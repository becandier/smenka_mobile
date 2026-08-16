import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_adjustment.freezed.dart';

/// Своё ручное начисление/удержание сотрудника (employee-facing,
/// `my-adjustments`, только чтение; см. `manual_time_entry`).
///
/// Знак хранится в самой сумме: [amountMinor] `> 0` — доплата, `< 0` —
/// удержание. Без данных о том, кто создал — симметрично `MyPenalty`.
@freezed
abstract class MyAdjustment with _$MyAdjustment {
  const factory MyAdjustment({
    required String id,
    required int amountMinor,
    required String currency,
    required String reason,
    required DateTime occurredAt,
    required DateTime createdAt,
    String? comment,
    String? shiftId,
  }) = _MyAdjustment;
}
