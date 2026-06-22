import 'package:freezed_annotation/freezed_annotation.dart';

part 'payroll.freezed.dart';

/// Фактическое окно отчёта (эхо запроса; границы могут быть открыты).
@freezed
abstract class PayrollPeriod with _$PayrollPeriod {
  const factory PayrollPeriod({DateTime? dateFrom, DateTime? dateTo}) =
      _PayrollPeriod;
}

/// Строка отчёта «кому сколько заплатить» по одному сотруднику.
/// Деньги — в копейках (int), деление на 100 только при отображении.
@freezed
abstract class PayrollItem with _$PayrollItem {
  const factory PayrollItem({
    required String userId,
    required String userName,
    required int workedSeconds,
    required int shiftsCount,
    required int grossAmountMinor,

    /// Время/число смен без действующей ставки (не вошли в gross).
    required int unpaidSeconds,
    required int unpaidShiftsCount,
    required bool hasMissingRate,

    /// Сумма штрафов сотрудника за период (фича fines). `0` при
    /// `include_penalties=false` или отсутствии поля (старый бэк).
    @Default(0) int penaltyAmountMinor,
    @Default(0) int penaltiesCount,

    /// К выплате = gross − penalty. Может быть отрицательным
    /// (штрафы > начислений) — показываем как есть, без обрезки до нуля.
    @Default(0) int netAmountMinor,
  }) = _PayrollItem;
}

/// Итоги отчёта по всем сотрудникам.
@freezed
abstract class PayrollTotals with _$PayrollTotals {
  const factory PayrollTotals({
    required int workedSeconds,
    required int shiftsCount,
    required int grossAmountMinor,

    /// Итоги штрафов по орг (фича fines). `0` при `include_penalties=false`.
    @Default(0) int penaltyAmountMinor,
    @Default(0) int penaltiesCount,

    /// К выплате по орг = gross − penalty (может быть отрицательным).
    @Default(0) int netAmountMinor,
  }) = _PayrollTotals;
}

/// Отчёт по зарплате за период (admin/owner). Owner в [items] не фигурирует.
@freezed
abstract class Payroll with _$Payroll {
  const factory Payroll({
    required PayrollPeriod period,
    required String currency,
    required List<PayrollItem> items,
    required PayrollTotals totals,
  }) = _Payroll;
}
