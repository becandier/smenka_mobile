import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';

part 'login_state.freezed.dart';

enum AuthMode { login, register }

/// Провайдер, чей OAuth-флоу сейчас в процессе (для спиннера нужной кнопки)
enum OAuthSignInProvider { google, apple }

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(AuthMode.login) AuthMode mode,
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
    @Default(false) bool obscurePassword,
    @Default(FeatureStatus.initial) FeatureStatus status,
    String? error,

    /// Машинный `error.code` последней ошибки (для маппинга 423/429)
    String? errorCode,

    /// Конфигурация OAuth-провайдеров с бэка (`null` — ещё не загружена).
    /// На web остаётся `null` всегда — OAuth-вход вне scope web-сборки.
    OAuthConfig? oauthConfig,

    /// Провайдер, чья кнопка сейчас показывает спиннер
    OAuthSignInProvider? activeOAuthProvider,
  }) = _LoginState;
  const LoginState._();

  bool get isLogin => mode == AuthMode.login;
  bool get isRegister => mode == AuthMode.register;

  /// Аккаунт временно заблокирован (423 ACCOUNT_LOCKED) — блокируем submit
  bool get isLocked => errorCode == 'ACCOUNT_LOCKED';

  bool get isEmailValid => RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);

  bool get isPasswordLongEnough => password.length >= 8;
  bool get passwordHasLetter => RegExp('[a-zA-Zа-яА-ЯёЁ]').hasMatch(password);
  bool get passwordHasDigit => RegExp(r'\d').hasMatch(password);
  bool get isPasswordValid =>
      isPasswordLongEnough && passwordHasLetter && passwordHasDigit;

  bool get isNameValid => name.trim().isNotEmpty;

  bool get isFormValid {
    if (isLogin) return isEmailValid && password.isNotEmpty;
    return isEmailValid && isPasswordValid && isNameValid;
  }

  bool get isLoading => status == FeatureStatus.loading;

  bool get googleEnabled => oauthConfig?.google?.enabled ?? false;
  bool get appleEnabled => oauthConfig?.apple?.enabled ?? false;
  bool get showOAuthSection => googleEnabled || appleEnabled;

  bool get isGoogleLoading =>
      isLoading && activeOAuthProvider == OAuthSignInProvider.google;
  bool get isAppleLoading =>
      isLoading && activeOAuthProvider == OAuthSignInProvider.apple;
}
