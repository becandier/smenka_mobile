// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkLocationDto _$WorkLocationDtoFromJson(Map<String, dynamic> json) =>
    _WorkLocationDto(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$WorkLocationDtoToJson(_WorkLocationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };
