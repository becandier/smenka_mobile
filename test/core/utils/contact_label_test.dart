import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/utils/contact_label.dart';

void main() {
  group('resolveContactLabel (admin_created_accounts)', () {
    test('email заполнен → email', () {
      expect(
        resolveContactLabel(email: 'ivan@mail.com', login: 'ivanov'),
        'ivan@mail.com',
      );
    });

    test('email пуст, login заполнен → login', () {
      expect(resolveContactLabel(email: '', login: 'ivanov'), 'ivanov');
    });

    test('email null, login заполнен → login', () {
      expect(resolveContactLabel(email: null, login: 'ivanov'), 'ivanov');
    });

    test('email и login пусты/null → null', () {
      expect(resolveContactLabel(email: '', login: null), isNull);
      expect(resolveContactLabel(email: null, login: ''), isNull);
      expect(resolveContactLabel(email: '  ', login: '  '), isNull);
    });

    test('оба поля с пробелами по краям → trim применяется', () {
      expect(
        resolveContactLabel(email: '  ivan@mail.com  ', login: null),
        'ivan@mail.com',
      );
      expect(resolveContactLabel(email: '', login: '  ivanov  '), 'ivanov');
    });
  });
}
