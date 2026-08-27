part of '../view/geo_diagnostics_page.dart';

/// Блок «Тест»: гоняет тот же [GeoService.getCurrentPosition], что и старт
/// смены, и показывает исход — координаты с точностью либо классифицированную
/// ошибку (текст выбирается по типу [GeoFailure], не по сообщению платформы).
class _TestSection extends StatelessWidget {
  const _TestSection({required this.state});

  final GeoDiagnosticsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isRunning = state.test.isLoading;
    final result = state.test.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(l10n.geoDiagnosticsTestSection),
        const SizedBox(height: 12),
        _SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton(
                label: l10n.geoDiagnosticsRunTest,
                isLoading: isRunning,
                onPressed: () => context.read<GeoDiagnosticsCubit>().runTest(),
              ),
              if (isRunning) ...[
                const SizedBox(height: 12),
                Text(
                  l10n.geoDiagnosticsTestRunning,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: context.appColors.muted,
                  ),
                ),
              ] else if (result != null) ...[
                const SizedBox(height: 16),
                _TestOutcome(result: result, isWeb: state.isWeb),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _TestOutcome extends StatelessWidget {
  const _TestOutcome({required this.result, required this.isWeb});

  final GeoResult result;
  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    return switch (result) {
      final GeoSuccess success => _TestSuccess(success: success),
      final GeoFailure failure => _TestFailure(failure: failure, isWeb: isWeb),
    };
  }
}

class _TestSuccess extends StatelessWidget {
  const _TestSuccess({required this.success});

  final GeoSuccess success;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final coords =
        '${success.latitude.toStringAsFixed(5)}, '
        '${success.longitude.toStringAsFixed(5)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle_outline, size: 20, color: colors.success),
            const SizedBox(width: 8),
            Text(
              l10n.geoDiagnosticsTestSuccess,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l10n.geoDiagnosticsTestCoords(coords),
          style: textTheme.bodySmall?.copyWith(color: colors.muted),
        ),
        if (success.accuracyMeters case final meters?) ...[
          const SizedBox(height: 4),
          Text(
            l10n.geoDiagnosticsTestAccuracy(meters.toStringAsFixed(0)),
            style: textTheme.bodySmall?.copyWith(color: colors.muted),
          ),
        ],
        if (success.lowAccuracy) ...[
          const SizedBox(height: 8),
          Text(
            l10n.geoLowAccuracy,
            style: textTheme.bodySmall?.copyWith(color: colors.warning),
          ),
        ],
      ],
    );
  }
}

class _TestFailure extends StatelessWidget {
  const _TestFailure({required this.failure, required this.isWeb});

  final GeoFailure failure;
  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.error_outline, size: 20, color: colors.error),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            _failureMessage(context, failure, isWeb: isWeb),
            style: textTheme.bodyMedium?.copyWith(color: colors.error),
          ),
        ),
      ],
    );
  }
}

/// Текст неуспешного исхода теста — строго по типу отказа из таксономии
/// `GeoService` (см. `docs/ERROR_FORMAT.md`: логика по коду, не по тексту).
String _failureMessage(
  BuildContext context,
  GeoFailure failure, {
  required bool isWeb,
}) {
  final l10n = context.l10n;
  return switch (failure) {
    GeoServiceDisabled() => l10n.geoServiceDisabledMessage,
    GeoPermissionDenied() => l10n.geoPermissionDenied,
    GeoPermissionDeniedForever() when isWeb => l10n.geoPermissionWebMessage,
    GeoPermissionDeniedForever() => l10n.geoPermissionDeniedForeverMessage,
    GeoUnavailable() => l10n.errorGeoUnavailable,
    GeoInsecureContext() => l10n.geoInsecureContextMessage,
    GeoUnsupported() => l10n.geoUnsupportedMessage,
  };
}
