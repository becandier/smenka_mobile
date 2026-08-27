import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';

part 'geo_fallback_start_state.freezed.dart';

/// Как флоу получает кадр: съёмкой in-app или выбором файла.
///
/// [file] включается ТОЛЬКО когда камеры нет или доступ к ней не дали —
/// это фолбэк фолбэка (решение владельца: «мало ли человек с компа сидит»),
/// а не равноправный выбор источника. Пока идёт проба камеры — [unknown].
enum GeoFallbackPhotoMode { unknown, camera, file }

@freezed
abstract class GeoFallbackStartState with _$GeoFallbackStartState {
  const factory GeoFallbackStartState({
    /// Организация смены (у неё включена геопроверка — иначе фолбэк не нужен).
    required String organizationId,

    /// Машинный код гео-ошибки, приведшей в фолбэк (`GeoFailure.code`).
    /// Уходит на бэк как есть — строки по месту не конструируем.
    required String geoFallbackReason,

    /// Выбранная сотрудником рабочая точка. Обязательна: сервер её не
    /// резолвит (координат нет), без неё бэк вернёт `WORK_LOCATION_REQUIRED`.
    WorkLocation? workLocation,

    /// Эффективный набор графиков по выбранной точке.
    @Default(SectionData<MySchedules>()) SectionData<MySchedules> schedules,
    String? workScheduleId,

    /// Источник кадра — решается пробой камеры, не пользователем.
    @Default(GeoFallbackPhotoMode.unknown) GeoFallbackPhotoMode photoMode,

    /// Подготовленный кадр (JPEG) — превью и аплоад. `null` — фото ещё нет.
    Uint8List? photoBytes,

    /// Идёт подготовка кадра (чтение + ресайз после съёмки/выбора файла).
    @Default(false) bool photoProcessing,

    /// Машинный код ошибки шага фото (`PhotoPickFailure.code` либо серверный
    /// `GEO_FALLBACK_PHOTO_INVALID`). `null` — ошибки нет.
    String? photoErrorCode,

    /// Отправка (аплоад файла + `POST /shifts/start`).
    @Default(FeatureStatus.initial) FeatureStatus submitStatus,
    String? submitError,
    String? submitErrorCode,
  }) = _GeoFallbackStartState;
  const GeoFallbackStartState._();

  List<WorkSchedule> get availableSchedules =>
      schedules.data?.items ?? const <WorkSchedule>[];

  /// Обязательность графика по настройке организации. Пока набор не загружен —
  /// `false` (как на idle-экране трекера: сетевой сбой не должен запирать
  /// сотрудника).
  bool get requireSchedule => schedules.data?.requireSchedule ?? false;

  int get earlyStartMinutes => schedules.data?.earlyStartMinutes ?? 0;

  /// >1 графика — выбор обязателен на клиенте (то же правило, что в трекере).
  bool get scheduleSelectionRequired => availableSchedules.length > 1;

  /// Графиков нет, а они обязательны — старт закрыт, нужен администратор.
  bool get scheduleBlockedNoOptions =>
      schedules.data != null && availableSchedules.isEmpty && requireSchedule;

  WorkSchedule? get selectedWorkSchedule {
    final id = workScheduleId;
    if (id == null) return null;
    return availableSchedules.where((s) => s.id == id).firstOrNull;
  }

  bool get hasPhoto => photoBytes != null;

  bool get isSubmitting => submitStatus == FeatureStatus.loading;

  /// Кнопка «Начать смену»: точка + фото обязательны, график — по тем же
  /// правилам, что и в обычном старте.
  bool get canSubmit =>
      workLocation != null &&
      hasPhoto &&
      !photoProcessing &&
      !isSubmitting &&
      !schedules.isLoading &&
      !scheduleBlockedNoOptions &&
      (!scheduleSelectionRequired || workScheduleId != null);
}
