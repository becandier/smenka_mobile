import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_work_location_dto.freezed.dart';
part 'nearby_work_location_dto.g.dart';

/// DTO элемента `items` в ответе `work-locations/nearby`. Парсим только поля,
/// нужные UI (`id/name/address/distance_meters/is_nearest`) — `latitude`/
/// `longitude`/`radius_meters` json_serializable игнорирует (карты нет, вне
/// scope shift_start_location_choice/mobile.md).
@freezed
abstract class NearbyWorkLocationDto with _$NearbyWorkLocationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NearbyWorkLocationDto({
    required String id,
    required String name,
    required int distanceMeters,
    required bool isNearest,
    String? address,
  }) = _NearbyWorkLocationDto;

  factory NearbyWorkLocationDto.fromJson(Map<String, dynamic> json) =>
      _$NearbyWorkLocationDtoFromJson(json);
}

/// DTO поля `nearest_outside`. `id`/`radius_meters` из ответа не нужны UI —
/// подсказка показывает только название и расстояние.
@freezed
abstract class NearestOutsideWorkLocationDto
    with _$NearestOutsideWorkLocationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NearestOutsideWorkLocationDto({
    required String name,
    required int distanceMeters,
  }) = _NearestOutsideWorkLocationDto;

  factory NearestOutsideWorkLocationDto.fromJson(Map<String, dynamic> json) =>
      _$NearestOutsideWorkLocationDtoFromJson(json);
}

/// DTO ответа `GET /organizations/{org_id}/work-locations/nearby` целиком.
@freezed
abstract class NearbyWorkLocationsDto with _$NearbyWorkLocationsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NearbyWorkLocationsDto({
    @Default(<NearbyWorkLocationDto>[]) List<NearbyWorkLocationDto> items,
    NearestOutsideWorkLocationDto? nearestOutside,
  }) = _NearbyWorkLocationsDto;

  factory NearbyWorkLocationsDto.fromJson(Map<String, dynamic> json) =>
      _$NearbyWorkLocationsDtoFromJson(json);
}
