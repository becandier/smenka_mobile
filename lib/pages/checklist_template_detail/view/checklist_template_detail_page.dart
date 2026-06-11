import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/checklist_template_detail/cubit/checklist_template_detail_cubit.dart';
import 'package:smenka_mobile/pages/checklist_template_detail/cubit/checklist_template_detail_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_assign_roles_sheet.dart';
part '../widgets/_assignments_section.dart';
part '../widgets/_header_section.dart';
part '../widgets/_item_editor_sheet.dart';
part '../widgets/_items_section.dart';
part '../widgets/_rename_template_sheet.dart';
part '../widgets/_roles_section.dart';

@RoutePage()
class ChecklistTemplateDetailPage extends StatelessWidget {
  const ChecklistTemplateDetailPage({
    @pathParam required this.orgId,
    @pathParam required this.templateId,
    super.key,
  });

  final String orgId;
  final String templateId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChecklistTemplateDetailCubit(
        orgId: orgId,
        templateId: templateId,
        checklistRepository: context.read<ChecklistRepository>(),
        roleRepository: context.read<OrganizationRoleRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _TemplateDetailView(),
    );
  }
}

class _TemplateDetailView extends StatelessWidget {
  const _TemplateDetailView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.checklistTemplateDetailTitle),
        centerTitle: true,
        actions: [
          BlocBuilder<
            ChecklistTemplateDetailCubit,
            ChecklistTemplateDetailState
          >(
            buildWhen: (p, c) =>
                p.template.data?.isArchived != c.template.data?.isArchived,
            builder: (context, state) {
              final detail = state.template.data;
              if (detail == null || detail.isArchived) {
                return const SizedBox.shrink();
              }
              return IconButton(
                tooltip: l10n.checklistTemplateArchive,
                icon: const Icon(Icons.archive_outlined),
                onPressed: () => _confirmArchive(context, detail.name),
              );
            },
          ),
        ],
      ),
      body:
          SectionDataWrapper<
            ChecklistTemplateDetailCubit,
            ChecklistTemplateDetailState,
            ChecklistTemplateDetail
          >(
            selector: (state) => state.template,
            onRetry: () =>
                context.read<ChecklistTemplateDetailCubit>().loadTemplate(),
            contentBuilder: (detail) => RefreshIndicator.adaptive(
              onRefresh: () =>
                  context.read<ChecklistTemplateDetailCubit>().loadTemplate(),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _HeaderSection(detail: detail),
                  const SizedBox(height: 16),
                  _ItemsSection(detail: detail),
                  const SizedBox(height: 16),
                  const _RolesSection(),
                  const SizedBox(height: 16),
                  const _AssignmentsSection(),
                ],
              ),
            ),
          ),
    );
  }

  Future<void> _confirmArchive(BuildContext context, String name) async {
    final l10n = context.l10n;
    final cubit = context.read<ChecklistTemplateDetailCubit>();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.checklistTemplateArchive),
        content: Text(l10n.checklistTemplateArchiveConfirm(name)),
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

    final ok = await cubit.archiveTemplate();
    if (ok && context.mounted) {
      context.modals.showSuccess(l10n.checklistTemplateArchived);
      await context.router.maybePop();
    }
  }
}
