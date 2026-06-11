import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/org_settings/cubit/org_settings_cubit.dart';
import 'package:smenka_mobile/pages/org_settings/cubit/org_settings_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

@RoutePage()
class OrgSettingsPage extends StatelessWidget {
  const OrgSettingsPage({@pathParam required this.orgId, super.key});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrgSettingsCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: const _OrgSettingsView(),
    );
  }
}

class _OrgSettingsView extends StatelessWidget {
  const _OrgSettingsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.orgSettingsTitle), centerTitle: true),
      body: SectionDataWrapper<OrgSettingsCubit, OrgSettingsState, OrgSettings>(
        selector: (state) => state.settings,
        onRetry: () => context.read<OrgSettingsCubit>().loadSettings(),
        contentBuilder: (_) => const _OrgSettingsForm(),
      ),
    );
  }
}

class _OrgSettingsForm extends StatelessWidget {
  const _OrgSettingsForm();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<OrgSettingsCubit, OrgSettingsState>(
      listenWhen: (prev, curr) => prev.saveStatus != curr.saveStatus,
      listener: (context, state) {
        if (state.saveStatus == FeatureStatus.success) {
          context.modals.showSuccess(l10n.orgSettingsSaved);
          context.read<OrgSettingsCubit>().resetSaveStatus();
        } else if (state.saveStatus == FeatureStatus.error) {
          context.modals.showError(l10n.error);
          context.read<OrgSettingsCubit>().resetSaveStatus();
        }
      },
      child: BlocBuilder<OrgSettingsCubit, OrgSettingsState>(
        builder: (context, state) {
          final cubit = context.read<OrgSettingsCubit>();

          return ListView(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 32,
            ),
            children: [
              _GeoCheckTile(
                value: state.geoCheckEnabled,
                onChanged: (value) => cubit.setGeoCheck(value: value),
              ),
              const SizedBox(height: 16),
              _GeoCheckTile(
                title: l10n.orgSettingsAutoFinish,
                description: l10n.orgSettingsAutoFinishDesc,
                value: state.autoFinishEnabled,
                onChanged: (value) => cubit.setAutoFinishEnabled(value: value),
              ),
              if (state.autoFinishEnabled) ...[
                const SizedBox(height: 12),
                _NumberField(
                  label: l10n.orgSettingsAutoFinishHours,
                  description: l10n.orgSettingsAutoFinishHoursDesc,
                  value: state.autoFinishHours,
                  onChanged: cubit.setAutoFinishHours,
                ),
              ],
              const SizedBox(height: 12),
              _NumberField(
                label: l10n.orgSettingsMaxPause,
                description: l10n.orgSettingsMaxPauseDesc,
                value: state.maxPauseMinutes,
                onChanged: cubit.setMaxPauseMinutes,
              ),
              const SizedBox(height: 12),
              _NumberField(
                label: l10n.orgSettingsMaxPauses,
                description: l10n.orgSettingsMaxPausesDesc,
                value: state.maxPausesPerShift,
                onChanged: cubit.setMaxPausesPerShift,
              ),
              const SizedBox(height: 24),
              AppButton(
                onPressed: cubit.saveSettings,
                label: l10n.save,
                isEnabled: state.hasChanges,
                isLoading: state.saveStatus == FeatureStatus.loading,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GeoCheckTile extends StatelessWidget {
  const _GeoCheckTile({
    required this.value,
    required this.onChanged,
    this.title,
    this.description,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: SwitchListTile.adaptive(
        title: Text(
          title ?? l10n.orgSettingsGeoCheck,
          style: textTheme.titleSmall,
        ),
        subtitle: Text(
          description ?? l10n.orgSettingsGeoCheckDesc,
          style: textTheme.bodySmall?.copyWith(
            color: textTheme.bodySmall?.color?.withValues(alpha: 0.6),
          ),
        ),
        value: value,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _NumberField extends StatefulWidget {
  const _NumberField({
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String description;
  final int? value;
  final ValueChanged<int?> onChanged;

  @override
  State<_NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<_NumberField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString() ?? '');
  }

  @override
  void didUpdateWidget(covariant _NumberField oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newText = widget.value?.toString() ?? '';
    if (_controller.text != newText) {
      _controller.text = newText;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.label, style: textTheme.titleSmall),
            const SizedBox(height: 4),
            Text(
              widget.description,
              style: textTheme.bodySmall?.copyWith(
                color: textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: '0',
                isDense: true,
                contentPadding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 10,
                  bottom: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) {
                final value = int.tryParse(text);
                widget.onChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
