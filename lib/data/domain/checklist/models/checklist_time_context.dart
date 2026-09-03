import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_instance.dart';

/// Единая точка выбора [AppTimeContext] для чек-листа смены и его фото
/// (время выполнения пункта, штамп/`captured_at` фото).
extension ChecklistTimeContext on ChecklistInstanceDetail {
  /// Self-contained ответ детали чек-листа уже несёт [organizationTimezone]
  /// (backend additive, `d84750c`) — без rolling-deploy scoped fallback:
  /// экран не грузит `Organization` отдельно только ради таймзоны. `null`,
  /// либо невалидное IANA-имя (см. [isValidTimeZone] — без явной проверки
  /// [toOrgLocal] тихо откатился бы на UTC вместо контекста устройства) —
  /// персональная смена/старый бэк без поля/рассинхрон версий — контекст
  /// устройства.
  AppTimeContext timeContext() {
    if (organizationTimezone case final zone? when isValidTimeZone(zone)) {
      return AppTimeContext.organization(zone);
    }
    return const AppTimeContext.device();
  }
}
