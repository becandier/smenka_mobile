import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'paginated_section_data.freezed.dart';

@freezed
abstract class PaginatedSectionData<T> with _$PaginatedSectionData<T> {
  const factory PaginatedSectionData({
    @Default([]) List<T> data,
    @Default(false) bool hasMore,
    int? total,
    @Default(1) int currentPage,
    @Default(20) int perPage,
    @Default(FeatureStatus.initial) FeatureStatus status,
    String? error,

    /// Машинный код ошибки (`error.code`) — для маппинга в локализованный
    /// текст на UI-слое.
    String? errorCode,
  }) = _PaginatedSectionData<T>;
  const PaginatedSectionData._();

  bool get isLoading => status == FeatureStatus.loading;
  bool get isSuccess => status == FeatureStatus.success;
  bool get isError => status == FeatureStatus.error;
  bool get isEmpty => data.isEmpty;
  bool get isNotEmpty => data.isNotEmpty;
  bool get hasError => error != null;
}
