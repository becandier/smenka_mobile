import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
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
  })  : _shiftRepository = shiftRepository,
        _organizationRepository = organizationRepository,
        _geoService = geoService,
        super(const ShiftTrackerState()) {
    _orgSubscription = _organizationRepository
        .watchMyOrganizations()
        .listen((orgs) {
      emit(state.copyWith(
        organizations: state.organizations.toSuccess(orgs),
      ),);
    });
    _init();
  }

  final ShiftRepository _shiftRepository;
  final OrganizationRepository _organizationRepository;
  final GeoService _geoService;
  Timer? _timer;

  @override
  void emit(ShiftTrackerState state) {
    if (!isClosed) super.emit(state);
  }

  StreamSubscription<List<Organization>>? _orgSubscription;

  Future<void> _init() async {
    await Future.wait([
      _loadActiveShift(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
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
        emit(state.copyWith(
          activeShift: state.activeShift.toError(error.message),
        ),);
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
    emit(state.copyWith(selectedOrganizationId: organizationId));
  }

  Future<StartShiftResult> startShift() async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
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
          emit(state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: geoResult.message,
          ),);
          return StartShiftResult.error;
      }
    }

    final result = await _shiftRepository.startShift(
      organizationId: state.selectedOrganizationId,
      latitude: lat,
      longitude: lng,
    );

    return result.fold(
      onSuccess: (shift) {
        emit(state.copyWith(
          activeShift: state.activeShift.toSuccess(shift),
          actionStatus: FeatureStatus.success,
        ),);
        _startTimer(shift);
        return StartShiftResult.success;
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
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

    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );

    final result = await _shiftRepository.pauseShift(shift.id);

    return result.fold(
      onSuccess: (updatedShift) {
        emit(state.copyWith(
          activeShift: state.activeShift.toSuccess(updatedShift),
          actionStatus: FeatureStatus.success,
        ),);
        return true;
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
        return false;
      },
    );
  }

  Future<bool> resumeShift() async {
    final shift = state.activeShift.data;
    if (shift == null) return false;

    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );

    final result = await _shiftRepository.resumeShift(shift.id);

    return result.fold(
      onSuccess: (updatedShift) {
        emit(state.copyWith(
          activeShift: state.activeShift.toSuccess(updatedShift),
          actionStatus: FeatureStatus.success,
        ),);
        return true;
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
        return false;
      },
    );
  }

  Future<bool> finishShift() async {
    final shift = state.activeShift.data;
    if (shift == null) return false;

    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );

    final result = await _shiftRepository.finishShift(shift.id);

    return result.fold(
      onSuccess: (_) {
        _stopTimer();
        emit(state.copyWith(
          activeShift: const SectionData(),
          actionStatus: FeatureStatus.success,
          elapsedSeconds: 0,
          selectedOrganizationId: null,
        ),);
        return true;
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
        return false;
      },
    );
  }

  Future<void> refresh() async {
    await Future.wait([
      _loadActiveShift(),
      _organizationRepository.fetchMyOrganizations(),
    ]);
  }

  void _startTimer(Shift shift) {
    _stopTimer();
    _updateElapsed(shift);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateElapsed(state.activeShift.data);
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
