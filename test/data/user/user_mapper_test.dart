import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/user/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/user/mappers/_mappers.dart';

void main() {
  group('UserDto → toDomain', () {
    test('обычная учётка с email → contactLabel = email', () {
      final dto = UserDto.fromJson({
        'id': 'u1',
        'name': 'Иван Иванов',
        'is_verified': true,
        'role': 'user',
        'created_at': '2026-07-20T10:00:00Z',
        'email': 'ivan@mail.com',
      });
      final user = dto.toDomain();

      expect(user.email, 'ivan@mail.com');
      expect(user.login, isNull);
      expect(user.contactLabel, 'ivan@mail.com');
    });

    test('учётка, заведённая админом (admin_created_accounts): email null, '
        'login заполнен → contactLabel = login', () {
      final dto = UserDto.fromJson({
        'id': 'u2',
        'name': 'Ваня (склад)',
        'is_verified': true,
        'role': 'user',
        'created_at': '2026-07-20T10:00:00Z',
        'email': null,
        'login': 'ivanov',
      });
      final user = dto.toDomain();

      expect(user.email, isNull);
      expect(user.login, 'ivanov');
      expect(user.contactLabel, 'ivanov');
    });

    test('старый бэк без поля login в ответе → парсинг не падает', () {
      final dto = UserDto.fromJson({
        'id': 'u3',
        'name': 'Пётр Петров',
        'is_verified': true,
        'role': 'user',
        'created_at': '2026-07-20T10:00:00Z',
        'email': 'petr@mail.com',
      });
      final user = dto.toDomain();

      expect(user.login, isNull);
      expect(user.contactLabel, 'petr@mail.com');
    });
  });
}
