part of '../view/checklist_template_detail_page.dart';

class _ItemEditorSheet extends StatefulWidget {
  const _ItemEditorSheet({required this.item});

  final ChecklistTemplateItem? item;

  @override
  State<_ItemEditorSheet> createState() => _ItemEditorSheetState();
}

class _ItemEditorSheetState extends State<_ItemEditorSheet> {
  late final TextEditingController _text;
  late bool _isRequired;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _text = TextEditingController(text: widget.item?.text ?? '');
    _isRequired = widget.item?.isRequired ?? false;
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEdit = widget.item != null;

    return AppBottomSheet(
      title: isEdit
          ? l10n.checklistTemplateItemUpdated
          : l10n.checklistTemplateItemAdd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _text,
            label: l10n.checklistTemplateItemTextLabel,
            hint: l10n.checklistTemplateItemTextHint,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 12),
          SwitchListTile.adaptive(
            value: _isRequired,
            onChanged: _submitting
                ? null
                : (v) => setState(() => _isRequired = v),
            title: Text(l10n.checklistTemplateItemRequiredLabel),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 12),
          AppButton(
            label: isEdit ? l10n.rolesSaveAction : l10n.rolesCreateAction,
            isLoading: _submitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final text = _text.text.trim();
    if (text.isEmpty) return;

    setState(() => _submitting = true);
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final l10n = context.l10n;

    final item = widget.item;
    final ok = item == null
        ? await cubit.addItem(text: text, isRequired: _isRequired)
        : await cubit.updateItem(item.id, text: text, isRequired: _isRequired);

    if (!mounted) return;
    setState(() => _submitting = false);

    if (ok) {
      Navigator.of(context).pop();
      context.modals.showSuccess(
        item == null
            ? l10n.checklistTemplateItemAdded
            : l10n.checklistTemplateItemUpdated,
      );
    }
  }
}
