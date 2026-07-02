import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';

/// Контракт репозитория авторизации
abstract class AuthRepository {
  /// Нотифаер состояния авторизации (для роутера и UI)
  AuthStateNotifier get authNotifier;

  /// Проверить сохранённые токены при старте приложения
  Future<void> checkAuthStatus();

  /// Регистрация — возвращает user_id, код подтверждения отправляется на email
  Future<Task<RegisterResult>> register({
    required String email,
    required String password,
    required String name,
  });

  /// Подтверждение email 4-значным кодом — возвращает токены
  Future<Task<AuthToken>> verify({required String email, required String code});

  /// Повторная отправка кода (cooldown 30 сек)
  Future<Task<void>> resendCode({required String email});

  /// Вход по email/password
  Future<Task<AuthToken>> login({
    required String email,
    required String password,
  });

  /// Обновление токенов (ротация — старый refresh revoked)
  Future<Task<AuthToken>> refresh({required String refreshToken});

  /// Выход — очищает токены локально и на сервере
  Future<Task<void>> logout();

  /// Публичная конфигурация OAuth-провайдеров для платформы (флаг `enabled`
  /// и `client_id`, используемый как `serverClientId`/`WebAuthenticationOptions.clientId`
  /// на Android — см. `docs/tasks/oauth_login/STATUS.md`, «Открытые вопросы»)
  Future<Task<OAuthConfig>> getOAuthConfig({required String clientType});

  /// Вход/регистрация через Google id-токен — возвращает тот же результат, что [login]
  Future<Task<AuthToken>> loginWithGoogle({
    required String idToken,
    required String clientType,
  });

  /// Вход/регистрация через Apple identity-токен — [email]/[name] приходят от
  /// Apple только при первой авторизации пользователя в приложении
  Future<Task<AuthToken>> loginWithApple({
    required String identityToken,
    required String clientType,
    String? email,
    String? name,
  });
}
