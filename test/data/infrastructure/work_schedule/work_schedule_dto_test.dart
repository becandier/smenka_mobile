import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/work_schedule/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/work_schedule/mappers/_mappers.dart';

/// Обратная совместимость парсинга `GET /organizations/{org_id}/my-schedules`
/// (schedule_window_enforcement): старый бэкенд ещё не отдаёт
/// `early_start_minutes` — приложение не должно падать, поле должно
/// дефолтиться в `0` (см. mobile.md, приёмка).
void main() {
  Map<String, dynamic> item({bool withCanStartNow = true}) => {
    'id': 'sched1',
    'name': 'Дневная',
    'start_time': '09:00',
    'end_time': '18:00',
    'duration_minutes': 540,
    'crosses_midnight': false,
    'next_start_at': '2026-08-17T06:00:00Z',
    'next_end_at': '2026-08-17T15:00:00Z',
    'is_current': false,
    'starts_in_minutes': 120,
    if (withCanStartNow) 'can_start_now': false,
  };

  test('новый бэкенд (early_start_minutes + can_start_now в ответе) — '
      'earlyStartMinutes парсится, can_start_now в домен не идёт', () {
    final json = {
      'items': [item()],
      'total': 1,
      'require_schedule': true,
      'early_start_minutes': 15,
    };

    final dto = MySchedulesDto.fromJson(json);
    final domain = dto.toDomain();

    expect(domain.earlyStartMinutes, 15);
    expect(domain.items, hasLength(1));
    expect(domain.items.single.id, 'sched1');
  });

  test('старый бэкенд (нет early_start_minutes и can_start_now) — парсинг не '
      'падает, earlyStartMinutes дефолтится в 0', () {
    final json = {
      'items': [item(withCanStartNow: false)],
      'total': 1,
      'require_schedule': true,
      // early_start_minutes отсутствует намеренно.
    };

    final dto = MySchedulesDto.fromJson(json);
    final domain = dto.toDomain();

    expect(domain.earlyStartMinutes, 0);
    expect(domain.requireSchedule, isTrue);
    expect(domain.items.single.id, 'sched1');
  });
}
