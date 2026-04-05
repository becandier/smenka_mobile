import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';

enum MemberRole { admin, employee }

@freezed
abstract class Member with _$Member {
  const factory Member({
    required String id,
    required String organizationId,
    required String userId,
    required String userName,
    required String userEmail,
    required MemberRole role,
    required DateTime joinedAt,
  }) = _Member;
}
