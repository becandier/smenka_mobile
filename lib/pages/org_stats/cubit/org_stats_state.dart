import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'org_stats_state.freezed.dart';

@freezed
abstract class OrgStatsState with _$OrgStatsState {
  const factory OrgStatsState({
    @Default(SectionData<OrgStats>()) SectionData<OrgStats> stats,

    /// Пресет окна (`day|week|month`); null — активен произвольный
    /// диапазон ([customFrom]/[customTo]). Ровно один источник окна.
    /// Пресет вычисляется сервером в таймзоне организации — клиент границы
    /// сам не считает (см. `OrgStatsCubit.loadStats`).
    @Default('week') String? period,

    /// Границы произвольного окна (UTC); заданы только при `period == null`,
    /// хотя бы одна из границ непуста.
    DateTime? customFrom,
    DateTime? customTo,

    /// IANA-таймзона организации — для пикера и подписи произвольного
    /// диапазона. Дефолт до загрузки совпадает с server_default
    /// `Organization.timezone`.
    @Default('Europe/Moscow') String organizationTimezone,
  }) = _OrgStatsState;
  const OrgStatsState._();

  bool get isCustomRange => period == null;

  AppTimeContext get timeContext =>
      AppTimeContext.organization(organizationTimezone);
}
