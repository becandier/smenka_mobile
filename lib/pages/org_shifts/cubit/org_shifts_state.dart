import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'org_shifts_state.freezed.dart';

@freezed
abstract class OrgShiftsState with _$OrgShiftsState {
  const factory OrgShiftsState({
    @Default(PaginatedSectionData<Shift>()) PaginatedSectionData<Shift> shifts,

    /// Фильтр по статусу (null = все)
    ShiftStatus? filterStatus,

    /// Фильтр по дате — от
    DateTime? filterDateFrom,

    /// Фильтр по дате — до
    DateTime? filterDateTo,

    /// Фильтр по сотруднику (`?user_id`); null = все сотрудники
    String? filterUserId,

    /// Имя выбранного сотрудника — для отображения в управляющем элементе
    String? filterUserName,

    /// IANA-таймзона организации — карточки и date-range фильтр всегда её
    /// бизнес-события. `null` до первого ответа `getById` — угадывать зону
    /// нельзя (организация может быть не в `Europe/Moscow`), поэтому
    /// [timeContext] на этот момент нейтрально отдаёт устройство, а не
    /// заведомо неверную org-зону.
    String? organizationTimezone,
  }) = _OrgShiftsState;
  const OrgShiftsState._();

  bool get hasFilters =>
      filterStatus != null ||
      filterDateFrom != null ||
      filterDateTo != null ||
      filterUserId != null;

  bool get hasEmployeeFilter => filterUserId != null;

  bool get hasDateFilter => filterDateFrom != null || filterDateTo != null;

  AppTimeContext get timeContext => switch (organizationTimezone) {
    final zone? => AppTimeContext.organization(zone),
    null => const AppTimeContext.device(),
  };
}
