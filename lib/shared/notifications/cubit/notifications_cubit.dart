import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/notification/_notification.dart';
import 'package:smenka_mobile/shared/notifications/cubit/notifications_state.dart';

/// Центр уведомлений — глобальный кубит уровня приложения (по образцу
/// `AuthCubit`, см. `lib/shared/auth/`), а НЕ кубит одной страницы: счётчик
/// непрочитанных нужен в аппбаре всех 4 табов шелла одновременно, а лента
/// (`NotificationsPage`) переиспользует тот же инстанс, чтобы `read`/
/// `read-all` сразу отражались в бейдже без повторного похода за счётчиком.
///
/// Независим от других кубитов (см. конвенции проекта) — только
/// [NotificationRepository].
class NotificationsCubit extends Cubit<NotificationsState>
    with PaginationMixin<NotificationsState> {
  NotificationsCubit({required NotificationRepository repository})
    : _repository = repository,
      super(const NotificationsState()) {
    // Счётчик — дёшево и нужен сразу при старте приложения (бейдж на всех
    // табах). Полная лента лениво грузится при открытии `NotificationsPage`
    // (см. `NotificationsPage.initState`) — не тратим сеть на экран,
    // который пользователь может не открыть.
    loadUnreadCount();
  }

  final NotificationRepository _repository;

  Future<void> loadUnreadCount() async {
    final result = await _repository.getUnreadCount();
    result.fold(
      onSuccess: (count) => emit(state.copyWith(unreadCount: count)),
      // Сбой обновления счётчика не критичен — оставляем прежнее значение,
      // следующий заход/pull-to-refresh попробует снова.
      onFailure: (_) {},
    );
  }

  Future<void> loadFeed({bool isRefresh = true}) => fetchPaginated(
    getSection: (s) => s.feed,
    updateState: (s, section) => s.copyWith(feed: section),
    fetch: (page, perPage) => _repository.getNotifications(
      limit: perPage,
      offset: (page - 1) * perPage,
    ),
    isRefresh: isRefresh,
  );

  /// Помечает уведомление прочитанным (по тапу) и синхронно обновляет ленту
  /// + бейдж, если уведомление было непрочитанным.
  Future<void> markRead(String notificationId) async {
    final current = state.feed.data.where((n) => n.id == notificationId);
    final wasUnread = current.isNotEmpty && !current.first.isRead;
    if (!wasUnread && current.isNotEmpty) {
      return;
    }

    final result = await _repository.markRead(notificationId);
    result.fold(
      onSuccess: (updated) {
        final data = [
          for (final n in state.feed.data)
            if (n.id == updated.id) updated else n,
        ];
        emit(
          state.copyWith(
            feed: state.feed.copyWith(data: data),
            unreadCount: wasUnread
                ? (state.unreadCount - 1).clamp(0, 1 << 30)
                : state.unreadCount,
          ),
        );
      },
      // Ошибку не показываем отдельным тостом — не критично, пользователь
      // всё равно перейдёт по уведомлению; повторный pull-to-refresh
      // подтянет актуальный статус.
      onFailure: (_) {},
    );
  }

  Future<void> markAllRead() async {
    if (state.markingAllRead) return;
    emit(state.copyWith(markingAllRead: true));

    final result = await _repository.markAllRead();
    result.fold(
      onSuccess: (_) {
        final data = [
          for (final n in state.feed.data) n.copyWith(isRead: true),
        ];
        emit(
          state.copyWith(
            feed: state.feed.copyWith(data: data),
            unreadCount: 0,
            markingAllRead: false,
          ),
        );
      },
      onFailure: (_) => emit(state.copyWith(markingAllRead: false)),
    );
  }
}
