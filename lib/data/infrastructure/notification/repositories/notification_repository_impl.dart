import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/notification/_notification.dart';
import 'package:smenka_mobile/data/infrastructure/notification/datasource/notification_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/notification/mappers/_mappers.dart';

class NotificationRepositoryImpl
    with TaskHandler
    implements NotificationRepository {
  NotificationRepositoryImpl({required NotificationDataSource dataSource})
    : _dataSource = dataSource;

  final NotificationDataSource _dataSource;

  @override
  Future<Task<DefaultPaginator<AppNotification>>> getNotifications({
    int limit = 20,
    int offset = 0,
    bool? unread,
  }) {
    return execute(() async {
      final dto = await _dataSource.getNotifications(
        limit: limit,
        offset: offset,
        unread: unread,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<int>> getUnreadCount() {
    return execute(_dataSource.getUnreadCount);
  }

  @override
  Future<Task<AppNotification>> markRead(String notificationId) {
    return execute(() async {
      final dto = await _dataSource.markRead(notificationId);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<int>> markAllRead() {
    return execute(_dataSource.markAllRead);
  }
}
