import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'verify_state.freezed.dart';

@freezed
abstract class VerifyState with _$VerifyState {
  const factory VerifyState({
    required String email,
    @Default('') String code,
    @Default(FeatureStatus.initial) FeatureStatus status,
    @Default(0) int cooldownSeconds,
    @Default(false) bool isResending,
    String? error,
  }) = _VerifyState;
  const VerifyState._();

  bool get isLoading => status == FeatureStatus.loading;
  bool get canResend => cooldownSeconds <= 0 && !isResending;
  bool get isCodeComplete => code.length == 4;
}
