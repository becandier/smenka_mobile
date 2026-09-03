// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_work_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyWorkLocationDto _$NearbyWorkLocationDtoFromJson(
  Map<String, dynamic> json,
) => _NearbyWorkLocationDto(
  id: json['id'] as String,
  name: json['name'] as String,
  distanceMeters: (json['distance_meters'] as num).toInt(),
  isNearest: json['is_nearest'] as bool,
  address: json['address'] as String?,
);

Map<String, dynamic> _$NearbyWorkLocationDtoToJson(
  _NearbyWorkLocationDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'distance_meters': instance.distanceMeters,
  'is_nearest': instance.isNearest,
  'address': instance.address,
};

_NearestOutsideWorkLocationDto _$NearestOutsideWorkLocationDtoFromJson(
  Map<String, dynamic> json,
) => _NearestOutsideWorkLocationDto(
  name: json['name'] as String,
  distanceMeters: (json['distance_meters'] as num).toInt(),
);

Map<String, dynamic> _$NearestOutsideWorkLocationDtoToJson(
  _NearestOutsideWorkLocationDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'distance_meters': instance.distanceMeters,
};

_NearbyWorkLocationsDto _$NearbyWorkLocationsDtoFromJson(
  Map<String, dynamic> json,
) => _NearbyWorkLocationsDto(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => NearbyWorkLocationDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <NearbyWorkLocationDto>[],
  nearestOutside: json['nearest_outside'] == null
      ? null
      : NearestOutsideWorkLocationDto.fromJson(
          json['nearest_outside'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$NearbyWorkLocationsDtoToJson(
  _NearbyWorkLocationsDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'nearest_outside': instance.nearestOutside,
};
