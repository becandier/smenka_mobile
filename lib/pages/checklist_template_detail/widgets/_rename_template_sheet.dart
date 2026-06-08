part of '../view/checklist_template_detail_page.dart';

class _RenameTemplateSheet extends StatefulWidget {
  const _RenameTemplateSheet({required this.initial});

  final String initial;

  @override
  State<_RenameTemplateSheet> createState() => _RenameTemplateSheetState();
}

class _RenameTemplateSheetState extends State<_RenameTemplateSheet> {
  late final TextEditingController _controller;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initial);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.rolesRename,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _controller,
            label: l10n.checklistTemplateNameLabel,
            hint: l10n.checklistTemplateNameHint,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          AppButton(
            label: l10n.rolesSaveAction,
            isLoading: _submitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    setState(() => _submitting = true);
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final l10n = context.l10n;
    final ok = await cubit.updateMeta(name: name);

    if (!mounted) return;
    setState(() => _submitting = false);

    if (ok) {
      Navigator.of(context).pop();
      context.modals.showSuccess(l10n.checklistTemplateUpdated);
    }
  }
}
