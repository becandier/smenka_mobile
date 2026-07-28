import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_cubit.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_state.dart';
import 'package:smenka_mobile/pages/organizations/view/single_org_auto_open_guard.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_org_list_card.dart';

@RoutePage()
class OrganizationsPage extends StatefulWidget {
  const OrganizationsPage({super.key});

  @override
  State<OrganizationsPage> createState() => _OrganizationsPageState();
}

class _OrganizationsPageState extends State<OrganizationsPage> {
  final _autoOpenGuard = SingleOrgAutoOpenGuard();

  void _handleOrganizationsChanged(
    BuildContext context,
    OrganizationsState state,
  ) {
    final orgId = _autoOpenGuard.resolve(state.organizations);
    if (orgId == null) return;

    // Пушим после кадра построения, а не прямо из listener — на момент
    // эмита состояния текущий кадр может быть ещё не завершён.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.router.push(OrganizationDetailRoute(orgId: orgId));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.organizationsTitle),
        centerTitle: true,
        actions: [
          const NotificationBellButton(),
          IconButton(
            icon: const Icon(Icons.login),
            tooltip: l10n.organizationsJoin,
            onPressed: () => context.router.push(const JoinOrgRoute()),
          ),
        ],
      ),
      body: BlocListener<OrganizationsCubit, OrganizationsState>(
        listenWhen: (previous, current) =>
            previous.organizations != current.organizations,
        listener: _handleOrganizationsChanged,
        child:
            SectionDataWrapper<
              OrganizationsCubit,
              OrganizationsState,
              List<Organization>
            >(
              selector: (state) => state.organizations,
              onRetry: () =>
                  context.read<OrganizationsCubit>().loadOrganizations(),
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
      ),
    );
  }
}
