import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_photo_draft.dart';

part 'checklist_fill_state.freezed.dart';

@freezed
abstract class ChecklistFillState with _$ChecklistFillState {
  const factory ChecklistFillState({
    @Default(SectionData<ChecklistInstanceDetail>())
    SectionData<ChecklistInstanceDetail> instance,
    @Default(<String, FeatureStatus>{}) Map<String, FeatureStatus> itemStatuses,
    String? saveError,

    /// Только чтение — редактирование пунктов и фото недоступно (просмотр
    /// чужой/завершённой смены). Чекбоксы, комментарии и кнопки фото неактивны.
    @Default(false) bool readOnly,

    /// Черновики загрузки фото (uploading/error) по `item.id`. Серверные фото
    /// лежат в `instance.data.items[].photos` и тут не дублируются.
    @Default(<String, List<ChecklistPhotoDraft>>{})
    Map<String, List<ChecklistPhotoDraft>> photoDrafts,

    /// Одноразовый нотис (info/warning) — view показывает тостом и сбрасывает.
    PhotoNotice? notice,

    /// Одноразовый `error.code` действия с фото (напр. удаление/лимит) — view
    /// показывает локализованным тостом и сбрасывает.
    String? actionErrorCode,
  }) = _ChecklistFillState;
}
