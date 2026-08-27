part of 'invite_cubit.dart';

/// Причина финального состояния "ошибка" на экране приглашения — маппится
/// напрямую из `error.code` бэкенда (см. `docs/tasks/invite_links/mobile.md`).
enum InviteErrorKind {
  /// Код не найден/отозван (`INVALID_INVITE`, 404).
  invalidInvite,

  /// Владелец организации пытается вступить как сотрудник
  /// (`OWNER_CANNOT_JOIN`, 400) — не сбой, нейтральный тон.
  ownerCannotJoin,

  /// Пользователь уже состоит в организации (`ALREADY_MEMBER`, 409) — не
  /// ошибка, ведём на главный экран.
  alreadyMember,

  /// Организация исчерпала лимит мест по тарифу (`PLAN_LIMIT_REACHED`, 402,
  /// `tariffs`) — финальное состояние, не повторяемое (лимит не снимется
  /// повторным вызовом): сотруднику ничего не остаётся, кроме как
  /// обратиться к руководителю. Текст без слов «оплата»/«тариф»/«долг» —
  /// сотрудник на тариф не влияет (mobile.md).
  planLimitReached,

  /// Организация приостановлена — read-only (`SUBSCRIPTION_INACTIVE`, 402,
  /// `tariffs`): бэк проверяет активность подписки РАНЬШЕ лимита мест при
  /// вступлении по коду (`join_by_invite`), так что этот код тоже возможен
  /// здесь, а не только при старте смены. Финально, не повторяемо — тот же
  /// текст, что и в `error_localization.dart`.
  subscriptionInactive,

  /// Сеть/неизвестный код — единственный повторяемый случай.
  network,
}

@freezed
sealed class InviteState with _$InviteState {
  /// Идёт вступление (первичный запрос или повтор после сетевой ошибки).
  const factory InviteState.loading() = InviteStateLoading;

  /// Пользователь не авторизован: код уже сохранён в [PendingInviteStorage],
  /// экран сейчас уйдёт на логин/регистрацию.
  const factory InviteState.requiresAuth() = InviteStateRequiresAuth;

  /// Успешное вступление.
  const factory InviteState.success({required String organizationName}) =
      InviteStateSuccess;

  /// Финальная или повторяемая ошибка — см. [InviteErrorKind].
  const factory InviteState.error({
    required InviteErrorKind kind,
    String? message,
  }) = InviteStateError;
}
