import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/time/app_time.dart';

void main() {
  const appTime = AppTime();

  group('AppTimeContext', () {
    test('organization/device — value equality (не identity)', () {
      expect(
        const AppTimeContext.organization('Europe/Moscow'),
        const AppTimeContext.organization('Europe/Moscow'),
      );
      expect(
        const AppTimeContext.organization('Europe/Moscow') ==
            const AppTimeContext.organization('Europe/Berlin'),
        isFalse,
      );
      expect(const AppTimeContext.device(), const AppTimeContext.device());
    });
  });

  group('formatDateTime — прод-кейс смены «Атлетика»', () {
    test('04:39:06Z в Europe/Moscow (UTC+3, без DST) → 07:39', () {
      final result = appTime.formatDateTime(
        DateTime.parse('2026-09-01T04:39:06Z'),
        const AppTimeContext.organization('Europe/Moscow'),
      );

      expect(result, '01.09.2026, 07:39');
    });

    test('18:00:00Z в Europe/Moscow → 21:00 (окончание той же смены)', () {
      final result = appTime.formatDateTime(
        DateTime.parse('2026-09-01T18:00:00Z'),
        const AppTimeContext.organization('Europe/Moscow'),
      );

      expect(result, '01.09.2026, 21:00');
    });

    test('"Z" и "+00:00" — один и тот же момент, один и тот же результат', () {
      final withZ = appTime.formatDateTime(
        DateTime.parse('2026-09-01T04:39:06Z'),
        const AppTimeContext.organization('Europe/Moscow'),
      );
      final withOffset = appTime.formatDateTime(
        DateTime.parse('2026-09-01T04:39:06+00:00'),
        const AppTimeContext.organization('Europe/Moscow'),
      );

      expect(withOffset, withZ);
    });
  });

  group('Europe/Berlin — зима/лето', () {
    test('зима (CET, UTC+1): 10:00Z → 11:00', () {
      final result = appTime.formatTime(
        DateTime.utc(2026, 1, 15, 10),
        const AppTimeContext.organization('Europe/Berlin'),
      );

      expect(result, '11:00');
    });

    test('лето (CEST, UTC+2): 10:00Z → 12:00', () {
      final result = appTime.formatTime(
        DateTime.utc(2026, 7, 15, 10),
        const AppTimeContext.organization('Europe/Berlin'),
      );

      expect(result, '12:00');
    });
  });

  group('utcBoundsForDay — организационный контекст, IANA/DST', () {
    test('обычные сутки Europe/Moscow — ровно 24 часа', () {
      final bounds = appTime.utcBoundsForDay(
        DateTime(2026, 9, 1),
        const AppTimeContext.organization('Europe/Moscow'),
      );

      expect(bounds.toUtc.difference(bounds.fromUtc).inHours, 24);
    });

    test(
      'переход на летнее время Europe/Berlin (29.03.2026) — сутки 23 часа',
      () {
        final bounds = appTime.utcBoundsForDay(
          DateTime(2026, 3, 29),
          const AppTimeContext.organization('Europe/Berlin'),
        );

        expect(bounds.toUtc.difference(bounds.fromUtc).inHours, 23);
      },
    );

    test(
      'переход на зимнее время Europe/Berlin (25.10.2026) — сутки 25 часов',
      () {
        final bounds = appTime.utcBoundsForDay(
          DateTime(2026, 10, 25),
          const AppTimeContext.organization('Europe/Berlin'),
        );

        expect(bounds.toUtc.difference(bounds.fromUtc).inHours, 25);
      },
    );

    test('границы возвращаются в UTC (timezone-aware), не naive', () {
      final bounds = appTime.utcBoundsForDay(
        DateTime(2026, 9, 1),
        const AppTimeContext.organization('Europe/Moscow'),
      );

      expect(bounds.fromUtc.isUtc, isTrue);
      expect(bounds.toUtc.isUtc, isTrue);
    });
  });

  group('невалидная IANA-зона — безопасный fallback, без падения', () {
    test('formatDateTime не бросает исключение на незнакомой зоне', () {
      expect(
        () => appTime.formatDateTime(
          DateTime.utc(2026, 9, 1, 4, 39, 6),
          const AppTimeContext.organization('Not/A_Real_Zone'),
        ),
        returnsNormally,
      );
    });

    test('невалидная зона показывает момент как UTC (не падает, не угадывает)', () {
      final wall = appTime.wallTime(
        DateTime.utc(2026, 9, 1, 4, 39, 6),
        const AppTimeContext.organization('Not/A_Real_Zone'),
      );

      expect(wall.isUtc, isTrue);
      expect(wall.hour, 4);
    });

    test('utcBoundsForDay на невалидной зоне возвращает 24-часовые сутки', () {
      final bounds = appTime.utcBoundsForDay(
        DateTime(2026, 9, 1),
        const AppTimeContext.organization('Not/A_Real_Zone'),
      );

      expect(bounds.toUtc.difference(bounds.fromUtc).inHours, 24);
    });
  });

  group('device-контекст — таймзона устройства, .toLocal() только здесь', () {
    test('wallTime(device) совпадает с .toLocal() того же момента', () {
      final utc = DateTime.utc(2026, 9, 1, 4, 39, 6);

      final wall = appTime.wallTime(utc, const AppTimeContext.device());

      expect(wall, utc.toLocal());
      expect(wall.isUtc, isFalse);
    });

    test('formatDateTime(device) форматирует локальное время устройства', () {
      final utc = DateTime.utc(2026, 9, 1, 4, 39, 6);
      final expected = _format(utc.toLocal());

      final result = appTime.formatDateTime(
        utc,
        const AppTimeContext.device(),
      );

      expect(result, expected);
    });

    test('utcBoundsForDay(device) — 24 часа вне переходов DST устройства', () {
      final bounds = appTime.utcBoundsForDay(
        DateTime(2026, 9, 1),
        const AppTimeContext.device(),
      );

      expect(bounds.fromUtc.isUtc, isTrue);
      expect(bounds.toUtc.isUtc, isTrue);
      expect(bounds.toUtc.isAfter(bounds.fromUtc), isTrue);
    });
  });

  group('UTC-моменты не искажаются вычислениями', () {
    test('исходный instant после форматирования остаётся тем же UTC-моментом', () {
      final utcMoment = DateTime.parse('2026-09-01T04:39:06Z');
      final untouched = utcMoment.toUtc();

      appTime.formatDateTime(
        utcMoment,
        const AppTimeContext.organization('Europe/Moscow'),
      );

      expect(utcMoment.toUtc(), untouched);
      expect(utcMoment.isUtc, isTrue);
    });
  });
}

String _format(DateTime dt) {
  final d = dt.day.toString().padLeft(2, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final h = dt.hour.toString().padLeft(2, '0');
  final min = dt.minute.toString().padLeft(2, '0');
  return '$d.$m.${dt.year}, $h:$min';
}
