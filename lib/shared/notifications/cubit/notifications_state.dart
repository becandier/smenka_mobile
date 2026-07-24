import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/data/domain/notification/models/_models.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(PaginatedSectionData<AppNotification>())
    PaginatedSectionData<AppNotification> feed,

    /// Счётчик непрочитанных для бейджа колокольчика. Обновляется при заходе
    /// в шелл (конструктор), на pull-to-refresh ленты и после read/read-all.
    /// Намеренно без отдельного `FeatureStatus` — сбой обновления счётчика
    /// не критичен для UX, просто оставляем прежнее значение.
    @Default(0) int unreadCount,

    @Default(false) bool markingAllRead,
  }) = _NotificationsState;
}
