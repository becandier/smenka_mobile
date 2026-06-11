part of '../view/work_locations_page.dart';

class _LocationTile extends StatelessWidget {
  const _LocationTile({required this.location});

  final WorkLocation location;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final tile = Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _navigateToEdit(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: appColors.primary.withValues(alpha: 0.1),
                child: Icon(
                  Icons.location_on,
                  color: appColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.workLocationsRadius(location.radiusMeters),
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: appColors.secondary.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );

    return Dismissible(
      key: ValueKey(location.id),
      direction: DismissDirection.endToStart,
      background: Material(
        color: appColors.error,
        borderRadius: BorderRadius.circular(12),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete_outline, color: Colors.white),
          ),
        ),
      ),
      confirmDismiss: (_) => _confirmDelete(context),
      child: tile,
    );
  }

  Future<bool> _confirmDelete(BuildContext context) async {
    final l10n = context.l10n;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.workLocationsDelete),
        content: Text(l10n.workLocationsDeleteConfirm(location.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return false;

    final cubit = context.read<LocationsCubit>();
    final didDelete = await cubit.deleteLocation(location.id);

    if (didDelete && context.mounted) {
      context.modals.showSuccess(l10n.workLocationsDeleted);
    }

    return didDelete;
  }

  void _navigateToEdit(BuildContext context) {
    final cubit = context.read<LocationsCubit>();
    context.router.push(
      AddEditLocationRoute(orgId: cubit.orgId, existingLocation: location),
    );
  }
}
