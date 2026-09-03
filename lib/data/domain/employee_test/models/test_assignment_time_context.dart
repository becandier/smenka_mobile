import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/test_assignment.dart';

/// Единая точка выбора [AppTimeContext] для дедлайна и попыток назначения
/// теста сотрудника (по образцу `ShiftTimeContext`).
extension TestAssignmentTimeContext on TestAssignment {
  /// Self-contained backend-поле ([organizationTimezone], additive,
  /// `23dc2e3`) — основной источник, `/my/*` не scoped по `{org_id}` и
  /// смешивает назначения нескольких организаций сотрудника. Если поле
  /// отсутствует (rolling deploy — старый бэк ещё не отдаёт его) или несёт
  /// невалидное IANA-имя, используется [scopedOrganizationTimezone] —
  /// клиентский резолв по уже загруженному списку организаций пользователя
  /// (`MyTestsState.timeContextFor`), без дополнительного запроса. Ни то ни
  /// другое — безопасный fallback на устройство.
  AppTimeContext timeContext({String? scopedOrganizationTimezone}) {
    if (organizationTimezone case final zone? when isValidTimeZone(zone)) {
      return AppTimeContext.organization(zone);
    }
    if (scopedOrganizationTimezone case final zone?
        when isValidTimeZone(zone)) {
      return AppTimeContext.organization(zone);
    }
    return const AppTimeContext.device();
  }
}
