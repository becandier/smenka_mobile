part of '../view/test_attempt_page.dart';

/// Прохождение недоступно (уже сдан / попытки исчерпаны / попытка уже
/// сдана на другом устройстве / шаблон архивный) — причина по
/// [TestAttemptState.errorCode], итог берём из уже загруженного
/// [TestAttemptState.assignment] (денормализованные поля), без похода за
/// попыткой.
class _BlockedView extends StatelessWidget {
  const _BlockedView({required this.state});

  final TestAttemptState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final assignment = state.assignment;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              assignment?.passed ?? false
                  ? Icons.check_circle_outline
                  : Icons.info_outline,
              size: 56,
              color: assignment?.passed ?? false
                  ? colors.success
                  : colors.secondary,
            ),
            const SizedBox(height: 16),
            Text(
              localizedErrorMessage(context, code: state.errorCode),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (assignment?.bestPercent case final bestPercent?) ...[
              const SizedBox(height: 8),
              Text(
                l10n.testAttemptResultPercent(bestPercent),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: colors.secondary),
              ),
            ],
            const SizedBox(height: 24),
            AppButton(
              label: l10n.commonDone,
              onPressed: () => context.router.maybePop(),
            ),
          ],
        ),
      ),
    );
  }
}
