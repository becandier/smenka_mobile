import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/work_schedule/_work_schedule.dart';
import 'package:smenka_mobile/data/infrastructure/work_schedule/datasource/work_schedule_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/work_schedule/mappers/_mappers.dart';

class WorkScheduleRepositoryImpl
    with TaskHandler
    implements WorkScheduleRepository {
  WorkScheduleRepositoryImpl({required WorkScheduleDataSource dataSource})
    : _dataSource = dataSource;

  final WorkScheduleDataSource _dataSource;

  @override
  Future<Task<MySchedules>> getMySchedules(
    String orgId, {
    String? workLocationId,
    double? lat,
    double? lng,
  }) {
    return execute(() async {
      final dto = await _dataSource.getMySchedules(
        orgId,
        workLocationId: workLocationId,
        lat: lat,
        lng: lng,
      );
      return dto.toDomain();
    });
  }
}
