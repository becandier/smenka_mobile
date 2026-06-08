import 'package:freezed_annotation/freezed_annotation.dart';

part 'assignment_dto.freezed.dart';
part 'assignment_dto.g.dart';

@freezed
abstract class ChecklistAssignedUserDto with _$ChecklistAssignedUserDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistAssignedUserDto({
    required String userId,
    required String userName,
    required String userEmail,
  }) = _ChecklistAssignedUserDto;

  factory ChecklistAssignedUserDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistAssignedUserDtoFromJson(json);
}

@freezed
abstract class ChecklistAssignmentDto with _$ChecklistAssignmentDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistAssignmentDto({
    required String templateId,
    required List<String> roleIds,
    required List<ChecklistAssignedUserDto> personalAdd,
    required List<ChecklistAssignedUserDto> personalRemove,
  }) = _ChecklistAssignmentDto;

  factory ChecklistAssignmentDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistAssignmentDtoFromJson(json);
}
