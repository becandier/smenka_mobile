import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'overtime_request_state.freezed.dart';

@freezed
abstract class OvertimeRequestState with _$OvertimeRequestState {
  const factory OvertimeRequestState({
    @Default(FeatureStatus.initial) FeatureStatus submitStatus,
    String? submitError,
    String? submitErrorCode,
  }) = _OvertimeRequestState;
  const OvertimeRequestState._();

  bool get isSubmitting => submitStatus == FeatureStatus.loading;
}
