import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result_dto.freezed.dart';
part 'register_result_dto.g.dart';

@freezed
abstract class RegisterResultDto with _$RegisterResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegisterResultDto({
    required String userId,
    required String message,
  }) = _RegisterResultDto;

  factory RegisterResultDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResultDtoFromJson(json);
}
