import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_instance.dart';

/// Единая точка выбора [AppTimeContext] для чек-листа смены и его фото
/// (время выполнения пункта, штамп/`captured_at` фото).
extension ChecklistTimeContext on ChecklistInstanceDetail {
  /// Self-contained ответ детали чек-листа уже несёт [organizationTimezone]
  /// (backend additive, `d84750c`) — без rolling-deploy scoped fallback:
  /// экран не грузит `Organization` отдельно только ради таймзоны. `null` —
  /// персональная смена либо старый бэк без поля — контекст устройства.
  AppTimeContext timeContext() {
    final timeZone = organizationTimezone;
    if (timeZone == null) return const AppTimeContext.device();
    return AppTimeContext.organization(timeZone);
  }
}
