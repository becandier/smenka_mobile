import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_cubit.dart';
import 'package:smenka_mobile/pages/organizations/cubit/organizations_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

@RoutePage(name: 'JoinOrgRoute')
class JoinOrgModal extends StatefulWidget {
  const JoinOrgModal({super.key});

  @override
  State<JoinOrgModal> createState() => _JoinOrgModalState();
}

class _JoinOrgModalState extends State<JoinOrgModal> {
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  bool get _isValid => _codeController.text.trim().length == 8;

  void _submit() {
    if (!_isValid) return;
    context
        .read<OrganizationsCubit>()
        .joinOrganization(inviteCode: _codeController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<OrganizationsCubit, OrganizationsState>(
      listenWhen: (prev, curr) => prev.joinStatus != curr.joinStatus,
      listener: (context, state) {
        if (state.joinStatus == FeatureStatus.success) {
          final orgName = state.joinResult?.organizationName ?? '';
          context.modals.showSuccess(l10n.joinOrgSuccess(orgName));
          context.read<OrganizationsCubit>().resetJoinStatus();
          context.router.maybePop();
        } else if (state.joinStatus == FeatureStatus.error) {
          final error = state.actionError;
          if (error != null) {
            context.modals.showError(error);
          }
          context.read<OrganizationsCubit>().resetJoinStatus();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Material(
                color: appColors.secondary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
                child: const SizedBox(width: 32, height: 4),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.joinOrgTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ListenableBuilder(
              listenable: _codeController,
              builder: (context, _) {
                return AppTextField(
                  controller: _codeController,
                  label: l10n.joinOrgCodeLabel,
                  hint: l10n.joinOrgCodeHint,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                );
              },
            ),
            const SizedBox(height: 24),
            ListenableBuilder(
              listenable: _codeController,
              builder: (context, _) {
                return BlocSelector<OrganizationsCubit, OrganizationsState,
                    FeatureStatus>(
                  selector: (state) => state.joinStatus,
                  builder: (context, status) {
                    return AppButton(
                      onPressed: _submit,
                      label: l10n.organizationsJoin,
                      isLoading: status == FeatureStatus.loading,
                      isEnabled: _isValid,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
