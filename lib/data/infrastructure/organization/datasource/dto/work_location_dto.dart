import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_location_dto.freezed.dart';
part 'work_location_dto.g.dart';

/// DTO рабочей точки. Парсим только `id/name/address`; прочие поля ответа
/// (`latitude/longitude/radius_meters/...`) json_serializable игнорирует.
@freezed
abstract class WorkLocationDto with _$WorkLocationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WorkLocationDto({
    required String id,
    required String name,
    String? address,
  }) = _WorkLocationDto;

  factory WorkLocationDto.fromJson(Map<String, dynamic> json) =>
      _$WorkLocationDtoFromJson(json);
}
