import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';

part 'payroll_state.freezed.dart';

@freezed
abstract class PayrollState with _$PayrollState {
  const factory PayrollState({
    @Default(SectionData<Payroll>()) SectionData<Payroll> payroll,

    /// Участники по userId — для перехода на деталь из строки отчёта
    /// (MemberDetailRoute требует целый объект Member).
    @Default(<String, Member>{}) Map<String, Member> membersByUserId,

    /// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
    /// По умолчанию — текущий месяц (ТЗ payroll).
    @Default(PeriodPreset.month) PeriodPreset? preset,

    /// Границы произвольного окна (UTC); активны при `preset == null`.
    DateTime? customFrom,
    DateTime? customTo,
  }) = _PayrollState;
  const PayrollState._();

  bool get isCustomRange => preset == null;
}
