import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';

part 'member_rates_state.freezed.dart';

@freezed
abstract class MemberRatesState with _$MemberRatesState {
  const factory MemberRatesState({
    /// История ставок участника (effective_from DESC, без пагинации).
    @Default(SectionData<List<Rate>>()) SectionData<List<Rate>> rates,
  }) = _MemberRatesState;
  const MemberRatesState._();

  /// Действующая ставка из загруженной истории: первая запись
  /// с `effectiveFrom <= now` (история отсортирована по убыванию).
  Rate? get currentRate {
    final list = rates.data;
    if (list == null) return null;
    final nowUtc = DateTime.now().toUtc();
    for (final rate in list) {
      if (!rate.effectiveFrom.isAfter(nowUtc)) return rate;
    }
    return null;
  }
}
