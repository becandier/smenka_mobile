import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/data/domain/notification/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/notification/datasource/dto/_dto.dart';

extension NotificationMapper on NotificationDto {
  AppNotification toDomain() {
    return AppNotification(
      id: id,
      type: type,
      title: title,
      body: body,
      payload: payload,
      isRead: isRead,
      createdAt: createdAt,
    );
  }
}

extension PaginatedNotificationsMapper on PaginatedNotificationsDto {
  DefaultPaginator<AppNotification> toDomain() {
    return DefaultPaginator<AppNotification>(
      hasMore: offset + items.length < total,
      data: items.map((e) => e.toDomain()).toList(),
      total: total,
    );
  }
}
