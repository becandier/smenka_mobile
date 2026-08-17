import 'package:timezone/data/latest_10y.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Настенное время организации из UTC-момента.
///
/// Плановые окна графиков (`work_schedules`) приходят от бэка в UTC — ТЗ
/// требует показывать их в таймзоне организации (`Organization.timezone`,
/// IANA-имя типа `Europe/Moscow`), не в локальном времени устройства. Из
/// коробки `DateTime` умеет только UTC/локальное устройства, поэтому нужна
/// полноценная база IANA (с учётом перехода на летнее/зимнее время для тех
/// зон, где оно есть) — берём `timezone` (dart-lang), а не рукописную таблицу
/// смещений: захардкоженные оффсеты были бы неверны для зон с DST и
/// разошлись бы при следующем изменении правил.
///
/// База (`latest_10y` — сжатый набор переходов за 10 лет, этого достаточно
/// для истории и планов смен) инициализируется один раз лениво при первом
/// вызове: это чистая Dart-структура без I/O, безопасно на всех платформах,
/// включая web.
///
/// Незнакомое/невалидное имя зоны — не должно происходить, бэкенд
/// валидирует его через `zoneinfo.ZoneInfo` (`INVALID_TIMEZONE`), но клиент
/// не должен падать на рассинхроне версий — тогда просто возвращает [utc]
/// без конвертации.
DateTime toOrgLocal(DateTime utc, String timezoneName) {
  _ensureInitialized();
  try {
    final location = tz.getLocation(timezoneName);
    return tz.TZDateTime.from(utc.toUtc(), location);
  } on Object {
    return utc.toUtc();
  }
}

/// Разница в календарных днях (настенное время организации) между
/// [targetUtc] и текущим моментом: `0` — сегодня, `1` — завтра и т.д.
/// (отрицательное — прошлое). Общая точка для «когда» подписей графика
/// (`work_schedule_picker_page.dart` — «начнётся сегодня/завтра/{дата}»,
/// `work_schedule_selector.dart` — «можно начать с/закрыт, ближайший старт
/// завтра»), чтобы конвертация в org-local и усечение до даты не дублировались.
int orgLocalDayDiff(DateTime targetUtc, String timezoneName) {
  final localTarget = toOrgLocal(targetUtc, timezoneName);
  final localNow = toOrgLocal(DateTime.now().toUtc(), timezoneName);
  final targetDate = DateTime(
    localTarget.year,
    localTarget.month,
    localTarget.day,
  );
  final nowDate = DateTime(localNow.year, localNow.month, localNow.day);
  return targetDate.difference(nowDate).inDays;
}

bool _initialized = false;

void _ensureInitialized() {
  if (_initialized) return;
  tzdata.initializeTimeZones();
  _initialized = true;
}
