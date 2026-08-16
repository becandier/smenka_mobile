import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/work_schedule/datasource/dto/_dto.dart';

extension WorkScheduleMapper on WorkScheduleDto {
  WorkSchedule toDomain() {
    return WorkSchedule(
      id: id,
      name: name,
      startTime: startTime,
      endTime: endTime,
      durationMinutes: durationMinutes,
      crossesMidnight: crossesMidnight,
      nextStartAt: nextStartAt,
      nextEndAt: nextEndAt,
      isCurrent: isCurrent,
      startsInMinutes: startsInMinutes,
    );
  }
}

extension MySchedulesMapper on MySchedulesDto {
  MySchedules toDomain() {
    return MySchedules(
      items: items.map((e) => e.toDomain()).toList(),
      total: total,
      requireSchedule: requireSchedule,
      earlyStartMinutes: earlyStartMinutes,
    );
  }
}
