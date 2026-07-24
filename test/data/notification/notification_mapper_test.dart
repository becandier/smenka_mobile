import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/notification/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/notification/mappers/_mappers.dart';

void main() {
  group('NotificationDto → toDomain', () {
    test('переносит все поля', () {
      final dto = NotificationDto.fromJson({
        'id': 'n1',
        'type': 'test_assigned',
        'title': 'Вам назначен тест',
        'body': 'Пройдите тест «Техника безопасности»',
        'payload': {'assignment_id': 'a1', 'due_at': null},
        'is_read': false,
        'created_at': '2026-07-20T10:00:00Z',
      });
      final notification = dto.toDomain();

      expect(notification.id, 'n1');
      expect(notification.type, 'test_assigned');
      expect(notification.title, 'Вам назначен тест');
      expect(notification.body, 'Пройдите тест «Техника безопасности»');
      expect(notification.payload?['assignment_id'], 'a1');
      expect(notification.isRead, isFalse);
      expect(notification.createdAt.isUtc, isTrue);
    });

    test('body/payload отсутствуют → null, парсинг не падает', () {
      final dto = NotificationDto.fromJson({
        'id': 'n2',
        'type': 'test_assigned',
        'title': 'Заголовок',
        'is_read': true,
        'created_at': '2026-07-20T10:00:00Z',
      });
      final notification = dto.toDomain();

      expect(notification.body, isNull);
      expect(notification.payload, isNull);
      expect(notification.isRead, isTrue);
    });
  });

  group('PaginatedNotificationsDto → toDomain', () {
    test('hasMore = true, когда offset+items.length < total', () {
      final dto = PaginatedNotificationsDto.fromJson({
        'items': [
          {
            'id': 'n1',
            'type': 'test_assigned',
            'title': 'A',
            'is_read': false,
            'created_at': '2026-07-20T10:00:00Z',
          },
        ],
        'total': 5,
        'limit': 1,
        'offset': 0,
      });
      final page = dto.toDomain();

      expect(page.hasMore, isTrue);
      expect(page.data, hasLength(1));
      expect(page.total, 5);
    });

    test('hasMore = false, когда все элементы загружены', () {
      final dto = PaginatedNotificationsDto.fromJson({
        'items': <dynamic>[],
        'total': 1,
        'limit': 20,
        'offset': 1,
      });
      final page = dto.toDomain();

      expect(page.hasMore, isFalse);
    });
  });
}
