import 'package:freezed_annotation/freezed_annotation.dart';

part 'effective_template_dto.freezed.dart';
part 'effective_template_dto.g.dart';

@freezed
abstract class EffectiveChecklistTemplateDto
    with _$EffectiveChecklistTemplateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EffectiveChecklistTemplateDto({
    required String id,
    required String name,
    required String type,
    required bool isRequired,
    required String source,
  }) = _EffectiveChecklistTemplateDto;

  factory EffectiveChecklistTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$EffectiveChecklistTemplateDtoFromJson(json);
}
