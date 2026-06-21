import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_photo_draft.freezed.dart';

/// Источник кадра, выбранный пользователем.
enum PhotoCaptureSource { camera, gallery }

/// Статус локального черновика загрузки фото.
enum PhotoDraftStatus { uploading, error }

/// Однократный нотис экрана заполнения (показываем тостом и сбрасываем).
///
/// `geoUnavailable` — координаты не получены, штамп вжжён только со временем
/// (info). `shiftFinished` — смена завершилась во время добавления, экран
/// переходит в read-only (warning).
enum PhotoNotice { geoUnavailable, shiftFinished }

/// Лёгкий черновик фото в стейте: только то, что нужно UI для прогресса/ретрая.
///
/// Тяжёлые байты кадра и `file_id` (для ретрая привязки) живут в приватной мапе
/// кубита, а не в стейте — чтобы не таскать мегабайты в каждом сравнении стейта
/// (freezed сравнивал бы `Uint8List` побайтово).
@freezed
abstract class ChecklistPhotoDraft with _$ChecklistPhotoDraft {
  const factory ChecklistPhotoDraft({
    required String draftId,
    required String itemId,
    required PhotoDraftStatus status,
    @Default(0.0) double progress,
    String? errorCode,
  }) = _ChecklistPhotoDraft;
}
