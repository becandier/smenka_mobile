import 'package:templatecmd/core/network/task.dart';
import 'package:templatecmd/data/domain/auth/models/_models.dart';

/// Абстрактный репозиторий авторизации
/// Определяет контракт для работы с авторизацией, не зависит от реализации
abstract class AuthRepository {
  /// Авторизация по email и паролю
  Future<Task<AuthToken>> login({
    required String email,
    required String password,
  });

  /// Регистрация нового пользователя
  Future<Task<AuthToken>> register({
    required String email,
    required String password,
    required String name,
  });

  /// Получение текущего пользователя
  Future<Task<User>> getCurrentUser();

  /// Обновление токена
  Future<Task<AuthToken>> refreshToken(String refreshToken);

  /// Выход из системы
  Future<Task<void>> logout();
}
