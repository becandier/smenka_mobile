import 'package:freezed_annotation/freezed_annotation.dart';

part 'penalty.freezed.dart';

/// Шаблон штрафа организации (снимок «Опоздание — 500 ₽»).
/// Заводится/редактируется только в веб-админке; мобилка лишь выбирает
/// шаблон при назначении штрафа. Деньги — в копейках (int).
@freezed
abstract class PenaltyTemplate with _$PenaltyTemplate {
  const factory PenaltyTemplate({
    required String id,
    required String reason,
    required int amountMinor,
    required String currency,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PenaltyTemplate;
}

/// Штраф сотрудника (admin-facing: список орг-штрафов, деталь, форма правки).
/// Деньги — в копейках (int), деление на 100 только при отображении.
@freezed
abstract class Penalty with _$Penalty {
  const factory Penalty({
    required String id,
    required String memberId,
    required String userId,
    required String userName,
    required String reason,
    required int amountMinor,
    required String currency,
    required DateTime occurredAt,
    required String createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,

    /// Происхождение из шаблона; null — кастомный штраф.
    String? templateId,

    /// Привязка к конкретной смене сотрудника; null — штраф без смены.
    String? shiftId,
    String? comment,
  }) = _Penalty;
}

/// Свой штраф сотрудника (employee-facing, `my-penalties`).
/// Деньги — в копейках (int).
@freezed
abstract class MyPenalty with _$MyPenalty {
  const factory MyPenalty({
    required String id,
    required String reason,
    required int amountMinor,
    required String currency,
    required DateTime occurredAt,
    required DateTime createdAt,
    String? shiftId,
    String? comment,
  }) = _MyPenalty;
}

/// Данные формы назначения штрафа (`POST /penalties`).
///
/// [amountMinor] — копейки (> 0), [reason] — итоговая причина (из шаблона или
/// переопределённая). [occurredAt] обязателен, если [shiftId] не задан (бэк
/// иначе подставит `shift.started_at`).
@freezed
abstract class CreatePenaltyInput with _$CreatePenaltyInput {
  const factory CreatePenaltyInput({
    required String memberId,
    required String reason,
    required int amountMinor,
    String? templateId,
    String? currency,
    String? shiftId,
    DateTime? occurredAt,
    String? comment,
  }) = _CreatePenaltyInput;
}

/// Данные исправления штрафа (`PATCH /penalties/{id}`); все поля опциональны,
/// в тело запроса уходят только заданные (не-null) поля.
@freezed
abstract class UpdatePenaltyInput with _$UpdatePenaltyInput {
  const factory UpdatePenaltyInput({
    String? reason,
    int? amountMinor,
    String? currency,
    String? shiftId,
    DateTime? occurredAt,
    String? comment,
  }) = _UpdatePenaltyInput;
}
