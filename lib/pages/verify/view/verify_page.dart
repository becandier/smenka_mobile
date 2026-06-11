import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/verify/cubit/verify_cubit.dart';
import 'package:smenka_mobile/pages/verify/cubit/verify_state.dart';
import 'package:smenka_mobile/widgets/app_button.dart';
import 'package:smenka_mobile/widgets/pin_code_field.dart';

@RoutePage()
class VerifyPage extends StatelessWidget {
  const VerifyPage({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyCubit(
        email: email,
        authRepository: context.read<AuthRepository>(),
      ),
      child: _VerifyView(email: email),
    );
  }
}

class _VerifyView extends StatefulWidget {
  const _VerifyView({required this.email});

  final String email;

  @override
  State<_VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<_VerifyView> {
  final _pinKey = GlobalKey<PinCodeFieldState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.appColors;

    return MultiBlocListener(
      listeners: [
        BlocListener<VerifyCubit, VerifyState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == FeatureStatus.success) {
              context.modals.showSuccess(l10n.success);
              // Навигацию обрабатывает reevaluateListenable + guard
            }

            if (state.status == FeatureStatus.error) {
              context.modals.showError(
                localizedErrorMessage(
                  context,
                  code: state.errorCode,
                  fallback: state.error,
                ),
              );
              _pinKey.currentState?.clear();
            }
          },
        ),
        BlocListener<VerifyCubit, VerifyState>(
          listenWhen: (prev, curr) =>
              prev.isResending &&
              !curr.isResending &&
              curr.cooldownSeconds == 30,
          listener: (context, state) {
            context.modals.showInfo(l10n.authCodeResent);
          },
        ),
        // Ошибка повторной отправки кода (напр. 429 RATE_LIMIT_EXCEEDED):
        // resendCode не меняет status, поэтому ловим отдельно.
        BlocListener<VerifyCubit, VerifyState>(
          listenWhen: (prev, curr) =>
              prev.isResending && !curr.isResending && curr.error != null,
          listener: (context, state) {
            context.modals.showError(
              localizedErrorMessage(
                context,
                code: state.errorCode,
                fallback: state.error,
              ),
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => context.router.maybePop()),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<VerifyCubit, VerifyState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.authVerifyTitle,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.authVerifySubtitle(widget.email),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.secondary.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      PinCodeField(
                        key: _pinKey,
                        hasError: state.status == FeatureStatus.error,
                        onCompleted: (code) {
                          context.read<VerifyCubit>()
                            ..updateCode(code)
                            ..verify();
                        },
                      ),
                      const SizedBox(height: 24),
                      _ResendButton(
                        cooldownSeconds: state.cooldownSeconds,
                        isResending: state.isResending,
                        canResend: state.canResend,
                        onPressed: () =>
                            context.read<VerifyCubit>().resendCode(),
                      ),
                      if (state.isLoading) ...[
                        const SizedBox(height: 16),
                        const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResendButton extends StatelessWidget {
  const _ResendButton({
    required this.cooldownSeconds,
    required this.isResending,
    required this.canResend,
    required this.onPressed,
  });

  final int cooldownSeconds;
  final bool isResending;
  final bool canResend;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final label = cooldownSeconds > 0
        ? l10n.authResendCodeTimer(cooldownSeconds)
        : l10n.authResendCode;

    return AppButton(
      label: label,
      isLoading: isResending,
      isEnabled: canResend,
      isOutlined: true,
      onPressed: onPressed,
    );
  }
}
