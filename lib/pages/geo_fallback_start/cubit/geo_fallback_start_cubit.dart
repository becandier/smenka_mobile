import 'dart:async';

import 'package:camera/camera.dart' show XFile;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/repositories/work_schedule_repository.dart';
import 'package:smenka_mobile/pages/geo_fallback_start/cubit/geo_fallback_start_state.dart';

/// Кубит фолбэк-старта смены по фото (`shift_geo_photo_fallback`):
/// точка → график → кадр → `POST /files` + `POST /shifts/start`.
///
/// От `ShiftTrackerCubit` не зависит вовсе: связь только через результат
/// навигации — экран возвращает стартовавшую [Shift], а трекер её принимает
/// (`ShiftTrackerCubit.adoptStartedShift`).
class GeoFallbackStartCubit extends Cubit<GeoFallbackStartState> {
  GeoFallbackStartCubit({
    required String organizationId,
    required String geoFallbackReason,
    required ShiftRepository shiftRepository,
    required WorkScheduleRepository workScheduleRepository,
    required FilesRepository filesRepository,
    required PhotoPickerService photoPicker,
    DateTime Function()? now,
  }) : _shiftRepository = shiftRepository,
       _workScheduleRepository = workScheduleRepository,
       _filesRepository = filesRepository,
       _photoPicker = photoPicker,
       _now = now ?? DateTime.now,
       super(
         GeoFallbackStartState(
           organizationId: organizationId,
           geoFallbackReason: geoFallbackReason,
         ),
       ) {
    unawaited(_probeCamera());
  }

  final ShiftRepository _shiftRepository;
  final WorkScheduleRepository _workScheduleRepository;
  final FilesRepository _filesRepository;
  final PhotoPickerService _photoPicker;
  final DateTime Function() _now;

  /// Монотонный токен запроса графиков — ответ устаревшего запроса (точку
  /// успели поменять ещё раз) игнорируется.
  int _scheduleRequestId = 0;
  Timer? _scheduleTimer;

  @override
  Future<void> close() {
    _scheduleTimer?.cancel();
    _scheduleTimer = null;
    return super.close();
  }

  /// Есть ли камера. Пока проба идёт, шаг фото показывает загрузку; результат
  /// определяет режим — съёмка in-app или (только при отсутствии камеры)
  /// выбор файла.
  Future<void> _probeCamera() async {
    final available = await _photoPicker.isCameraAvailable();
    if (isClosed) return;
    emit(
      state.copyWith(
        photoMode: available
            ? GeoFallbackPhotoMode.camera
            : GeoFallbackPhotoMode.file,
      ),
    );
  }

  /// Камера не инициализировалась/не дала доступ уже после пробы — уходим на
  /// выбор файла и показываем причину (код, не текст плагина).
  void onCameraUnavailable(Object error) {
    final failure = _photoPicker.classifyCaptureError(error);
    emit(
      state.copyWith(
        photoMode: GeoFallbackPhotoMode.file,
        photoErrorCode: failure.code,
      ),
    );
  }

  void selectWorkLocation(WorkLocation location) {
    // Набор графиков зависит от точки — прошлый выбор больше не валиден.
    _scheduleTimer?.cancel();
    _scheduleTimer = null;
    emit(
      state.copyWith(
        workLocation: location,
        scheduleNow: null,
        workScheduleId: null,
      ),
    );
    unawaited(loadSchedules());
  }

  void selectWorkSchedule(WorkSchedule schedule) {
    emit(state.copyWith(workScheduleId: schedule.id));
  }

  /// Эффективный набор графиков по выбранной точке. Явный `work_location_id`
  /// имеет приоритет над координатами (которых здесь и нет) — контракт
  /// `my-schedules` не меняется.
  Future<void> loadSchedules() async {
    final location = state.workLocation;
    if (location == null) return;

    final requestId = ++_scheduleRequestId;
    _scheduleTimer?.cancel();
    _scheduleTimer = null;
    emit(state.copyWith(schedules: state.schedules.toLoading()));

    final result = await _workScheduleRepository.getMySchedules(
      state.organizationId,
      workLocationId: location.id,
    );
    if (isClosed || requestId != _scheduleRequestId) return;

    result.fold(
      onSuccess: (schedules) {
        final now = _now().toUtc();
        emit(
          state.copyWith(
            schedules: state.schedules.toSuccess(schedules),
            scheduleNow: now,
          ),
        );
        _scheduleTimer?.cancel();
        _scheduleTimer = Timer.periodic(const Duration(seconds: 1), (_) {
          if (!isClosed && state.schedules.isSuccess) {
            emit(state.copyWith(scheduleNow: _now().toUtc()));
          }
        });
        final startable = schedules.startableSchedulesAt(now);
        final selectedId = startable.length == 1 ? startable.first.id : null;
        emit(state.copyWith(workScheduleId: selectedId));
      },
      onFailure: (error) => emit(
        state.copyWith(
          schedules: state.schedules.toError(error.message, code: error.code),
        ),
      ),
    );
  }

  /// Кадр, снятый камерой in-app. Готовится тем же пайплайном, что и любое
  /// другое фото приложения (`PhotoPickerService.preparePhoto`).
  Future<void> attachShot(XFile shot) =>
      _applyPhotoResult(() => _photoPicker.preparePhoto(shot));

  /// Выбор файла — только когда камера недоступна (см. `state.photoMode`).
  Future<void> pickFromFile() => _applyPhotoResult(
    () => _photoPicker.pickPhoto(source: PhotoSource.gallery),
  );

  Future<void> _applyPhotoResult(
    Future<PhotoPickResult> Function() produce,
  ) async {
    emit(state.copyWith(photoProcessing: true, photoErrorCode: null));
    final result = await produce();
    if (isClosed) return;

    switch (result) {
      case PhotoPickSuccess(:final bytes):
        emit(state.copyWith(photoProcessing: false, photoBytes: bytes));
      case PhotoPickCancelled():
        // Закрыл пикер — не ошибка, просто ничего не меняем.
        emit(state.copyWith(photoProcessing: false));
      case final PhotoPickFailure failure:
        emit(
          state.copyWith(photoProcessing: false, photoErrorCode: failure.code),
        );
    }
  }

  /// Пересъёмка: кадр выбрасывается, шаг фото начинается заново.
  void clearPhoto() {
    emit(
      state.copyWith(
        photoBytes: null,
        photoErrorCode: null,
        photoProcessing: false,
      ),
    );
  }

  /// Загружает кадр и стартует смену. Возвращает стартовавшую смену либо
  /// `null` — тогда причина уже в состоянии (`submitErrorCode`/`photoErrorCode`).
  ///
  /// Файл грузится на КАЖДОЙ попытке: уже загруженный, но не привязанный
  /// `file_id` переиспользовать нельзя (бэк принимает только `is_attached =
  /// false`, а после отказа старта состояние файла на сервере для клиента
  /// неизвестно) — сирот подберёт штатная чистка.
  Future<Shift?> submit() async {
    final bytes = state.photoBytes;
    final location = state.workLocation;
    if (bytes == null || location == null || state.isSubmitting) return null;

    emit(
      state.copyWith(
        submitStatus: FeatureStatus.loading,
        submitError: null,
        submitErrorCode: null,
        photoErrorCode: null,
      ),
    );

    final upload = await _filesRepository.uploadFile(
      bytes: bytes,
      filename:
          'shift_geo_${DateTime.now().toUtc().millisecondsSinceEpoch}.jpg',
      category: FileCategory.shiftGeoPhoto,
      organizationId: state.organizationId,
    );
    if (isClosed) return null;

    final file = upload.dataOrNull;
    if (file == null) {
      final error = upload.errorOrNull;
      emit(
        state.copyWith(
          submitStatus: FeatureStatus.error,
          submitError: error?.message,
          submitErrorCode: error?.code,
        ),
      );
      return null;
    }

    final selectedScheduleId = state.workScheduleId;
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
      organizationId: state.organizationId,
      workLocationId: location.id,
      workScheduleId: startableScheduleId,
      geoFallbackPhotoId: file.id,
      geoFallbackReason: state.geoFallbackReason,
    );
    if (isClosed) return null;

    return result.fold(
      onSuccess: (shift) {
        emit(state.copyWith(submitStatus: FeatureStatus.success));
        return shift;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            submitStatus: FeatureStatus.error,
            submitError: error.message,
            submitErrorCode: error.code,
          ),
        );
        _reactToStartFailure(error.code);
        return null;
      },
    );
  }

  /// Реакция на бизнес-коды отказа старта (строго по `error.code`).
  void _reactToStartFailure(String? code) {
    switch (code) {
      // Фото бэк не принял — возвращаем сотрудника на шаг съёмки: тот же файл
      // повторно использовать нельзя.
      case geoFallbackPhotoInvalidCode:
        emit(
          state.copyWith(
            photoBytes: null,
            photoErrorCode: geoFallbackPhotoInvalidCode,
          ),
        );
      // График перестал подходить/закрылось окно — сбрасываем выбор и
      // перезапрашиваем набор по той же точке.
      case 'SCHEDULE_NOT_AVAILABLE' ||
          'SCHEDULE_NOT_FOUND' ||
          'SCHEDULE_WINDOW_CLOSED':
        emit(state.copyWith(workScheduleId: null));
        unawaited(loadSchedules());
    }
  }
}

/// Серверный код «фото фолбэка не принято» (`docs/ERROR_FORMAT.md`,
/// `shift_geo_photo_fallback`).
const geoFallbackPhotoInvalidCode = 'GEO_FALLBACK_PHOTO_INVALID';
