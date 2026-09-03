import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';
import 'package:smenka_mobile/data/domain/shift/models/shift.dart';

/// Единая точка выбора [AppTimeContext] для всех временных полей смены
/// (начало/конец, паузы, план, время правки) и связанных с ней сущностей
/// (чек-листы/фото, штраф по смене...).
extension ShiftTimeContext on Shift {
  /// Персональная смена (`organizationId == null`) — контекст устройства.
  ///
  /// Организационная — IANA-зона из самого ответа ([organizationTimezone],
  /// additive backend-поле), если она валидна. Если её нет (rolling deploy
  /// — старый бэк ещё не отдаёт поле) или она невалидна, используется
  /// [scopedOrganizationTimezone] уже загруженной организации этого экрана,
  /// когда она известна и тоже валидна. Ни то ни другое — безопасный
  /// fallback на устройство, без подстановки угаданной зоны.
  ///
  /// Валидация через [isValidTimeZone] обязательна: [toOrgLocal]/
  /// [orgUtcDayBounds] сами по себе тихо откатываются на UTC при
  /// невалидном имени, и без явной проверки здесь это перекрыло бы
  /// достижимый валидный [scopedOrganizationTimezone].
  AppTimeContext timeContext({String? scopedOrganizationTimezone}) {
    if (organizationId == null) return const AppTimeContext.device();
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
