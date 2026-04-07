import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'members_state.freezed.dart';

@freezed
abstract class MembersState with _$MembersState {
  const factory MembersState({
    @Default(SectionData<List<Member>>()) SectionData<List<Member>> members,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
  }) = _MembersState;
}
