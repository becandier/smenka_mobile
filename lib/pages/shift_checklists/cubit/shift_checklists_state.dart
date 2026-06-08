import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';

part 'shift_checklists_state.freezed.dart';

@freezed
abstract class ShiftChecklistsState with _$ShiftChecklistsState {
  const factory ShiftChecklistsState({
    @Default(SectionData<List<ChecklistInstance>>())
    SectionData<List<ChecklistInstance>> instances,
  }) = _ShiftChecklistsState;
}
