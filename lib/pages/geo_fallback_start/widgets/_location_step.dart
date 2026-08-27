part of '../view/geo_fallback_start_page.dart';

/// Шаг 1 — рабочая точка. Обязательна: координат нет, сервер точку не
/// резолвит, без неё бэк вернёт `WORK_LOCATION_REQUIRED`. Переиспользует ту
/// же модалку, что и обычный старт при выключенной геопроверке.
class _LocationStep extends StatelessWidget {
  const _LocationStep({required this.state});

  final GeoFallbackStartState state;

  Future<void> _openPicker(BuildContext context) async {
    final cubit = context.read<GeoFallbackStartCubit>();
    final result = await context.router.push<WorkLocationPickerResult?>(
      WorkLocationPickerRoute(
        orgId: state.organizationId,
        selectedLocationId: state.workLocation?.id,
      ),
    );
    // allowNone здесь не передаётся: «Без точки» в этом флоу невозможен.
    final location = result?.location;
    if (location != null) cubit.selectWorkLocation(location);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selected = state.workLocation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StepTitle(l10n.geoFallbackLocationStep),
        const SizedBox(height: 8),
        _StepField(
          icon: Icons.place_outlined,
          label: selected?.name ?? l10n.geoFallbackLocationSelect,
          isPlaceholder: selected == null,
          onTap: state.isSubmitting ? null : () => _openPicker(context),
        ),
      ],
    );
  }
}
