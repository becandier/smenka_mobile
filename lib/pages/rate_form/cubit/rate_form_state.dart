import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'rate_form_state.freezed.dart';

@freezed
abstract class RateFormState with _$RateFormState {
  const factory RateFormState({
    @Default(FeatureStatus.initial) FeatureStatus status,
    String? errorMessage,
    String? errorCode,
  }) = _RateFormState;
  const RateFormState._();

  bool get isSubmitting => status == FeatureStatus.loading;

  /// 409: на эту дату у участника уже есть ставка — подсветить поле даты.
  bool get isEffectiveFromTaken => errorCode == 'RATE_EFFECTIVE_FROM_TAKEN';
}
