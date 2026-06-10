import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'employee_picker_state.freezed.dart';

@freezed
abstract class EmployeePickerState with _$EmployeePickerState {
  const factory EmployeePickerState({
    @Default(SectionData<List<Member>>()) SectionData<List<Member>> members,
  }) = _EmployeePickerState;
}
