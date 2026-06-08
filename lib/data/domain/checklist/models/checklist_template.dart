import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_template.freezed.dart';

enum ChecklistType { shiftStart, shiftEnd }

@freezed
abstract class ChecklistTemplate with _$ChecklistTemplate {
  const factory ChecklistTemplate({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required int itemsCount,
    required bool isArchived,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecklistTemplate;
}

@freezed
abstract class ChecklistTemplateDetail with _$ChecklistTemplateDetail {
  const factory ChecklistTemplateDetail({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required bool isArchived,
    required List<ChecklistTemplateItem> items,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecklistTemplateDetail;
}

@freezed
abstract class ChecklistTemplateItem with _$ChecklistTemplateItem {
  const factory ChecklistTemplateItem({
    required String id,
    required String text,
    required bool isRequired,
    required int position,
  }) = _ChecklistTemplateItem;
}
