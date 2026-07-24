import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';

/// Уведомление внутри-апповой ленты (см. `docs/tasks/notifications`).
///
/// Названо `AppNotification`, а не `Notification` — во Flutter/Dart уже есть
/// widgets-класс `Notification` (`package:flutter/widgets.dart`), коллизия
/// имён при импорте недопустима.
///
/// [payload] — машинные данные для перехода, форма зависит от [type]
/// (напр. для `test_assigned`: `assignment_id`/`test_template_id`/
/// `test_title`/`due_at`). Разбирается точечно в момент перехода
/// (см. `lib/shared/notifications/notification_navigation.dart`), не здесь —
/// новые типы не должны требовать правки модели.
@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String type,
    required String title,
    required bool isRead,
    required DateTime createdAt,
    String? body,
    Map<String, dynamic>? payload,
  }) = _AppNotification;
}
