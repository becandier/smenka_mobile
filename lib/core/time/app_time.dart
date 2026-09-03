import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';

/// Явный контекст представления настенного времени.
///
/// UTC-момент — единственная точка правды (хранится, передаётся,
/// сравнивается). Настенное время строится ТОЛЬКО на UI-границе, и только
/// в одном из двух явных контекстов:
///
/// - [OrganizationTimeContext] — момент относится к бизнес-событию
///   организации (смена, пауза, график, чек-лист, фото, штраф,
///   корректировка, ставка, тест сотрудника...) — показывается в IANA
///   таймзоне организации, независимо от таймзоны устройства;
/// - [DeviceTimeContext] — персональное/платформенное событие без
///   организации (личная смена, профиль, уведомления/платежи вне org) —
///   показывается в таймзоне устройства.
///
/// Ни один cubit/сервис не хранит «текущую» таймзону глобально — экран
/// «Все смены» одновременно показывает смены разных организаций, поэтому
/// глобальный mutable-контекст был бы в принципе неверен. Контекст приходит
/// явным аргументом в каждый вызов [AppTime] вместе с доменными данными
/// конкретной строки/экрана (`Shift.organizationTimezone`, уже загруженная
/// `Organization.timezone` и т.д.).
sealed class AppTimeContext {
  const AppTimeContext();

  /// Бизнес-событие организации. [timeZone] — IANA-имя
  /// (`Organization.timezone`), например `Europe/Moscow`.
  const factory AppTimeContext.organization(String timeZone) =
      OrganizationTimeContext;

  /// Персональное/платформенное событие — таймзона устройства.
  const factory AppTimeContext.device() = DeviceTimeContext;
}

/// См. [AppTimeContext.organization].
@immutable
final class OrganizationTimeContext extends AppTimeContext {
  const OrganizationTimeContext(this.timeZone);

  final String timeZone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationTimeContext && other.timeZone == timeZone);

  @override
  int get hashCode => Object.hash(OrganizationTimeContext, timeZone);

  @override
  String toString() => 'AppTimeContext.organization($timeZone)';
}

/// См. [AppTimeContext.device].
@immutable
final class DeviceTimeContext extends AppTimeContext {
  const DeviceTimeContext();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DeviceTimeContext;

  @override
  int get hashCode => (DeviceTimeContext).hashCode;

  @override
  String toString() => 'AppTimeContext.device()';
}

/// Единая stateless-точка форматирования и календарных вычислений времени
/// приложения. Не хранит выбранную таймзону, не выполняет I/O — вся IANA-база
/// уже лежит в бандле (`timezone`/`latest_10y`, см. `org_timezone.dart`).
///
/// Presentation-код не должен форматировать API-timestamp через
/// `DateFormat`/`.toLocal()` напрямую — только через этот интерфейс с явным
/// [AppTimeContext] (см. `test/architecture/time_boundary_test.dart`).
abstract interface class AppTime {
  const factory AppTime() = _AppTime;

  /// Настенное время [utcMoment] в [context]. `.toLocal()` вызывается
  /// только внутри ветки [DeviceTimeContext] — единственное разрешённое
  /// место в приложении.
  DateTime wallTime(DateTime utcMoment, AppTimeContext context);

  /// `dd.MM.yyyy, HH:mm` в настенном времени [context].
  String formatDateTime(DateTime utcMoment, AppTimeContext context);

  /// `dd.MM.yyyy` в настенном времени [context].
  String formatDate(DateTime utcMoment, AppTimeContext context);

  /// `HH:mm` в настенном времени [context].
  String formatTime(DateTime utcMoment, AppTimeContext context);

  /// UTC-границы `[fromUtc, toUtc)` календарных суток [calendarDay]
  /// (используются только `year`/`month`/`day`, время игнорируется) в
  /// [context]. В организационном контексте сутки строятся через IANA:
  /// 23/25 часов в дни перехода DST, а не безусловные 24 часа. Невалидная
  /// IANA-зона безопасно возвращает 24-часовые UTC-сутки без падения.
  ({DateTime fromUtc, DateTime toUtc}) utcBoundsForDay(
    DateTime calendarDay,
    AppTimeContext context,
  );
}

class _AppTime implements AppTime {
  const _AppTime();

  static final DateFormat _dateTimeFormat = DateFormat('dd.MM.yyyy, HH:mm');
  static final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');
  static final DateFormat _timeFormat = DateFormat('HH:mm');

  @override
  DateTime wallTime(DateTime utcMoment, AppTimeContext context) {
    final utc = utcMoment.toUtc();
    return switch (context) {
      OrganizationTimeContext(:final timeZone) => toOrgLocal(utc, timeZone),
      DeviceTimeContext() => utc.toLocal(),
    };
  }

  @override
  String formatDateTime(DateTime utcMoment, AppTimeContext context) =>
      _dateTimeFormat.format(wallTime(utcMoment, context));

  @override
  String formatDate(DateTime utcMoment, AppTimeContext context) =>
      _dateFormat.format(wallTime(utcMoment, context));

  @override
  String formatTime(DateTime utcMoment, AppTimeContext context) =>
      _timeFormat.format(wallTime(utcMoment, context));

  @override
  ({DateTime fromUtc, DateTime toUtc}) utcBoundsForDay(
    DateTime calendarDay,
    AppTimeContext context,
  ) {
    return switch (context) {
      OrganizationTimeContext(:final timeZone) => orgUtcDayBounds(
        calendarDay,
        timeZone,
      ),
      DeviceTimeContext() => _deviceUtcDayBounds(calendarDay),
    };
  }

  /// `DateTime(y, m, d)` конструирует настенную полночь устройства — Dart
  /// сам учитывает DST локальной зоны ОС при последующем `.toUtc()`, без
  /// ручной арифметики смещений.
  ({DateTime fromUtc, DateTime toUtc}) _deviceUtcDayBounds(
    DateTime calendarDay,
  ) {
    final start = DateTime(
      calendarDay.year,
      calendarDay.month,
      calendarDay.day,
    );
    final end = DateTime(
      calendarDay.year,
      calendarDay.month,
      calendarDay.day + 1,
    );
    return (fromUtc: start.toUtc(), toUtc: end.toUtc());
  }
}
