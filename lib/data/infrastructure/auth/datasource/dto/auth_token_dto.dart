import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token_dto.freezed.dart';
part 'auth_token_dto.g.dart';

/// DTO модель токенов авторизации от API
@freezed
abstract class AuthTokenDto with _$AuthTokenDto {
  const factory AuthTokenDto({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) = _AuthTokenDto;

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDtoFromJson(json);
}
