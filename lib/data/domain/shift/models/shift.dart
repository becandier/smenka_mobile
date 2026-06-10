import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift.freezed.dart';

enum ShiftStatus { active, paused, finished }

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
  }) = _Shift;
}
