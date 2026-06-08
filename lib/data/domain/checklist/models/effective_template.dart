import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_template.dart';

part 'effective_template.freezed.dart';

enum ChecklistTemplateSource { role, personalAdd }

@freezed
abstract class EffectiveChecklistTemplate with _$EffectiveChecklistTemplate {
  const factory EffectiveChecklistTemplate({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required ChecklistTemplateSource source,
  }) = _EffectiveChecklistTemplate;
}
