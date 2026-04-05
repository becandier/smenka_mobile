import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_location_dto.freezed.dart';
part 'work_location_dto.g.dart';

@freezed
abstract class WorkLocationDto with _$WorkLocationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkLocationDto({
    required String id,
    required String organizationId,
    required String name,
    required double latitude,
    required double longitude,
    required int radiusMeters,
    required DateTime createdAt,
  }) = _WorkLocationDto;

  factory WorkLocationDto.fromJson(Map<String, dynamic> json) =>
      _$WorkLocationDtoFromJson(json);
}
