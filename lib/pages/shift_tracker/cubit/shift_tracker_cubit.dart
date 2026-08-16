import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/api/local/work_schedule_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/repositories/work_schedule_repository.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_state.dart';

class ShiftTrackerCubit extends Cubit<ShiftTrackerState> {
  ShiftTrackerCubit({
    required ShiftRepository shiftRepository,
    required OrganizationRepository organizationRepository,
    required WorkScheduleRepository workScheduleRepository,
    required GeoService geoService,
    required ShiftContextStorage contextStorage,
    required WorkScheduleContextStorage scheduleContextStorage,
    Connectivity? connectivity,
    DateTime Function()? now,
  }) : _shiftRepository = shiftRepository,
       _organizationRepository = organizationRepository,
       _workScheduleRepository = workScheduleRepository,
       _geoService = geoService,
       _contextStorage = contextStorage,
       _scheduleContextStorage = scheduleContextStorage,
       _connectivity = connectivity ?? Connectivity(),
       _now = now ?? DateTime.now,
       super(const ShiftTrackerState()) {
    _orgSubscription = _organizationRepository.watchMyOrganizations().listen((
      orgs,
    ) {
      emit(state.copyWith(organizations: state.organizations.toSuccess(orgs)));
      _maybePreselectContext();
    });
    _watchConnectivity();
    _init();
  }

  final ShiftRepository _shiftRepository;
  final OrganizationRepository _organizationRepository;
  final WorkScheduleRepository _workScheduleRepository;
  final GeoService _geoService;
  final ShiftContextStorage _contextStorage;
  final WorkScheduleContextStorage _scheduleContextStorage;
  final Connectivity _connectivity;

  /// Источник «текущего времени» для пересчёта окна графика — по умолчанию
  /// `DateTime.now`, переопределяется в тестах (см. mobile.md, тесты границ
  /// окна).
  final DateTime Function() _now;
  Timer? _timer;

  /// Тикер idle-экрана — пересчитывает стартуемость графика раз в секунду,
  /// пока смена не активна, выбрана организация и список графиков загружен
  /// (см. [_syncIdleTicker]).
  Timer? _idleTimer;

  /// Момент последнего перезапроса `my-schedules` из-за закрытия окна —
  /// дебаунс на [_windowCloseRefetchCooldown] от `now`, а не от «была ли уже
  /// свежая загрузка»: бэк гарантирует окно, конец которого впереди
  /// (backend.md), но если только что перезагруженные графики ВСЁ РАВНО
  /// пришли с уже закрытым окном (рассинхрон часов, задержка сети), это НЕ
  /// должно зациклить перезапросы — `emit` внутри `_loadSchedules` синхронно
  /// перезапускает тикер и его первый тик.
  DateTime? _lastWindowCloseRefetchAt;

  static const _windowCloseRefetchCooldown = Duration(seconds: 5);

  /// Монотонный токен запроса графиков — ответы устаревших запросов
  /// (org/точка успели поменяться ещё раз) игнорируются.
  int _scheduleRequestId = 0;

  /// Период фонового опроса активной смены (сек). Бэкенд авто-завершает смены
  /// (1–48ч) — без поллинга мобилка не узнала бы об этом, пока экран открыт.
  static const _pollSeconds = 60;

  /// Тики 1-секундного таймера до следующего опроса.
  int _pollTick = 0;

  /// Защита от наложения опросов (poll + resume + pull-to-refresh).
  bool _syncing = false;

  /// Последнее действие смены — для повторной попытки после сетевой ошибки.
  Future<void> Function()? _lastAction;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;

  /// Предвыбор контекста применяется ровно один раз
  bool _contextPreselectApplied = false;

  /// Пользователь вручную менял контекст в селекторе
  bool _contextSelectedManually = false;

  /// _init завершён — известно, есть ли активная/приостановленная смена
  bool _initCompleted = false;

  @override
  void emit(ShiftTrackerState state) {
    if (isClosed) return;
    super.emit(state);
    _syncIdleTicker();
  }

  /// Запускает/останавливает тикер idle-экрана вслед за состоянием: идёт,
  /// пока нет активной/приостановленной смены, выбрана организация и список
  /// графиков успешно загружен (см. [ShiftTrackerState.schedules]) — тот же
  /// принцип, что и у [_startTimer] для активной смены, но для локального
  /// пересчёта стартуемости графика (mobile.md, «Реактивность»).
  ///
  /// Вызывается из [emit] после каждого апдейта состояния; побочные `emit` от
  /// [_startIdleTicker]/[_stopIdleTicker] безопасны — при повторном заходе
  /// `shouldTick == isTicking` уже совпадают, рекурсия обрывается сразу.
  void _syncIdleTicker() {
    final shouldTick =
        !state.hasActiveShift && state.isOrgShift && state.schedules.isSuccess;
    final isTicking = _idleTimer != null;
    if (shouldTick == isTicking) return;

    if (shouldTick) {
      _startIdleTicker();
    } else {
      _stopIdleTicker();
      if (state.idleNow != null) emit(state.copyWith(idleNow: null));
    }
  }

  void _startIdleTicker() {
    _idleTimer = Timer.periodic(const Duration(seconds: 1), (_) => _tickIdle());
    _tickIdle();
  }

  void _stopIdleTicker() {
    _idleTimer?.cancel();
    _idleTimer = null;
  }

  void _tickIdle() {
    final now = _now().toUtc();
    emit(state.copyWith(idleNow: now));
    _resetClosedSelection(now);
    _maybeRefetchOnWindowClosed(now);
  }

  /// Сбрасывает выбор графика, если его окно закрылось (mobile.md, п.1:
  /// «Ранее выбранный график, у которого окно закрылось, сбрасывается из
  /// выбора автоматически»).
  void _resetClosedSelection(DateTime now) {
    final selected = state.selectedWorkSchedule;
    if (selected == null) return;
    if (!selected.isStartableAt(
      now,
      earlyStartMinutes: state.earlyStartMinutes,
    )) {
      emit(state.copyWith(selectedWorkScheduleId: null));
    }
  }

  /// Перезапрос `my-schedules`, когда локально обнаружено, что окно
  /// ближайшего графика закрылось (mobile.md, п.2) — сервер отдаст следующее
  /// окно. Дебаунс по [_windowCloseRefetchCooldown] от [now], а не по факту
  /// «была ли уже свежая загрузка» — так безопасно даже если очередной ответ
  /// снова окажется с уже закрытым окном (см. [_lastWindowCloseRefetchAt]).
  void _maybeRefetchOnWindowClosed(DateTime now) {
    final items = state.schedules.data?.items ?? const <WorkSchedule>[];
    if (items.isEmpty) return;
    final closeAt = items
        .map((s) => s.nextEndAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);
    if (now.isBefore(closeAt)) return;
    final last = _lastWindowCloseRefetchAt;
    if (last != null && now.difference(last) < _windowCloseRefetchCooldown) {
      return;
    }
    _lastWindowCloseRefetchAt = now;
    unawaited(_loadSchedules());
  }

  StreamSubscription<List<Organization>>? _orgSubscription;

  /// Подписка на изменения сети — для пассивной индикации офлайна (баннер).
  /// Не блокирует операции смены: трекер продолжает считать время локально.
  void _watchConnectivity() {
    _connectivitySub = _connectivity.onConnectivityChanged.listen((results) {
      emit(state.copyWith(isOffline: _isOffline(results)));
    });
    unawaited(
      _connectivity.checkConnectivity().then((results) {
        emit(state.copyWith(isOffline: _isOffline(results)));
      }),
    );
  }

  bool _isOffline(List<ConnectivityResult> results) =>
      results.isEmpty || results.every((r) => r == ConnectivityResult.none);

  /// Повторяет последнее действие смены (start/pause/resume/finish) —
  /// используется кнопкой «Повторить» при сетевой ошибке.
  Future<void> retryLastAction() async {
    final action = _lastAction;
    if (action != null) {
      await action();
    }
  }

  Future<void> _init() async {
    await Future.wait([
      _loadActiveShift(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
    _initCompleted = true;
    _maybePreselectContext();
  }

  /// Предвыбор контекста смены (shift_quick_start).
  ///
  /// Применяется один раз после завершения [_init], когда известно,
  /// есть ли активная/приостановленная смена, и организации загружены.
  /// Ручной выбор пользователя не перетирается; повторные эмиты
  /// [OrganizationRepository.watchMyOrganizations] выбор не передёргивают.
  void _maybePreselectContext() {
    if (_contextPreselectApplied || _contextSelectedManually) return;
    if (!_initCompleted || !state.organizations.isSuccess) return;

    _contextPreselectApplied = true;

    if (state.hasActiveShift || state.selectedOrganizationId != null) return;

    final orgs = state.organizations.data ?? const <Organization>[];
    final savedMarker = _contextStorage.read();

    String? preselectedId;
    if (savedMarker == ShiftContextStorage.personalMarker) {
      // Личная смена — selectedOrganizationId остаётся null
      preselectedId = null;
    } else if (savedMarker != null &&
        orgs.any((org) => org.id == savedMarker)) {
      preselectedId = savedMarker;
    } else if (orgs.length == 1) {
      // Сохранённого валидного контекста нет, организация ровно одна
      preselectedId = orgs.first.id;
    }

    if (preselectedId != null) {
      emit(state.copyWith(selectedOrganizationId: preselectedId));
      // См. selectOrganization: при гео-проверке точка неизвестна заранее —
      // список графиков грузится только внутри startShift().
      if (state.showWorkLocationSelector) unawaited(_loadSchedules());
    }
  }

  Future<void> _loadActiveShift() async {
    emit(state.copyWith(activeShift: state.activeShift.toLoading()));

    final result = await _shiftRepository.getShifts(
      status: ShiftStatus.active,
      limit: 1,
    );

    result.fold(
      onSuccess: (paginator) {
        final shifts = paginator.data;
        if (shifts != null && shifts.isNotEmpty) {
          final shift = shifts.first;
          emit(state.copyWith(activeShift: state.activeShift.toSuccess(shift)));
          _startTimer(shift);
          return;
        }
      },
      onFailure: (error) {
        emit(
          state.copyWith(activeShift: state.activeShift.toError(error.message)),
        );
      },
    );

    // Если активной нет — ищем паузу
    if (!state.hasActiveShift) {
      final pausedResult = await _shiftRepository.getShifts(
        status: ShiftStatus.paused,
        limit: 1,
      );

      pausedResult.fold(
        onSuccess: (paginator) {
          final shifts = paginator.data;
          if (shifts != null && shifts.isNotEmpty) {
            final shift = shifts.first;
            emit(
              state.copyWith(activeShift: state.activeShift.toSuccess(shift)),
            );
            _startTimer(shift);
          } else {
            emit(state.copyWith(activeShift: state.activeShift.toIdle()));
          }
        },
        onFailure: (_) {
          emit(state.copyWith(activeShift: state.activeShift.toIdle()));
        },
      );
    }
  }

  void selectOrganization(String? organizationId) {
    _contextSelectedManually = true;
    // Смена контекста сбрасывает выбранную точку: точка принадлежит конкретной
    // организации и не должна «перетекать» в другую org или персональную смену.
    // Набор графиков зависит от org+точки — сбрасываем и его тоже.
    emit(
      state.copyWith(
        selectedOrganizationId: organizationId,
        selectedWorkLocation: null,
        selectedWorkScheduleId: null,
        schedules: const SectionData(),
      ),
    );
    unawaited(
      _contextStorage.save(
        organizationId ?? ShiftContextStorage.personalMarker,
      ),
    );
    // При гео-проверке точка неизвестна клиенту заранее (её резолвит сервер
    // только на старте по координатам) — ранний запрос без точки исключил бы
    // location-only графики (баг, см. work_schedules_geo_resolve/mobile.md).
    // Список для таких организаций грузится только внутри startShift().
    if (organizationId != null && state.showWorkLocationSelector) {
      unawaited(_loadSchedules());
    }
  }

  /// Выбор рабочей точки в модалке. `null` — пункт «Без точки» (необязательная
  /// привязка). Точка входит в резолв графиков — перезапрашиваем список.
  void selectWorkLocation(WorkLocation? location) {
    emit(
      state.copyWith(
        selectedWorkLocation: location,
        selectedWorkScheduleId: null,
      ),
    );
    unawaited(_loadSchedules());
  }

  /// Выбор графика в модалке или предвыбор одного доступного варианта.
  void selectWorkSchedule(WorkSchedule? schedule) {
    emit(state.copyWith(selectedWorkScheduleId: schedule?.id));
    final orgId = state.selectedOrganizationId;
    if (orgId == null || schedule == null) return;
    unawaited(
      _scheduleContextStorage.save(
        orgId,
        state.showWorkLocationSelector ? state.selectedWorkLocation?.id : null,
        schedule.id,
      ),
    );
  }

  /// Повторная попытка загрузки списка графиков (кнопка «Повторить»).
  Future<void> reloadSchedules() => _loadSchedules();

  /// Загружает эффективный набор графиков по вручную выбранной точке
  /// (`work_location_id`).
  ///
  /// Используется для организаций БЕЗ гео-проверки — точка выбрана вручную и
  /// известна заранее (`state.showWorkLocationSelector`), плюс как ретрай
  /// после `SCHEDULE_NOT_AVAILABLE`/`SCHEDULE_NOT_FOUND` при старте для ТАКИХ
  /// организаций (см. [_reloadSchedulesAfterStartFailure]).
  ///
  /// Для гео-check организаций резолв идёт по свежим координатам —
  /// [_resolveScheduleForGeoStart] (на старте) и
  /// [_reloadSchedulesForGeoCoords] (ретрай) — этот метод их не вызывает.
  Future<void> _loadSchedules() async {
    final orgId = state.selectedOrganizationId;
    if (orgId == null) return;

    final requestId = ++_scheduleRequestId;
    emit(state.copyWith(schedules: state.schedules.toLoading()));

    final workLocationId = state.showWorkLocationSelector
        ? state.selectedWorkLocation?.id
        : null;
    final result = await _workScheduleRepository.getMySchedules(
      orgId,
      workLocationId: workLocationId,
    );
    if (requestId != _scheduleRequestId || isClosed) return;

    result.fold(
      onSuccess: (schedules) =>
          _applyResolvedSchedules(schedules, orgId, workLocationId),
      onFailure: (error) => emit(
        state.copyWith(
          schedules: state.schedules.toError(error.message, code: error.code),
        ),
      ),
    );
  }

  /// Применяет успешный результат `getMySchedules` к состоянию: обновляет
  /// `schedules` (SectionData) и пересчитывает авто-подстановку/сохранённый
  /// выбор ([_preselectSchedule]). Общий хвост для всех точек резолва
  /// графиков — ранней загрузки ([_loadSchedules]), резолва на старте у
  /// гео-check организаций ([_resolveScheduleForGeoStart]) и ретрая после
  /// `SCHEDULE_NOT_AVAILABLE` ([_reloadSchedulesAfterStartFailure]).
  void _applyResolvedSchedules(
    MySchedules schedules,
    String orgId,
    String? workLocationId,
  ) {
    emit(state.copyWith(schedules: state.schedules.toSuccess(schedules)));
    _preselectSchedule(schedules, orgId, workLocationId);
  }

  /// Ровно один доступный график — подставляется автоматически (старт
  /// остаётся в один тап). Несколько — предвыбирается последний сохранённый
  /// для этой пары org+точка, если он всё ещё доступен.
  void _preselectSchedule(
    MySchedules schedules,
    String orgId,
    String? workLocationId,
  ) {
    final items = schedules.items;
    if (items.length == 1) {
      emit(state.copyWith(selectedWorkScheduleId: items.first.id));
      return;
    }
    if (items.length > 1) {
      final saved = _scheduleContextStorage.read(orgId, workLocationId);
      final stillAvailable = saved != null && items.any((s) => s.id == saved);
      emit(
        state.copyWith(selectedWorkScheduleId: stillAvailable ? saved : null),
      );
      return;
    }
    emit(state.copyWith(selectedWorkScheduleId: null));
  }

  /// Координаты, полученные на текущей попытке старта — кэшируются между
  /// [startShift] (резолв графика при гео-проверке) и
  /// [continueStartAfterScheduleSelection] (продолжение после модалки
  /// выбора), чтобы не запрашивать GPS дважды в рамках одного тапа «Начать».
  ({double? lat, double? lng})? _pendingStartCoords;

  Future<StartShiftResult> startShift() async {
    _lastAction = startShift;
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );

    final org = state.selectedOrganization;
    final needsGeo = org != null && org.geoCheckEnabled;

    double? lat;
    double? lng;

    if (needsGeo) {
      final geoResult = await _geoService.getCurrentPosition();

      switch (geoResult) {
        case GeoSuccess():
          lat = geoResult.latitude;
          lng = geoResult.longitude;
          if (geoResult.lowAccuracy) {
            emit(state.copyWith(showLowAccuracyWarning: true));
          }
        // Гео-отказы не пишем в actionStatus/actionError: конкретный
        // платформо-зависимый UX (диалог/тост) выбирает вызывающий код по
        // возвращённому StartShiftResult. Статус возвращаем в initial, чтобы
        // BlocListener сетевых ошибок не показал ложный тост.
        case GeoServiceDisabled():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoServiceDisabled;
        case GeoPermissionDenied():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoPermissionDenied;
        case GeoPermissionDeniedForever():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoPermissionDeniedForever;
        case GeoUnavailable():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoUnavailable;
        case GeoInsecureContext():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoInsecureContext;
        case GeoUnsupported():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoUnsupported;
      }

      // Гео-check организация: точка известна только сейчас (только что
      // получена от GPS) — резолвим эффективный набор графиков по тем же
      // координатам, которые пойдут в POST /shifts/start ниже (см.
      // docs/tasks/work_schedules_geo_resolve/mobile.md). Без этого шага
      // location-only графики (без роли/глобально) никогда не резолвились бы
      // для гео-check организаций — это и был исходный баг.
      final orgId = state.selectedOrganizationId;
      if (orgId != null) {
        final selectionOutcome = await _resolveScheduleForGeoStart(
          orgId,
          lat,
          lng,
        );
        if (selectionOutcome != null) return selectionOutcome;
      }
    }

    return _performStart(lat: lat, lng: lng);
  }

  /// Резолвит эффективный набор графиков по свежим координатам
  /// непосредственно перед стартом (только гео-check организации).
  ///
  /// 0 или 1 график — подставляется автоматически ([_preselectSchedule]),
  /// вызывающий код продолжает старт сразу (возвращает `null`). Больше
  /// одного — сохраняет координаты для [continueStartAfterScheduleSelection]
  /// и просит UI показать модалку выбора (см. `_WorkScheduleSelector`),
  /// возвращая [StartShiftResult.scheduleSelectionRequired]. Сбой запроса —
  /// это часть уже идущего действия «Начать», поэтому обрабатывается как
  /// обычная ошибка действия (тост/сетевая плашка + «Повторить», который
  /// заново пройдёт этот же путь) — отдельного молчаливого фолбэка нет,
  /// чтобы не стартовать смену с неизвестным требованием графика.
  Future<StartShiftResult?> _resolveScheduleForGeoStart(
    String orgId,
    double? lat,
    double? lng,
  ) async {
    final result = await _workScheduleRepository.getMySchedules(
      orgId,
      lat: lat,
      lng: lng,
    );

    return result.fold(
      onSuccess: (schedules) {
        _applyResolvedSchedules(schedules, orgId, null);

        if (schedules.items.length > 1) {
          _pendingStartCoords = (lat: lat, lng: lng);
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.scheduleSelectionRequired;
        }
        return null;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            schedules: state.schedules.toError(error.message, code: error.code),
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        return StartShiftResult.error;
      },
    );
  }

  /// Продолжение старта после того, как сотрудник выбрал график в модалке
  /// (гео-check организация, `>1` доступных вариантов, см. [startShift] /
  /// [_resolveScheduleForGeoStart]). Переиспользует координаты, полученные
  /// на этом же тапе «Начать» — повторного запроса GPS нет.
  Future<StartShiftResult> continueStartAfterScheduleSelection(
    WorkSchedule schedule,
  ) {
    selectWorkSchedule(schedule);
    // Возвращаем actionStatus в loading здесь явно: startShift() сбросил его
    // в initial перед показом модалки (см. _resolveScheduleForGeoStart), а
    // _performStart больше не трогает actionStatus сам — эта ответственность
    // теперь у каждого из его вызывающих (см. также прямые ветки startShift,
    // где статус уже loading с самого начала действия).
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );
    final coords = _pendingStartCoords;
    _pendingStartCoords = null;
    return _performStart(lat: coords?.lat, lng: coords?.lng);
  }

  /// Собственно `POST /shifts/start` + обработка результата — общий хвост
  /// для прямого старта (0/1 график или организация без гео-проверки) и для
  /// продолжения после модалки выбора ([continueStartAfterScheduleSelection]).
  /// Не переводит `actionStatus` в loading сам — вызывающий код уже сделал
  /// это (см. [startShift] / [continueStartAfterScheduleSelection]).
  Future<StartShiftResult> _performStart({double? lat, double? lng}) async {
    final result = await _shiftRepository.startShift(
      organizationId: state.selectedOrganizationId,
      latitude: lat,
      longitude: lng,
      // При гео точку определяет сервер (selectedWorkLocation тогда null —
      // селектор скрыт). При гео выкл шлём выбранную точку (или null).
      workLocationId: state.selectedWorkLocation?.id,
      workScheduleId: state.selectedWorkScheduleId,
    );

    return result.fold(
      onSuccess: (shift) {
        emit(
          state.copyWith(
            activeShift: state.activeShift.toSuccess(shift),
            actionStatus: FeatureStatus.success,
          ),
        );
        _startTimer(shift);
        return StartShiftResult.success;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        // Выбранный график перестал подходить (сервер узнал точку только на
        // старте), был удалён, либо его окно уже закрылось/ещё не открылось
        // (SCHEDULE_WINDOW_CLOSED — страховка от рассинхрона часов устройства
        // и сервера, schedule_window_enforcement/mobile.md, п.4) — сбрасываем
        // выбор и принудительно перезапрашиваем список, чтобы сотрудник
        // выбрал заново.
        if (error.code == 'SCHEDULE_NOT_AVAILABLE' ||
            error.code == 'SCHEDULE_NOT_FOUND' ||
            error.code == 'SCHEDULE_WINDOW_CLOSED') {
          emit(state.copyWith(selectedWorkScheduleId: null));
          unawaited(_reloadSchedulesAfterStartFailure(lat: lat, lng: lng));
        }
        return StartShiftResult.error;
      },
    );
  }

  /// Перезапрашивает список графиков после `SCHEDULE_NOT_AVAILABLE`/
  /// `SCHEDULE_NOT_FOUND` на старте — обновляет отображаемый список, чтобы
  /// сотрудник выбрал заново при следующем тапе «Начать». При гео-проверке
  /// переиспользует координаты именно этой попытки старта — без них ретрай
  /// деградировал бы обратно к «точка неизвестна» (тот самый баг, который
  /// чинит эта задача, см. docs/tasks/work_schedules_geo_resolve/mobile.md);
  /// для организаций без гео-проверки — обычная ранняя загрузка по выбранной
  /// вручную точке ([_loadSchedules], как и раньше).
  Future<void> _reloadSchedulesAfterStartFailure({double? lat, double? lng}) {
    if (lat != null && lng != null) {
      return _reloadSchedulesForGeoCoords(lat, lng);
    }
    return _loadSchedules();
  }

  /// Пассивный повторный запрос `getMySchedules` по координатам — только
  /// обновляет отображаемое состояние (без побочных эффектов «идущего
  /// действия», в отличие от [_resolveScheduleForGeoStart]: пользователь
  /// увидит актуальный список только при следующем тапе «Начать»).
  Future<void> _reloadSchedulesForGeoCoords(double lat, double lng) async {
    final orgId = state.selectedOrganizationId;
    if (orgId == null) return;

    final result = await _workScheduleRepository.getMySchedules(
      orgId,
      lat: lat,
      lng: lng,
    );
    if (isClosed) return;

    result.fold(
      onSuccess: (schedules) => _applyResolvedSchedules(schedules, orgId, null),
      onFailure: (error) => emit(
        state.copyWith(
          schedules: state.schedules.toError(error.message, code: error.code),
        ),
      ),
    );
  }

  void clearLowAccuracyWarning() {
    emit(state.copyWith(showLowAccuracyWarning: false));
  }

  Future<bool> pauseShift() async {
    final shift = state.activeShift.data;
    if (shift == null) return false;

    _lastAction = pauseShift;
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );

    final result = await _shiftRepository.pauseShift(shift.id);

    return result.fold(
      onSuccess: (updatedShift) {
        emit(
          state.copyWith(
            activeShift: state.activeShift.toSuccess(updatedShift),
            actionStatus: FeatureStatus.success,
          ),
        );
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        return false;
      },
    );
  }

  Future<bool> resumeShift() async {
    final shift = state.activeShift.data;
    if (shift == null) return false;

    _lastAction = resumeShift;
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );

    final result = await _shiftRepository.resumeShift(shift.id);

    return result.fold(
      onSuccess: (updatedShift) {
        emit(
          state.copyWith(
            activeShift: state.activeShift.toSuccess(updatedShift),
            actionStatus: FeatureStatus.success,
          ),
        );
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        return false;
      },
    );
  }

  Future<bool> finishShift() async {
    final shift = state.activeShift.data;
    if (shift == null) return false;

    _lastAction = finishShift;
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );

    final result = await _shiftRepository.finishShift(shift.id);

    return result.fold(
      onSuccess: (_) {
        _stopTimer();
        // selectedOrganizationId не сбрасываем — контекст сохраняется
        // для следующего старта (shift_quick_start)
        emit(
          state.copyWith(
            activeShift: const SectionData(),
            actionStatus: FeatureStatus.success,
            elapsedSeconds: 0,
          ),
        );
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        return false;
      },
    );
  }

  /// Pull-to-refresh: тихая сверка активной смены и организаций (без шиммера —
  /// спиннер показывает сам RefreshIndicator).
  Future<void> refresh() async {
    await Future.wait([
      _pollSync(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
  }

  /// Возврат приложения на передний план — мгновенная сверка: на фоне ОС могла
  /// приморозить 1с-таймер, и авто-финиш остался бы незамеченным (см.
  /// [_refreshVisibleContext]).
  void onAppResumed() => unawaited(_refreshVisibleContext());

  /// Возврат на экран трекера (переключение таба обратно на «Смена» — см.
  /// `ShiftTrackerPage`, `didChangeTabRoute`). Тот же принцип, что и
  /// [onAppResumed]: пока пользователь был на другом табе, список графиков
  /// на idle-экране мог устареть, а внутренний тикер — быть неактивным.
  void onScreenVisible() => unawaited(_refreshVisibleContext());

  /// Общий хвост [onAppResumed]/[onScreenVisible] (mobile.md, п.2): сверяет
  /// активную смену и, если сейчас снова idle организационной смены,
  /// принудительно перезапрашивает график — локальный тик мог быть
  /// заморожен (фон ОС) или экран был на другом табе всё это время.
  Future<void> _refreshVisibleContext() async {
    await _pollSync();
    if (!state.hasActiveShift &&
        state.isOrgShift &&
        state.showWorkLocationSelector) {
      unawaited(_loadSchedules());
    }
  }

  void clearAutoFinishedNotice() {
    emit(state.copyWith(shiftAutoFinished: false));
  }

  /// Тихий опрос: сверяет показанную смену с сервером и ловит авто-завершение,
  /// не трогая UI шиммером. Сетевые/серверные сбои не меняют состояние —
  /// повторим на следующем тике (об офлайне и так сигналит баннер).
  Future<void> _pollSync() async {
    if (_syncing || state.isActionLoading) return;
    _syncing = true;
    try {
      var ok = true;
      Shift? shift;

      final activeRes = await _shiftRepository.getShifts(
        status: ShiftStatus.active,
        limit: 1,
      );
      activeRes.fold(
        onSuccess: (p) {
          final list = p.data;
          shift = (list != null && list.isNotEmpty) ? list.first : null;
        },
        onFailure: (_) => ok = false,
      );
      if (!ok) return;

      if (shift == null) {
        final pausedRes = await _shiftRepository.getShifts(
          status: ShiftStatus.paused,
          limit: 1,
        );
        pausedRes.fold(
          onSuccess: (p) {
            final list = p.data;
            shift = (list != null && list.isNotEmpty) ? list.first : null;
          },
          onFailure: (_) => ok = false,
        );
        if (!ok) return;
      }

      final found = shift;
      if (found != null) {
        // Смена ещё идёт — подтягиваем актуальные данные (паузы/worked).
        emit(state.copyWith(activeShift: state.activeShift.toSuccess(found)));
        if (_timer == null) _startTimer(found);
      } else if (state.hasActiveShift) {
        // Сервер: активной/приостановленной смены больше нет → авто-завершена.
        _stopTimer();
        emit(
          state.copyWith(
            activeShift: const SectionData<Shift>(),
            elapsedSeconds: 0,
            shiftAutoFinished: true,
          ),
        );
        // Список графиков к моменту авто-финиша устарел (тот самый прод-баг,
        // mobile.md, контекст) — перезапрашиваем вместе с возвратом в idle.
        // Только для организаций без гео-проверки: у гео-check список на
        // idle-экране не грузится заранее вовсе (см. showWorkLocationSelector).
        if (state.isOrgShift && state.showWorkLocationSelector) {
          unawaited(_loadSchedules());
        }
      }
    } finally {
      _syncing = false;
    }
  }

  void _startTimer(Shift shift) {
    _stopTimer();
    _pollTick = 0;
    _updateElapsed(shift);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateElapsed(state.activeShift.data);
      _pollTick++;
      if (_pollTick >= _pollSeconds) {
        _pollTick = 0;
        unawaited(_pollSync());
      }
    });
  }

  void _updateElapsed(Shift? shift) {
    if (shift == null) return;
    final now = DateTime.now();
    final totalSeconds = now.difference(shift.startedAt).inSeconds;

    var pauseSeconds = 0;
    for (final pause in shift.pauses) {
      final end = pause.finishedAt ?? now;
      pauseSeconds += end.difference(pause.startedAt).inSeconds;
    }

    final elapsed = totalSeconds - pauseSeconds;
    emit(state.copyWith(elapsedSeconds: elapsed < 0 ? 0 : elapsed));
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _stopTimer();
    _stopIdleTicker();
    _orgSubscription?.cancel();
    _connectivitySub?.cancel();
    return super.close();
  }
}

/// Исход попытки старта смены — определяет, какой UX показать вызывающему коду.
/// Гео-ветки повторяют таксономию [GeoResult] (`geo_service.dart`), чтобы UI
/// выбрал платформо-корректную реакцию (диалог настроек / web-инструкция / тост).
enum StartShiftResult {
  success,

  /// Бизнес-/сетевая ошибка старта — показывает BlocListener (тост/плашка).
  error,

  /// Сервис геолокации выключен (native) → диалог + настройки геолокации.
  geoServiceDisabled,

  /// Доступ отклонён (можно повторить) → короткий тост + повтор.
  geoPermissionDenied,

  /// Доступ отклонён навсегда → native: диалог + настройки приложения;
  /// web: диалог-инструкция по браузеру + «Повторить».
  geoPermissionDeniedForever,

  /// Позиция не получена (таймаут/недоступна) → тост + повтор.
  geoUnavailable,

  /// Web без HTTPS → сообщение о необходимости защищённого соединения.
  geoInsecureContext,

  /// Геолокация не поддерживается браузером → сообщение об обновлении браузера.
  geoUnsupported,

  /// Гео-check организация: координаты получены, эффективный набор графиков
  /// на этой точке резолвлен и содержит `>1` вариант — вызывающий код должен
  /// показать модалку выбора (`WorkSchedulePickerRoute`) и по её результату
  /// вызвать [ShiftTrackerCubit.continueStartAfterScheduleSelection].
  scheduleSelectionRequired,
}
