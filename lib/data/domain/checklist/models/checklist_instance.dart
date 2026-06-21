import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_photo.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_template.dart';

part 'checklist_instance.freezed.dart';

enum ChecklistInstanceStatus { pending, completed, incomplete }

@freezed
abstract class ChecklistItemsSummary with _$ChecklistItemsSummary {
  const factory ChecklistItemsSummary({
    required int total,
    required int completed,

    /// Число пунктов, прошедших критерий «satisfied» (учитывает фото). По нему
    /// рисуем честный прогресс. `@Default(0)` — старый бэк поля не пришлёт.
    @Default(0) int satisfiedCount,

    /// Число пунктов `required` без фото — для бейджа «нужно фото».
    @Default(0) int photosRequiredMissing,
  }) = _ChecklistItemsSummary;
}

@freezed
abstract class ChecklistInstance with _$ChecklistInstance {
  const factory ChecklistInstance({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required ChecklistInstanceStatus status,
    required ChecklistItemsSummary itemsSummary,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _ChecklistInstance;
}

@freezed
abstract class ChecklistInstanceDetail with _$ChecklistInstanceDetail {
  const factory ChecklistInstanceDetail({
    required String id,
    required String name,
    required ChecklistType type,
    required bool isRequired,
    required ChecklistInstanceStatus status,
    required DateTime createdAt,
    required List<ChecklistInstanceItem> items,
    DateTime? completedAt,

    /// Верхняя граница числа фото на пункт (с бэка, не хардкод). Клиент по нему
    /// прячет кнопку «Добавить фото». `null` — старый бэк лимит не прислал.
    int? maxPhotosPerItem,
  }) = _ChecklistInstanceDetail;
}

@freezed
abstract class ChecklistInstanceItem with _$ChecklistInstanceItem {
  const factory ChecklistInstanceItem({
    required String id,
    required String text,
    required bool isRequired,
    required int position,
    required bool isCompleted,
    required int changeCount,
    String? comment,
    DateTime? completedAt,

    /// Что разрешено по фото для пункта (снимок шаблона). `@Default` — для
    /// поэтапного деплоя: старый бэк новых полей не пришлёт, `fromJson` не
    /// сломается.
    @Default(PhotoRequirement.none) PhotoRequirement photoRequirement,
    @Default(PhotoSource.camera) PhotoSource photoSource,
    @Default(0) int photosCount,
    @Default(<ChecklistItemPhoto>[]) List<ChecklistItemPhoto> photos,
  }) = _ChecklistInstanceItem;
}
