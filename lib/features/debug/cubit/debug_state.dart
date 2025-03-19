part of 'debug_cubit.dart';

@freezed
sealed class DebugState with _$DebugState {
  const factory DebugState.initial() = Initial;
  const factory DebugState.loading() = Loading;
  const factory DebugState.error(
    String message,
  ) = Error;
  const factory DebugState.success(Flavors flavor) = Success;
}
