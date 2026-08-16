import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/mappers/work_location_mapper.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';

extension PauseMapper on PauseDto {
  Pause toDomain() {
    return Pause(
      id: id,
      shiftId: shiftId,
      startedAt: startedAt,
      finishedAt: finishedAt,
    );
  }
}

/// Незнакомое/отсутствующее значение → `null` (forward-compat: старый бэк
/// без графиков, либо новый статус завершения, о котором клиент не знает).
ShiftFinishReason? _parseFinishReason(String? value) => switch (value) {
  'manual' => ShiftFinishReason.manual,
  'auto_schedule' => ShiftFinishReason.autoSchedule,
  _ => null,
};

/// Незнакомый статус переработки → `pending` (самый безопасный дефолт: не
/// показать заявку как согласованную/отклонённую, если это не так).
OvertimeStatus _parseOvertimeStatus(String value) => switch (value) {
  'pending' => OvertimeStatus.pending,
  'approved' => OvertimeStatus.approved,
  'rejected' => OvertimeStatus.rejected,
  _ => OvertimeStatus.pending,
};

extension ShiftOvertimeRequestMapper on ShiftOvertimeRequestDto {
  ShiftOvertimeRequest toDomain() {
    return ShiftOvertimeRequest(
      id: id,
      minutes: minutes,
      status: _parseOvertimeStatus(status),
      comment: comment,
      reviewComment: reviewComment,
      reviewedAt: reviewedAt,
      createdAt: createdAt,
    );
  }
}

extension ShiftMapper on ShiftDto {
  Shift toDomain() {
    return Shift(
      id: id,
      userId: userId,
      organizationId: organizationId,
      startedAt: startedAt,
      finishedAt: finishedAt,
      status: ShiftStatus.values.byName(status),
      pauses: pauses.map((p) => p.toDomain()).toList(),
      workedSeconds: workedSeconds,
      hasIncompleteRequiredChecklists: hasIncompleteRequiredChecklists,
      workLocationId: workLocationId,
      workLocation: workLocation?.toDomain(),
      userName: userName,
      userEmail: userEmail,
      role: role,
      customRoleName: customRoleName,
      workScheduleId: workScheduleId,
      scheduleName: scheduleName,
      scheduledStartAt: scheduledStartAt,
      scheduledEndAt: scheduledEndAt,
      lateSeconds: lateSeconds,
      finishReason: _parseFinishReason(finishReason),
      overtime: overtime?.toDomain(),
      isManual: isManual,
      isEdited: isEdited,
      manualNote: manualNote,
      editedAt: editedAt,
      createdByName: createdByName,
      editedByName: editedByName,
      isDeleted: isDeleted,
    );
  }
}
