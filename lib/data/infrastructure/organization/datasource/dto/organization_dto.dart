import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/dto/_dto.dart';

part 'organization_dto.freezed.dart';
part 'organization_dto.g.dart';

@freezed
abstract class OrganizationDto with _$OrganizationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrganizationDto({
    required String id,
    required String name,
    required String ownerId,
    required String inviteCode,
    required bool isDeleted,
    required DateTime createdAt,
    @Default(false) bool geoCheckEnabled,
    @Default(false) bool requireWorkLocation,
    String? myRole,
    OrganizationRoleDto? myCustomRole,
  }) = _OrganizationDto;

  factory OrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationDtoFromJson(json);
}
