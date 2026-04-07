import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/members/cubit/members_cubit.dart';
import 'package:smenka_mobile/pages/members/cubit/members_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_member_tile.dart';

@RoutePage(name: 'OrgMembersRoute')
class MembersPage extends StatelessWidget {
  const MembersPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MembersCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
        userRepository: context.read<UserRepository>(),
      ),
      child: const _MembersView(),
    );
  }
}

class _MembersView extends StatelessWidget {
  const _MembersView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.membersTitle),
        centerTitle: true,
      ),
      body: SectionDataWrapper<MembersCubit, MembersState, List<Member>>(
        selector: (state) => state.members,
        onRetry: () => context.read<MembersCubit>().loadMembers(),
        contentBuilder: (members) {
          if (members.isEmpty) {
            return AppEmptyState(
              icon: Icons.people_outlined,
              title: l10n.membersEmpty,
            );
          }

          return RefreshIndicator.adaptive(
            onRefresh: () => context.read<MembersCubit>().loadMembers(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: members.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  _MemberTile(member: members[index]),
            ),
          );
        },
      ),
    );
  }
}
