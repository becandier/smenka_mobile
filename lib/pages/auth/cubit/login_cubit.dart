import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/pages/auth/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState(obscurePassword: true));

  final AuthRepository _authRepository;

  void toggleMode() {
    emit(state.copyWith(
      mode: state.isLogin ? AuthMode.register : AuthMode.login,
      error: null,
      status: FeatureStatus.initial,
    ),);
  }

  void updateEmail(String value) =>
      emit(state.copyWith(email: value, error: null));

  void updatePassword(String value) =>
      emit(state.copyWith(password: value, error: null));

  void updateName(String value) =>
      emit(state.copyWith(name: value, error: null));

  void toggleObscurePassword() =>
      emit(state.copyWith(obscurePassword: !state.obscurePassword));

  Future<LoginResult> login() async {
    emit(state.copyWith(status: FeatureStatus.loading, error: null));

    final result = await _authRepository.login(
      email: state.email.trim(),
      password: state.password,
    );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(status: FeatureStatus.success));
        return LoginResult.success;
      },
      onFailure: (error) {
        if (_isNotVerified(error)) {
          emit(state.copyWith(status: FeatureStatus.idle));
          return LoginResult.needsVerification;
        }
        emit(state.copyWith(
          status: FeatureStatus.error,
          error: error.message,
        ),);
        return LoginResult.error;
      },
    );
  }

  Future<LoginResult> register() async {
    emit(state.copyWith(status: FeatureStatus.loading, error: null));

    final result = await _authRepository.register(
      email: state.email.trim(),
      password: state.password,
      name: state.name.trim(),
    );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(status: FeatureStatus.success));
        return LoginResult.needsVerification;
      },
      onFailure: (error) {
        emit(state.copyWith(
          status: FeatureStatus.error,
          error: error.message,
        ),);
        return LoginResult.error;
      },
    );
  }

  bool _isNotVerified(ApiException error) {
    return switch (error) {
      ServerException(:final code) => code == 'NOT_VERIFIED',
      UnauthorizedException(:final code) => code == 'NOT_VERIFIED',
      NetworkException() => false,
      ValidationException() => false,
    };
  }
}

enum LoginResult { success, needsVerification, error }
