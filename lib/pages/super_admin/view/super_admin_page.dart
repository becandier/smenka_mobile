import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/super_admin/cubit/super_admin_cubit.dart';
import 'package:smenka_mobile/pages/super_admin/cubit/super_admin_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_admin_org_card.dart';

@RoutePage()
class SuperAdminPage extends StatelessWidget {
  const SuperAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SuperAdminCubit(
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _SuperAdminView(),
    );
  }
}

class _SuperAdminView extends StatelessWidget {
  const _SuperAdminView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.superAdminTitle),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final created =
              await context.router.push<bool>(const CreateOrgRoute());
          if ((created ?? false) && context.mounted) {
            await context.read<SuperAdminCubit>().loadOrganizations();
          }
        },
        icon: const Icon(Icons.add),
        label: Text(l10n.organizationsCreate),
      ),
      body: SectionDataWrapper<SuperAdminCubit, SuperAdminState,
          List<Organization>>(
        selector: (state) => state.organizations,
        onRetry: () => context.read<SuperAdminCubit>().loadOrganizations(),
        contentBuilder: (orgs) {
          if (orgs.isEmpty) {
            return AppEmptyState(
              icon: Icons.business_outlined,
              title: l10n.superAdminEmpty,
            );
          }

          return RefreshIndicator.adaptive(
            onRefresh: () =>
                context.read<SuperAdminCubit>().loadOrganizations(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: orgs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return _AdminOrgCard(organization: orgs[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
