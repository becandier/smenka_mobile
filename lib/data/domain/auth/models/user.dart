import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Доменная модель пользователя
@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String name,
    String? avatarUrl,
  }) = _User;
}
