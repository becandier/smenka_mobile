import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/profile/cubit/profile_cubit.dart';
import 'package:smenka_mobile/pages/profile/cubit/profile_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

@RoutePage(name: 'EditProfileRoute')
class EditProfileModal extends StatefulWidget {
  const EditProfileModal({super.key});

  @override
  State<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late String _initialName;
  late String _initialPhone;

  @override
  void initState() {
    super.initState();
    final user = context.read<ProfileCubit>().state.user.data;
    _initialName = user?.name ?? '';
    _initialPhone = user?.phone ?? '';
    _nameController = TextEditingController(text: _initialName);
    _phoneController = TextEditingController(text: _initialPhone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  bool get _hasChanges =>
      _nameController.text.trim() != _initialName ||
      _phoneController.text.trim() != _initialPhone;

  bool get _isNameValid => _nameController.text.trim().isNotEmpty;

  void _save() {
    if (!_isNameValid || !_hasChanges) return;

    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    context.read<ProfileCubit>().updateProfile(
      name: name != _initialName ? name : null,
      phone: phone != _initialPhone ? phone : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (prev, curr) => prev.updateStatus != curr.updateStatus,
      listener: (context, state) {
        if (state.updateStatus == FeatureStatus.success) {
          context.modals.showSuccess(l10n.profileUpdated);
          context.read<ProfileCubit>().resetUpdateStatus();
          context.router.maybePop();
        } else if (state.updateStatus == FeatureStatus.error) {
          final error = state.updateError;
          if (error != null) {
            context.modals.showError(error);
          }
          context.read<ProfileCubit>().resetUpdateStatus();
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
              l10n.editProfile,
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
                  label: l10n.authName,
                  hint: l10n.authNameHint,
                  error: _nameController.text.trim().isEmpty
                      ? l10n.nameRequired
                      : null,
                );
              },
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _phoneController,
              label: l10n.phone,
              hint: l10n.phoneHint,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ListenableBuilder(
              listenable: Listenable.merge([_nameController, _phoneController]),
              builder: (context, _) {
                return BlocSelector<ProfileCubit, ProfileState, FeatureStatus>(
                  selector: (state) => state.updateStatus,
                  builder: (context, updateStatus) {
                    return AppButton(
                      onPressed: _save,
                      label: l10n.save,
                      isLoading: updateStatus == FeatureStatus.loading,
                      isEnabled: _hasChanges && _isNameValid,
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
