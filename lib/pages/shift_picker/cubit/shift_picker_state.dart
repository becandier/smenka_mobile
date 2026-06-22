import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/shift/_shift.dart';

part 'shift_picker_state.freezed.dart';

@freezed
abstract class ShiftPickerState with _$ShiftPickerState {
  const factory ShiftPickerState({
    @Default(SectionData<List<Shift>>()) SectionData<List<Shift>> shifts,
  }) = _ShiftPickerState;
}
