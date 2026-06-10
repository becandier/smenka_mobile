part of '../view/checklist_templates_page.dart';

class _CreateTemplateSheet extends StatefulWidget {
  const _CreateTemplateSheet();

  @override
  State<_CreateTemplateSheet> createState() => _CreateTemplateSheetState();
}

class _CreateTemplateSheetState extends State<_CreateTemplateSheet> {
  final TextEditingController _name = TextEditingController();
  ChecklistType _type = ChecklistType.shiftStart;
  bool _isRequired = false;
  bool _submitting = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.checklistTemplatesCreate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _name,
            label: l10n.checklistTemplateNameLabel,
            hint: l10n.checklistTemplateNameHint,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.checklistTemplateTypeLabel,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 6),
          SegmentedButton<ChecklistType>(
            segments: [
              ButtonSegment(
                value: ChecklistType.shiftStart,
                label: Text(l10n.checklistTemplatesShiftStart),
              ),
              ButtonSegment(
                value: ChecklistType.shiftEnd,
                label: Text(l10n.checklistTemplatesShiftEnd),
              ),
            ],
            selected: {_type},
            onSelectionChanged:
                _submitting ? null : (s) => setState(() => _type = s.first),
          ),
          const SizedBox(height: 12),
          SwitchListTile.adaptive(
            value: _isRequired,
            onChanged:
                _submitting ? null : (v) => setState(() => _isRequired = v),
            title: Text(l10n.checklistTemplateIsRequiredLabel),
            subtitle: Text(l10n.checklistTemplateIsRequiredDesc),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 12),
          AppButton(
            label: l10n.rolesCreateAction,
            isLoading: _submitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final name = _name.text.trim();
    if (name.isEmpty) return;

    setState(() => _submitting = true);
    final cubit = context.read<ChecklistTemplatesCubit>();
    final router = context.router;
    final l10n = context.l10n;

    final template = await cubit.createTemplate(
      name: name,
      type: _type,
      isRequired: _isRequired,
    );

    if (!mounted) return;
    setState(() => _submitting = false);

    if (template != null) {
      Navigator.of(context).pop();
      context.modals.showSuccess(l10n.checklistTemplateCreated);
      await router.push(
        ChecklistTemplateDetailRoute(
          orgId: cubit.orgId,
          templateId: template.id,
        ),
      );
    }
  }
}
