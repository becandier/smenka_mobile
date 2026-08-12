import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/organization/mappers/_mappers.dart';

Map<String, dynamic> _baseJson({String userEmail = '', String? userLogin}) => {
  'id': 'm1',
  'organization_id': 'org1',
  'user_id': 'u1',
  'user_name': 'Ваня (склад)',
  'user_email': userEmail,
  'role': 'employee',
  'joined_at': '2026-07-20T10:00:00Z',
  'user_login': userLogin,
};

void main() {
  group('MemberDto → toDomain: contactLabel (admin_created_accounts)', () {
    test('обычный участник с email → contactLabel = email', () {
      final dto = MemberDto.fromJson(_baseJson(userEmail: 'ivan@mail.com'));
      final member = dto.toDomain();

      expect(member.userEmail, 'ivan@mail.com');
      expect(member.userLogin, isNull);
      expect(member.contactLabel, 'ivan@mail.com');
    });

    test('учётка без email (заведена админом): user_email = "", '
        'user_login заполнен → contactLabel = login', () {
      final dto = MemberDto.fromJson(_baseJson(userLogin: 'ivanov'));
      final member = dto.toDomain();

      expect(member.userEmail, '');
      expect(member.userLogin, 'ivanov');
      expect(member.contactLabel, 'ivanov');
    });

    test(
      'email и login оба пусты → contactLabel = null (не показываем строку)',
      () {
        final dto = MemberDto.fromJson(_baseJson());
        final member = dto.toDomain();

        expect(member.contactLabel, isNull);
      },
    );

    test('старый бэк без поля user_login в ответе → парсинг не падает', () {
      final json = _baseJson(userEmail: 'ivan@mail.com')..remove('user_login');
      final dto = MemberDto.fromJson(json);
      final member = dto.toDomain();

      expect(member.userLogin, isNull);
      expect(member.contactLabel, 'ivan@mail.com');
    });
  });
}
