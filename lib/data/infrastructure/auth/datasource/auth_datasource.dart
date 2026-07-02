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
      '/auth/register',
      data: {'email': email, 'password': password, 'name': name},
    );
    return RegisterResultDto.fromJson(response.data!);
  }

  Future<AuthTokenDto> verify({
    required String email,
    required String code,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/verify',
      data: {'email': email, 'code': code},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<void> resendCode({required String email}) async {
    await _dio.post<Map<String, dynamic>>(
      '/auth/resend-code',
      data: {'email': email},
    );
  }

  Future<AuthTokenDto> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<AuthTokenDto> refresh({required String refreshToken}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<void> logout({required String refreshToken}) async {
    await _dio.post<void>(
      '/auth/logout',
      data: {'refresh_token': refreshToken},
    );
  }

  Future<OAuthConfigDto> getOAuthConfig({required String clientType}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/auth/oauth/config',
      queryParameters: {'client_type': clientType},
    );
    return OAuthConfigDto.fromJson(response.data!);
  }

  Future<AuthTokenDto> loginWithGoogle({
    required String idToken,
    required String clientType,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/oauth/google',
      data: {'id_token': idToken, 'client_type': clientType},
    );
    return AuthTokenDto.fromJson(response.data!);
  }

  Future<AuthTokenDto> loginWithApple({
    required String identityToken,
    required String clientType,
    String? email,
    String? name,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/oauth/apple',
      data: {
        'identity_token': identityToken,
        'client_type': clientType,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
      },
    );
    return AuthTokenDto.fromJson(response.data!);
  }
}
