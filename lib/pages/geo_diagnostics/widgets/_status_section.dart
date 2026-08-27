part of '../view/geo_diagnostics_page.dart';

/// Блок «Статус»: разрешение сайта (web) / приложения (native) и, на native,
/// системный переключатель служб геолокации.
class _StatusSection extends StatelessWidget {
  const _StatusSection({required this.state});

  final GeoDiagnosticsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final diagnostics = state.status.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(l10n.geoDiagnosticsStatusSection),
        const SizedBox(height: 12),
        _SectionCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (diagnostics == null)
                const _StatusPlaceholder()
              else ...[
                _StatusRow(
                  label: state.isWeb
                      ? l10n.geoDiagnosticsPermissionSiteLabel
                      : l10n.geoDiagnosticsPermissionAppLabel,
                  value: _permissionLabel(context, diagnostics.permission),
                  tone: _permissionTone(context, diagnostics.permission),
                ),
                if (diagnostics.serviceEnabled case final enabled?) ...[
                  const SizedBox(height: 12),
                  _StatusRow(
                    label: l10n.geoDiagnosticsServiceLabel,
                    value: enabled
                        ? l10n.geoDiagnosticsStateOn
                        : l10n.geoDiagnosticsStateOff,
                    tone: enabled
                        ? context.appColors.success
                        : context.appColors.error,
                  ),
                ],
              ],
              const SizedBox(height: 16),
              AppButton(
                label: l10n.geoDiagnosticsRefreshStatus,
                isOutlined: true,
                isLoading: state.status.isLoading,
                onPressed: () =>
                    context.read<GeoDiagnosticsCubit>().loadStatus(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _permissionLabel(BuildContext context, GeoPermissionState permission) {
    final l10n = context.l10n;
    return switch (permission) {
      GeoPermissionState.granted => l10n.geoDiagnosticsStateGranted,
      GeoPermissionState.blocked => l10n.geoDiagnosticsStateBlocked,
      GeoPermissionState.notRequested => l10n.geoDiagnosticsStateNotRequested,
      GeoPermissionState.unknown => l10n.geoDiagnosticsStateUnknown,
    };
  }

  Color _permissionTone(BuildContext context, GeoPermissionState permission) {
    final colors = context.appColors;
    return switch (permission) {
      GeoPermissionState.granted => colors.success,
      GeoPermissionState.blocked => colors.error,
      GeoPermissionState.notRequested => colors.warning,
      GeoPermissionState.unknown => colors.muted,
    };
  }
}

/// Статус ещё не прочитан (первый заход на экран) — короткий спиннер вместо
/// пустого места; данных, которые можно было бы показать, тут ещё нет.
class _StatusPlaceholder extends StatelessWidget {
  const _StatusPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator.adaptive(strokeWidth: 2),
        ),
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.label,
    required this.value,
    required this.tone,
  });

  final String label;
  final String value;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: context.appColors.muted,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            color: tone,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
