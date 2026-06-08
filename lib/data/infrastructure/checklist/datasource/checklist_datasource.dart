import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';

class ChecklistDataSource {
  ChecklistDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  // --- Templates ---

  Future<List<ChecklistTemplateDto>> getTemplates(
    String orgId, {
    bool includeArchived = false,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates',
      queryParameters: {'include_archived': includeArchived},
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(ChecklistTemplateDto.fromJson)
        .toList();
  }

  Future<ChecklistTemplateDetailDto> getTemplate(
    String orgId,
    String templateId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates/$templateId',
    );
    return ChecklistTemplateDetailDto.fromJson(response.data!);
  }

  Future<ChecklistTemplateDto> createTemplate(
    String orgId, {
    required String name,
    required String type,
    required bool isRequired,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates',
      data: {
        'name': name,
        'type': type,
        'is_required': isRequired,
      },
    );
    return ChecklistTemplateDto.fromJson(response.data!);
  }

  Future<ChecklistTemplateDto> updateTemplate(
    String orgId,
    String templateId, {
    String? name,
    String? type,
    bool? isRequired,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (type != null) data['type'] = type;
    if (isRequired != null) data['is_required'] = isRequired;

    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates/$templateId',
      data: data,
    );
    return ChecklistTemplateDto.fromJson(response.data!);
  }

  Future<ChecklistTemplateDto> archiveTemplate(
    String orgId,
    String templateId,
  ) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates/$templateId',
    );
    return ChecklistTemplateDto.fromJson(response.data!);
  }

  // --- Template items ---

  Future<ChecklistTemplateItemDto> addItem(
    String orgId,
    String templateId, {
    required String text,
    required bool isRequired,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates/$templateId/items',
      data: {
        'text': text,
        'is_required': isRequired,
      },
    );
    return ChecklistTemplateItemDto.fromJson(response.data!);
  }

  Future<ChecklistTemplateItemDto> updateItem(
    String orgId,
    String templateId,
    String itemId, {
    String? text,
    bool? isRequired,
  }) async {
    final data = <String, dynamic>{};
    if (text != null) data['text'] = text;
    if (isRequired != null) data['is_required'] = isRequired;

    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates/$templateId/items/$itemId',
      data: data,
    );
    return ChecklistTemplateItemDto.fromJson(response.data!);
  }

  Future<void> deleteItem(
    String orgId,
    String templateId,
    String itemId,
  ) async {
    await _dio.delete<void>(
      '/organizations/$orgId/checklist-templates/$templateId/items/$itemId',
    );
  }

  Future<void> reorderItems(
    String orgId,
    String templateId, {
    required List<String> itemIds,
  }) async {
    await _dio.put<void>(
      '/organizations/$orgId/checklist-templates/$templateId/items/reorder',
      data: {'item_ids': itemIds},
    );
  }

  // --- Assignments ---

  Future<void> assignToRoles(
    String orgId,
    String templateId, {
    required List<String> roleIds,
  }) async {
    await _dio.put<void>(
      '/organizations/$orgId/checklist-templates/$templateId/roles',
      data: {'role_ids': roleIds},
    );
  }

  Future<ChecklistAssignmentDto> getAssignments(
    String orgId,
    String templateId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/checklist-templates/$templateId/assignments',
    );
    return ChecklistAssignmentDto.fromJson(response.data!);
  }

  // --- Overrides ---

  Future<void> setMemberOverrides(
    String orgId,
    String userId, {
    required List<Map<String, String>> overrides,
  }) async {
    await _dio.put<void>(
      '/organizations/$orgId/members/$userId/checklist-overrides',
      data: {'overrides': overrides},
    );
  }

  Future<List<MemberOverrideItemDto>> getMemberOverrides(
    String orgId,
    String userId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/members/$userId/checklist-overrides',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(MemberOverrideItemDto.fromJson)
        .toList();
  }

  Future<void> setPersonalOverride(
    String orgId,
    String templateId,
    String userId, {
    required String type,
  }) async {
    await _dio.put<void>(
      '/organizations/$orgId/checklist-templates/$templateId/personal/$userId',
      data: {'type': type},
    );
  }

  Future<void> clearPersonalOverride(
    String orgId,
    String templateId,
    String userId,
  ) async {
    await _dio.delete<void>(
      '/organizations/$orgId/checklist-templates/$templateId/personal/$userId',
    );
  }

  Future<List<EffectiveChecklistTemplateDto>> getEffectiveTemplates(
    String orgId,
    String userId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/members/$userId/checklists',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(EffectiveChecklistTemplateDto.fromJson)
        .toList();
  }

  // --- Shift instances ---

  Future<List<ChecklistInstanceDto>> getShiftChecklists(String shiftId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/shifts/$shiftId/checklists',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(ChecklistInstanceDto.fromJson)
        .toList();
  }

  Future<ChecklistInstanceDetailDto> getInstanceDetail(
    String shiftId,
    String instanceId,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/shifts/$shiftId/checklists/$instanceId',
    );
    return ChecklistInstanceDetailDto.fromJson(response.data!);
  }

  Future<ChecklistInstanceItemDto> updateInstanceItem(
    String shiftId,
    String instanceId,
    String itemId, {
    required bool isCompleted,
    String? comment,
  }) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/shifts/$shiftId/checklists/$instanceId/items/$itemId',
      data: {
        'is_completed': isCompleted,
        'comment': comment,
      },
    );
    return ChecklistInstanceItemDto.fromJson(response.data!);
  }
}
