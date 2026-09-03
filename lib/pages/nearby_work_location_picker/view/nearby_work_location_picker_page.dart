import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат выбора точки в модалке. Закрытие свайпом/тапом по фону
/// возвращает `null` целиком — вызывающая сторона (`ShiftTrackerCubit.
/// startShift`) старт смены не продолжает (mobile.md: «закрытие модалки
/// отменяет старт смены без побочных эффектов»).
class NearbyWorkLocationPickerResult {
  const NearbyWorkLocationPickerResult(this.location);

  final NearbyWorkLocation location;
}

/// Модалка выбора рабочей точки при старте смены, когда сотрудник попал в
/// радиус нескольких зон (`shift_start_location_choice`). Список уже
/// загружен и отсортирован сервером ([ShiftTrackerCubit.
/// _resolveWorkLocationForGeoStart]) — здесь только выбор карточкой, без
/// собственного сетевого запроса и без пересортировки (тот же принцип, что и
/// у `WorkSchedulePickerPage`).
@RoutePage()
class NearbyWorkLocationPickerPage extends StatelessWidget {
  const NearbyWorkLocationPickerPage({required this.locations, super.key});

  /// Порядок — как пришёл с сервера (по возрастанию расстояния); первый
  /// элемент несёт `isNearest == true`.
  final List<NearbyWorkLocation> locations;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.shiftNearbyLocationsTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final location in locations) ...[
            _NearbyLocationRow(
              location: location,
              onTap: () => context.router.maybePop(
                NearbyWorkLocationPickerResult(location),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _NearbyLocationRow extends StatelessWidget {
  const _NearbyLocationRow({required this.location, required this.onTap});

  final NearbyWorkLocation location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: location.isNearest
          ? colors.primary.withValues(alpha: 0.08)
          : colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            location.name,
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (location.isNearest) ...[
                          const SizedBox(width: 8),
                          _NearestBadge(label: l10n.shiftNearbyIsNearestBadge),
                        ],
                      ],
                    ),
                    if (location.address case final address?
                        when address.trim().isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        address,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                    const SizedBox(height: 2),
                    Text(
                      l10n.shiftNearbyDistanceMeters(location.distanceMeters),
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: colors.secondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _NearestBadge extends StatelessWidget {
  const _NearestBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        child: Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
