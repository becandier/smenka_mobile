part of '../view/shift_detail_page.dart';

/// Пояснение о ручной правке смены администратором (`manual_time_entry`,
/// прозрачность для сотрудника): факт + комментарий (`manualNote`), если
/// заполнен. Сотрудник только читает — никаких действий (оспорить/
/// подтвердить) здесь нет, за вопросами он идёт к своему админу.
class _ManualNoticeSection extends StatelessWidget {
  const _ManualNoticeSection({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final note = shift.manualNote;

    final notice = shift.isManual
        ? l10n.shiftManualAddedNotice
        : l10n.shiftManualEditedNotice(
            _formatDateTime(shift.editedAt, shift.timeContext()),
          );

    return Material(
      color: colors.info.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: colors.info, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notice,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (note != null && note.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      note,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [DateTime?] здесь всегда non-null при вызове (виден только когда
  /// `isEdited`), но тип поля nullable — обрабатываем явно, без `!`.
  String _formatDateTime(DateTime? dt, AppTimeContext timeContext) =>
      dt == null ? '' : const AppTime().formatDateTime(dt, timeContext);
}
