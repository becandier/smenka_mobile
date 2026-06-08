import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';

extension ChecklistAssignedUserDtoMapper on ChecklistAssignedUserDto {
  ChecklistAssignedUser toDomain() => ChecklistAssignedUser(
        userId: userId,
        userName: userName,
        userEmail: userEmail,
      );
}

extension ChecklistAssignmentDtoMapper on ChecklistAssignmentDto {
  ChecklistAssignment toDomain() => ChecklistAssignment(
        templateId: templateId,
        roleIds: roleIds,
        personalAdd: personalAdd.map((e) => e.toDomain()).toList(),
        personalRemove: personalRemove.map((e) => e.toDomain()).toList(),
      );
}
