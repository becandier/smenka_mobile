import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/template_mapper.dart';

ChecklistOverrideType parseOverrideType(String value) => switch (value) {
      'add' => ChecklistOverrideType.add,
      'remove' => ChecklistOverrideType.remove,
      _ => throw ArgumentError('Unknown override type: $value'),
    };

extension MemberOverrideItemDtoMapper on MemberOverrideItemDto {
  MemberChecklistOverride toDomain() => MemberChecklistOverride(
        templateId: templateId,
        templateName: templateName,
        templateType: checklistTypeFromApi(templateType),
        type: parseOverrideType(type),
      );
}
