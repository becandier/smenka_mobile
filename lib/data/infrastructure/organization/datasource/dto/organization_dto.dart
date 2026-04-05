import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _OrganizationDto;

  factory OrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationDtoFromJson(json);
}
