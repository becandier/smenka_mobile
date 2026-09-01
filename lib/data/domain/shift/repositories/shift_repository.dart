import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

abstract class ShiftRepository {
  /// [scope]/[organizationId] — срез истории (`shift_history_scope`):
  /// `null` = параметр `scope` не передаётся вовсе (текущее поведение,
  /// эквивалент [ShiftScope.all] на бэке). [organizationId] осмыслен
  /// только при `scope == ShiftScope.organization`.
  Future<Task<DefaultPaginator<Shift>>> getShifts({
    ShiftStatus? status,
    DateTime? dateFrom,
    DateTime? dateTo,
    ShiftScope? scope,
    String? organizationId,
    int limit = 20,
    int offset = 0,
  });

  /// Своя смена по id (`GET /shifts/{shift_id}`, `shift_self_detail`).
  /// Персональная и орг-смена, где пользователь сотрудник; чужая,
  /// несуществующая или soft-deleted смена → `404 SHIFT_NOT_FOUND`.
  Future<Task<Shift>> getShiftById(String shiftId);

  /// Окно статистики — [dateFrom]/[dateTo] (UTC), границы вычисляет
  /// клиент (`shift_history_earnings/mobile.md`: единый источник окна на
  /// экран, серверный параметр `period` не используется).
  /// [scope]/[organizationId] — см. [getShifts]; та же семантика,
  /// статистика считается по тому же множеству смен, что отдаёт список.
  Future<Task<ShiftStats>> getStats({
    DateTime? dateFrom,
    DateTime? dateTo,
    ShiftScope? scope,
    String? organizationId,
  });

  /// Старт смены.
  ///
  /// [geoFallbackPhotoId] и [geoFallbackReason] — ветка старта без координат
  /// по фото (`shift_geo_photo_fallback`). Передаются строго вместе, только
  /// когда координат нет и точка выбрана вручную; [geoFallbackReason] — код
  /// фактически полученного `GeoFailure`. Вместе с координатами бэк вернёт
  /// 422 `VALIDATION_ERROR`: фото не обходит проверку «вне зоны».
  Future<Task<Shift>> startShift({
    String? organizationId,
    double? latitude,
    double? longitude,
    String? workLocationId,
    String? workScheduleId,
    String? geoFallbackPhotoId,
    String? geoFallbackReason,
  });

  Future<Task<Shift>> pauseShift(String shiftId);
  Future<Task<Shift>> resumeShift(String shiftId);
  Future<Task<Shift>> finishShift(String shiftId);

  /// Подать заявку на переработку по завершённой смене (владелец смены).
  Future<Task<ShiftOvertimeRequest>> requestOvertime(
    String shiftId, {
    required int minutes,
    required String comment,
  });

  /// Отозвать свою заявку, пока она `pending`.
  Future<Task<void>> cancelOvertimeRequest(String shiftId);
}
