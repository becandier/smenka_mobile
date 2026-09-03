import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/notification/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/notifications/notification_navigation.dart';
import 'package:smenka_mobile/shared/notifications/_notifications.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_notification_tile.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    // Лента грузится лениво здесь (не в конструкторе глобального кубита) —
    // см. doc-комментарий `NotificationsCubit`.
    context.read<NotificationsCubit>().loadFeed();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        centerTitle: true,
        actions: [
          BlocSelector<NotificationsCubit, NotificationsState, bool>(
            selector: (state) => state.unreadCount > 0,
            builder: (context, hasUnread) {
              if (!hasUnread) return const SizedBox.shrink();
              return TextButton(
                onPressed: () =>
                    context.read<NotificationsCubit>().markAllRead(),
                child: Text(l10n.notificationsMarkAllRead),
              );
            },
          ),
        ],
      ),
      body:
          PaginatedSectionDataList<
            NotificationsCubit,
            NotificationsState,
            AppNotification
          >(
            selector: (state) => state.feed,
            itemBuilder: (context, notification, index) => _NotificationTile(
              notification: notification,
              onTap: () {
                context.read<NotificationsCubit>().markRead(notification.id);
                unawaited(navigateForNotification(context, notification));
              },
            ),
            onLoadMore: () =>
                context.read<NotificationsCubit>().loadFeed(isRefresh: false),
            onRefresh: () {
              context.read<NotificationsCubit>().loadFeed();
              context.read<NotificationsCubit>().loadUnreadCount();
            },
            emptyBuilder: () => AppEmptyState(
              icon: Icons.notifications_none,
              title: l10n.notificationsEmpty,
            ),
          ),
    );
  }
}
