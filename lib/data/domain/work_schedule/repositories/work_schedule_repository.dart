import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';

/// Абстрактный интерфейс — конвенция репозиториев проекта (см. остальные
/// `Repository` в `data/domain/*`), не необходимость под мок: сейчас у
/// мобилки один read-эндпоинт для графиков, но кубит получает репозиторий
/// через DI (`RepositoryProvider`), как и остальные.
// ignore: one_member_abstracts, reason: конвенция репозиториев проекта, см. doc-комментарий выше
abstract class WorkScheduleRepository {
  /// Эффективный набор графиков сотрудника на точке [workLocationId]
  /// (`null`, если точка ещё не определена — гео-старт до фикса позиции).
  Future<Task<MySchedules>> getMySchedules(
    String orgId, {
    String? workLocationId,
  });
}
