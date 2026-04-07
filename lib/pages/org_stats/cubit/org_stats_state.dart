import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'org_stats_state.freezed.dart';

@freezed
abstract class OrgStatsState with _$OrgStatsState {
  const factory OrgStatsState({
    @Default(SectionData<OrgStats>()) SectionData<OrgStats> stats,
    @Default('week') String period,
  }) = _OrgStatsState;
}
