import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';

/// Чтение чек-листов: эффективные шаблоны участника (read-only просмотр в
/// member_detail) и экземпляры чек-листов в смене (заполнение сотрудником).
///
/// Управление шаблонами (создание/правка/назначение ролям/overrides) вынесено
/// в веб-админку.
abstract class ChecklistRepository {
  Future<Task<List<EffectiveChecklistTemplate>>> getEffectiveTemplates(
    String orgId,
    String userId,
  );

  // Shift instances

  Future<Task<List<ChecklistInstance>>> getShiftChecklists(String shiftId);

  Future<Task<ChecklistInstanceDetail>> getInstanceDetail(
    String shiftId,
    String instanceId,
  );

  Future<Task<ChecklistInstanceItem>> updateInstanceItem(
    String shiftId,
    String instanceId,
    String itemId, {
    required bool isCompleted,
    String? comment,
  });

  // Item photos (владелец активной смены)

  Future<Task<ChecklistItemPhoto>> addItemPhoto(
    String shiftId,
    String instanceId,
    String itemId, {
    required String fileId,
    DateTime? capturedAt,
    double? latitude,
    double? longitude,
  });

  Future<Task<void>> deleteItemPhoto(
    String shiftId,
    String instanceId,
    String itemId,
    String photoId,
  );
}
