part of 'debug_cubit.dart';

@freezed
abstract class DebugState with _$DebugState {
  const factory DebugState({
    Flavors? flavor,
    bool? isDeviceAccess,
    String? errorMessage,
    @Default(FeatureStatus.initial) FeatureStatus status,
  }) = _DebugState;
}
