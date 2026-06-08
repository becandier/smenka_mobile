import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_role.freezed.dart';

@freezed
abstract class OrganizationRole with _$OrganizationRole {
  const factory OrganizationRole({
    required String id,
    required String name,
    required DateTime createdAt,
  }) = _OrganizationRole;
}
