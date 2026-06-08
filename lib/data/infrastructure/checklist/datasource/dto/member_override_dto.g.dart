// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_override_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberOverrideItemDto _$MemberOverrideItemDtoFromJson(
        Map<String, dynamic> json) =>
    _MemberOverrideItemDto(
      templateId: json['template_id'] as String,
      templateName: json['template_name'] as String,
      templateType: json['template_type'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MemberOverrideItemDtoToJson(
        _MemberOverrideItemDto instance) =>
    <String, dynamic>{
      'template_id': instance.templateId,
      'template_name': instance.templateName,
      'template_type': instance.templateType,
      'type': instance.type,
    };
