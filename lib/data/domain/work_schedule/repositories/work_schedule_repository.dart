import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';

/// Абстрактный интерфейс — конвенция репозиториев проекта (см. остальные
/// `Repository` в `data/domain/*`), не необходимость под мок: сейчас у
/// мобилки один read-эндпоинт для графиков, но кубит получает репозиторий
/// через DI (`RepositoryProvider`), как и остальные.
// ignore: one_member_abstracts, reason: конвенция репозиториев проекта, см. doc-комментарий выше
abstract class WorkScheduleRepository {
  /// Эффективный набор графиков сотрудника.
  ///
  /// Точка резолвится одним из двух взаимоисключающих способов (см.
  /// `docs/tasks/work_schedules_geo_resolve/backend.md`):
  /// - [workLocationId] — точка выбрана вручную (организации без
  ///   геопроверки, `showWorkLocationSelector == true`);
  /// - [lat]/[lng] — свежие координаты сотрудника (организации с
  ///   геопроверкой; передаются только непосредственно перед стартом смены,
  ///   см. `ShiftTrackerCubit.startShift`, не на idle-экране).
  Future<Task<MySchedules>> getMySchedules(
    String orgId, {
    String? workLocationId,
    double? lat,
    double? lng,
  });
}
