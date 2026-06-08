import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';

ChecklistType _parseType(String value) =>
    ChecklistType.values.firstWhere((e) => _checklistTypeApi(e) == value);

String _checklistTypeApi(ChecklistType t) => switch (t) {
      ChecklistType.shiftStart => 'shift_start',
      ChecklistType.shiftEnd => 'shift_end',
    };

extension ChecklistTypeCodec on ChecklistType {
  String toApi() => _checklistTypeApi(this);
}

ChecklistType checklistTypeFromApi(String value) => _parseType(value);

extension ChecklistTemplateDtoMapper on ChecklistTemplateDto {
  ChecklistTemplate toDomain() => ChecklistTemplate(
        id: id,
        name: name,
        type: _parseType(type),
        isRequired: isRequired,
        itemsCount: itemsCount,
        isArchived: isArchived,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension ChecklistTemplateItemDtoMapper on ChecklistTemplateItemDto {
  ChecklistTemplateItem toDomain() => ChecklistTemplateItem(
        id: id,
        text: text,
        isRequired: isRequired,
        position: position,
      );
}

extension ChecklistTemplateDetailDtoMapper on ChecklistTemplateDetailDto {
  ChecklistTemplateDetail toDomain() => ChecklistTemplateDetail(
        id: id,
        name: name,
        type: _parseType(type),
        isRequired: isRequired,
        isArchived: isArchived,
        items: items.map((e) => e.toDomain()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
