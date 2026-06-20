import 'package:freezed_annotation/freezed_annotation.dart';

part 'instance_dto.freezed.dart';
part 'instance_dto.g.dart';

@freezed
abstract class ChecklistItemsSummaryDto with _$ChecklistItemsSummaryDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistItemsSummaryDto({
    required int total,
    required int completed,
    // nullable (не @Default): старый бэк поля не пришлёт — в маппере падаем на
    // completed, чтобы прогресс не обнулялся (а не на 0).
    int? satisfiedCount,
    @Default(0) int photosRequiredMissing,
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
    required DateTime createdAt,
    DateTime? completedAt,
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
    required DateTime createdAt,
    required List<ChecklistInstanceItemDto> items,
    DateTime? completedAt,
    int? maxPhotosPerItem,
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
    required int changeCount,
    String? comment,
    DateTime? completedAt,
    // Снимок шаблона по фото; строки парсятся в enum в маппере (как status).
    // `@Default` — поэтапный деплой: старый бэк новых полей не пришлёт.
    @Default('none') String photoRequirement,
    @Default('camera') String photoSource,
    @Default(0) int photosCount,
    @Default(<ChecklistItemPhotoDto>[]) List<ChecklistItemPhotoDto> photos,
  }) = _ChecklistInstanceItemDto;

  factory ChecklistInstanceItemDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistInstanceItemDtoFromJson(json);
}

@freezed
abstract class ChecklistItemPhotoDto with _$ChecklistItemPhotoDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChecklistItemPhotoDto({
    required String id,
    required String fileId,
    required int position,
    String? url,
    DateTime? urlExpiresAt,
    DateTime? capturedAt,
    double? latitude,
    double? longitude,
  }) = _ChecklistItemPhotoDto;

  factory ChecklistItemPhotoDto.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemPhotoDtoFromJson(json);
}
