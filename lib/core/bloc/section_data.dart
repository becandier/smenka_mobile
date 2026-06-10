import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'section_data.freezed.dart';

@freezed
abstract class SectionData<T> with _$SectionData<T> {
  const factory SectionData({
    T? data,
    @Default(FeatureStatus.initial) FeatureStatus status,
    String? error,

    /// Машинный код ошибки (`error.code`) — для маппинга в локализованный
    /// текст на UI-слое. Логику строим по нему, а не по [error] (message).
    String? errorCode,
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
        errorCode: null,
      );

  SectionData<T> toError(String? message, {String? code}) => copyWith(
        status: FeatureStatus.error,
        error: message,
        errorCode: code,
      );

  SectionData<T> toIdle() => copyWith(
        status: FeatureStatus.idle,
        error: null,
        errorCode: null,
      );
}
