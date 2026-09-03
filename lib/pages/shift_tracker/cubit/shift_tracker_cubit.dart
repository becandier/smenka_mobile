import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/api/local/work_schedule_context_storage.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
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
    required ChecklistRepository checklistRepository,
    required GeoService geoService,
    required ShiftContextStorage contextStorage,
    required WorkScheduleContextStorage scheduleContextStorage,
    Connectivity? connectivity,
    DateTime Function()? now,
  }) : _shiftRepository = shiftRepository,
       _organizationRepository = organizationRepository,
       _workScheduleRepository = workScheduleRepository,
       _checklistRepository = checklistRepository,
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
  final ChecklistRepository _checklistRepository;
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

  /// Тикер обратного отсчёта окна дозаполнения чек-листа
  /// (`checklist_grace_period`, mobile.md п.2-3) — идёт, пока
  /// `state.checklistGraceDeadlineAt` не `null`. Отдельный от [_idleTimer]:
  /// блок дозаполнения не зависит от выбранной организации/загрузки
  /// графиков (условие тикера графика), а только от наличия последней
  /// завершённой смены с открытым окном.
  Timer? _checklistGraceTimer;

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
    _reconcileScheduleSelection(now);
    _maybeRefetchOnWindowClosed(now);
  }

  /// Синхронизирует выбор с текущим окном: закрывшийся выбор очищается, а
  /// единственный открывшийся график подставляется автоматически без нового
  /// запроса. При нескольких стартуемых восстанавливается только сохранённый
  /// график, который сам остаётся стартуемым.
  void _reconcileScheduleSelection(DateTime now) {
    final schedules = state.schedules.data;
    final orgId = state.selectedOrganizationId;
    if (schedules == null || orgId == null) return;

    final startable = schedules.startableSchedulesAt(now);
    final selectedId = state.selectedWorkScheduleId;
    if (selectedId != null &&
        startable.any((schedule) => schedule.id == selectedId)) {
      return;
    }

    String? nextSelectedId;
    if (startable.length == 1) {
      nextSelectedId = startable.first.id;
    } else if (startable.length > 1) {
      final workLocationId = state.showWorkLocationSelector
          ? state.selectedWorkLocation?.id
          : null;
      final saved = _scheduleContextStorage.read(orgId, workLocationId);
      if (saved != null && startable.any((schedule) => schedule.id == saved)) {
        nextSelectedId = saved;
      }
    }

    if (selectedId != nextSelectedId) {
      emit(state.copyWith(selectedWorkScheduleId: nextSelectedId));
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
    unawaited(_loadChecklistGrace());
  }

  /// Предвыбор контекста смены (shift_org_default, инверсия дефолта
  /// shift_quick_start).
  ///
  /// Применяется один раз после завершения [_init], когда известно,
  /// есть ли активная/приостановленная смена, и организации загружены.
  /// Ручной выбор пользователя не перетирается; повторные эмиты
  /// [OrganizationRepository.watchMyOrganizations] выбор не передёргивают.
  ///
  /// Правило (mobile.md, блок A): (1) сохранённый `org_id` есть среди
  /// доступных для смены организаций
  /// ([ShiftTrackerState.availableOrganizations], т.е. `myRole != owner`) →
  /// подставить её; (2) иначе, если доступных
  /// организаций одна и более → первая в порядке репозитория (раньше — только
  /// при ровно одной, персональная была дефолтом при двух и более — тот самый
  /// баг); (3) доступных организаций нет → персональный контекст остаётся
  /// дефолтом. Легаси-маркер `personal` (шёл до этой фичи) на предвыбор
  /// больше не влияет — игнорируется и чистится из хранилища.
  void _maybePreselectContext() {
    if (_contextPreselectApplied || _contextSelectedManually) return;
    if (!_initCompleted || !state.organizations.isSuccess) return;

    _contextPreselectApplied = true;

    if (state.hasActiveShift || state.selectedOrganizationId != null) return;

    final orgs = state.availableOrganizations;
    final savedMarker = _contextStorage.read();

    if (savedMarker == ShiftContextStorage.personalMarker) {
      // Легаси-маркер персональной смены (до shift_org_default) больше не
      // подставляется и не имеет смысла как значение — чистим, дальше
      // действует правило A наравне со случаем «маркера нет вовсе».
      unawaited(_contextStorage.clear());
    }

    String? preselectedId;
    if (savedMarker != null &&
        savedMarker != ShiftContextStorage.personalMarker &&
        orgs.any((org) => org.id == savedMarker)) {
      preselectedId = savedMarker;
    } else if (orgs.isNotEmpty) {
      // Сохранённого валидного org-контекста нет (маркера нет, был `personal`,
      // либо организация пропала из доступных — исключили/удалили/стал
      // owner) → первая доступная.
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

  /// Выбор организации в селекторе idle-экрана (shift_org_default: селектор
  /// выбирает только между организациями, персональная смена — отдельная
  /// ссылка с подтверждением, см. [startPersonalShift]).
  void selectOrganization(String organizationId) {
    _contextSelectedManually = true;
    // Смена контекста сбрасывает выбранную точку: точка принадлежит конкретной
    // организации и не должна «перетекать» в другую org. Набор графиков
    // зависит от org+точки — сбрасываем и его тоже.
    emit(
      state.copyWith(
        selectedOrganizationId: organizationId,
        selectedWorkLocation: null,
        selectedWorkScheduleId: null,
        schedules: const SectionData(),
      ),
    );
    unawaited(_contextStorage.save(organizationId));
    // При гео-проверке точка неизвестна клиенту заранее (её резолвит сервер
    // только на старте по координатам) — ранний запрос без точки исключил бы
    // location-only графики (баг, см. work_schedules_geo_resolve/mobile.md).
    // Список для таких организаций грузится только внутри startShift().
    if (state.showWorkLocationSelector) {
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

  /// Ровно один стартуемый график — подставляется автоматически (старт
  /// остаётся в один тап). Несколько — предвыбирается последний сохранённый
  /// для этой пары org+точка, если он всё ещё стартуем. Закрытые графики
  /// остаются в `schedules.items` только для информационного UI.
  void _preselectSchedule(
    MySchedules schedules,
    String orgId,
    String? workLocationId,
  ) {
    final items = schedules.startableSchedulesAt(_now().toUtc());
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

  /// Координаты, полученные на текущей попытке старта — кэшируются в
  /// [startShift] сразу после успешной геолокации и переживают ОБЕ
  /// возможные модалки на пути до старта (точка →
  /// [continueStartAfterWorkLocationSelection], график →
  /// [continueStartAfterScheduleSelection]), чтобы не запрашивать GPS дважды
  /// в рамках одного тапа «Начать» (`shift_start_location_choice`).
  ({double? lat, double? lng})? _pendingStartCoords;

  Future<StartShiftResult> startShift() async {
    _lastAction = startShift;
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
        // Новая попытка — прошлый гео-отказ/подсказка больше не описывают
        // реальность.
        lastGeoFailure: null,
        geoBlockLevel: GeoBlockLevel.unknown,
        nearestOutsideHint: null,
        nearbyWorkLocations: const [],
      ),
    );

    final org = state.selectedOrganization;
    final needsGeo = org != null && org.geoCheckEnabled;

    double? lat;
    double? lng;

    if (needsGeo) {
      // «Определяем местоположение…» — идёт только на время самого запроса
      // координат, не всей операции старта (shift_start_location_choice).
      emit(state.copyWith(isLocating: true));
      final geoResult = await _geoService.getCurrentPosition();
      emit(state.copyWith(isLocating: false));

      switch (geoResult) {
        case GeoSuccess():
          lat = geoResult.latitude;
          lng = geoResult.longitude;
          if (geoResult.lowAccuracy) {
            emit(state.copyWith(showLowAccuracyWarning: true));
          }
        // Гео-отказы не пишем в actionStatus/actionError: конкретный
        // платформо-зависимый UX (диалог) выбирает вызывающий код по
        // возвращённому StartShiftResult. Статус возвращаем в initial, чтобы
        // BlocListener сетевых ошибок не показал ложный тост.
        case GeoServiceDisabled():
          return _failStartWithGeo(
            geoResult,
            StartShiftResult.geoServiceDisabled,
          );
        case GeoPermissionDenied():
          return _failStartWithGeo(
            geoResult,
            StartShiftResult.geoPermissionDenied,
          );
        case GeoPermissionDeniedForever():
          return _failStartWithGeo(
            geoResult,
            StartShiftResult.geoPermissionDeniedForever,
          );
        case GeoUnavailable():
          return _failStartWithGeo(geoResult, StartShiftResult.geoUnavailable);
        case GeoInsecureContext():
          return _failStartWithGeo(
            geoResult,
            StartShiftResult.geoInsecureContext,
          );
        case GeoUnsupported():
          return _failStartWithGeo(geoResult, StartShiftResult.geoUnsupported);
      }

      final orgId = state.selectedOrganizationId;
      if (orgId != null) {
        // Координаты этой попытки кэшируются сразу — переживают ОБЕ модалки
        // (точка → график), которые могут понадобиться ниже, до самого
        // _performStart (см. continueStartAfterWorkLocationSelection /
        // continueStartAfterScheduleSelection).
        _pendingStartCoords = (lat: lat, lng: lng);

        // Явный выбор точки при пересечении зон (shift_start_location_choice):
        // сервер больше не решает молча, какую точку считать «той самой».
        final locationOutcome = await _resolveWorkLocationForGeoStart(
          orgId,
          lat,
          lng,
        );
        if (locationOutcome != null) return locationOutcome;

        // Точка уже известна (авто при одной подходящей, либо будет выбрана
        // после continueStartAfterWorkLocationSelection) — резолвим
        // эффективный набор графиков по НЕЙ, а не по сырым координатам:
        // иначе выбор сотрудником НЕ ближайшей точки разошёлся бы с тем,
        // location-only графики какой точки резолвит бэк (см.
        // docs/tasks/work_schedules_geo_resolve/mobile.md — тот исходный баг
        // чинился резолвом по координатам, здесь уточняем его резолвом по
        // явной точке, раз она уже известна).
        final selectionOutcome = await _resolveScheduleForGeoStart(
          orgId,
          state.selectedWorkLocation?.id,
        );
        if (selectionOutcome != null) return selectionOutcome;
      }
    }

    _pendingStartCoords = null;
    return _performStart(lat: lat, lng: lng);
  }

  /// Старт персональной смены как осознанный выбор поверх активного
  /// организационного контекста (`shift_org_default`, блок B) — вызывается
  /// только из «Всё равно персональную» модалки подтверждения
  /// (`PersonalShiftConfirmRoute`), НЕ из обычного «Начать». В отличие от
  /// [startShift]/[_performStart] намеренно НЕ читает и НЕ трогает
  /// `selectedOrganizationId`/`selectedWorkLocation`/`selectedWorkScheduleId`
  /// состояния — они принадлежат организационному контексту на экране,
  /// который остаётся как есть при отмене модалки (mobile.md: «контекст
  /// остаётся организационным, как был до тапа по ссылке»). Персональная
  /// смена не поддерживает гео-проверку/точку/график — запрос уходит без них.
  Future<StartShiftResult> startPersonalShift() async {
    _lastAction = startPersonalShift;
    // Осознанный выбор персональной смены — не запоминается (mobile.md, блок
    // C): ранее сохранённый `org_id`, если был, больше не годится как
    // «последний выбор»; следующий заход на экран снова определит правило A.
    unawaited(_contextStorage.clear());
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
        lastGeoFailure: null,
        geoBlockLevel: GeoBlockLevel.unknown,
      ),
    );

    // Без аргументов: все параметры (organizationId/latitude/longitude/
    // workLocationId/workScheduleId) остаются `null` по умолчанию —
    // намеренно не читаем их из состояния, в отличие от _performStart
    // (org-контекст на экране не трогаем).
    final result = await _shiftRepository.startShift();

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
        return StartShiftResult.error;
      },
    );
  }

  /// Общий хвост всех гео-отказов старта: кладёт в состояние сам объект
  /// [GeoFailure] (UI строит по нему диалог, а `shift_geo_photo_fallback` —
  /// машинный `code` причины) и, для «запрещено навсегда», уровень блокировки
  /// из пост-диагностики (`geo_troubleshooting`, сценарий 1).
  ///
  /// Пост-диагностика запускается только для [GeoPermissionDeniedForever]:
  /// у остальных отказов уровень разрешения ничего не объясняет (сервис
  /// выключен / нет HTTPS / браузер не умеет), а лишний запрос к Permissions
  /// API затянул бы показ диалога.
  Future<StartShiftResult> _failStartWithGeo(
    GeoFailure failure,
    StartShiftResult result,
  ) async {
    final blockLevel = failure is GeoPermissionDeniedForever
        ? await _geoService.diagnoseBlockLevel()
        : GeoBlockLevel.unknown;
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.initial,
        lastGeoFailure: failure,
        geoBlockLevel: blockLevel,
      ),
    );
    return result;
  }

  /// Принять смену, стартовавшую в отдельном флоу (фолбэк-старт по фото,
  /// `shift_geo_photo_fallback`): трекер показывает её как активную и
  /// запускает таймер, будто стартовал сам.
  ///
  /// Кубиты флоу и трекера друг о друге не знают — связь только через
  /// результат навигации (см. `_IdleShiftContent`).
  void adoptStartedShift(Shift shift) {
    emit(
      state.copyWith(
        activeShift: state.activeShift.toSuccess(shift),
        actionStatus: FeatureStatus.success,
        actionError: null,
        actionErrorCode: null,
        lastGeoFailure: null,
        geoBlockLevel: GeoBlockLevel.unknown,
      ),
    );
    _startTimer(shift);
  }

  /// Системные настройки приложения/геолокации (native) — UI дёргает их через
  /// кубит, чтобы не создавать второй экземпляр [GeoService] на экране.
  Future<void> openGeoAppSettings() => _geoService.openAppSettings();

  Future<void> openGeoLocationSettings() => _geoService.openLocationSettings();

  /// Резолвит рабочую точку по свежим координатам непосредственно перед
  /// стартом (только гео-check организации, `GET .../work-locations/nearby`,
  /// `shift_start_location_choice`) — заменяет прежнее молчаливое решение
  /// сервера «беру ближайшую» явным выбором сотрудника, когда подходящих
  /// точек несколько.
  ///
  /// 0 точек — сценарий блокируется (сотрудник вне всех зон): подсказка о
  /// ближайшей точке вне радиуса кладётся в [ShiftTrackerState.
  /// nearestOutsideHint], возвращается [StartShiftResult.noNearbyWorkLocation].
  /// 1 точка — подставляется автоматически в [ShiftTrackerState.
  /// selectedWorkLocation] без лишнего шага, вызывающий код продолжает старт
  /// сразу (возвращает `null`). Больше одного — просит UI показать модалку
  /// выбора (`NearbyWorkLocationPickerRoute`), возвращая
  /// [StartShiftResult.workLocationSelectionRequired]; координаты для
  /// продолжения уже сохранены вызывающим кодом ([startShift]) в
  /// [_pendingStartCoords]. Сбой запроса — часть уже идущего действия
  /// «Начать»: тост/сетевая плашка + «Повторить», который заново пройдёт этот
  /// же путь.
  Future<StartShiftResult?> _resolveWorkLocationForGeoStart(
    String orgId,
    double? lat,
    double? lng,
  ) async {
    if (lat == null || lng == null) return null;

    final result = await _organizationRepository.getNearbyWorkLocations(
      orgId,
      latitude: lat,
      longitude: lng,
    );

    return result.fold(
      onSuccess: (nearby) {
        if (nearby.items.isEmpty) {
          emit(
            state.copyWith(
              actionStatus: FeatureStatus.initial,
              nearestOutsideHint: nearby.nearestOutside,
            ),
          );
          return StartShiftResult.noNearbyWorkLocation;
        }

        if (nearby.items.length == 1) {
          final only = nearby.items.first;
          emit(
            state.copyWith(
              selectedWorkLocation: WorkLocation(
                id: only.id,
                name: only.name,
                address: only.address,
              ),
            ),
          );
          return null;
        }

        emit(
          state.copyWith(
            actionStatus: FeatureStatus.initial,
            nearbyWorkLocations: nearby.items,
          ),
        );
        return StartShiftResult.workLocationSelectionRequired;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        return StartShiftResult.error;
      },
    );
  }

  /// Продолжение старта после того, как сотрудник выбрал рабочую точку в
  /// модалке (гео-check организация, `>1` подходящих точек, см. [startShift]
  /// / [_resolveWorkLocationForGeoStart]). Переиспользует координаты,
  /// полученные на этом же тапе «Начать» — повторного запроса GPS нет.
  Future<StartShiftResult> continueStartAfterWorkLocationSelection(
    NearbyWorkLocation location,
  ) async {
    emit(
      state.copyWith(
        selectedWorkLocation: WorkLocation(
          id: location.id,
          name: location.name,
          address: location.address,
        ),
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );

    final orgId = state.selectedOrganizationId;
    // Координаты ЕЩЁ нужны ниже — если графиков окажется >1, второй модалке
    // (WorkSchedulePickerRoute → continueStartAfterScheduleSelection) тоже
    // придётся дождаться своей очереди читать [_pendingStartCoords], поэтому
    // очищаем поле только непосредственно перед финальным _performStart.
    final coords = _pendingStartCoords;
    if (orgId == null) return _performStart();

    final selectionOutcome = await _resolveScheduleForGeoStart(
      orgId,
      location.id,
    );
    if (selectionOutcome != null) return selectionOutcome;

    _pendingStartCoords = null;
    return _performStart(lat: coords?.lat, lng: coords?.lng);
  }

  /// Резолвит эффективный набор графиков по явно известной рабочей точке
  /// непосредственно перед стартом (только гео-check организации, точка уже
  /// резолвлена — см. [_resolveWorkLocationForGeoStart] /
  /// [continueStartAfterWorkLocationSelection]).
  ///
  /// 0 или 1 график — подставляется автоматически ([_preselectSchedule]),
  /// вызывающий код продолжает старт сразу (возвращает `null`). Больше
  /// одного — просит UI показать модалку выбора (см. `_WorkScheduleSelector`),
  /// возвращая [StartShiftResult.scheduleSelectionRequired]. Сбой запроса —
  /// это часть уже идущего действия «Начать», поэтому обрабатывается как
  /// обычная ошибка действия (тост/сетевая плашка + «Повторить», который
  /// заново пройдёт этот же путь) — отдельного молчаливого фолбэка нет,
  /// чтобы не стартовать смену с неизвестным требованием графика.
  ///
  /// Ключ кэша выбора графика (`_scheduleContextStorage`) для гео-check
  /// организаций сознательно остаётся `null` (как и до этой фичи) — им
  /// симметрично пишет [selectWorkSchedule], который для гео-org тоже всегда
  /// сохраняет по ключу `null` (см. тело
  /// `ShiftTrackerState.showWorkLocationSelector`): привязка кэша к реальному
  /// `work_location_id` потребовала бы синхронно менять оба места, это
  /// отдельное улучшение вне scope shift_start_location_choice.
  Future<StartShiftResult?> _resolveScheduleForGeoStart(
    String orgId,
    String? workLocationId,
  ) async {
    final result = await _workScheduleRepository.getMySchedules(
      orgId,
      workLocationId: workLocationId,
    );

    return result.fold(
      onSuccess: (schedules) {
        _applyResolvedSchedules(schedules, orgId, null);

        if (state.startableSchedules.length > 1) {
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
    final selectedScheduleId = state.selectedWorkScheduleId;
    final selectedScheduleIsStartable =
        state.schedules.data
            ?.startableSchedulesAt(_now().toUtc())
            .any((schedule) => schedule.id == selectedScheduleId) ??
        false;
    final startableScheduleId =
        selectedScheduleId != null && selectedScheduleIsStartable
        ? selectedScheduleId
        : null;
    final result = await _shiftRepository.startShift(
      organizationId: state.selectedOrganizationId,
      latitude: lat,
      longitude: lng,
      // При гео точку резолвит кубит перед стартом (_resolveWorkLocationFor
      // GeoStart/continueStartAfterWorkLocationSelection) и кладёт сюда же —
      // явный выбор вместо молчаливого «сервер решит сам»
      // (shift_start_location_choice). При гео выкл шлём выбранную вручную
      // точку (или null).
      workLocationId: state.selectedWorkLocation?.id,
      workScheduleId: startableScheduleId,
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
        // Сотрудник успел отойти от выбранной/резолвленной точки между
        // work-locations/nearby и стартом (гонка «список устарел»,
        // shift_start_location_choice/backend.md) — точка больше не
        // актуальна, сбрасываем её. Ничего не перезапрашиваем сами: сценарий
        // целиком (свежие координаты → новый nearby) начнётся заново со
        // следующего тапа «Начать» — здесь нечего резолвить без свежего GPS.
        if (error.code == 'WORK_LOCATION_OUT_OF_RANGE') {
          emit(
            state.copyWith(
              selectedWorkLocation: null,
              selectedWorkScheduleId: null,
            ),
          );
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
        // Смена только что завершилась — если у неё остались незакрытые
        // обязательные пункты, сразу проверяем окно дозаполнения (mobile.md,
        // п.2), не дожидаясь следующего резюма/pull-to-refresh.
        unawaited(_loadChecklistGrace());
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
      _loadChecklistGrace(),
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
  ///
  /// Также перечитывает список организаций
  /// (`shift_start_location_choice`): `geoCheckEnabled`/`requireWorkLocation`
  /// и т.п. настройки раньше обновлялись только pull-to-refresh, поэтому
  /// админ, переключивший геопроверку, не подхватывался у уже открытой
  /// вкладки — тот же `fetchMyOrganizations()`, что и в [refresh], пушит
  /// свежие данные в уже действующую подписку `_orgSubscription`, не трогая
  /// текущий выбор (`_maybePreselectContext` срабатывает не более раза).
  Future<void> _refreshVisibleContext() async {
    await Future.wait([
      _pollSync(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
    if (!state.hasActiveShift &&
        state.isOrgShift &&
        state.showWorkLocationSelector) {
      unawaited(_loadSchedules());
    }
  }

  void clearAutoFinishedNotice() {
    emit(state.copyWith(shiftAutoFinished: false));
  }

  /// Перепроверка окна дозаполнения после возврата с экрана чек-листов
  /// (`_ChecklistGraceBlock`, mobile.md п.2) — пользователь мог закрыть все
  /// обязательные пункты, либо окно истекло, пока он там был.
  Future<void> refreshChecklistGrace() => _loadChecklistGrace();

  /// Проверяет, есть ли у сотрудника последняя завершённая смена с открытым
  /// окном дозаполнения чек-листа — источник «заметного блока» на
  /// idle-экране (mobile.md, п.2). Дешёвый предфильтр по
  /// `Shift.hasIncompleteRequiredChecklists` (сервер сам держит его
  /// актуальным весь период окна, backend.md) экономит второй запрос, когда
  /// дозаполнять нечего.
  Future<void> _loadChecklistGrace() async {
    if (state.hasActiveShift) {
      _clearChecklistGrace();
      return;
    }

    final result = await _shiftRepository.getShifts(
      status: ShiftStatus.finished,
      limit: 1,
    );
    final shift = result.fold(
      onSuccess: (paginator) => paginator.data?.firstOrNull,
      onFailure: (_) => null,
    );

    if (shift == null ||
        shift.organizationId == null ||
        !shift.hasIncompleteRequiredChecklists) {
      _clearChecklistGrace();
      return;
    }

    final checklistsResult = await _checklistRepository.getShiftChecklists(
      shift.id,
    );
    final deadline = checklistsResult.fold(
      onSuccess: (items) => items
          .where((i) => i.fillAllowed && i.fillDeadlineAt != null)
          .map((i) => i.fillDeadlineAt)
          .whereType<DateTime>()
          .firstOrNull,
      onFailure: (_) => null,
    );

    if (deadline == null) {
      _clearChecklistGrace();
      return;
    }

    emit(
      state.copyWith(
        checklistGraceShift: shift,
        checklistGraceDeadlineAt: deadline,
        checklistGraceNow: _now().toUtc(),
      ),
    );
    _startChecklistGraceTimer();
  }

  void _clearChecklistGrace() {
    _stopChecklistGraceTimer();
    if (state.checklistGraceShift == null &&
        state.checklistGraceDeadlineAt == null) {
      return;
    }
    emit(
      state.copyWith(
        checklistGraceShift: null,
        checklistGraceDeadlineAt: null,
        checklistGraceNow: null,
      ),
    );
  }

  void _startChecklistGraceTimer() {
    _stopChecklistGraceTimer();
    _checklistGraceTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _tickChecklistGrace(),
    );
  }

  void _stopChecklistGraceTimer() {
    _checklistGraceTimer?.cancel();
    _checklistGraceTimer = null;
  }

  /// Локальный клиентский тик — переводит блок в скрытое состояние по
  /// истечении расчёта от серверного `fill_deadline_at`, без нового запроса
  /// (mobile.md, п.3). Часы устройства могут отставать/спешить — это
  /// косметика: реальное решение по-прежнему принимает сервер при
  /// фактической попытке дозаполнения.
  void _tickChecklistGrace() {
    final deadline = state.checklistGraceDeadlineAt;
    if (deadline == null) {
      _stopChecklistGraceTimer();
      return;
    }
    final now = _now().toUtc();
    if (!now.isBefore(deadline)) {
      _clearChecklistGrace();
      return;
    }
    emit(state.copyWith(checklistGraceNow: now));
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
        unawaited(_loadChecklistGrace());
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
    _stopChecklistGraceTimer();
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

  /// Гео-check организация: по координатам найдено `>1` подходящей рабочей
  /// точки (`GET .../work-locations/nearby`, `shift_start_location_choice`) —
  /// вызывающий код должен показать модалку выбора
  /// (`NearbyWorkLocationPickerRoute`) и по её результату вызвать
  /// [ShiftTrackerCubit.continueStartAfterWorkLocationSelection].
  workLocationSelectionRequired,

  /// Гео-check организация: сотрудник не попал ни в одну рабочую зону
  /// (`nearby.items` пуст) — вызывающий код показывает сообщение
  /// «Вы вне рабочих зон» (см. [ShiftTrackerState.nearestOutsideHint] для
  /// подсказки о ближайшей точке) с «Повторить», запускающим сценарий заново.
  noNearbyWorkLocation,
}
