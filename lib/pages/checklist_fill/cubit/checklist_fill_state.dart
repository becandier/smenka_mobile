import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';

part 'checklist_fill_state.freezed.dart';

@freezed
abstract class ChecklistFillState with _$ChecklistFillState {
  const factory ChecklistFillState({
    @Default(SectionData<ChecklistInstanceDetail>())
    SectionData<ChecklistInstanceDetail> instance,
    @Default(<String, FeatureStatus>{})
    Map<String, FeatureStatus> itemStatuses,
    String? saveError,
  }) = _ChecklistFillState;
}
