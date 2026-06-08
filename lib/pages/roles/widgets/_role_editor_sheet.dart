part of '../view/roles_page.dart';

class _RoleEditorSheet extends StatefulWidget {
  const _RoleEditorSheet({required this.role});

  final OrganizationRole? role;

  @override
  State<_RoleEditorSheet> createState() => _RoleEditorSheetState();
}

class _RoleEditorSheetState extends State<_RoleEditorSheet> {
  late final TextEditingController _controller;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.role?.name ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEdit = widget.role != null;

    return AppBottomSheet(
      title: isEdit ? l10n.rolesRename : l10n.rolesCreate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _controller,
            label: l10n.rolesNameLabel,
            hint: l10n.rolesNameHint,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
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
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    final l10n = context.l10n;
    final cubit = context.read<RolesCubit>();
    setState(() => _submitting = true);

    final role = widget.role;
    final ok = role == null
        ? await cubit.createRole(name)
        : await cubit.updateRole(role.id, name);

    if (!mounted) return;
    setState(() => _submitting = false);

    if (ok) {
      Navigator.of(context).pop();
      context.modals.showSuccess(
        role == null ? l10n.rolesCreated : l10n.rolesRenamed,
      );
    }
  }
}
