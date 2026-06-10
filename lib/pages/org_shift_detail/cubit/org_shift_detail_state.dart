import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'org_shift_detail_state.freezed.dart';

@freezed
abstract class OrgShiftDetailState with _$OrgShiftDetailState {
  const factory OrgShiftDetailState({
    @Default(SectionData<Shift>()) SectionData<Shift> shift,
  }) = _OrgShiftDetailState;
}
