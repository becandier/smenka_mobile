import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_assignment.freezed.dart';

@freezed
abstract class ChecklistAssignedUser with _$ChecklistAssignedUser {
  const factory ChecklistAssignedUser({
    required String userId,
    required String userName,
    required String userEmail,
  }) = _ChecklistAssignedUser;
}

@freezed
abstract class ChecklistAssignment with _$ChecklistAssignment {
  const factory ChecklistAssignment({
    required String templateId,
    required List<String> roleIds,
    required List<ChecklistAssignedUser> personalAdd,
    required List<ChecklistAssignedUser> personalRemove,
  }) = _ChecklistAssignment;
}
