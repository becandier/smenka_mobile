part of '../view/test_attempt_page.dart';

/// Назначение больше не существует — админ снял его в любой момент (без
/// уведомления сотруднику) или тест удалён, пока сотрудник был на экране
/// (`TestUnassignedReason`). В отличие от [_BlockedView] это не техническая
/// ошибка: повторный запрос не поможет, поэтому единственное действие —
/// вернуться к списку тестов, без ретраев (см. `mobile.md`).
class _UnassignedView extends StatelessWidget {
  const _UnassignedView({required this.state});

  final TestAttemptState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final reason =
        state.unassignedReason ?? TestUnassignedReason.assignmentNotFound;

    return AppEmptyState(
      icon: Icons.assignment_late_outlined,
      title: switch (reason) {
        TestUnassignedReason.assignmentNotFound =>
          l10n.testAttemptUnassignedTitle,
        TestUnassignedReason.templateDeleted => l10n.testAttemptDeletedTitle,
      },
      subtitle: switch (reason) {
        TestUnassignedReason.assignmentNotFound =>
          l10n.testAttemptUnassignedMessage,
        TestUnassignedReason.templateDeleted => null,
      },
      actionLabel: l10n.testAttemptBackToList,
      onAction: () => context.router.maybePop(),
    );
  }
}
