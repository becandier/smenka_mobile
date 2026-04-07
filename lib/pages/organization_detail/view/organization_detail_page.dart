import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/pages/organization_detail/cubit/organization_detail_cubit.dart';
import 'package:smenka_mobile/pages/organization_detail/cubit/organization_detail_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_org_header.dart';
part '../widgets/_org_members_section.dart';
part '../widgets/_org_invite_section.dart';
part '../widgets/_org_actions_section.dart';

@RoutePage()
class OrganizationDetailPage extends StatelessWidget {
  const OrganizationDetailPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrganizationDetailCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
        userRepository: context.read<UserRepository>(),
      ),
      child: const _OrganizationDetailView(),
    );
  }
}

class _OrganizationDetailView extends StatelessWidget {
  const _OrganizationDetailView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orgDetailTitle),
        centerTitle: true,
      ),
      body: SectionDataWrapper<OrganizationDetailCubit,
          OrganizationDetailState, Organization>(
        selector: (state) => state.organization,
        onRetry: () => context.read<OrganizationDetailCubit>().refresh(),
        contentBuilder: (org) {
          final cubit = context.read<OrganizationDetailCubit>();
          final isOwner = org.ownerId == cubit.currentUserId;

          return RefreshIndicator.adaptive(
            onRefresh: () =>
                context.read<OrganizationDetailCubit>().refresh(),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 32),
              children: [
                _OrgHeader(organization: org),
                const SizedBox(height: 24),
                const _OrgMembersSection(),
                const SizedBox(height: 24),
                if (isOwner) ...[
                  _OrgInviteSection(organization: org),
                  const SizedBox(height: 24),
                ],
                _OrgActionsSection(organization: org),
              ],
            ),
          );
        },
      ),
    );
  }
}
