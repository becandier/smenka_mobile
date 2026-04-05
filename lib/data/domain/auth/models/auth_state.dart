import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// Состояние авторизации пользователя
@freezed
sealed class AuthState with _$AuthState {
  /// Пользователь авторизован
  const factory AuthState.authenticated() = AuthStateAuthenticated;

  /// Пользователь не авторизован
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;

  /// Состояние неизвестно (при старте приложения)
  const factory AuthState.unknown() = AuthStateUnknown;
}
