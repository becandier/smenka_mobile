import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';

class ChecklistDataSource {
  ChecklistDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

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
      data: {'is_completed': isCompleted, 'comment': comment},
    );
    return ChecklistInstanceItemDto.fromJson(response.data!);
  }

  // --- Item photos ---

  Future<ChecklistItemPhotoDto> addItemPhoto(
    String shiftId,
    String instanceId,
    String itemId, {
    required String fileId,
    DateTime? capturedAt,
    double? latitude,
    double? longitude,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/$shiftId/checklists/$instanceId/items/$itemId/photos',
      data: {
        'file_id': fileId,
        if (capturedAt != null)
          'captured_at': capturedAt.toUtc().toIso8601String(),
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
      },
    );
    return ChecklistItemPhotoDto.fromJson(response.data!);
  }

  Future<void> deleteItemPhoto(
    String shiftId,
    String instanceId,
    String itemId,
    String photoId,
  ) async {
    await _dio.delete<void>(
      '/shifts/$shiftId/checklists/$instanceId/items/$itemId/photos/$photoId',
    );
  }
}
