import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in_web/web_only.dart' as google_web;
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
        // Коммитим autofill-контекст ТОЛЬКО после успешного входа: web-движок
        // сабмитит скрытую DOM-форму, и браузер/менеджер паролей предлагает
        // сохранить/обновить пару логин-пароль (если введённый пароль отличается
        // от сохранённого). shouldSave по умолчанию true. При ошибке/
        // needsVerification не коммитим — тогда предложения «Обновить пароль?»
        // нет. На нативе — то же поведение.
        TextInput.finishAutofillContext();
        widget.onResult?.call(didLogin: true);
      case LoginResult.needsVerification:
        final email = cubit.state.email.trim();
        final message = state.isLogin
            ? context.l10n.authEmailNotVerified
            : context.l10n.authCodeSent;
        context.modals.showInfo(message);
        // Регистрация (register() → needsVerification) — тоже успешный ввод
        // новой пары логин-пароль: коммитим autofill-контекст перед уходом
        // на экран верификации, чтобы web-браузер предложил сохранить новый
        // пароль (autofillHints.newPassword). Для login-needsVerification
        // (email не верифицирован) пароль не менялся — не коммитим.
        if (cubit.state.isRegister) {
          TextInput.finishAutofillContext();
        }
        await context.router.push(VerifyRoute(email: email));
      case LoginResult.error:
        _showLoginError(cubit.state);
      case LoginResult.cancelled:
      // Email/password-флоу никогда не возвращает cancelled — только OAuth
    }
  }

  Future<void> _onGoogleSignIn() async {
    final cubit = context.read<LoginCubit>();
    if (cubit.state.isLoading) return;
    final result = await cubit.signInWithGoogle();
    if (!mounted) return;
    _handleOAuthCompletion(result);
  }

  Future<void> _onAppleSignIn() async {
    final cubit = context.read<LoginCubit>();
    if (cubit.state.isLoading) return;
    final result = await cubit.signInWithApple();
    if (!mounted) return;
    _handleOAuthCompletion(result);
  }

  /// Cancelled/needsVerification игнорируются: пользователь сам отменил вход
  /// либо (needsVerification) OAuth-вход этого не возвращает в принципе.
  void _handleOAuthCompletion(LoginResult result) {
    if (result == LoginResult.success) {
      widget.onResult?.call(didLogin: true);
      return;
    }
    if (result != LoginResult.error) return;
    _showLoginError(context.read<LoginCubit>().state);
  }

  void _showLoginError(LoginState state) {
    context.modals.showError(
      localizedErrorMessage(
        context,
        code: state.errorCode,
        fallback: state.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AutofillGroup(
              // Сохранять пару логин-пароль только при явном успешном входе
              // (см. _onSubmit → LoginResult.success), поэтому dispose группы
              // не должен коммитить контекст: cancel вместо дефолтного commit,
              // иначе браузер предлагал бы сохранить при уходе со страницы.
              onDisposeAction: AutofillContextAction.cancel,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildLockup(context),
                    const SizedBox(height: 40),
                    // Заголовок и поля перестраиваются только при смене режима
                    // (login↔register) или видимости пароля, но НЕ на каждый
                    // символ. Это удерживает layout-трансформацию полей
                    // автозаполнения неизменной: web-движок не перефокусирует
                    // и не переразмещает скрытую <form> на каждый символ (см.
                    // GloballyPositionedTextEditingStrategy.placeElement →
                    // focusedFormElement.focusWithoutScroll), и Chrome при
                    // сохранённой паре не показывает «Обновить пароль?».
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.mode != current.mode ||
                          previous.obscurePassword != current.obscurePassword,
                      builder: (context, state) {
                        return Column(
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
                          ],
                        );
                      },
                    ),
                    // Реактивная часть (требования к паролю, кнопка входа,
                    // OAuth, переключатель режима) обновляется на каждый
                    // символ, но лежит НИЖЕ полей — при alignment topCenter
                    // рост высоты не сдвигает поля выше, их трансформация
                    // остаётся стабильной.
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                            if (state.showOAuthSection) ...[
                              const SizedBox(height: 20),
                              _buildOAuthDivider(context),
                              const SizedBox(height: 16),
                              if (state.googleEnabled)
                                _buildGoogleButton(context, state),
                              if (state.googleEnabled && state.appleEnabled)
                                const SizedBox(height: 12),
                              if (state.appleEnabled)
                                _buildAppleButton(context, state),
                            ],
                            const SizedBox(height: 16),
                            _buildToggleButton(context, state),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Фирменный лок-ап Smenka (знак + словесный знак) по центру над формой.
  ///
  /// Знак рендерится из SVG через flutter_svg; словесный знак — текстом в Arimo
  /// (flutter_svg не отрисовывает `<text>` из лок-ап-SVG), цвет — Deep Blue.
  Widget _buildLockup(BuildContext context) {
    final colors = context.appColors;
    return Semantics(
      label: 'Smenka',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/smenka-mark-color.svg', height: 40),
          const SizedBox(width: 10),
          Text(
            'smenka',
            style: TextStyle(
              fontFamily: 'Arimo',
              fontSize: 32,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.64,
              color: colors.blueDeep,
            ),
          ),
        ],
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
      // username первым: на web это даёт <input autocomplete="username">, и
      // менеджер паролей пейрит идентификатор с current-password. email — как
      // запасной хинт (та же подсказка сохранённых аккаунтов, что и раньше).
      autofillHints: const [AutofillHints.username, AutofillHints.email],
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

  Widget _buildOAuthDivider(BuildContext context) {
    final colors = context.appColors;
    return Row(
      children: [
        Expanded(child: Divider(color: colors.line)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            context.l10n.authOrDivider,
            style: TextStyle(color: colors.muted),
          ),
        ),
        Expanded(child: Divider(color: colors.line)),
      ],
    );
  }

  Widget _buildGoogleButton(BuildContext context, LoginState state) {
    // На web `google_sign_in` не поддерживает программный вход — единственный
    // способ инициировать флоу это официальный GIS-виджет Google (нельзя
    // оформить как обычную AppButton); результат обрабатывается в LoginCubit
    // через authenticationEvents, а не через _onGoogleSignIn.
    if (kIsWeb) {
      return Center(
        child: google_web.renderButton(
          configuration: google_web.GSIButtonConfiguration(
            type: google_web.GSIButtonType.standard,
            theme: google_web.GSIButtonTheme.outline,
            size: google_web.GSIButtonSize.large,
            text: google_web.GSIButtonText.continueWith,
            shape: google_web.GSIButtonShape.pill,
            minimumWidth: 400,
          ),
        ),
      );
    }
    return AppButton(
      label: context.l10n.authContinueWithGoogle,
      isOutlined: true,
      isLoading: state.isGoogleLoading,
      isEnabled: !state.isLoading,
      icon: SvgPicture.asset('assets/google_logo.svg', width: 20, height: 20),
      onPressed: _onGoogleSignIn,
    );
  }

  Widget _buildAppleButton(BuildContext context, LoginState state) {
    return AppButton(
      label: context.l10n.authContinueWithApple,
      isOutlined: true,
      isLoading: state.isAppleLoading,
      isEnabled: !state.isLoading,
      icon: Icon(Icons.apple, size: 20, color: context.appColors.ink),
      onPressed: _onAppleSignIn,
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
