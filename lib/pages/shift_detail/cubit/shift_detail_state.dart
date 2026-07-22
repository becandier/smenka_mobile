import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_detail_state.freezed.dart';

@freezed
abstract class ShiftDetailState with _$ShiftDetailState {
  const factory ShiftDetailState({
    required Shift shift,

    /// Организация смены — грузится лениво, только если у смены есть график
    /// (нужна для таймзоны планового времени). Персональная смена и смена
    /// без графика её не запрашивают.
    @Default(SectionData<Organization>())
    SectionData<Organization> organization,

    /// Статус действия с заявкой на переработку (подача/отмена) — transient.
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
    String? actionErrorCode,
  }) = _ShiftDetailState;
  const ShiftDetailState._();

  bool get isActionLoading => actionStatus == FeatureStatus.loading;
}
