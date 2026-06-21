part of '../view/shift_tracker_page.dart';

class _ActiveShiftContent extends StatelessWidget {
  const _ActiveShiftContent({required this.state});

  final ShiftTrackerState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;
    final shift = state.activeShift.data;
    if (shift == null) return const SizedBox.shrink();

    final isPaused = state.isShiftPaused;
    final statusText = isPaused ? l10n.shiftPaused : l10n.shiftActive;
    final statusColor = isPaused ? colors.warning : colors.success;

    return SingleChildScrollView(
      // AlwaysScrollable — чтобы pull-to-refresh срабатывал даже когда контент
      // короче экрана.
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Status badge
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  statusText,
                  style: textTheme.labelLarge?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Timer
          Center(
            child: Text(
              _formatDuration(state.elapsedSeconds),
              style: textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontFeatures: [const FontFeature.tabularFigures()],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              l10n.shiftElapsed,
              style: textTheme.bodyMedium?.copyWith(color: colors.secondary),
            ),
          ),
          if (shift.workLocation case final loc?) ...[
            const SizedBox(height: 12),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.place_outlined, size: 16, color: colors.secondary),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      loc.name,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 32),

          // Pause/Resume button
          AppButton(
            label: isPaused ? l10n.shiftResume : l10n.shiftPause,
            isLoading: state.isActionLoading,
            onPressed: () async {
              final cubit = context.read<ShiftTrackerCubit>();
              if (isPaused) {
                final ok = await cubit.resumeShift();
                if (ok && context.mounted) {
                  context.modals.showSuccess(l10n.shiftResumed);
                }
              } else {
                final ok = await cubit.pauseShift();
                if (ok && context.mounted) {
                  context.modals.showInfo(l10n.shiftPauseStarted);
                }
              }
            },
          ),
          const SizedBox(height: 12),

          // Finish button
          AppButton(
            label: l10n.shiftFinish,
            isLoading: state.isActionLoading,
            isOutlined: true,
            onPressed: () => _onFinishShift(context),
          ),
          const SizedBox(height: 24),

          // Checklists for org shifts
          if (shift.organizationId != null)
            _ShiftChecklistsTile(
              shiftId: shift.id,
              organizationId: shift.organizationId,
            ),

          // Pauses list
          if (shift.pauses.isNotEmpty || isPaused)
            _PauseList(pauses: shift.pauses),
        ],
      ),
    );
  }

  Future<void> _onFinishShift(BuildContext context) async {
    final l10n = context.l10n;
    final shift = state.activeShift.data;

    var hasIncompleteRequired = false;
    if (shift != null && shift.organizationId != null) {
      final task = await context.read<ChecklistRepository>().getShiftChecklists(
        shift.id,
      );
      hasIncompleteRequired = task.fold(
        onSuccess: (items) => items.any(
          (i) => i.isRequired && i.status != ChecklistInstanceStatus.completed,
        ),
        onFailure: (_) => false,
      );
    }

    if (!context.mounted) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.shiftConfirmFinish),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.shiftConfirmFinishBody),
            if (hasIncompleteRequired) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: ctx.appColors.error,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      l10n.shiftFinishIncompleteWarning,
                      style: TextStyle(color: ctx.appColors.error),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final cubit = context.read<ShiftTrackerCubit>();
    final ok = await cubit.finishShift();
    if (ok && context.mounted) {
      context.modals.showSuccess(l10n.shiftFinished);
    }
  }

  String _formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}
