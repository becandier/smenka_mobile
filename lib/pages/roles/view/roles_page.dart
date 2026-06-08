import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/roles/cubit/roles_cubit.dart';
import 'package:smenka_mobile/pages/roles/cubit/roles_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_role_tile.dart';
part '../widgets/_role_editor_sheet.dart';

@RoutePage()
class RolesPage extends StatelessWidget {
  const RolesPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RolesCubit(
        orgId: orgId,
        roleRepository: context.read<OrganizationRoleRepository>(),
      ),
      child: const _RolesView(),
    );
  }
}

class _RolesView extends StatelessWidget {
  const _RolesView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.rolesTitle),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreate(context),
        child: const Icon(Icons.add),
      ),
      body: SectionDataWrapper<RolesCubit, RolesState, List<OrganizationRole>>(
        selector: (state) => state.roles,
        onRetry: () => context.read<RolesCubit>().loadRoles(),
        contentBuilder: (roles) {
          if (roles.isEmpty) {
            return AppEmptyState(
              icon: Icons.badge_outlined,
              title: l10n.rolesEmpty,
              actionLabel: l10n.rolesAdd,
              onAction: () => _openCreate(context),
            );
          }

          return RefreshIndicator.adaptive(
            onRefresh: () => context.read<RolesCubit>().loadRoles(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: roles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  _RoleTile(role: roles[index]),
            ),
          );
        },
      ),
    );
  }

  void _openCreate(BuildContext context) {
    final cubit = context.read<RolesCubit>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const _RoleEditorSheet(role: null),
      ),
    );
  }
}
