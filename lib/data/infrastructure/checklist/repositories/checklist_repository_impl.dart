import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/checklist_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/_mappers.dart';

class ChecklistRepositoryImpl with TaskHandler implements ChecklistRepository {
  ChecklistRepositoryImpl({required ChecklistDataSource dataSource})
    : _dataSource = dataSource;

  final ChecklistDataSource _dataSource;

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

  // --- Item photos ---

  @override
  Future<Task<ChecklistItemPhoto>> addItemPhoto(
    String shiftId,
    String instanceId,
    String itemId, {
    required String fileId,
    DateTime? capturedAt,
    double? latitude,
    double? longitude,
  }) {
    return execute(() async {
      final dto = await _dataSource.addItemPhoto(
        shiftId,
        instanceId,
        itemId,
        fileId: fileId,
        capturedAt: capturedAt,
        latitude: latitude,
        longitude: longitude,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> deleteItemPhoto(
    String shiftId,
    String instanceId,
    String itemId,
    String photoId,
  ) {
    return execute(
      () => _dataSource.deleteItemPhoto(shiftId, instanceId, itemId, photoId),
    );
  }
}
