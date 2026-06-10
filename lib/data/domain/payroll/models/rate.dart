import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate.freezed.dart';

/// Тип ставки: почасовая (₽/час) или за смену (₽/смена).
/// На бэке — `hourly` / `per_shift`.
enum RateType { hourly, perShift }

/// Запись истории ставок участника. Одна строка — одна ставка,
/// действующая начиная с [effectiveFrom]. Деньги — в копейках (int).
@freezed
abstract class Rate with _$Rate {
  const factory Rate({
    required String id,
    required String memberId,

    /// Ставка в копейках (> 0). Смысл определяется [rateType].
    required int rateAmountMinor,
    required RateType rateType,
    required String currency,

    /// Момент начала действия (UTC).
    required DateTime effectiveFrom,
    required DateTime createdAt,
    String? note,
  }) = _Rate;
}

/// Действующая ставка участника (срез истории на «сейчас»).
@freezed
abstract class CurrentRate with _$CurrentRate {
  const factory CurrentRate({
    required int rateAmountMinor,
    required RateType rateType,
    required String currency,
    required DateTime effectiveFrom,
  }) = _CurrentRate;
}
