import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_result_dto.freezed.dart';
part 'join_result_dto.g.dart';

@freezed
abstract class JoinResultDto with _$JoinResultDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory JoinResultDto({
    required String organizationId,
    required String organizationName,
    required String role,
  }) = _JoinResultDto;

  factory JoinResultDto.fromJson(Map<String, dynamic> json) =>
      _$JoinResultDtoFromJson(json);
}
