import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/pages/auth/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const LoginState(obscurePassword: true)) {
    unawaited(_loadOAuthConfig());
  }

  final AuthRepository _authRepository;

  /// На web `GoogleSignIn.instance.authenticate()` бросает `UnsupportedError`
  /// (GIS-виджет — единственный способ инициировать вход, см. `LoginPage` —
  /// `google_web.renderButton()`); реальный сигнал об успехе приходит через
  /// этот стрим, а не через `signInWithGoogle()`.
  StreamSubscription<GoogleSignInAuthenticationEvent>? _googleWebEventsSub;

  bool get _isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// OAuth-вход поддержан на iOS/Android/web — на десктоп-таргетах (macOS/
  /// Windows/Linux, шаблонные каталоги flutter create, не входящие в
  /// поставку — см. docs/ARCHITECTURE.md) у пакетов нет платформенной
  /// реализации, поэтому там OAuth выключен.
  bool get _isOAuthSupportedPlatform =>
      kIsWeb ||
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;

  @override
  Future<void> close() {
    unawaited(_googleWebEventsSub?.cancel());
    return super.close();
  }

  void toggleMode() {
    emit(
      state.copyWith(
        mode: state.isLogin ? AuthMode.register : AuthMode.login,
        error: null,
        errorCode: null,
        status: FeatureStatus.initial,
      ),
    );
  }

  void updateIdentifier(String value) =>
      emit(state.copyWith(identifier: value, error: null, errorCode: null));

  void updatePassword(String value) =>
      emit(state.copyWith(password: value, error: null, errorCode: null));

  void updateName(String value) =>
      emit(state.copyWith(name: value, error: null, errorCode: null));

  void toggleObscurePassword() =>
      emit(state.copyWith(obscurePassword: !state.obscurePassword));

  Future<LoginResult> login() async {
    emit(
      state.copyWith(
        status: FeatureStatus.loading,
        error: null,
        errorCode: null,
      ),
    );

    final result = await _authRepository.login(
      login: state.identifier.trim(),
      password: state.password,
    );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(status: FeatureStatus.success));
        return LoginResult.success;
      },
      onFailure: (error) {
        if (_isNotVerified(error)) {
          emit(state.copyWith(status: FeatureStatus.idle));
          return LoginResult.needsVerification;
        }
        emit(
          state.copyWith(
            status: FeatureStatus.error,
            error: error.message,
            errorCode: error.code,
          ),
        );
        return LoginResult.error;
      },
    );
  }

  Future<LoginResult> register() async {
    emit(
      state.copyWith(
        status: FeatureStatus.loading,
        error: null,
        errorCode: null,
      ),
    );

    final result = await _authRepository.register(
      email: state.identifier.trim(),
      password: state.password,
      name: state.name.trim(),
    );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(status: FeatureStatus.success));
        return LoginResult.needsVerification;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            status: FeatureStatus.error,
            error: error.message,
            errorCode: error.code,
          ),
        );
        return LoginResult.error;
      },
    );
  }

  /// Загружает флаги `enabled`/`client_id` OAuth-провайдеров для текущей
  /// платформы, чтобы решить, показывать ли кнопки Google/Apple. Ошибка
  /// загрузки не блокирует форму email/пароль — просто кнопки не появятся.
  ///
  /// На Android Apple Sign-In не предлагаем вовсе (продуктовое решение) —
  /// запрашиваем конфиг только для Google (`client_type=android`); поле
  /// `apple` в `state.oauthConfig` на Android так и остаётся `null`, кнопка
  /// Apple не рендерится (см. `LoginState.appleEnabled`).
  Future<void> _loadOAuthConfig() async {
    if (!_isOAuthSupportedPlatform) return;

    if (kIsWeb) {
      final config = (await _authRepository.getOAuthConfig(
        clientType: 'web',
      )).dataOrNull;
      // Cubit мог закрыться, пока запрос был в полёте (например, страница
      // уже размонтирована) — emit() после close() бросает StateError.
      if (isClosed || config == null) return;
      emit(state.copyWith(oauthConfig: config));
      final googleClientId = config.google?.clientId;
      if ((config.google?.enabled ?? false) && googleClientId != null) {
        await _initGoogleWebSignIn(googleClientId);
      }
      return;
    }

    if (_isIOS) {
      final config = (await _authRepository.getOAuthConfig(
        clientType: 'ios',
      )).dataOrNull;
      if (isClosed || config == null) return;
      emit(state.copyWith(oauthConfig: config));
      return;
    }

    final google = (await _authRepository.getOAuthConfig(
      clientType: 'android',
    )).dataOrNull?.google;
    if (isClosed || google == null) return;
    emit(state.copyWith(oauthConfig: OAuthConfig(google: google)));
  }

  /// Google на web не поддерживает `authenticate()` (GIS-SDK требует
  /// собственный рендер-виджет — см. `google_web.renderButton()` в
  /// `LoginPage`). Результат входа приходит асинхронно через
  /// `authenticationEvents`, поэтому слушаем стрим один раз после
  /// инициализации, а не по тапу кнопки.
  Future<void> _initGoogleWebSignIn(String clientId) async {
    await GoogleSignIn.instance.initialize(clientId: clientId);
    if (isClosed) return;
    _googleWebEventsSub = GoogleSignIn.instance.authenticationEvents.listen(
      _handleGoogleWebAuthEvent,
      onError: (Object _) {},
    );
  }

  Future<void> _handleGoogleWebAuthEvent(
    GoogleSignInAuthenticationEvent event,
  ) async {
    if (isClosed || event is! GoogleSignInAuthenticationEventSignIn) return;

    final idToken = event.user.authentication.idToken;
    if (idToken == null) return;

    _emitOAuthLoading(OAuthSignInProvider.google);
    final result = await _authRepository.loginWithGoogle(
      idToken: idToken,
      clientType: 'web',
    );
    _handleOAuthResult(result);
  }

  /// Вход через Google. На Android `google_sign_in` v7 выдаёт `id_token`
  /// только при явном `serverClientId` — и это должен быть Web-клиент (аудиенс
  /// токена всегда Web, а не Android-специфичный клиент), поэтому берём
  /// `client_id` из `(google, android)` в `oauth_provider_settings`, а не
  /// значение, зашитое в `google-services.json` (см. STATUS.md, «Открытые
  /// вопросы к аналитику»).
  Future<LoginResult> signInWithGoogle() async {
    // На web вход идёт через рендер-виджет Google (_handleGoogleWebAuthEvent)
    if (!_isOAuthSupportedPlatform || kIsWeb || state.isLoading) {
      return LoginResult.cancelled;
    }

    _emitOAuthLoading(OAuthSignInProvider.google);

    try {
      await GoogleSignIn.instance.initialize(
        serverClientId: _isIOS ? null : state.oauthConfig?.google?.clientId,
      );
      final account = await GoogleSignIn.instance.authenticate();
      final idToken = account.authentication.idToken;

      if (idToken == null) {
        return _emitOAuthClientError();
      }

      final result = await _authRepository.loginWithGoogle(
        idToken: idToken,
        clientType: _isIOS ? 'ios' : 'android',
      );
      return _handleOAuthResult(result);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return _emitOAuthCancelled();
      }
      return _emitOAuthClientError();
    } catch (_) {
      return _emitOAuthClientError();
    }
  }

  /// Вход через Apple — iOS (нативно, `aud` = App ID `com.becandier.smenka`)
  /// и web (браузерный флоу через Apple JS SDK, `aud` = Services ID
  /// `com.becandier.smenka.web`). На Android не предлагаем вовсе (продуктовое
  /// решение — только Google).
  Future<LoginResult> signInWithApple() async {
    if (!_isOAuthSupportedPlatform || (!kIsWeb && !_isIOS) || state.isLoading) {
      return LoginResult.cancelled;
    }

    _emitOAuthLoading(OAuthSignInProvider.apple);

    // CSRF-защита браузерного флоу (та же находка, что уже закрыта в
    // admin-треке для их Apple JS-кнопки): Apple возвращает `state`
    // неизменным — на iOS (нативный ASAuthorizationController) не нужен.
    final expectedState = kIsWeb ? _generateOAuthState() : null;

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: const [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        state: expectedState,
        webAuthenticationOptions: kIsWeb
            ? WebAuthenticationOptions(
                clientId: state.oauthConfig?.apple?.clientId ?? '',
                // Возврат на текущий домен (app.smenka.space в проде) —
                // Apple должен знать этот Return URL заранее в консоли
                // (Services ID → Sign In with Apple → Domains/Return URLs).
                redirectUri: Uri.parse('${Uri.base.origin}/'),
              )
            : null,
      );

      if (expectedState != null && credential.state != expectedState) {
        return _emitOAuthClientError();
      }

      final identityToken = credential.identityToken;
      if (identityToken == null) {
        return _emitOAuthClientError();
      }

      final result = await _authRepository.loginWithApple(
        identityToken: identityToken,
        clientType: kIsWeb ? 'web' : 'ios',
        email: credential.email,
        name: _fullName(credential),
      );
      return _handleOAuthResult(result);
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        return _emitOAuthCancelled();
      }
      return _emitOAuthClientError();
    } catch (_) {
      return _emitOAuthClientError();
    }
  }

  String _generateOAuthState() {
    final bytes = List<int>.generate(16, (_) => Random.secure().nextInt(256));
    return base64Url.encode(bytes);
  }

  String? _fullName(AuthorizationCredentialAppleID credential) {
    final parts = [
      credential.givenName,
      credential.familyName,
    ].whereType<String>().where((part) => part.trim().isNotEmpty);
    return parts.isEmpty ? null : parts.join(' ');
  }

  // Пока await GoogleSignIn.instance.authenticate()/SignInWithApple.get...
  // висит (пользователь может уйти со страницы, авторизоваться параллельным
  // путём и т.п.), LoginCubit мог успеть закрыться — emit() после close()
  // бросает StateError (см. аналогичный комментарий в _loadOAuthConfig).
  // LoginResult всё равно возвращается: вызывающая сторона (LoginPage)
  // отдельно проверяет `mounted` перед тем, как им воспользоваться.

  void _emitOAuthLoading(OAuthSignInProvider provider) {
    emit(
      state.copyWith(
        status: FeatureStatus.loading,
        error: null,
        errorCode: null,
        activeOAuthProvider: provider,
      ),
    );
  }

  LoginResult _handleOAuthResult(Task<AuthToken> result) {
    return result.fold(
      onSuccess: (_) {
        if (!isClosed) {
          emit(
            state.copyWith(
              status: FeatureStatus.success,
              activeOAuthProvider: null,
            ),
          );
        }
        return LoginResult.success;
      },
      onFailure: (error) {
        if (!isClosed) {
          emit(
            state.copyWith(
              status: FeatureStatus.error,
              error: error.message,
              errorCode: error.code,
              activeOAuthProvider: null,
            ),
          );
        }
        return LoginResult.error;
      },
    );
  }

  LoginResult _emitOAuthCancelled() {
    if (!isClosed) {
      emit(
        state.copyWith(status: FeatureStatus.idle, activeOAuthProvider: null),
      );
    }
    return LoginResult.cancelled;
  }

  LoginResult _emitOAuthClientError() {
    if (!isClosed) {
      emit(
        state.copyWith(
          status: FeatureStatus.error,
          error: null,
          errorCode: 'OAUTH_CLIENT_ERROR',
          activeOAuthProvider: null,
        ),
      );
    }
    return LoginResult.error;
  }

  bool _isNotVerified(ApiException error) {
    return switch (error) {
      ServerException(:final code) => code == 'NOT_VERIFIED',
      UnauthorizedException(:final code) => code == 'NOT_VERIFIED',
      NetworkException() => false,
      ValidationException() => false,
    };
  }
}

enum LoginResult { success, needsVerification, error, cancelled }
