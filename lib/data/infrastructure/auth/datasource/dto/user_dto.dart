import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// DTO модель пользователя от API
@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String email,
    required String name,
    String? avatarUrl,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
