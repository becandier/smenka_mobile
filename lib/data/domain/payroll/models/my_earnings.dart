import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/payroll/models/payroll.dart';
import 'package:smenka_mobile/data/domain/payroll/models/rate.dart';

part 'my_earnings.freezed.dart';

/// Личный заработок сотрудника за период + текущая ставка.
/// Деньги — в копейках (int).
@freezed
abstract class MyEarnings with _$MyEarnings {
  const factory MyEarnings({
    required PayrollPeriod period,
    required String currency,
    required int workedSeconds,
    required int shiftsCount,
    required int grossAmountMinor,
    required bool hasMissingRate,

    /// Штрафы сотрудника за период (фича fines); для self учитываются всегда.
    @Default(0) int penaltyAmountMinor,
    @Default(0) int penaltiesCount,

    /// Ручные начисления/удержания сотрудника за период (`manual_time_entry`),
    /// знаковая сумма в копейках (`> 0` — доплата, `< 0` — удержание).
    @Default(0) int adjustmentAmountMinor,
    @Default(0) int adjustmentsCount,

    /// К выплате = gross − penalty + adjustment. Может быть отрицательным.
    @Default(0) int netAmountMinor,

    /// План против факта (фича `work_schedules`): плановая сумма за смены
    /// периода, у которых есть график (для смен без графика план = факт).
    /// `0` для персональных отчётов и организаций без графиков.
    @Default(0) int plannedAmountMinor,

    /// `gross − planned`. Отрицательное значение — заработал меньше плана.
    @Default(0) int deltaAmountMinor,

    /// Сумма согласованных (`approved`) заявок на переработку за период,
    /// секунды. Уже учтена в [grossAmountMinor] (влияет на оплату).
    @Default(0) int overtimeSeconds,

    /// Количество опозданий за период (`work_schedules`). `0` — опозданий
    /// нет либо организация графики не использует.
    @Default(0) int lateCount,

    /// Суммарное время опозданий за период, секунды. Уже уменьшило
    /// фактически отработанное время и, соответственно, [grossAmountMinor]
    /// — отдельной суммой из заработка не вычитается.
    @Default(0) int lateSecondsTotal,

    /// Действующая ставка; null — ставка ещё не задана.
    CurrentRate? currentRate,
  }) = _MyEarnings;
  const MyEarnings._();

  /// «Сколько можно было заработать» есть смысл показывать, только если
  /// есть хоть один ненулевой сигнал графика (`earnings_drilldown/
  /// mobile.md`, «B», п.3): недобор/перебор плана, переработка или
  /// опоздания. Для организаций без графиков и смен без графика план
  /// равен факту (R8 backend.md) — все три сигнала нулевые.
  bool get hasScheduleSignal =>
      deltaAmountMinor != 0 || overtimeSeconds != 0 || lateCount != 0;
}
