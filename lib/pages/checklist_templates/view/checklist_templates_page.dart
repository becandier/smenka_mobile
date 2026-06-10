import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/checklist_templates/cubit/checklist_templates_cubit.dart';
import 'package:smenka_mobile/pages/checklist_templates/cubit/checklist_templates_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_template_tile.dart';
part '../widgets/_create_template_sheet.dart';

@RoutePage()
class ChecklistTemplatesPage extends StatelessWidget {
  const ChecklistTemplatesPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChecklistTemplatesCubit(
        orgId: orgId,
        checklistRepository: context.read<ChecklistRepository>(),
      ),
      child: const _TemplatesView(),
    );
  }
}

class _TemplatesView extends StatelessWidget {
  const _TemplatesView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.checklistTemplatesTitle),
        centerTitle: true,
        actions: [
          BlocBuilder<ChecklistTemplatesCubit, ChecklistTemplatesState>(
            buildWhen: (p, c) => p.includeArchived != c.includeArchived,
            builder: (context, state) {
              return IconButton(
                tooltip: l10n.checklistTemplateShowArchived,
                icon: Icon(
                  state.includeArchived
                      ? Icons.inventory_2
                      : Icons.inventory_2_outlined,
                ),
                onPressed: () => context
                    .read<ChecklistTemplatesCubit>()
                    .toggleShowArchived(),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreate(context),
        child: const Icon(Icons.add),
      ),
      body: SectionDataWrapper<ChecklistTemplatesCubit, ChecklistTemplatesState,
          List<ChecklistTemplate>>(
        selector: (state) => state.templates,
        onRetry: () => context.read<ChecklistTemplatesCubit>().loadTemplates(),
        contentBuilder: (templates) {
          if (templates.isEmpty) {
            return AppEmptyState(
              icon: Icons.checklist,
              title: l10n.checklistTemplatesEmpty,
              actionLabel: l10n.checklistTemplatesAdd,
              onAction: () => _openCreate(context),
            );
          }

          final startItems = templates
              .where((t) => t.type == ChecklistType.shiftStart)
              .toList();
          final endItems =
              templates.where((t) => t.type == ChecklistType.shiftEnd).toList();

          return RefreshIndicator.adaptive(
            onRefresh: () =>
                context.read<ChecklistTemplatesCubit>().loadTemplates(),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (startItems.isNotEmpty) ...[
                  _SectionHeader(text: l10n.checklistTemplatesShiftStart),
                  ...startItems.map((t) => _TemplateTile(template: t)),
                  const SizedBox(height: 16),
                ],
                if (endItems.isNotEmpty) ...[
                  _SectionHeader(text: l10n.checklistTemplatesShiftEnd),
                  ...endItems.map((t) => _TemplateTile(template: t)),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _openCreate(BuildContext context) {
    final cubit = context.read<ChecklistTemplatesCubit>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: const _CreateTemplateSheet(),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
