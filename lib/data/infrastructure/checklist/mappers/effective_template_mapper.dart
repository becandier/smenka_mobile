import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/template_mapper.dart';

ChecklistTemplateSource _parseSource(String value) => switch (value) {
  'role' => ChecklistTemplateSource.role,
  'personal_add' => ChecklistTemplateSource.personalAdd,
  _ => throw ArgumentError('Unknown checklist template source: $value'),
};

extension EffectiveChecklistTemplateDtoMapper on EffectiveChecklistTemplateDto {
  EffectiveChecklistTemplate toDomain() => EffectiveChecklistTemplate(
    id: id,
    name: name,
    type: checklistTypeFromApi(type),
    isRequired: isRequired,
    source: _parseSource(source),
  );
}
