part of '../view/checklist_fill_page.dart';

/// Фото-секция под пунктом чек-листа: бейдж «нужно фото», лента превью
/// (серверные фото + локальные черновики загрузки) и кнопка «Добавить фото».
/// Видимость кнопок зависит от `readOnly` и лимита `max_photos_per_item`.
class _ItemPhotosSection extends StatelessWidget {
  const _ItemPhotosSection({required this.item});

  final ChecklistInstanceItem item;

  @override
  Widget build(BuildContext context) {
    final readOnly = context.select<ChecklistFillCubit, bool>(
      (c) => c.state.readOnly,
    );
    final maxPhotos = context.select<ChecklistFillCubit, int?>(
      (c) => c.state.instance.data?.maxPhotosPerItem,
    );
    final drafts = context
        .select<ChecklistFillCubit, List<ChecklistPhotoDraft>>(
          (c) => c.state.photoDrafts[item.id] ?? const [],
        );

    final photos = [...item.photos]
      ..sort((a, b) => a.position.compareTo(b.position));

    final hasSection =
        item.photoRequirement != PhotoRequirement.none ||
        photos.isNotEmpty ||
        drafts.isNotEmpty;
    if (!hasSection) return const SizedBox.shrink();

    final shownCount = item.photosCount + drafts.length;
    final canAdd =
        !readOnly &&
        item.photoRequirement != PhotoRequirement.none &&
        (maxPhotos == null || shownCount < maxPhotos);

    final needsPhoto =
        item.photoRequirement == PhotoRequirement.required &&
        item.photosCount == 0;

    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 4, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (needsPhoto)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: _PhotoRequiredBadge(),
            ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var i = 0; i < photos.length; i++)
                _PhotoThumb(
                  photo: photos[i],
                  readOnly: readOnly,
                  onTap: () => _openViewer(context, photos, i, readOnly),
                  onDelete: () => _onDeleteThumb(context, photos[i].id),
                ),
              for (final draft in drafts)
                _DraftThumb(
                  draft: draft,
                  onRetry: () => context.read<ChecklistFillCubit>().retryPhoto(
                    item.id,
                    draft.draftId,
                  ),
                  onDismiss: () => context
                      .read<ChecklistFillCubit>()
                      .removePhotoDraft(item.id, draft.draftId),
                ),
              if (canAdd) _AddPhotoTile(onTap: () => _onAdd(context)),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onAdd(BuildContext context) async {
    final cubit = context.read<ChecklistFillCubit>();
    if (item.photoSource == PhotoSource.camera) {
      await cubit.addPhoto(item, PhotoCaptureSource.camera);
      return;
    }
    final router = context.router;
    final source = await router.root.push<PhotoCaptureSource?>(
      const ChecklistPhotoSourceRoute(),
    );
    if (source == null) return;
    await cubit.addPhoto(item, source);
  }

  void _openViewer(
    BuildContext context,
    List<ChecklistItemPhoto> photos,
    int index,
    bool readOnly,
  ) {
    final cubit = context.read<ChecklistFillCubit>();
    context.router.root.push(
      ChecklistPhotoViewerRoute(
        photos: photos,
        initialIndex: index,
        isAddedSemantics: item.photoSource == PhotoSource.cameraOrGallery,
        onDeletePhoto: readOnly
            ? null
            : (photoId) => cubit.removePhoto(item, photoId),
      ),
    );
  }

  Future<void> _onDeleteThumb(BuildContext context, String photoId) async {
    final cubit = context.read<ChecklistFillCubit>();
    final confirmed = await _confirmDeletePhoto(context);
    if (confirmed != true) return;
    await cubit.removePhoto(item, photoId);
  }
}

class _PhotoRequiredBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = context.l10n;
    return Material(
      color: colors.warning.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.photo_camera_outlined, size: 14, color: colors.warning),
            const SizedBox(width: 4),
            Text(
              l10n.checklistPhotoRequiredBadge,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colors.warning,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const double _kThumbSize = 72;

class _PhotoThumb extends StatelessWidget {
  const _PhotoThumb({
    required this.photo,
    required this.readOnly,
    required this.onTap,
    required this.onDelete,
  });

  final ChecklistItemPhoto photo;
  final bool readOnly;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _kThumbSize,
      height: _kThumbSize,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: StorageImage(
              fileId: photo.fileId,
              initialUrl: photo.url,
              width: _kThumbSize,
              height: _kThumbSize,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          if (!readOnly)
            Positioned(
              top: 2,
              right: 2,
              child: _ThumbActionButton(icon: Icons.close, onTap: onDelete),
            ),
        ],
      ),
    );
  }
}

class _DraftThumb extends StatelessWidget {
  const _DraftThumb({
    required this.draft,
    required this.onRetry,
    required this.onDismiss,
  });

  final ChecklistPhotoDraft draft;
  final VoidCallback onRetry;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isError = draft.status == PhotoDraftStatus.error;

    return SizedBox(
      width: _kThumbSize,
      height: _kThumbSize,
      child: Stack(
        children: [
          Material(
            color: colors.surface,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: isError ? onRetry : null,
              child: Center(
                child: isError
                    ? Icon(Icons.refresh, color: colors.error)
                    : SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          value: draft.progress > 0 ? draft.progress : null,
                        ),
                      ),
              ),
            ),
          ),
          if (isError)
            Positioned(
              top: 2,
              right: 2,
              child: _ThumbActionButton(icon: Icons.close, onTap: onDismiss),
            ),
        ],
      ),
    );
  }
}

class _AddPhotoTile extends StatelessWidget {
  const _AddPhotoTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return SizedBox(
      width: _kThumbSize,
      height: _kThumbSize,
      child: Material(
        color: colors.background,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Center(
            child: Icon(
              Icons.add_a_photo_outlined,
              color: colors.primary,
              semanticLabel: context.l10n.checklistPhotoAdd,
            ),
          ),
        ),
      ),
    );
  }
}

class _ThumbActionButton extends StatelessWidget {
  const _ThumbActionButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.55),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(icon, size: 14, color: Colors.white),
        ),
      ),
    );
  }
}

Future<bool?> _confirmDeletePhoto(BuildContext context) {
  final l10n = context.l10n;
  return showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(l10n.checklistPhotoDeleteConfirmTitle),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(
            l10n.checklistPhotoDelete,
            style: TextStyle(color: context.appColors.error),
          ),
        ),
      ],
    ),
  );
}
