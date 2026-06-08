import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_cubit.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_header_section.dart';
part '../widgets/_system_role_section.dart';
part '../widgets/_custom_role_section.dart';
part '../widgets/_effective_section.dart';
part '../widgets/_overrides_section.dart';
part '../widgets/_custom_role_sheet.dart';

@RoutePage()
class MemberDetailPage extends StatelessWidget {
  const MemberDetailPage({
    required this.orgId,
    required this.member,
    super.key,
  });

  final String orgId;
  final Member member;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MemberDetailCubit(
        orgId: orgId,
        member: member,
        organizationRepository: context.read<OrganizationRepository>(),
        roleRepository: context.read<OrganizationRoleRepository>(),
        checklistRepository: context.read<ChecklistRepository>(),
      ),
      child: const _MemberDetailView(),
    );
  }
}

class _MemberDetailView extends StatelessWidget {
  const _MemberDetailView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<MemberDetailCubit, MemberDetailState>(
      listenWhen: (p, c) =>
          p.actionStatus != c.actionStatus &&
          c.actionStatus == FeatureStatus.error,
      listener: (context, state) {
        final error = state.actionError;
        if (error != null) context.modals.showError(error);
      },
      child: BlocSelector<MemberDetailCubit, MemberDetailState, bool>(
        selector: (state) => state.canManage,
        builder: (context, canManage) {
          return Scaffold(
            appBar: AppBar(
              title: Text(l10n.memberDetailTitle),
              centerTitle: true,
              actions: [
                if (canManage)
                  IconButton(
                    tooltip: l10n.membersRemove,
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _confirmRemove(context),
                  ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const _HeaderSection(),
                if (canManage) ...const [
                  SizedBox(height: 16),
                  _SystemRoleSection(),
                  SizedBox(height: 16),
                  _CustomRoleSection(),
                  SizedBox(height: 16),
                  _EffectiveSection(),
                  SizedBox(height: 16),
                  _OverridesSection(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _confirmRemove(BuildContext context) async {
    final l10n = context.l10n;
    final cubit = context.read<MemberDetailCubit>();
    final name = cubit.state.member.userName;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.membersRemove),
        content: Text(l10n.membersRemoveConfirm(name)),
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

    if (confirmed != true || !context.mounted) return;

    final ok = await cubit.removeMember();
    if (ok && context.mounted) {
      context.modals.showSuccess(l10n.membersRemoved);
      await context.router.maybePop();
    }
  }
}
