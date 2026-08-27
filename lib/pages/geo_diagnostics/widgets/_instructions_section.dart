part of '../view/geo_diagnostics_page.dart';

/// Блок «Что делать»: платформо-специфичные инструкции.
///
/// На web их всегда две — уровень сайта и уровень ОС: сайту можно разрешить
/// доступ, а система при этом запрещает геолокацию самому браузеру, и именно
/// это заводило пользователей в тупик (`geo_troubleshooting`, контекст ТЗ).
/// На native инструкция одна плюс кнопки системных настроек.
class _InstructionsSection extends StatelessWidget {
  const _InstructionsSection({required this.state});

  final GeoDiagnosticsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(l10n.geoDiagnosticsInstructionsSection),
        const SizedBox(height: 12),
        _SectionCard(
          child: state.target == GeoInstructionsTarget.nativeApp
              ? const _NativeInstructions()
              : _WebInstructions(target: state.target),
        ),
      ],
    );
  }
}

class _WebInstructions extends StatelessWidget {
  const _WebInstructions({required this.target});

  final GeoInstructionsTarget target;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InstructionStep(
          title: l10n.geoDiagnosticsSiteStepTitle,
          body: l10n.geoDiagnosticsSiteStepBody,
        ),
        const SizedBox(height: 16),
        _InstructionStep(
          title: l10n.geoDiagnosticsSystemStepTitle,
          body: _systemStepBody(context, target),
        ),
      ],
    );
  }

  String _systemStepBody(BuildContext context, GeoInstructionsTarget target) {
    final l10n = context.l10n;
    return switch (target) {
      GeoInstructionsTarget.webMacOs => l10n.geoDiagnosticsSystemStepMacOs,
      GeoInstructionsTarget.webWindows => l10n.geoDiagnosticsSystemStepWindows,
      GeoInstructionsTarget.webAndroid => l10n.geoDiagnosticsSystemStepAndroid,
      GeoInstructionsTarget.webIos => l10n.geoDiagnosticsSystemStepIos,
      // nativeApp сюда не попадает — ветка выбрана в _InstructionsSection.
      GeoInstructionsTarget.webOther ||
      GeoInstructionsTarget.nativeApp => l10n.geoDiagnosticsSystemStepOther,
    };
  }
}

class _NativeInstructions extends StatelessWidget {
  const _NativeInstructions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<GeoDiagnosticsCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InstructionStep(
          title: l10n.geoDiagnosticsNativeStepTitle,
          body: l10n.geoDiagnosticsNativeStepBody,
        ),
        const SizedBox(height: 16),
        AppButton(
          label: l10n.geoOpenAppSettings,
          isOutlined: true,
          onPressed: cubit.openAppSettings,
        ),
        const SizedBox(height: 8),
        AppButton(
          label: l10n.geoDiagnosticsOpenLocationSettings,
          isOutlined: true,
          onPressed: cubit.openLocationSettings,
        ),
      ],
    );
  }
}

class _InstructionStep extends StatelessWidget {
  const _InstructionStep({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          body,
          style: textTheme.bodySmall?.copyWith(color: context.appColors.muted),
        ),
      ],
    );
  }
}
