import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/models/_models.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/profile/cubit/profile_cubit.dart';
import 'package:smenka_mobile/pages/profile/cubit/profile_state.dart';
import 'package:smenka_mobile/pages/theme/widgets/theme_button_widget.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_profile_header.dart';
part '../widgets/_personal_info_section.dart';
part '../widgets/_organizations_section.dart';
part '../widgets/_settings_section.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileView();
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle), centerTitle: true),
      body: SectionDataWrapper<ProfileCubit, ProfileState, User>(
        selector: (state) => state.user,
        onRetry: () => context.read<ProfileCubit>().refresh(),
        contentBuilder: (user) {
          return RefreshIndicator.adaptive(
            onRefresh: () => context.read<ProfileCubit>().refresh(),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 32),
              children: [
                _ProfileHeader(user: user),
                const SizedBox(height: 24),
                _PersonalInfoSection(user: user),
                const SizedBox(height: 24),
                const _OrganizationsSection(),
                const SizedBox(height: 24),
                const _SettingsSection(),
                const SizedBox(height: 32),
                const _LogoutButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OutlinedButton.icon(
        onPressed: () => _showLogoutConfirmation(context),
        icon: Icon(Icons.logout, color: appColors.error),
        label: Text(l10n.logout, style: TextStyle(color: appColors.error)),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: appColors.error.withValues(alpha: 0.5)),
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    final l10n = context.l10n;
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.logoutConfirmTitle),
        content: Text(l10n.logoutConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<ProfileCubit>().logout();
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
