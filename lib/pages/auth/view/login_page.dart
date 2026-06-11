import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/auth/cubit/login_cubit.dart';
import 'package:smenka_mobile/pages/auth/cubit/login_state.dart';
import 'package:smenka_mobile/widgets/app_button.dart';
import 'package:smenka_mobile/widgets/app_text_field.dart';

part '../widgets/password_requirements.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.onResult});

  /// Callback при успешной авторизации -- вызывается guard-ом
  final void Function({required bool didLogin})? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(authRepository: context.read<AuthRepository>()),
      child: _LoginView(onResult: onResult),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView({required this.onResult});

  final void Function({required bool didLogin})? onResult;

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();

    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _nameController.addListener(_onNameChanged);
  }

  void _onEmailChanged() {
    context.read<LoginCubit>().updateEmail(_emailController.text);
  }

  void _onPasswordChanged() {
    context.read<LoginCubit>().updatePassword(_passwordController.text);
  }

  void _onNameChanged() {
    context.read<LoginCubit>().updateName(_nameController.text);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    final cubit = context.read<LoginCubit>();
    final state = cubit.state;

    if (!state.isFormValid || state.isLoading) return;

    final LoginResult result;
    if (state.isLogin) {
      result = await cubit.login();
    } else {
      result = await cubit.register();
    }

    if (!mounted) return;

    switch (result) {
      case LoginResult.success:
        widget.onResult?.call(didLogin: true);
      case LoginResult.needsVerification:
        final email = cubit.state.email.trim();
        final message = state.isLogin
            ? context.l10n.authEmailNotVerified
            : context.l10n.authCodeSent;
        context.modals.showInfo(message);
        await context.router.push(VerifyRoute(email: email));
      case LoginResult.error:
        final errorState = cubit.state;
        context.modals.showError(
          localizedErrorMessage(
            context,
            code: errorState.errorCode,
            fallback: errorState.error,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return AutofillGroup(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTitle(context, state),
                        const SizedBox(height: 32),
                        if (state.isRegister) ...[
                          _buildNameField(context, state),
                          const SizedBox(height: 16),
                        ],
                        _buildEmailField(context, state),
                        const SizedBox(height: 16),
                        _buildPasswordField(context, state),
                        if (state.isRegister) ...[
                          const SizedBox(height: 12),
                          _PasswordRequirements(
                            isLongEnough: state.isPasswordLongEnough,
                            hasLetter: state.passwordHasLetter,
                            hasDigit: state.passwordHasDigit,
                            passwordNotEmpty: state.password.isNotEmpty,
                          ),
                        ],
                        const SizedBox(height: 24),
                        _buildSubmitButton(context, state),
                        const SizedBox(height: 16),
                        _buildToggleButton(context, state),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, LoginState state) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Text(
        state.isLogin ? context.l10n.authLogin : context.l10n.authRegister,
        key: ValueKey(state.mode),
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildNameField(BuildContext context, LoginState state) {
    return AppTextField(
      controller: _nameController,
      label: context.l10n.authName,
      hint: context.l10n.authNameHint,
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildEmailField(BuildContext context, LoginState state) {
    return AppTextField(
      controller: _emailController,
      label: context.l10n.authEmail,
      hint: context.l10n.authEmailHint,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildPasswordField(BuildContext context, LoginState state) {
    return AppTextField(
      controller: _passwordController,
      label: context.l10n.authPassword,
      obscure: state.obscurePassword,
      onToggleObscure: context.read<LoginCubit>().toggleObscurePassword,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: state.isLogin
          ? const [AutofillHints.password]
          : const [AutofillHints.newPassword],
      textInputAction: TextInputAction.done,
      onSubmitted: (_) => _onSubmit(),
    );
  }

  Widget _buildSubmitButton(BuildContext context, LoginState state) {
    return AppButton(
      label: state.isLogin ? context.l10n.authLogin : context.l10n.authRegister,
      isLoading: state.isLoading,
      // 423 ACCOUNT_LOCKED — временно блокируем повторные попытки входа
      isEnabled: state.isFormValid && !state.isLocked,
      onPressed: _onSubmit,
    );
  }

  Widget _buildToggleButton(BuildContext context, LoginState state) {
    return TextButton(
      onPressed: state.isLoading ? null : context.read<LoginCubit>().toggleMode,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          state.isLogin
              ? context.l10n.authNoAccount
              : context.l10n.authHasAccount,
          key: ValueKey(state.mode),
        ),
      ),
    );
  }
}
