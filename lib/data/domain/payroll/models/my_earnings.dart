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

    /// Действующая ставка; null — ставка ещё не задана.
    CurrentRate? currentRate,
  }) = _MyEarnings;
}
