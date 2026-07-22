import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';

void main() {
  test('переводит UTC в Europe/Moscow (UTC+3, без DST)', () {
    final utc = DateTime.utc(2026, 6, 11, 6);
    final local = toOrgLocal(utc, 'Europe/Moscow');

    expect(local.hour, 9);
    expect(local.day, 11);
  });

  test('переводит через полночь в Asia/Yekaterinburg (UTC+5)', () {
    final utc = DateTime.utc(2026, 6, 11, 20);
    final local = toOrgLocal(utc, 'Asia/Yekaterinburg');

    expect(local.hour, 1);
    expect(local.day, 12);
  });

  test('незнакомая/невалидная зона → фолбэк на UTC без падения', () {
    final utc = DateTime.utc(2026, 6, 11, 6);
    final local = toOrgLocal(utc, 'Not/A_Real_Zone');

    expect(local.hour, 6);
    expect(local.isUtc, isTrue);
  });
}
