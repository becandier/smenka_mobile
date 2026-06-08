part of '../view/checklist_template_detail_page.dart';

class _AssignRolesSheet extends StatefulWidget {
  const _AssignRolesSheet({required this.initialSelected});

  final Set<String> initialSelected;

  @override
  State<_AssignRolesSheet> createState() => _AssignRolesSheetState();
}

class _AssignRolesSheetState extends State<_AssignRolesSheet> {
  late Set<String> _selected;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _selected = {...widget.initialSelected};
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final roles =
        context.read<ChecklistTemplateDetailCubit>().state.roles.data ??
            const <OrganizationRole>[];

    return AppBottomSheet(
      title: l10n.checklistTemplateAssignRoles,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (roles.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.rolesEmpty,
                textAlign: TextAlign.center,
                style: TextStyle(color: context.appColors.secondary),
              ),
            )
          else
            ...roles.map(
              (role) => CheckboxListTile(
                value: _selected.contains(role.id),
                onChanged: _submitting
                    ? null
                    : (v) {
                        setState(() {
                          if (v ?? false) {
                            _selected.add(role.id);
                          } else {
                            _selected.remove(role.id);
                          }
                        });
                      },
                title: Text(role.name),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          const SizedBox(height: 12),
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
    setState(() => _submitting = true);
    final cubit = context.read<ChecklistTemplateDetailCubit>();
    final l10n = context.l10n;

    final ok = await cubit.assignToRoles(_selected.toList());

    if (!mounted) return;
    setState(() => _submitting = false);

    if (ok) {
      Navigator.of(context).pop();
      context.modals.showSuccess(l10n.checklistTemplateRolesAssigned);
    }
  }
}
