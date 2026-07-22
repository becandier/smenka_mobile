import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/work_schedule.dart';

part 'my_schedules.freezed.dart';

/// Ответ `GET /organizations/{org_id}/my-schedules` целиком: эффективный
/// набор графиков сотрудника + флаг обязательности выбора настройки
/// организации (дублируется в ответе, чтобы клиент не ходил за настройками
/// отдельным запросом).
@freezed
abstract class MySchedules with _$MySchedules {
  const factory MySchedules({
    required List<WorkSchedule> items,
    required int total,
    required bool requireSchedule,
  }) = _MySchedules;
}
