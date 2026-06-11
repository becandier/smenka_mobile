import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';

abstract class ChecklistRepository {
  // Templates

  Future<Task<List<ChecklistTemplate>>> getTemplates(
    String orgId, {
    bool includeArchived = false,
  });

  Future<Task<ChecklistTemplateDetail>> getTemplate(
    String orgId,
    String templateId,
  );

  Future<Task<ChecklistTemplate>> createTemplate(
    String orgId, {
    required String name,
    required ChecklistType type,
    required bool isRequired,
  });

  Future<Task<ChecklistTemplate>> updateTemplate(
    String orgId,
    String templateId, {
    String? name,
    ChecklistType? type,
    bool? isRequired,
  });

  Future<Task<ChecklistTemplate>> archiveTemplate(
    String orgId,
    String templateId,
  );

  // Template items

  Future<Task<ChecklistTemplateItem>> addItem(
    String orgId,
    String templateId, {
    required String text,
    required bool isRequired,
  });

  Future<Task<ChecklistTemplateItem>> updateItem(
    String orgId,
    String templateId,
    String itemId, {
    String? text,
    bool? isRequired,
  });

  Future<Task<void>> deleteItem(String orgId, String templateId, String itemId);

  Future<Task<void>> reorderItems(
    String orgId,
    String templateId, {
    required List<String> itemIds,
  });

  // Assignments

  Future<Task<void>> assignToRoles(
    String orgId,
    String templateId, {
    required List<String> roleIds,
  });

  Future<Task<ChecklistAssignment>> getAssignments(
    String orgId,
    String templateId,
  );

  // Member overrides

  Future<Task<void>> setMemberOverrides(
    String orgId,
    String userId, {
    required List<ChecklistMemberOverride> overrides,
  });

  Future<Task<List<MemberChecklistOverride>>> getMemberOverrides(
    String orgId,
    String userId,
  );

  Future<Task<void>> setPersonalOverride(
    String orgId,
    String templateId,
    String userId, {
    required ChecklistOverrideType type,
  });

  Future<Task<void>> clearPersonalOverride(
    String orgId,
    String templateId,
    String userId,
  );

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
}
