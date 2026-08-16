import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_adjustment_dto.freezed.dart';
part 'my_adjustment_dto.g.dart';

@freezed
abstract class MyAdjustmentDto with _$MyAdjustmentDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MyAdjustmentDto({
    required String id,
    required int amountMinor,
    required String currency,
    required String reason,
    required DateTime occurredAt,
    required DateTime createdAt,
    String? comment,
    String? shiftId,
  }) = _MyAdjustmentDto;

  factory MyAdjustmentDto.fromJson(Map<String, dynamic> json) =>
      _$MyAdjustmentDtoFromJson(json);
}

@freezed
abstract class PaginatedMyAdjustmentsDto with _$PaginatedMyAdjustmentsDto {
  const factory PaginatedMyAdjustmentsDto({
    required List<MyAdjustmentDto> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedMyAdjustmentsDto;

  factory PaginatedMyAdjustmentsDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMyAdjustmentsDtoFromJson(json);
}
