import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/shift_detail/cubit/shift_detail_cubit.dart';
import 'package:smenka_mobile/pages/shift_detail/cubit/shift_detail_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/detail_info_section.dart';
part '../widgets/detail_checklists_section.dart';
part '../widgets/overtime_section.dart';

@RoutePage()
class ShiftDetailPage extends StatelessWidget {
  const ShiftDetailPage({required this.shift, super.key});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShiftDetailCubit(
        shift: shift,
        shiftRepository: context.read<ShiftRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _ShiftDetailView(),
    );
  }
}

class _ShiftDetailView extends StatelessWidget {
  const _ShiftDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftDetailCubit, ShiftDetailState>(
      listenWhen: (prev, curr) => prev.actionStatus != curr.actionStatus,
      listener: (context, state) {
        if (state.actionStatus == FeatureStatus.error) {
          context.modals.showError(
            localizedErrorMessage(
              context,
              code: state.actionErrorCode,
              fallback: state.actionError,
            ),
          );
        }
      },
      child: BlocBuilder<ShiftDetailCubit, ShiftDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.l10n.detailTitle),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _DetailInfoSection(
                  shift: state.shift,
                  organization: state.organization.data,
                ),
                if (state.shift.organizationId != null) ...[
                  const SizedBox(height: 24),
                  _DetailChecklistsSection(shift: state.shift),
                ],
                if (state.shift.status == ShiftStatus.finished &&
                    state.shift.scheduledEndAt != null) ...[
                  const SizedBox(height: 24),
                  _OvertimeSection(state: state),
                ],
                const SizedBox(height: 24),
                ShiftPauseList(pauses: state.shift.pauses),
              ],
            ),
          );
        },
      ),
    );
  }
}
