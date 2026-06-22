import 'package:freezed_annotation/freezed_annotation.dart';

part 'penalty_dto.freezed.dart';
part 'penalty_dto.g.dart';

@freezed
abstract class PenaltyTemplateDto with _$PenaltyTemplateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PenaltyTemplateDto({
    required String id,
    required String reason,
    required int amountMinor,
    required String currency,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PenaltyTemplateDto;

  factory PenaltyTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$PenaltyTemplateDtoFromJson(json);
}

@freezed
abstract class PenaltyDto with _$PenaltyDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PenaltyDto({
    required String id,
    required String memberId,
    required String userId,
    required String userName,
    required String reason,
    required int amountMinor,
    required String currency,
    required DateTime occurredAt,
    required String createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? templateId,
    String? shiftId,
    String? comment,
  }) = _PenaltyDto;

  factory PenaltyDto.fromJson(Map<String, dynamic> json) =>
      _$PenaltyDtoFromJson(json);
}

@freezed
abstract class MyPenaltyDto with _$MyPenaltyDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MyPenaltyDto({
    required String id,
    required String reason,
    required int amountMinor,
    required String currency,
    required DateTime occurredAt,
    required DateTime createdAt,
    String? shiftId,
    String? comment,
  }) = _MyPenaltyDto;

  factory MyPenaltyDto.fromJson(Map<String, dynamic> json) =>
      _$MyPenaltyDtoFromJson(json);
}

@freezed
abstract class PaginatedPenaltiesDto with _$PaginatedPenaltiesDto {
  const factory PaginatedPenaltiesDto({
    required List<PenaltyDto> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedPenaltiesDto;

  factory PaginatedPenaltiesDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPenaltiesDtoFromJson(json);
}

@freezed
abstract class PaginatedMyPenaltiesDto with _$PaginatedMyPenaltiesDto {
  const factory PaginatedMyPenaltiesDto({
    required List<MyPenaltyDto> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedMyPenaltiesDto;

  factory PaginatedMyPenaltiesDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMyPenaltiesDtoFromJson(json);
}
