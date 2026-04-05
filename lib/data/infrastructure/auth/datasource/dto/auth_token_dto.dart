import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token_dto.freezed.dart';
part 'auth_token_dto.g.dart';

@freezed
abstract class AuthTokenDto with _$AuthTokenDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AuthTokenDto({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
  }) = _AuthTokenDto;

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDtoFromJson(json);
}
