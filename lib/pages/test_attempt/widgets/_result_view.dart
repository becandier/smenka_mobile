part of '../view/test_attempt_page.dart';

class _ResultView extends StatelessWidget {
  const _ResultView({required this.result, required this.testTitle});

  final TestResult result;
  final String? testTitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final canRetry = !result.passed && result.attemptsLeft > 0;

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Material(
                color: colors.surface,
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        result.passed
                            ? Icons.check_circle_outline
                            : Icons.cancel_outlined,
                        size: 56,
                        color: result.passed ? colors.success : colors.error,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        result.passed
                            ? l10n.testAttemptResultPassed
                            : l10n.testAttemptResultFailed,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: result.passed ? colors.success : colors.error,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.testAttemptResultScore(
                          result.score,
                          result.maxScore,
                        ),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        l10n.testAttemptResultPercent(result.percent),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.testAttemptResultAttemptsLeft(result.attemptsLeft),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (result.questions case final questions?
                  when result.revealAnswers) ...[
                const SizedBox(height: 20),
                for (final question in questions) ...[
                  _ResultQuestionCard(question: question),
                  const SizedBox(height: 12),
                ],
              ],
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 8,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                if (canRetry) ...[
                  Expanded(
                    child: AppButton(
                      label: l10n.testAttemptRetry,
                      isOutlined: true,
                      onPressed: () => context.read<TestAttemptCubit>().retry(),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: AppButton(
                    label: l10n.commonDone,
                    onPressed: () => context.router.maybePop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ResultQuestionCard extends StatelessWidget {
  const _ResultQuestionCard({required this.question});

  final TestAttemptQuestion question;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            for (final option in question.options)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Icon(
                      _iconFor(option),
                      size: 18,
                      color: _colorFor(context, option),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        option.text,
                        style: TextStyle(color: _colorFor(context, option)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(TestAttemptOption option) {
    if (option.isCorrect ?? false) return Icons.check_circle;
    if (option.isSelected) return Icons.cancel;
    return Icons.circle_outlined;
  }

  Color _colorFor(BuildContext context, TestAttemptOption option) {
    final colors = context.appColors;
    if (option.isCorrect ?? false) return colors.success;
    if (option.isSelected) return colors.error;
    return colors.secondary;
  }
}
