import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/domain/auth/_auth.dart';
import 'package:smenka_mobile/data/infrastructure/auth/datasource/auth_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/auth/mappers/_mappers.dart';

/// Реализация репозитория авторизации с реактивным управлением состоянием.
/// Сохраняет токены при успешном входе, очищает при выходе,
/// уведомляет AuthStateNotifier об изменениях.
class AuthRepositoryImpl with TaskHandler implements AuthRepository {
  AuthRepositoryImpl({
    required AuthDataSource dataSource,
    required AuthTokenStorage tokenStorage,
    required AuthStateNotifier authNotifier,
  }) : _dataSource = dataSource,
       _tokenStorage = tokenStorage,
       _authNotifier = authNotifier;

  final AuthDataSource _dataSource;
  final AuthTokenStorage _tokenStorage;
  final AuthStateNotifier _authNotifier;

  @override
  AuthStateNotifier get authNotifier => _authNotifier;

  @override
  Future<void> checkAuthStatus() async {
    if (_tokenStorage.hasTokens) {
      _authNotifier.setState(const AuthState.authenticated());
    } else {
      _authNotifier.setState(const AuthState.unauthenticated());
    }
  }

  @override
  Future<Task<RegisterResult>> register({
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
  Future<Task<AuthToken>> verify({
    required String email,
    required String code,
  }) {
    return execute(() async {
      final dto = await _dataSource.verify(email: email, code: code);
      final token = dto.toDomain();
      await _tokenStorage.saveTokens(
        accessToken: token.accessToken,
        refreshToken: token.refreshToken,
      );
      _authNotifier.setState(const AuthState.authenticated());
      return token;
    });
  }

  @override
  Future<Task<void>> resendCode({required String email}) {
    return executeVoid(() => _dataSource.resendCode(email: email));
  }

  @override
  Future<Task<AuthToken>> login({
    required String email,
    required String password,
  }) {
    return execute(() async {
      final dto = await _dataSource.login(email: email, password: password);
      final token = dto.toDomain();
      await _tokenStorage.saveTokens(
        accessToken: token.accessToken,
        refreshToken: token.refreshToken,
      );
      _authNotifier.setState(const AuthState.authenticated());
      return token;
    });
  }

  @override
  Future<Task<AuthToken>> refresh({required String refreshToken}) {
    return execute(() async {
      final dto = await _dataSource.refresh(refreshToken: refreshToken);
      final token = dto.toDomain();
      await _tokenStorage.saveTokens(
        accessToken: token.accessToken,
        refreshToken: token.refreshToken,
      );
      return token;
    });
  }

  @override
  Future<Task<void>> logout() async {
    final refreshToken = _tokenStorage.refreshToken;
    if (refreshToken != null) {
      try {
        await _dataSource.logout(refreshToken: refreshToken);
      } catch (_) {
        // Серверный logout может упасть — очищаем локально в любом случае
      }
    }
    await _tokenStorage.clearTokens();
    _authNotifier.setState(const AuthState.unauthenticated());
    return const Task.success(null);
  }
}
