import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/data/domain/notification/models/_models.dart';

/// Маппинг `notification.type → переход`, расширяемый: новый тип уведомления
/// добавляется новым `case` без правки остальной ленты/бэка.
///
/// Незнакомый (будущий) тип — форвард-совместимость: просто ничего не
/// открываем (уведомление уже помечено прочитанным вызывающей стороной).
void navigateForNotification(
  BuildContext context,
  AppNotification notification,
) {
  switch (notification.type) {
    case 'test_assigned':
      final assignmentId = notification.payload?['assignment_id'] as String?;
      if (assignmentId != null) {
        context.router.root.push(TestAttemptRoute(assignmentId: assignmentId));
      }
    default:
      break;
  }
}
