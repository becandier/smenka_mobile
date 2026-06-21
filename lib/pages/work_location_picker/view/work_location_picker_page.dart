import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/work_location_picker/cubit/work_location_picker_cubit.dart';
import 'package:smenka_mobile/pages/work_location_picker/cubit/work_location_picker_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат выбора точки в модалке.
///
/// `location == null` — выбран пункт «Без точки» (доступен, только когда
/// привязка точки необязательна). Если модалку закрыли свайпом/тапом по фону —
/// роут вернёт `null` целиком, и вызывающая сторона выбор НЕ меняет.
class WorkLocationPickerResult {
  const WorkLocationPickerResult(this.location);

  final WorkLocation? location;
}

@RoutePage()
class WorkLocationPickerPage extends StatelessWidget {
  const WorkLocationPickerPage({
    required this.orgId,
    this.selectedLocationId,
    this.allowNone = false,
    super.key,
  });

  final String orgId;
  final String? selectedLocationId;

  /// Показывать пункт «Без точки» — когда привязка точки необязательна
  /// (`require_work_location = false`).
  final bool allowNone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkLocationPickerCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: _WorkLocationPickerView(
        selectedLocationId: selectedLocationId,
        allowNone: allowNone,
      ),
    );
  }
}

class _WorkLocationPickerView extends StatelessWidget {
  const _WorkLocationPickerView({
    required this.selectedLocationId,
    required this.allowNone,
  });

  final String? selectedLocationId;
  final bool allowNone;

  void _pick(BuildContext context, WorkLocation? location) {
    context.router.maybePop(WorkLocationPickerResult(location));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.shiftWorkLocationPickerTitle,
      child: BlocBuilder<WorkLocationPickerCubit, WorkLocationPickerState>(
        builder: (context, state) {
          final section = state.locations;

          if (section.isLoading) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }

          if (section.error case final message?) {
            return _ErrorRow(
              message: message,
              onRetry: () => context.read<WorkLocationPickerCubit>().load(),
            );
          }

          final locations = section.data ?? const <WorkLocation>[];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (allowNone)
                _LocationRow(
                  label: l10n.shiftWorkLocationPickerNone,
                  isSelected: selectedLocationId == null,
                  onTap: () => _pick(context, null),
                ),
              if (locations.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    l10n.shiftWorkLocationPickerEmpty,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.appColors.secondary,
                    ),
                  ),
                )
              else
                ...locations.map(
                  (loc) => _LocationRow(
                    label: loc.name,
                    subtitle: loc.address,
                    isSelected: loc.id == selectedLocationId,
                    onTap: () => _pick(context, loc),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.subtitle,
  });

  final String label;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                    if (subtitle case final sub?
                        when sub.trim().isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        sub,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check, color: colors.primary, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorRow extends StatelessWidget {
  const _ErrorRow({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: context.appColors.error),
          ),
          const SizedBox(height: 12),
          AppButton(onPressed: onRetry, label: l10n.retry, isOutlined: true),
        ],
      ),
    );
  }
}
