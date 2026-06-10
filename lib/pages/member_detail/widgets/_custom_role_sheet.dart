part of '../view/member_detail_page.dart';

class _CustomRoleSheet extends StatefulWidget {
  const _CustomRoleSheet();

  @override
  State<_CustomRoleSheet> createState() => _CustomRoleSheetState();
}

class _CustomRoleSheetState extends State<_CustomRoleSheet> {
  String? _selectedId;
  bool _submitting = false;
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    return BlocBuilder<MemberDetailCubit, MemberDetailState>(
      buildWhen: (p, c) =>
          p.availableRoles.data != c.availableRoles.data ||
          p.availableRoles.isLoading != c.availableRoles.isLoading,
      builder: (context, state) {
        if (!_initialized) {
          _selectedId = state.member.customRole?.id;
          _initialized = true;
        }

        final roles = state.availableRoles.data ?? const <OrganizationRole>[];

        return AppBottomSheet(
          title: l10n.membersAssignRoleTitle,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.availableRoles.isLoading && roles.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                )
              else
                RadioGroup<String?>(
                  groupValue: _selectedId,
                  onChanged: (v) => setState(() => _selectedId = v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RadioListTile<String?>(
                        value: null,
                        enabled: !_submitting,
                        title: Text(l10n.membersCustomRoleNone),
                      ),
                      if (roles.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            l10n.rolesEmpty,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: appColors.secondary),
                          ),
                        )
                      else
                        ...roles.map(
                          (role) => RadioListTile<String?>(
                            value: role.id,
                            enabled: !_submitting,
                            title: Text(role.name),
                          ),
                        ),
                    ],
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
      },
    );
  }

  Future<void> _submit() async {
    final cubit = context.read<MemberDetailCubit>();
    final initialId = cubit.state.member.customRole?.id;
    if (_selectedId == initialId) {
      Navigator.of(context).pop();
      return;
    }

    setState(() => _submitting = true);
    final l10n = context.l10n;
    final ok = await cubit.assignCustomRole(_selectedId);

    if (!mounted) return;
    setState(() => _submitting = false);

    if (ok) {
      Navigator.of(context).pop();
      context.modals.showSuccess(
        _selectedId == null
            ? l10n.membersCustomRoleCleared
            : l10n.membersCustomRoleAssigned,
      );
    }
  }
}
