import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_dto.freezed.dart';
part 'template_dto.g.dart';

@freezed
abstract class ChecklistTemplateDto with _$ChecklistTemplateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistTemplateDto({
    required String id,
    required String name,
    required String type,
    required bool isRequired,
    required int itemsCount,
    required bool isArchived,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecklistTemplateDto;

  factory ChecklistTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistTemplateDtoFromJson(json);
}

@freezed
abstract class ChecklistTemplateDetailDto with _$ChecklistTemplateDetailDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistTemplateDetailDto({
    required String id,
    required String name,
    required String type,
    required bool isRequired,
    required bool isArchived,
    required List<ChecklistTemplateItemDto> items,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecklistTemplateDetailDto;

  factory ChecklistTemplateDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistTemplateDetailDtoFromJson(json);
}

@freezed
abstract class ChecklistTemplateItemDto with _$ChecklistTemplateItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistTemplateItemDto({
    required String id,
    required String text,
    required bool isRequired,
    required int position,
  }) = _ChecklistTemplateItemDto;

  factory ChecklistTemplateItemDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistTemplateItemDtoFromJson(json);
}
