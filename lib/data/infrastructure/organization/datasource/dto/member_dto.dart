import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';

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
    required DateTime joinedAt,
    OrganizationRoleDto? customRole,

    /// Действующая ставка (additive, фича payroll); отсутствует
    /// в ответах старого бэка.
    CurrentRateDto? currentRate,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
