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
  Future<Task<AuthToken>> verify({
    required String email,
    required String code,
  });

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
}
