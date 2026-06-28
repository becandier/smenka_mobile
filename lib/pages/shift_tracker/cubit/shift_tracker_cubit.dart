import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_state.dart';

class ShiftTrackerCubit extends Cubit<ShiftTrackerState> {
  ShiftTrackerCubit({
    required ShiftRepository shiftRepository,
    required OrganizationRepository organizationRepository,
    required GeoService geoService,
    required ShiftContextStorage contextStorage,
    Connectivity? connectivity,
  }) : _shiftRepository = shiftRepository,
       _organizationRepository = organizationRepository,
       _geoService = geoService,
       _contextStorage = contextStorage,
       _connectivity = connectivity ?? Connectivity(),
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
  final GeoService _geoService;
  final ShiftContextStorage _contextStorage;
  final Connectivity _connectivity;
  Timer? _timer;

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
    if (!isClosed) super.emit(state);
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
    emit(
      state.copyWith(
        selectedOrganizationId: organizationId,
        selectedWorkLocation: null,
      ),
    );
    unawaited(
      _contextStorage.save(
        organizationId ?? ShiftContextStorage.personalMarker,
      ),
    );
  }

  /// Выбор рабочей точки в модалке. `null` — пункт «Без точки» (необязательная
  /// привязка).
  void selectWorkLocation(WorkLocation? location) {
    emit(state.copyWith(selectedWorkLocation: location));
  }

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
        case GeoServiceDisabled():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoServiceDisabled;
        case GeoDenied():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoDenied;
        case GeoDeniedForever():
          emit(state.copyWith(actionStatus: FeatureStatus.initial));
          return StartShiftResult.geoDeniedForever;
        case GeoError():
          // На web сюда попадают непредвиденные отказы геолокации: показываем
          // локализованный текст по коду, а не сырой текст исключения.
          emit(
            state.copyWith(
              actionStatus: FeatureStatus.error,
              actionError: geoResult.message,
              actionErrorCode: geoResult.code,
            ),
          );
          return StartShiftResult.error;
      }
    }

    final result = await _shiftRepository.startShift(
      organizationId: state.selectedOrganizationId,
      latitude: lat,
      longitude: lng,
      // При гео точку определяет сервер (selectedWorkLocation тогда null —
      // селектор скрыт). При гео выкл шлём выбранную точку (или null).
      workLocationId: state.selectedWorkLocation?.id,
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
        return StartShiftResult.error;
      },
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
  /// приморозить 1с-таймер, и авто-финиш остался бы незамеченным.
  void onAppResumed() => unawaited(_pollSync());

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
    _orgSubscription?.cancel();
    _connectivitySub?.cancel();
    return super.close();
  }
}

enum StartShiftResult {
  success,
  error,
  geoServiceDisabled,
  geoDenied,
  geoDeniedForever,
}
