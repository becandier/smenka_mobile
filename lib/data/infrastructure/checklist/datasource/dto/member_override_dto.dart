import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_override_dto.freezed.dart';
part 'member_override_dto.g.dart';

@freezed
abstract class MemberOverrideItemDto with _$MemberOverrideItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MemberOverrideItemDto({
    required String templateId,
    required String templateName,
    required String templateType,
    required String type,
  }) = _MemberOverrideItemDto;

  factory MemberOverrideItemDto.fromJson(Map<String, dynamic> json) =>
      _$MemberOverrideItemDtoFromJson(json);
}
