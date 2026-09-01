import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_earnings.freezed.dart';

/// Заработок по одной смене (`shift_history_earnings/backend.md`, п.1;
/// ADR-005 `docs/decisions/005-earnings-calculation.md`).
///
/// `Shift.earnings` == `null` целиком — смена персональная либо не в
/// статусе `finished` (ADR-005 п.6/8): деньги ещё меняются или их нет по
/// определению, это НЕ то же самое, что "заработал 0".
///
/// Здесь же — сумма посчитана, но [hasRate] может быть `false`: на момент
/// начала смены действующей ставки не было (ADR-005 п.3). Тогда
/// [grossAmountMinor]/[netAmountMinor] == 0 не значит «заработал 0» — это
/// «ставка не задана», и клиент обязан различать эти два состояния в UI.
@freezed
abstract class ShiftEarnings with _$ShiftEarnings {
  const factory ShiftEarnings({
    required String currency,
    required int grossAmountMinor,

    /// Только активные штрафы, привязанные к этой смене (`shift_id`).
    required int penaltyAmountMinor,
    required int penaltiesCount,

    /// Только корректировки, привязанные к этой смене (`shift_id`);
    /// знаковая сумма (может быть отрицательной).
    required int adjustmentAmountMinor,
    required int adjustmentsCount,

    /// `gross − penalty + adjustment`, может быть отрицательным.
    required int netAmountMinor,

    /// Согласованная переработка, уже учтённая в [grossAmountMinor].
    required int overtimeSeconds,

    /// `false` — действующей ставки на момент начала смены не было.
    required bool hasRate,
  }) = _ShiftEarnings;
}
