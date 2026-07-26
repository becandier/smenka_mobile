part of '../view/test_attempt_page.dart';

class _FillingView extends StatelessWidget {
  const _FillingView({required this.state, required this.attempt});

  final TestAttemptState state;
  final TestAttempt attempt;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final total = attempt.questions.length;
    final answered = state.answeredCount;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 12,
            right: 16,
            bottom: 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.testAttemptProgress(answered, total),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: total == 0 ? 0 : answered / total,
                  minHeight: 6,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: attempt.questions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) => _QuestionCard(
              question: attempt.questions[index],
              index: index,
              selected:
                  state.selectedOptionIds[attempt.questions[index].id] ??
                  const {},
            ),
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
            child: Column(
              children: [
                if (state.submitErrorCode != null ||
                    state.submitError != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      localizedErrorMessage(
                        context,
                        code: state.submitErrorCode,
                        fallback: state.submitError,
                      ),
                      style: TextStyle(color: context.appColors.error),
                    ),
                  ),
                ],
                AppButton(
                  label: l10n.testAttemptSubmit,
                  isLoading: state.submitting,
                  onPressed: () => context.read<TestAttemptCubit>().submit(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.question,
    required this.index,
    required this.selected,
  });

  final TestAttemptQuestion question;
  final int index;
  final Set<String> selected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final cubit = context.read<TestAttemptCubit>();

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.testAttemptQuestionNumber(index + 1),
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: colors.secondary),
            ),
            const SizedBox(height: 4),
            Text(
              question.text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            switch (question.type) {
              TestQuestionType.single => RadioGroup<String>(
                groupValue: selected.isEmpty ? null : selected.first,
                onChanged: (value) {
                  if (value != null) {
                    cubit.selectSingle(question.id, value);
                  }
                },
                child: Column(
                  children: [
                    for (final option in question.options)
                      RadioListTile<String>(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(option.text),
                        value: option.id,
                      ),
                  ],
                ),
              ),
              TestQuestionType.multiple => Column(
                children: [
                  for (final option in question.options)
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(option.text),
                      value: selected.contains(option.id),
                      onChanged: (_) =>
                          cubit.toggleMultiple(question.id, option.id),
                    ),
                ],
              ),
              TestQuestionType.unknown => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  l10n.testAttemptUnsupportedQuestion,
                  style: TextStyle(color: colors.secondary),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }
}
