import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'login_state.freezed.dart';

enum AuthMode { login, register }

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
  }) = _LoginState;
  const LoginState._();

  bool get isLogin => mode == AuthMode.login;
  bool get isRegister => mode == AuthMode.register;

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
}
