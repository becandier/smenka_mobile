// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkLocationDto _$WorkLocationDtoFromJson(Map<String, dynamic> json) =>
    _WorkLocationDto(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radiusMeters: (json['radius_meters'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$WorkLocationDtoToJson(_WorkLocationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius_meters': instance.radiusMeters,
      'created_at': instance.createdAt.toIso8601String(),
    };
