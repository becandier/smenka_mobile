import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_template.dart';

part 'checklist_instance.freezed.dart';

enum ChecklistInstanceStatus { pending, completed, incomplete }

@freezed
abstract class ChecklistItemsSummary with _$ChecklistItemsSummary {
  const factory ChecklistItemsSummary({
    required int total,
    required int completed,
  }) = _ChecklistItemsSummary;
}

@freezed
abstract class ChecklistInstance with _$ChecklistInstance {
  const factory ChecklistInstance({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required ChecklistInstanceStatus status,
    required ChecklistItemsSummary itemsSummary,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _ChecklistInstance;
}

@freezed
abstract class ChecklistInstanceDetail with _$ChecklistInstanceDetail {
  const factory ChecklistInstanceDetail({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required ChecklistInstanceStatus status,
    required DateTime createdAt,
    required List<ChecklistInstanceItem> items,
    DateTime? completedAt,
  }) = _ChecklistInstanceDetail;
}

@freezed
abstract class ChecklistInstanceItem with _$ChecklistInstanceItem {
  const factory ChecklistInstanceItem({
    required String id,
    required String text,
    required bool isRequired,
    required int position,
    required bool isCompleted,
    required int changeCount,
    String? comment,
    DateTime? completedAt,
  }) = _ChecklistInstanceItem;
}
