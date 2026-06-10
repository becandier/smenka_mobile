import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_cubit.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_state.dart';
import 'package:smenka_mobile/widgets/app_button.dart';

part '../widgets/idle_shift_content.dart';
part '../widgets/active_shift_content.dart';
part '../widgets/org_selector.dart';
part '../widgets/pause_list.dart';
part '../widgets/shift_checklists_tile.dart';

@RoutePage()
class ShiftTrackerPage extends StatelessWidget {
  const ShiftTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShiftTrackerCubit(
        shiftRepository: context.read<ShiftRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
        geoService: GeoService(),
        contextStorage: context.read<ShiftContextStorage>(),
      ),
      child: const _ShiftTrackerView(),
    );
  }
}

class _ShiftTrackerView extends StatelessWidget {
  const _ShiftTrackerView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ShiftTrackerCubit, ShiftTrackerState>(
          listenWhen: (prev, curr) => prev.actionStatus != curr.actionStatus,
          listener: (context, state) {
            if (state.actionStatus == FeatureStatus.error) {
              final error = state.actionError;
              if (error != null) {
                context.modals.showError(error);
              }
            }
          },
        ),
        BlocListener<ShiftTrackerCubit, ShiftTrackerState>(
          listenWhen: (prev, curr) =>
              !prev.showLowAccuracyWarning && curr.showLowAccuracyWarning,
          listener: (context, state) {
            context.modals.showWarning(context.l10n.geoLowAccuracy);
            context.read<ShiftTrackerCubit>().clearLowAccuracyWarning();
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.shiftTracker),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<ShiftTrackerCubit, ShiftTrackerState>(
            builder: (context, state) {
              if (state.activeShift.isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state.hasActiveShift) {
                return _ActiveShiftContent(state: state);
              }
              return _IdleShiftContent(state: state);
            },
          ),
        ),
      ),
    );
  }
}
