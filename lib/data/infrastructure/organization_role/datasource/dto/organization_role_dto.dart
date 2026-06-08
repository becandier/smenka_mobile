import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_role_dto.freezed.dart';
part 'organization_role_dto.g.dart';

@freezed
abstract class OrganizationRoleDto with _$OrganizationRoleDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrganizationRoleDto({
    required String id,
    required String name,
    required DateTime createdAt,
  }) = _OrganizationRoleDto;

  factory OrganizationRoleDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationRoleDtoFromJson(json);
}
