part of '../view/checklist_fill_page.dart';

class _FillItemTile extends StatefulWidget {
  const _FillItemTile({required this.item});

  final ChecklistInstanceItem item;

  @override
  State<_FillItemTile> createState() => _FillItemTileState();
}

class _FillItemTileState extends State<_FillItemTile> {
  late final TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController(text: widget.item.comment ?? '');
  }

  @override
  void didUpdateWidget(covariant _FillItemTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newComment = widget.item.comment ?? '';
    if (_commentController.text != newComment) {
      // Avoid overwriting while user is typing — only sync when server
      // data differs and controller text doesn't match any pending edit.
      if (_commentController.text == (oldWidget.item.comment ?? '')) {
        _commentController.text = newComment;
      }
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final status = context.select<ChecklistFillCubit, FeatureStatus?>(
      (cubit) => cubit.state.itemStatuses[widget.item.id],
    );
    final readOnly = context.select<ChecklistFillCubit, bool>(
      (cubit) => cubit.state.readOnly,
    );

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: widget.item.isCompleted,
                  onChanged: readOnly
                      ? null
                      : (_) => context.read<ChecklistFillCubit>().toggleItem(
                          widget.item,
                        ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.item.text, style: textTheme.bodyMedium),
                        if (widget.item.isRequired)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              l10n.shiftChecklistRequiredBadge,
                              style: textTheme.labelSmall?.copyWith(
                                color: appColors.error,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (status == FeatureStatus.loading)
                  const Padding(
                    padding: EdgeInsets.only(top: 14, right: 6),
                    child: SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator.adaptive(
                        strokeWidth: 1.6,
                      ),
                    ),
                  ),
              ],
            ),
            if (!readOnly)
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 4, top: 8),
                child: Material(
                  color: appColors.background,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    controller: _commentController,
                    style: textTheme.bodyMedium,
                    minLines: 3,
                    maxLines: 8,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: l10n.checklistFillCommentHint,
                      hintStyle: textTheme.bodyMedium?.copyWith(
                        color: appColors.secondary.withValues(alpha: 0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: appColors.secondary.withValues(alpha: 0.2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: appColors.secondary.withValues(alpha: 0.2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: appColors.primary),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<ChecklistFillCubit>().scheduleCommentUpdate(
                        widget.item,
                        value.isEmpty ? null : value,
                      );
                    },
                  ),
                ),
              )
            else if ((widget.item.comment ?? '').isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 4, top: 8),
                child: Text(
                  widget.item.comment ?? '',
                  style: textTheme.bodyMedium?.copyWith(
                    color: appColors.secondary,
                  ),
                ),
              ),
            _ItemPhotosSection(item: widget.item),
          ],
        ),
      ),
    );
  }
}
