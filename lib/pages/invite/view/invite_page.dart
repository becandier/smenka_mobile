import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/deep_link/pending_invite_storage.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/invite/cubit/invite_cubit.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Единая точка обработки ссылки-приглашения — `/invite/:code`, одинаковая
/// для web (маршрут срабатывает сам по себе на холодном старте и на F5) и
/// native (пуш из `DeepLinkService`/`PendingInviteStorage` в `success_app.dart`).
@RoutePage(name: 'InviteRoute')
class InvitePage extends StatelessWidget {
  const InvitePage({@pathParam required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InviteCubit(
        code: code,
        organizationRepository: context.read<OrganizationRepository>(),
        pendingInviteStorage: context.read<PendingInviteStorage>(),
        authNotifier: context.read<AuthStateNotifier>(),
      ),
      child: const _InviteView(),
    );
  }
}

class _InviteView extends StatelessWidget {
  const _InviteView();

  void _goHome(BuildContext context) {
    context.router.replaceAll([const MainRouterRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<InviteCubit, InviteState>(
          // Переход на логин должен случиться ровно один раз — реагируем на
          // смену ВАРИАНТА состояния, а не на каждый рестрейт.
          listenWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
          listener: (context, state) {
            if (state is InviteStateRequiresAuth) {
              context.router.replace(LoginRoute());
            }
          },
          builder: (context, state) {
            return switch (state) {
              InviteStateLoading() || InviteStateRequiresAuth() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              InviteStateSuccess(:final organizationName) => _SuccessContent(
                organizationName: organizationName,
                onContinue: () => _goHome(context),
              ),
              InviteStateError(:final kind, :final message) => _ErrorContent(
                kind: kind,
                message: message,
                onGoHome: () => _goHome(context),
                onRetry: () => context.read<InviteCubit>().retry(),
              ),
            };
          },
        ),
      ),
    );
  }
}

class _SuccessContent extends StatelessWidget {
  const _SuccessContent({
    required this.organizationName,
    required this.onContinue,
  });

  final String organizationName;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppEmptyState(
      icon: Icons.check_circle_outline,
      title: l10n.inviteSuccessTitle(organizationName),
      actionLabel: l10n.inviteContinueAction,
      onAction: onContinue,
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({
    required this.kind,
    required this.message,
    required this.onGoHome,
    required this.onRetry,
  });

  final InviteErrorKind kind;
  final String? message;
  final VoidCallback onGoHome;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return switch (kind) {
      InviteErrorKind.invalidInvite => AppEmptyState(
        icon: Icons.link_off,
        title: l10n.inviteErrorInvalidTitle,
        subtitle: l10n.inviteErrorInvalidDescription,
        actionLabel: l10n.inviteGoHomeAction,
        onAction: onGoHome,
      ),
      InviteErrorKind.ownerCannotJoin => AppEmptyState(
        icon: Icons.info_outline,
        title: l10n.inviteErrorOwnerTitle,
        subtitle: l10n.inviteErrorOwnerDescription,
        actionLabel: l10n.inviteGoHomeAction,
        onAction: onGoHome,
      ),
      InviteErrorKind.alreadyMember => AppEmptyState(
        icon: Icons.check_circle_outline,
        title: l10n.inviteErrorAlreadyMemberTitle,
        actionLabel: l10n.inviteGoHomeAction,
        onAction: onGoHome,
      ),
      InviteErrorKind.network => AppEmptyState(
        icon: Icons.wifi_off,
        title: l10n.errorOccurred,
        subtitle: message ?? l10n.errorDescription,
        actionLabel: l10n.retry,
        onAction: onRetry,
      ),
    };
  }
}
