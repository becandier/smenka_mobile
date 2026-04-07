import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_cubit.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_org_list_card.dart';

@RoutePage()
class OrganizationsPage extends StatelessWidget {
  const OrganizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.organizationsTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: l10n.organizationsJoin,
            onPressed: () => context.router.push(const JoinOrgRoute()),
          ),
        ],
      ),
      floatingActionButton: BlocSelector<OrganizationsCubit,
          OrganizationsState, SectionData<User>>(
        selector: (state) => state.currentUser,
        builder: (context, userSection) {
          final user = userSection.data;
          if (user == null || user.role != UserRole.superAdmin) {
            return const SizedBox.shrink();
          }
          return FloatingActionButton.extended(
            onPressed: () => context.router.push(const CreateOrgRoute()),
            icon: const Icon(Icons.add),
            label: Text(l10n.organizationsCreate),
          );
        },
      ),
      body: SectionDataWrapper<OrganizationsCubit, OrganizationsState,
          List<Organization>>(
        selector: (state) => state.organizations,
        onRetry: () => context.read<OrganizationsCubit>().loadOrganizations(),
        contentBuilder: (orgs) {
          if (orgs.isEmpty) {
            return AppEmptyState(
              icon: Icons.business_outlined,
              title: l10n.organizationsEmpty,
              actionLabel: l10n.organizationsJoinByCode,
              onAction: () => context.router.push(const JoinOrgRoute()),
            );
          }

          return RefreshIndicator.adaptive(
            onRefresh: () =>
                context.read<OrganizationsCubit>().loadOrganizations(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: orgs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return _OrgListCard(organization: orgs[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
