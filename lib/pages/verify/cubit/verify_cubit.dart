import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/pages/verify/cubit/verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit({required String email, required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(VerifyState(email: email)) {
    _startCooldown();
  }

  final AuthRepository _authRepository;
  Timer? _cooldownTimer;

  void _startCooldown() {
    _cooldownTimer?.cancel();
    emit(state.copyWith(cooldownSeconds: 30));
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remaining = state.cooldownSeconds - 1;
      if (remaining <= 0) {
        timer.cancel();
        emit(state.copyWith(cooldownSeconds: 0));
      } else {
        emit(state.copyWith(cooldownSeconds: remaining));
      }
    });
  }

  void updateCode(String code) {
    emit(state.copyWith(code: code, error: null, errorCode: null));
  }

  Future<bool> verify() async {
    if (!state.isCodeComplete) return false;

    emit(
      state.copyWith(
        status: FeatureStatus.loading,
        error: null,
        errorCode: null,
      ),
    );

    final result = await _authRepository.verify(
      email: state.email,
      code: state.code,
    );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(status: FeatureStatus.success));
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            status: FeatureStatus.error,
            error: error.message,
            errorCode: error.code,
            code: '',
          ),
        );
        // 429 TOO_MANY_CODE_ATTEMPTS — старый код больше не примут, открываем
        // CTA «запросить код заново», снимая кулдаун.
        if (error.code == 'TOO_MANY_CODE_ATTEMPTS') {
          _cancelCooldown();
        }
        return false;
      },
    );
  }

  Future<void> resendCode() async {
    if (!state.canResend) return;

    emit(state.copyWith(isResending: true));

    final result = await _authRepository.resendCode(email: state.email);

    result.fold(
      onSuccess: (_) {
        emit(state.copyWith(isResending: false, error: null, errorCode: null));
        _startCooldown();
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            isResending: false,
            error: error.message,
            errorCode: error.code,
          ),
        );
      },
    );
  }

  void _cancelCooldown() {
    _cooldownTimer?.cancel();
    emit(state.copyWith(cooldownSeconds: 0));
  }

  @override
  Future<void> close() {
    _cooldownTimer?.cancel();
    return super.close();
  }
}
