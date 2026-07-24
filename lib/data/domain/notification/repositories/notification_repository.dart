import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/notification/models/_models.dart';

abstract class NotificationRepository {
  /// Лента уведомлений, `created_at DESC`.
  Future<Task<DefaultPaginator<AppNotification>>> getNotifications({
    int limit = 20,
    int offset = 0,
    bool? unread,
  });

  /// Счётчик непрочитанных — для бейджа колокольчика.
  Future<Task<int>> getUnreadCount();

  /// Пометить одно уведомление прочитанным (идемпотентно на бэке).
  Future<Task<AppNotification>> markRead(String notificationId);

  /// Пометить все непрочитанные прочитанными. Возвращает число обновлённых.
  Future<Task<int>> markAllRead();
}
