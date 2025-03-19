part of 'azkar_cubit.dart';

@freezed
sealed class AzkarsState with _$AzkarsState {
  factory AzkarsState.loading() = Loading;
  factory AzkarsState.success({
    required List<AzkarE> azkars,
  }) = Success;
}
