import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'section_data.freezed.dart';

@freezed
abstract class SectionData<T> with _$SectionData<T> {
  const factory SectionData({
    T? data,
    @Default(FeatureStatus.initial) FeatureStatus status,
    String? error,
  }) = _SectionData<T>;
  const SectionData._();

  bool get isLoading => status == FeatureStatus.loading;
  bool get isSuccess => status == FeatureStatus.success;
  bool get hasData => data != null;

  SectionData<T> toLoading() => copyWith(
        status: FeatureStatus.loading,
      );

  SectionData<T> toSuccess(T data) => copyWith(
        status: FeatureStatus.success,
        data: data,
        error: null,
      );

  SectionData<T> toError(String? message) => copyWith(
        status: FeatureStatus.error,
        error: message,
      );

  SectionData<T> toIdle() => copyWith(
        status: FeatureStatus.idle,
        error: null,
      );
}
