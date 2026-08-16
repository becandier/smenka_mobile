import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/data/domain/adjustment/_adjustment.dart';

part 'my_adjustments_state.freezed.dart';

@freezed
abstract class MyAdjustmentsState with _$MyAdjustmentsState {
  const factory MyAdjustmentsState({
    @Default(PaginatedSectionData<MyAdjustment>())
    PaginatedSectionData<MyAdjustment> adjustments,

    /// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
    @Default(PeriodPreset.month) PeriodPreset? preset,
    DateTime? customFrom,
    DateTime? customTo,
  }) = _MyAdjustmentsState;
  const MyAdjustmentsState._();

  bool get isCustomRange => preset == null;
}
