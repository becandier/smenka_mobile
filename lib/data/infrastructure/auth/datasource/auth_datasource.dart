import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/auth/datasource/dto/_dto.dart';

/// DataSource для работы с API авторизации
class AuthDataSource {
  AuthDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<RegisterResultDto> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/register',
      data: {'email': email, 'password': password, 'name': name},
    );
    return RegisterResultDto.fromJson(response.data!);
  }

  Future<AuthTokenDto> verify({
    required String email,
    required String code,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/verify',
      data: {'email': email, 'code': code},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<void> resendCode({required String email}) async {
    await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/resend-code',
      data: {'email': email},
    );
  }

  Future<AuthTokenDto> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/login',
      data: {'email': email, 'password': password},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<AuthTokenDto> refresh({required String refreshToken}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<void> logout({required String refreshToken}) async {
    await _dio.post<void>(
      '/api/v1/auth/logout',
      data: {'refresh_token': refreshToken},
    );
  }
}
