import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/shift/models/shift.dart';

/// Единая точка выбора [AppTimeContext] для всех временных полей смены
/// (начало/конец, паузы, план, время правки) и связанных с ней сущностей
/// (чек-листы/фото, штраф по смене...).
extension ShiftTimeContext on Shift {
  /// Персональная смена (`organizationId == null`) — контекст устройства.
  ///
  /// Организационная — IANA-зона из самого ответа ([organizationTimezone],
  /// additive backend-поле). Если её нет (rolling deploy — старый бэк ещё
  /// не отдаёт поле), используется [scopedOrganizationTimezone] уже
  /// загруженной организации этого экрана, когда она известна. Ни то ни
  /// другое — безопасный fallback на устройство, без подстановки
  /// угаданной зоны.
  AppTimeContext timeContext({String? scopedOrganizationTimezone}) {
    if (organizationId == null) return const AppTimeContext.device();
    final timeZone = organizationTimezone ?? scopedOrganizationTimezone;
    if (timeZone == null) return const AppTimeContext.device();
    return AppTimeContext.organization(timeZone);
  }
}
