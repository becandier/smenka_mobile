import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';

part 'member_penalties_state.freezed.dart';

@freezed
abstract class MemberPenaltiesState with _$MemberPenaltiesState {
  const factory MemberPenaltiesState({
    @Default(PaginatedSectionData<Penalty>())
    PaginatedSectionData<Penalty> penalties,
  }) = _MemberPenaltiesState;
}
