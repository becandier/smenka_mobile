import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/dto/_dto.dart';

part 'member_dto.freezed.dart';
part 'member_dto.g.dart';

@freezed
abstract class MemberDto with _$MemberDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MemberDto({
    required String id,
    required String organizationId,
    required String userId,
    required String userName,
    required String userEmail,
    required String role,
    OrganizationRoleDto? customRole,
    required DateTime joinedAt,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
