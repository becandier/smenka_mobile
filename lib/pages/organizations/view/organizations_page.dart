import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
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
      body: SectionDataWrapper<OrganizationsCubit, OrganizationsState,
          List<Organization>>(
        selector: (state) => state.organizations,
        onRetry: () => context.read<OrganizationsCubit>().loadOrganizations(),
        contentBuilder: (orgs) {
          if (orgs.isEmpty) {
            return const _EmptyState();
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.business_outlined,
              size: 64,
              color: appColors.secondary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.organizationsEmpty,
              style: textTheme.bodyLarge?.copyWith(
                color: appColors.secondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppButton(
              onPressed: () =>
                  context.router.push(const JoinOrgRoute()),
              label: l10n.organizationsJoinByCode,
              isOutlined: true,
            ),
          ],
        ),
      ),
    );
  }
}
