import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/organization/models/work_location.dart';
import 'package:smenka_mobile/data/domain/shift/models/shift_overtime_request.dart';

part 'shift.freezed.dart';

enum ShiftStatus { active, paused, finished }

/// Причина завершения смены. `manual` — завершил сам сотрудник/админ;
/// `autoSchedule` — авто-завершение по плановому концу графика
/// (`work_schedules`). `null` у активных/приостановленных смен и у всех
/// исторических смен, заведённых до фичи графиков.
enum ShiftFinishReason { manual, autoSchedule }

@freezed
abstract class Pause with _$Pause {
  const factory Pause({
    required String id,
    required String shiftId,
    required DateTime startedAt,
    DateTime? finishedAt,
  }) = _Pause;
}

@freezed
abstract class Shift with _$Shift {
  const factory Shift({
    required String id,
    required String userId,
    required DateTime startedAt,
    required ShiftStatus status,
    required List<Pause> pauses,
    required int workedSeconds,
    String? organizationId,
    DateTime? finishedAt,
    @Default(false) bool hasIncompleteRequiredChecklists,

    /// Рабочая точка, на которой открыта смена. `null` — не определена
    /// (персональная смена, гео-старт старого билда, либо точку не выбирали).
    String? workLocationId,
    WorkLocation? workLocation,

    /// Данные автора смены. Заполняются только в орг-ответах
    /// (`GET /organizations/{org_id}/shifts[/{shift_id}]`); в персональном
    /// трекере (`GET /shifts`) всегда `null`.
    String? userName,
    String? userEmail,

    /// Системная роль автора в этой организации: `admin` | `employee`.
    /// `null`, если участник исключён из org или персональный контекст.
    String? role,

    /// Плоское имя кастомной роли (НЕ объект). `null`, если не назначена.
    String? customRoleName,

    /// График, снимок которого записан в смену (`work_schedules`). `null` —
    /// смена без графика (персональная, либо графики не настроены/не
    /// выбраны) — авто-завершения по графику для неё нет.
    String? workScheduleId,

    /// Снимок имени графика на момент старта — не меняется правкой графика
    /// задним числом.
    String? scheduleName,

    /// Плановое окно смены (снимок, UTC). Оба `null` вместе — смена без
    /// графика.
    DateTime? scheduledStartAt,
    DateTime? scheduledEndAt,

    /// Опоздание в секундах относительно [scheduledStartAt] (с учётом
    /// допуска организации), `0` — вовремя/раньше. `null` — смена без
    /// графика (не персональная — там поле тоже всегда `null`).
    int? lateSeconds,

    /// Причина завершения. `null` для активных/приостановленных и для
    /// исторических смен, заведённых до фичи графиков.
    ShiftFinishReason? finishReason,

    /// Заявка на переработку по этой смене (`null` — заявки нет).
    ShiftOvertimeRequest? overtime,
  }) = _Shift;
}
