// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effective_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EffectiveChecklistTemplateDto _$EffectiveChecklistTemplateDtoFromJson(
  Map<String, dynamic> json,
) => _EffectiveChecklistTemplateDto(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  isRequired: json['is_required'] as bool,
  source: json['source'] as String,
  locationIds:
      (json['location_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$EffectiveChecklistTemplateDtoToJson(
  _EffectiveChecklistTemplateDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'is_required': instance.isRequired,
  'source': instance.source,
  'location_ids': instance.locationIds,
};
