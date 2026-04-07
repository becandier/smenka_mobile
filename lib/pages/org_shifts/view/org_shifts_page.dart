import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/org_shifts/cubit/org_shifts_cubit.dart';
import 'package:smenka_mobile/pages/org_shifts/cubit/org_shifts_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_org_shift_card.dart';
part '../widgets/_org_shifts_filters.dart';

@RoutePage()
class OrgShiftsPage extends StatelessWidget {
  const OrgShiftsPage({
    @pathParam required this.orgId,
    super.key,
  });

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrgShiftsCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _OrgShiftsView(),
    );
  }
}

class _OrgShiftsView extends StatelessWidget {
  const _OrgShiftsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orgShiftsTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const _OrgShiftsFilters(),
          Expanded(
            child:
                PaginatedSectionDataList<OrgShiftsCubit, OrgShiftsState, Shift>(
              selector: (state) => state.shifts,
              itemBuilder: (context, shift, index) =>
                  _OrgShiftCard(shift: shift),
              onLoadMore: () => context
                  .read<OrgShiftsCubit>()
                  .loadShifts(isRefresh: false),
              onRefresh: () => context.read<OrgShiftsCubit>().loadShifts(),
              emptyBuilder: () => AppEmptyState(
                icon: Icons.work_history_outlined,
                title: l10n.orgShiftsEmpty,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
