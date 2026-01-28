import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token.freezed.dart';

/// Доменная модель токенов авторизации
@freezed
abstract class AuthToken with _$AuthToken {
  const factory AuthToken({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) = _AuthToken;

  const AuthToken._();

  /// Проверяет, истёк ли токен
  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
