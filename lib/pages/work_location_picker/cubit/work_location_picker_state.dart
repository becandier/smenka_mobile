import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'work_location_picker_state.freezed.dart';

@freezed
abstract class WorkLocationPickerState with _$WorkLocationPickerState {
  const factory WorkLocationPickerState({
    @Default(SectionData<List<WorkLocation>>())
    SectionData<List<WorkLocation>> locations,
  }) = _WorkLocationPickerState;
}
