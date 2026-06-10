import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum UserRole { superAdmin, user }

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required bool isVerified,
    required UserRole role,
    required DateTime createdAt,
    String? phone,
  }) = _User;
}
