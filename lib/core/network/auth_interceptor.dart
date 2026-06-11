import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';

/// Интерцептор авторизации.
/// - Добавляет Bearer token к каждому запросу
/// - При 401 пытается обновить токен и повторить запрос
/// - При неудачном обновлении переводит в состояние unauthenticated
///
/// Использует QueuedInterceptor чтобы при нескольких одновременных 401
/// только один запрос обновлял токен.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required AuthTokenStorage tokenStorage,
    required AuthStateNotifier authNotifier,
    required Dio dio,
    @visibleForTesting Dio? refreshDio,
  }) : _tokenStorage = tokenStorage,
       _authNotifier = authNotifier,
       _dio = dio,
       _refreshDioOverride = refreshDio;

  final AuthTokenStorage _tokenStorage;
  final AuthStateNotifier _authNotifier;
  final Dio _dio;

  /// Тестовый сим: подменяет Dio для запроса `/auth/refresh`. В проде `null` —
  /// используется отдельный «чистый» Dio без интерцепторов
  /// (см. [_refreshTokens]).
  final Dio? _refreshDioOverride;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenStorage.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Обрабатываем только 401
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Не пытаемся обновить токен для auth-эндпоинтов (избегаем зацикливания)
    if (err.requestOptions.path.contains('/auth/')) {
      return handler.next(err);
    }

    // Не повторяем уже повторённый запрос
    if (err.requestOptions.extra['_retried'] == true) {
      return handler.next(err);
    }

    final refreshToken = _tokenStorage.refreshToken;
    if (refreshToken == null) {
      await _handleAuthFailure();
      return handler.next(err);
    }

    try {
      final tokens = await _refreshTokens(refreshToken);
      await _tokenStorage.saveTokens(
        accessToken: tokens.$1,
        refreshToken: tokens.$2,
      );

      // Повторяем оригинальный запрос с новым токеном
      final options = err.requestOptions;
      options.headers['Authorization'] = 'Bearer ${tokens.$1}';
      options.extra['_retried'] = true;
      final response = await _dio.fetch<dynamic>(options);
      return handler.resolve(response);
    } catch (_) {
      await _handleAuthFailure();
      return handler.next(err);
    }
  }

  /// Обновление токенов через отдельный Dio (без интерцепторов)
  Future<(String, String)> _refreshTokens(String refreshToken) async {
    final refreshDio =
        _refreshDioOverride ??
        Dio(
          BaseOptions(
            baseUrl: _dio.options.baseUrl,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

    final response = await refreshDio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
    );

    // Вручную разворачиваем обёртку бекенда
    final data = response.data;
    final payload = data?['data'] as Map<String, dynamic>?;
    if (payload == null) throw Exception('Invalid refresh response');

    return (
      payload['access_token'] as String,
      payload['refresh_token'] as String,
    );
  }

  Future<void> _handleAuthFailure() async {
    await _tokenStorage.clearTokens();
    _authNotifier.setState(const AuthState.unauthenticated());
  }
}
