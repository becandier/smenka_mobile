import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/notification/_notification.dart';
import 'package:smenka_mobile/shared/notifications/_notifications.dart';

class _MockNotificationRepository extends Mock
    implements NotificationRepository {}

AppNotification _notification({String id = 'n1', bool isRead = false}) =>
    AppNotification(
      id: id,
      type: 'test_assigned',
      title: 'Вам назначен тест',
      isRead: isRead,
      createdAt: DateTime.utc(2026, 7, 20),
    );

void main() {
  late _MockNotificationRepository repo;

  setUp(() {
    repo = _MockNotificationRepository();
    when(
      () => repo.getUnreadCount(),
    ).thenAnswer((_) async => const Task<int>.success(0));
  });

  NotificationsCubit build() => NotificationsCubit(repository: repo);

  test('конструктор сразу грузит счётчик непрочитанных', () async {
    when(
      () => repo.getUnreadCount(),
    ).thenAnswer((_) async => const Task<int>.success(3));

    final cubit = build();
    await cubit.loadUnreadCount();

    expect(cubit.state.unreadCount, 3);
  });

  test('сбой счётчика не роняет состояние — остаётся прежним', () async {
    when(() => repo.getUnreadCount()).thenAnswer(
      (_) async =>
          const Task<int>.failure(ApiException.network(message: 'нет сети')),
    );

    final cubit = build();
    await cubit.loadUnreadCount();

    expect(cubit.state.unreadCount, 0);
  });

  test('loadFeed успех → лента заполнена', () async {
    when(() => repo.getNotifications()).thenAnswer(
      (_) async => Task.success(
        DefaultPaginator<AppNotification>(
          hasMore: false,
          data: [_notification()],
          total: 1,
        ),
      ),
    );

    final cubit = build();
    await cubit.loadFeed();

    expect(cubit.state.feed.status, FeatureStatus.success);
    expect(cubit.state.feed.data, hasLength(1));
  });

  test(
    'markRead успех на непрочитанном → обновляет ленту и декрементит счётчик',
    () async {
      when(
        () => repo.getUnreadCount(),
      ).thenAnswer((_) async => const Task<int>.success(1));
      when(() => repo.getNotifications()).thenAnswer(
        (_) async => Task.success(
          DefaultPaginator<AppNotification>(
            hasMore: false,
            data: [_notification()],
            total: 1,
          ),
        ),
      );
      when(
        () => repo.markRead('n1'),
      ).thenAnswer((_) async => Task.success(_notification(isRead: true)));

      final cubit = build();
      await cubit.loadUnreadCount();
      expect(cubit.state.unreadCount, 1);

      await cubit.loadFeed();
      await cubit.markRead('n1');

      expect(cubit.state.feed.data.single.isRead, isTrue);
      expect(cubit.state.unreadCount, 0);
      verify(() => repo.markRead('n1')).called(1);
    },
  );

  test(
    'markRead на уже прочитанном элементе — не дёргает репозиторий повторно',
    () async {
      when(() => repo.getNotifications()).thenAnswer(
        (_) async => Task.success(
          DefaultPaginator<AppNotification>(
            hasMore: false,
            data: [_notification(isRead: true)],
            total: 1,
          ),
        ),
      );

      final cubit = build();
      await cubit.loadFeed();
      await cubit.markRead('n1');

      verifyNever(() => repo.markRead(any()));
    },
  );

  test('markAllRead успех → счётчик обнулён, все элементы прочитаны', () async {
    when(() => repo.getNotifications()).thenAnswer(
      (_) async => Task.success(
        DefaultPaginator<AppNotification>(
          hasMore: false,
          data: [
            _notification(),
            _notification(id: 'n2'),
          ],
          total: 2,
        ),
      ),
    );
    when(
      () => repo.markAllRead(),
    ).thenAnswer((_) async => const Task<int>.success(2));

    final cubit = build();
    await cubit.loadFeed();
    await cubit.markAllRead();

    expect(cubit.state.unreadCount, 0);
    expect(cubit.state.feed.data.every((n) => n.isRead), isTrue);
    expect(cubit.state.markingAllRead, isFalse);
  });
}
