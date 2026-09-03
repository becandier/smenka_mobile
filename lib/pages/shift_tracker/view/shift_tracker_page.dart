import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/core/utils/duration_format.dart';
import 'package:smenka_mobile/core/utils/org_timezone.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/api/local/work_schedule_context_storage.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/repositories/work_schedule_repository.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/personal_shift_confirm/view/personal_shift_confirm_page.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_cubit.dart';
import 'package:smenka_mobile/pages/shift_tracker/cubit/shift_tracker_state.dart';
import 'package:smenka_mobile/pages/work_location_picker/view/work_location_picker_page.dart';
import 'package:smenka_mobile/pages/work_schedule_picker/view/work_schedule_picker_page.dart';
import 'package:smenka_mobile/widgets/app_button.dart';
import 'package:smenka_mobile/widgets/app_shimmer_loader.dart';
import 'package:smenka_mobile/widgets/geo/geo_permission_dialogs.dart';
import 'package:smenka_mobile/widgets/notification_bell_button.dart';
import 'package:smenka_mobile/widgets/pwa_install_button.dart';

part '../widgets/idle_shift_content.dart';
part '../widgets/active_shift_content.dart';
part '../widgets/org_selector.dart';
part '../widgets/work_location_selector.dart';
part '../widgets/work_schedule_selector.dart';
part '../widgets/pause_list.dart';
part '../widgets/shift_checklists_tile.dart';
part '../widgets/shift_connectivity_bars.dart';

@RoutePage()
class ShiftTrackerPage extends StatelessWidget {
  const ShiftTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShiftTrackerCubit(
        shiftRepository: context.read<ShiftRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
        workScheduleRepository: context.read<WorkScheduleRepository>(),
        checklistRepository: context.read<ChecklistRepository>(),
        geoService: GeoService(),
        contextStorage: context.read<ShiftContextStorage>(),
        scheduleContextStorage: WorkScheduleContextStorage(
          prefs: context.read<SharedPreferences>(),
        ),
      ),
      child: const _ShiftTrackerView(),
    );
  }
}

class _ShiftTrackerView extends StatefulWidget {
  const _ShiftTrackerView();

  @override
  State<_ShiftTrackerView> createState() => _ShiftTrackerViewState();
}

class _ShiftTrackerViewState extends State<_ShiftTrackerView>
    with WidgetsBindingObserver, AutoRouteAwareStateMixin<_ShiftTrackerView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycle) {
    // Возврат на передний план → сразу сверяем активную смену с сервером
    // (мог сработать авто-финиш, пока приложение было свёрнуто).
    if (lifecycle == AppLifecycleState.resumed) {
      context.read<ShiftTrackerCubit>().onAppResumed();
    }
  }

  // Возврат на таб «Смена» после переключения на другой таб — список
  // графиков мог устареть, пока тикер idle-экрана не работал в фоне
  // (schedule_window_enforcement/mobile.md, п.2).
  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    context.read<ShiftTrackerCubit>().onScreenVisible();
  }

  Widget _buildContent(ShiftTrackerState state) {
    if (state.activeShift.isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (state.hasActiveShift) {
      return _ActiveShiftContent(state: state);
    }
    return _IdleShiftContent(state: state);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ShiftTrackerCubit, ShiftTrackerState>(
          listenWhen: (prev, curr) =>
              !prev.shiftAutoFinished && curr.shiftAutoFinished,
          listener: (context, state) {
            context.modals.showInfo(context.l10n.shiftAutoFinishedNotice);
            context.read<ShiftTrackerCubit>().clearAutoFinishedNotice();
          },
        ),
        BlocListener<ShiftTrackerCubit, ShiftTrackerState>(
          listenWhen: (prev, curr) => prev.actionStatus != curr.actionStatus,
          listener: (context, state) {
            // Сетевые ошибки показываем не тостом, а постоянной плашкой
            // с кнопкой «Повторить» (см. _ShiftActionErrorBar) — тост бы
            // исчез и пользователь потерял бы возможность ретрая.
            if (state.actionStatus == FeatureStatus.error &&
                !state.isActionNetworkError) {
              context.modals.showError(
                localizedErrorMessage(
                  context,
                  code: state.actionErrorCode,
                  fallback: state.actionError,
                ),
              );
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
          // «Установить приложение» (pwa_install_promo) — постоянная точка
          // входа; сама скрывается вне web / в standalone / после установки.
          actions: const [PwaInstallButton(), NotificationBellButton()],
        ),
        body: SafeArea(
          child: BlocBuilder<ShiftTrackerCubit, ShiftTrackerState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.isOffline) const _OfflineBanner(),
                  Expanded(
                    child: RefreshIndicator.adaptive(
                      onRefresh: () =>
                          context.read<ShiftTrackerCubit>().refresh(),
                      child: _buildContent(state),
                    ),
                  ),
                  if (state.hasActionError && state.isActionNetworkError)
                    _ShiftActionErrorBar(state: state),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
