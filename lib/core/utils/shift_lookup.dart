import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';

/// Найти свою смену по id через `GET /shifts` (нет отдельного эндпоинта
/// «смена по id» для персональной истории — только список с фильтрами).
///
/// Сужаем список окном `[startedAt, startedAt]`: интервалы смен одного
/// сотрудника не пересекаются (backend R2), поэтому точное совпадение
/// `started_at` однозначно определяет смену. Используется для перехода из
/// уведомления `shift_manual_changed` (точный `started_at` приходит в
/// payload) и из строки «Мои начисления» (приблизительно — `occurred_at`
/// начисления по умолчанию равен `started_at` привязанной смены, но админ
/// мог его переопределить или смену затем удалить — тогда смена просто не
/// найдётся, вызывающая сторона показывает ошибку).
Future<Shift?> findShiftByExactStart(
  ShiftRepository repository, {
  required String shiftId,
  required DateTime startedAt,
}) async {
  final result = await repository.getShifts(
    dateFrom: startedAt,
    dateTo: startedAt,
  );
  return switch (result) {
    TaskSuccess(:final data) =>
      data.data?.where((s) => s.id == shiftId).firstOrNull,
    TaskFailure() => null,
  };
}
