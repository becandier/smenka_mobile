import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/shift_checklists/cubit/shift_checklists_cubit.dart';
import 'package:smenka_mobile/pages/shift_checklists/cubit/shift_checklists_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_instance_tile.dart';

@RoutePage()
class ShiftChecklistsPage extends StatelessWidget {
  const ShiftChecklistsPage({
    @pathParam required this.shiftId,
    super.key,
  });

  final String shiftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShiftChecklistsCubit(
        shiftId: shiftId,
        checklistRepository: context.read<ChecklistRepository>(),
      ),
      child: const _ShiftChecklistsView(),
    );
  }
}

class _ShiftChecklistsView extends StatelessWidget {
  const _ShiftChecklistsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.shiftChecklistsTitle),
        centerTitle: true,
      ),
      body: SectionDataWrapper<ShiftChecklistsCubit, ShiftChecklistsState,
          List<ChecklistInstance>>(
        selector: (state) => state.instances,
        onRetry: () => context.read<ShiftChecklistsCubit>().loadChecklists(),
        contentBuilder: (items) {
          if (items.isEmpty) {
            return AppEmptyState(
              icon: Icons.checklist,
              title: l10n.shiftChecklistsEmpty,
            );
          }

          final start = items
              .where((i) => i.type == ChecklistType.shiftStart)
              .toList();
          final end = items
              .where((i) => i.type == ChecklistType.shiftEnd)
              .toList();

          return RefreshIndicator.adaptive(
            onRefresh: () =>
                context.read<ShiftChecklistsCubit>().loadChecklists(),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (start.isNotEmpty) ...[
                  _SectionHeader(text: l10n.shiftChecklistsStartGroup),
                  ...start.map((i) => _InstanceTile(instance: i)),
                  const SizedBox(height: 16),
                ],
                if (end.isNotEmpty) ...[
                  _SectionHeader(text: l10n.shiftChecklistsEndGroup),
                  ...end.map((i) => _InstanceTile(instance: i)),
                ],
              ],
            ),
          );
        },
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
