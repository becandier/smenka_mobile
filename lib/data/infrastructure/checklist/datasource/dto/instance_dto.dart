import 'package:freezed_annotation/freezed_annotation.dart';

part 'instance_dto.freezed.dart';
part 'instance_dto.g.dart';

@freezed
abstract class ChecklistItemsSummaryDto with _$ChecklistItemsSummaryDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistItemsSummaryDto({
    required int total,
    required int completed,
  }) = _ChecklistItemsSummaryDto;

  factory ChecklistItemsSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemsSummaryDtoFromJson(json);
}

@freezed
abstract class ChecklistInstanceDto with _$ChecklistInstanceDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistInstanceDto({
    required String id,
    required String name,
    required String type,
    required bool isRequired,
    required String status,
    required ChecklistItemsSummaryDto itemsSummary,
    DateTime? completedAt,
    required DateTime createdAt,
  }) = _ChecklistInstanceDto;

  factory ChecklistInstanceDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistInstanceDtoFromJson(json);
}

@freezed
abstract class ChecklistInstanceDetailDto with _$ChecklistInstanceDetailDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistInstanceDetailDto({
    required String id,
    required String name,
    required String type,
    required bool isRequired,
    required String status,
    DateTime? completedAt,
    required DateTime createdAt,
    required List<ChecklistInstanceItemDto> items,
  }) = _ChecklistInstanceDetailDto;

  factory ChecklistInstanceDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistInstanceDetailDtoFromJson(json);
}

@freezed
abstract class ChecklistInstanceItemDto with _$ChecklistInstanceItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistInstanceItemDto({
    required String id,
    required String text,
    required bool isRequired,
    required int position,
    required bool isCompleted,
    String? comment,
    DateTime? completedAt,
    required int changeCount,
  }) = _ChecklistInstanceItemDto;

  factory ChecklistInstanceItemDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistInstanceItemDtoFromJson(json);
}
