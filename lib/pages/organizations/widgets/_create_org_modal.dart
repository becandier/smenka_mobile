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

@RoutePage(name: 'CreateOrgRoute')
class CreateOrgModal extends StatefulWidget {
  const CreateOrgModal({super.key});

  @override
  State<CreateOrgModal> createState() => _CreateOrgModalState();
}

class _CreateOrgModalState extends State<CreateOrgModal> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isValid => _nameController.text.trim().isNotEmpty;

  void _submit() {
    if (!_isValid) return;
    context
        .read<OrganizationsCubit>()
        .createOrganization(name: _nameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<OrganizationsCubit, OrganizationsState>(
      listenWhen: (prev, curr) => prev.createStatus != curr.createStatus,
      listener: (context, state) {
        if (state.createStatus == FeatureStatus.success) {
          context.modals.showSuccess(l10n.createOrgSuccess);
          context.read<OrganizationsCubit>().resetCreateStatus();
          context.router.maybePop();
        } else if (state.createStatus == FeatureStatus.error) {
          final error = state.actionError;
          if (error != null) {
            context.modals.showError(error);
          }
          context.read<OrganizationsCubit>().resetCreateStatus();
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
              l10n.createOrgTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            ListenableBuilder(
              listenable: _nameController,
              builder: (context, _) {
                return AppTextField(
                  controller: _nameController,
                  label: l10n.createOrgNameLabel,
                  hint: l10n.createOrgNameHint,
                  error: _nameController.text.isNotEmpty &&
                          _nameController.text.trim().isEmpty
                      ? l10n.createOrgNameRequired
                      : null,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                );
              },
            ),
            const SizedBox(height: 24),
            ListenableBuilder(
              listenable: _nameController,
              builder: (context, _) {
                return BlocSelector<OrganizationsCubit, OrganizationsState,
                    FeatureStatus>(
                  selector: (state) => state.createStatus,
                  builder: (context, status) {
                    return AppButton(
                      onPressed: _submit,
                      label: l10n.organizationsCreate,
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
