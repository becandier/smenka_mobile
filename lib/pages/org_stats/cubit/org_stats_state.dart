import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'org_stats_state.freezed.dart';

@freezed
abstract class OrgStatsState with _$OrgStatsState {
  const factory OrgStatsState({
    @Default(SectionData<OrgStats>()) SectionData<OrgStats> stats,

    /// Пресет окна (`day|week|month`); null — активен произвольный
    /// диапазон ([customFrom]/[customTo]). Ровно один источник окна.
    @Default('week') String? period,

    /// Границы произвольного окна (UTC); заданы только при `period == null`,
    /// хотя бы одна из границ непуста.
    DateTime? customFrom,
    DateTime? customTo,
  }) = _OrgStatsState;
  const OrgStatsState._();

  bool get isCustomRange => period == null;
}
