import 'package:templatecmd/core/network/task.dart';
import 'package:templatecmd/core/network/task_handler.dart';
import 'package:templatecmd/data/domain/auth/_auth.dart';
import 'package:templatecmd/data/infrastructure/auth/datasource/auth_datasource.dart';
import 'package:templatecmd/data/infrastructure/auth/mappers/_mappers.dart';

/// Реализация репозитория авторизации
/// Использует TaskHandler для обработки ошибок на уровне репозитория
class AuthRepositoryImpl with TaskHandler implements AuthRepository {
  AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<Task<AuthToken>> login({
    required String email,
    required String password,
  }) {
    return execute(() async {
      final dto = await _dataSource.login(email: email, password: password);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<AuthToken>> register({
    required String email,
    required String password,
    required String name,
  }) {
    return execute(() async {
      final dto = await _dataSource.register(
        email: email,
        password: password,
        name: name,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<User>> getCurrentUser() {
    return execute(() async {
      final dto = await _dataSource.getCurrentUser();
      return dto.toDomain();
    });
  }

  @override
  Future<Task<AuthToken>> refreshToken(String refreshToken) {
    return execute(() async {
      final dto = await _dataSource.refreshToken(refreshToken);
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> logout() {
    return executeVoid(_dataSource.logout);
  }
}
