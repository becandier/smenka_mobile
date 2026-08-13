import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserDto({
    required String id,
    required String name,
    required bool isVerified,
    required String role,
    required DateTime createdAt,

    /// `null` — учётка заведена админом организации без email
    /// (`admin_created_accounts`).
    String? email,
    String? phone,

    /// Additive (`admin_created_accounts`). Старый бэк не шлёт → `null`.
    String? login,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
