import 'package:dio/dio.dart';
import 'package:templatecmd/data/infrastructure/auth/datasource/dto/_dto.dart';

/// DataSource для работы с API авторизации
/// Отвечает только за сетевые запросы, не содержит бизнес-логики
class AuthDataSource {
  AuthDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Авторизация по email и паролю
  Future<AuthTokenDto> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  /// Регистрация нового пользователя
  Future<AuthTokenDto> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'name': name,
      },
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  /// Получение текущего пользователя
  Future<UserDto> getCurrentUser() async {
    final response = await _dio.get<Map<String, dynamic>>('/auth/me');
    return UserDto.fromJson(response.data!);
  }

  /// Обновление токена
  Future<AuthTokenDto> refreshToken(String refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  /// Выход из системы
  Future<void> logout() async {
    await _dio.post<void>('/auth/logout');
  }
}
