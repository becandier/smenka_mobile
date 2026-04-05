import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization.freezed.dart';

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String ownerId,
    required String inviteCode,
    required bool isDeleted,
    required DateTime createdAt,
  }) = _Organization;
}
