import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/shared/notifications/_notifications.dart';

/// Колокольчик с бейджем непрочитанных — действие аппбара на всех 4 табах
/// шелла. Читает глобальный [NotificationsCubit] (см.
/// `lib/shared/notifications/`), поэтому не требует собственного провайдера.
class NotificationBellButton extends StatelessWidget {
  const NotificationBellButton({super.key});

  @override
  Widget build(BuildContext context) {
    final unreadCount = context.select(
      (NotificationsCubit cubit) => cubit.state.unreadCount,
    );

    return IconButton(
      tooltip: context.l10n.notificationsTitle,
      icon: Badge(
        isLabelVisible: unreadCount > 0,
        label: Text(unreadCount > 99 ? '99+' : '$unreadCount'),
        child: const Icon(Icons.notifications_outlined),
      ),
      onPressed: () => context.router.root.push(const NotificationsRoute()),
    );
  }
}
