part of '../view/shift_tracker_page.dart';

/// Поле выбора рабочей точки на idle-экране (когда гео выключена). Открывает
/// модалку [WorkLocationPickerRoute]; результат уходит в кубит. Визуально
/// повторяет [_OrgSelector] (OutlineInputBorder).
class _WorkLocationSelector extends StatelessWidget {
  const _WorkLocationSelector({required this.state});

  final ShiftTrackerState state;

  Future<void> _openPicker(BuildContext context) async {
    final org = state.selectedOrganization;
    if (org == null) return;
    final cubit = context.read<ShiftTrackerCubit>();
    final result = await context.router.push<WorkLocationPickerResult?>(
      WorkLocationPickerRoute(
        orgId: org.id,
        selectedLocationId: state.selectedWorkLocation?.id,
        allowNone: !state.requiresWorkLocation,
      ),
    );
    if (result != null) cubit.selectWorkLocation(result.location);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final selected = state.selectedWorkLocation;
    final label = selected?.name ?? l10n.shiftWorkLocationSelect;
    final isPlaceholder = selected == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.shiftWorkLocation, style: textTheme.titleSmall),
        const SizedBox(height: 8),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _openPicker(context),
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.place_outlined, size: 20, color: colors.secondary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge?.copyWith(
                        color: isPlaceholder ? colors.secondary : null,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: colors.secondary),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
