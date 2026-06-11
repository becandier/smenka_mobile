import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/checklist_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/_mappers.dart';

class ChecklistRepositoryImpl with TaskHandler implements ChecklistRepository {
  ChecklistRepositoryImpl({required ChecklistDataSource dataSource})
    : _dataSource = dataSource;

  final ChecklistDataSource _dataSource;

  // --- Templates ---

  @override
  Future<Task<List<ChecklistTemplate>>> getTemplates(
    String orgId, {
    bool includeArchived = false,
  }) {
    return execute(() async {
      final dtos = await _dataSource.getTemplates(
        orgId,
        includeArchived: includeArchived,
      );
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<ChecklistTemplateDetail>> getTemplate(
    String orgId,
    String templateId,
  ) {
    return execute(() async {
      final dto = await _dataSource.getTemplate(orgId, templateId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<ChecklistTemplate>> createTemplate(
    String orgId, {
    required String name,
    required ChecklistType type,
    required bool isRequired,
  }) {
    return execute(() async {
      final dto = await _dataSource.createTemplate(
        orgId,
        name: name,
        type: type.toApi(),
        isRequired: isRequired,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<ChecklistTemplate>> updateTemplate(
    String orgId,
    String templateId, {
    String? name,
    ChecklistType? type,
    bool? isRequired,
  }) {
    return execute(() async {
      final dto = await _dataSource.updateTemplate(
        orgId,
        templateId,
        name: name,
        type: type?.toApi(),
        isRequired: isRequired,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<ChecklistTemplate>> archiveTemplate(
    String orgId,
    String templateId,
  ) {
    return execute(() async {
      final dto = await _dataSource.archiveTemplate(orgId, templateId);
      return dto.toDomain();
    });
  }

  // --- Template items ---

  @override
  Future<Task<ChecklistTemplateItem>> addItem(
    String orgId,
    String templateId, {
    required String text,
    required bool isRequired,
  }) {
    return execute(() async {
      final dto = await _dataSource.addItem(
        orgId,
        templateId,
        text: text,
        isRequired: isRequired,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<ChecklistTemplateItem>> updateItem(
    String orgId,
    String templateId,
    String itemId, {
    String? text,
    bool? isRequired,
  }) {
    return execute(() async {
      final dto = await _dataSource.updateItem(
        orgId,
        templateId,
        itemId,
        text: text,
        isRequired: isRequired,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> deleteItem(
    String orgId,
    String templateId,
    String itemId,
  ) {
    return executeVoid(() => _dataSource.deleteItem(orgId, templateId, itemId));
  }

  @override
  Future<Task<void>> reorderItems(
    String orgId,
    String templateId, {
    required List<String> itemIds,
  }) {
    return executeVoid(
      () => _dataSource.reorderItems(orgId, templateId, itemIds: itemIds),
    );
  }

  // --- Assignments ---

  @override
  Future<Task<void>> assignToRoles(
    String orgId,
    String templateId, {
    required List<String> roleIds,
  }) {
    return executeVoid(
      () => _dataSource.assignToRoles(orgId, templateId, roleIds: roleIds),
    );
  }

  @override
  Future<Task<ChecklistAssignment>> getAssignments(
    String orgId,
    String templateId,
  ) {
    return execute(() async {
      final dto = await _dataSource.getAssignments(orgId, templateId);
      return dto.toDomain();
    });
  }

  // --- Overrides ---

  @override
  Future<Task<void>> setMemberOverrides(
    String orgId,
    String userId, {
    required List<ChecklistMemberOverride> overrides,
  }) {
    return executeVoid(
      () => _dataSource.setMemberOverrides(
        orgId,
        userId,
        overrides: overrides
            .map(
              (o) => <String, String>{
                'template_id': o.templateId,
                'type': o.type.name,
              },
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Task<List<MemberChecklistOverride>>> getMemberOverrides(
    String orgId,
    String userId,
  ) {
    return execute(() async {
      final dtos = await _dataSource.getMemberOverrides(orgId, userId);
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<void>> setPersonalOverride(
    String orgId,
    String templateId,
    String userId, {
    required ChecklistOverrideType type,
  }) {
    return executeVoid(
      () => _dataSource.setPersonalOverride(
        orgId,
        templateId,
        userId,
        type: type.name,
      ),
    );
  }

  @override
  Future<Task<void>> clearPersonalOverride(
    String orgId,
    String templateId,
    String userId,
  ) {
    return executeVoid(
      () => _dataSource.clearPersonalOverride(orgId, templateId, userId),
    );
  }

  @override
  Future<Task<List<EffectiveChecklistTemplate>>> getEffectiveTemplates(
    String orgId,
    String userId,
  ) {
    return execute(() async {
      final dtos = await _dataSource.getEffectiveTemplates(orgId, userId);
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  // --- Shift instances ---

  @override
  Future<Task<List<ChecklistInstance>>> getShiftChecklists(String shiftId) {
    return execute(() async {
      final dtos = await _dataSource.getShiftChecklists(shiftId);
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<ChecklistInstanceDetail>> getInstanceDetail(
    String shiftId,
    String instanceId,
  ) {
    return execute(() async {
      final dto = await _dataSource.getInstanceDetail(shiftId, instanceId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<ChecklistInstanceItem>> updateInstanceItem(
    String shiftId,
    String instanceId,
    String itemId, {
    required bool isCompleted,
    String? comment,
  }) {
    return execute(() async {
      final dto = await _dataSource.updateInstanceItem(
        shiftId,
        instanceId,
        itemId,
        isCompleted: isCompleted,
        comment: comment,
      );
      return dto.toDomain();
    });
  }
}
