import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';

part 'my_earnings_state.freezed.dart';

@freezed
abstract class MyEarningsState with _$MyEarningsState {
  const factory MyEarningsState({
    @Default(SectionData<MyEarnings>()) SectionData<MyEarnings> earnings,

    /// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
    /// По умолчанию — текущий месяц (ТЗ payroll).
    @Default(PeriodPreset.month) PeriodPreset? preset,

    /// Границы произвольного окна (UTC); активны при `preset == null`.
    DateTime? customFrom,
    DateTime? customTo,

    /// IANA-таймзона организации — заработок всегда её бизнес-события.
    /// Дефолт до загрузки совпадает с server_default `Organization.timezone`.
    @Default('Europe/Moscow') String organizationTimezone,
  }) = _MyEarningsState;
  const MyEarningsState._();

  bool get isCustomRange => preset == null;

  AppTimeContext get timeContext =>
      AppTimeContext.organization(organizationTimezone);
}
