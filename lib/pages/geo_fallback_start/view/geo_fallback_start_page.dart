import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/repositories/work_schedule_repository.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/geo_fallback_start/cubit/geo_fallback_start_cubit.dart';
import 'package:smenka_mobile/pages/geo_fallback_start/cubit/geo_fallback_start_state.dart';
import 'package:smenka_mobile/pages/work_location_picker/view/work_location_picker_page.dart';
import 'package:smenka_mobile/pages/work_schedule_picker/view/work_schedule_picker_page.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_location_step.dart';
part '../widgets/_schedule_step.dart';
part '../widgets/_photo_step.dart';
part '../widgets/_camera_capture.dart';

/// Экран фолбэк-старта смены по фото (`shift_geo_photo_fallback`).
///
/// Открывается только из диалога финальной гео-неудачи на старте смены —
/// когда координаты получить не удалось. При серверном `GEO_CHECK_FAILED`
/// (координаты есть, сотрудник вне зоны) сюда попасть нельзя: это не сбой
/// гео, и обходить его фото запрещено.
///
/// Возвращает стартовавшую [Shift] через `pop` — трекер её принимает
/// (`ShiftTrackerCubit.adoptStartedShift`); `null` — сотрудник передумал.
@RoutePage()
class GeoFallbackStartPage extends StatelessWidget {
  const GeoFallbackStartPage({
    required this.organizationId,
    required this.geoFallbackReason,
    this.organizationTimezone = 'Europe/Moscow',
    super.key,
  });

  final String organizationId;

  /// Машинный код `GeoFailure`, приведшего в фолбэк — уходит на бэк как есть.
  final String geoFallbackReason;

  /// Таймзона организации — для показа планового времени графиков в модалке.
  final String organizationTimezone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GeoFallbackStartCubit(
        organizationId: organizationId,
        geoFallbackReason: geoFallbackReason,
        shiftRepository: context.read<ShiftRepository>(),
        workScheduleRepository: context.read<WorkScheduleRepository>(),
        filesRepository: context.read<FilesRepository>(),
        photoPicker: PhotoPickerService(),
      ),
      child: _GeoFallbackStartView(organizationTimezone: organizationTimezone),
    );
  }
}

class _GeoFallbackStartView extends StatelessWidget {
  const _GeoFallbackStartView({required this.organizationTimezone});

  final String organizationTimezone;

  Future<void> _submit(BuildContext context) async {
    final cubit = context.read<GeoFallbackStartCubit>();
    final shift = await cubit.submit();
    if (!context.mounted) return;
    if (shift == null) return; // Причина уже в состоянии — покажет listener.
    context.modals.showSuccess(context.l10n.geoFallbackStarted);
    await context.router.maybePop(shift);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<GeoFallbackStartCubit, GeoFallbackStartState>(
      listenWhen: (prev, curr) => prev.submitStatus != curr.submitStatus,
      listener: (context, state) {
        if (state.submitStatus != FeatureStatus.error) return;
        context.modals.showError(
          localizedErrorMessage(
            context,
            code: state.submitErrorCode,
            fallback: state.submitError,
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.geoFallbackTitle), centerTitle: true),
        body: SafeArea(
          child: BlocBuilder<GeoFallbackStartCubit, GeoFallbackStartState>(
            builder: (context, state) {
              return ListView(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 32,
                ),
                children: [
                  Text(
                    l10n.geoFallbackIntro,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.appColors.muted,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _LocationStep(state: state),
                  const SizedBox(height: 24),
                  _ScheduleStep(
                    state: state,
                    organizationTimezone: organizationTimezone,
                  ),
                  const SizedBox(height: 24),
                  _PhotoStep(state: state),
                  const SizedBox(height: 32),
                  AppButton(
                    label: l10n.geoFallbackSubmit,
                    isLoading: state.isSubmitting,
                    isEnabled: state.canSubmit,
                    onPressed: () => _submit(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Заголовок шага флоу.
class _StepTitle extends StatelessWidget {
  const _StepTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

/// Строка-«поле» с текущим выбором шага (визуально как селекторы трекера).
class _StepField extends StatelessWidget {
  const _StepField({
    required this.icon,
    required this.label,
    required this.isPlaceholder,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isPlaceholder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            enabled: onTap != null,
          ),
          child: Row(
            children: [
              Icon(icon, size: 20, color: colors.secondary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge?.copyWith(
                    color: isPlaceholder ? colors.secondary : null,
                  ),
                ),
              ),
              if (onTap != null)
                Icon(Icons.keyboard_arrow_down, color: colors.secondary),
            ],
          ),
        ),
      ),
    );
  }
}
