import 'dart:io';

import 'package:dio/dio.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';

/// Интерцептор ошибок API.
///
/// Парсит формат ошибок бекенда:
/// `{"data": null, "error": {"code": "...", "message": "..."}}`
class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _handleError(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        response: err.response,
      ),
    );
  }

  ApiException _handleError(DioException error) {
    // Если ошибка уже является ApiException, возвращаем её
    final existingError = error.error;
    if (existingError is ApiException) {
      return existingError;
    }

    // Проверяем сетевые ошибки
    if (error.error is SocketException ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const ApiException.network(
        message: 'Проверьте подключение к интернету',
        code: 'NETWORK_ERROR',
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return const ApiException.network(
        message: 'Не удалось подключиться к серверу',
        code: 'CONNECTION_ERROR',
      );
    }

    final response = error.response;
    if (response == null) {
      return const ApiException.server(
        message: 'Произошла непредвиденная ошибка',
        code: 'UNKNOWN_ERROR',
      );
    }

    return _parseResponseError(response);
  }

  ApiException _parseResponseError(Response<dynamic> response) {
    final data = response.data;

    // Парсим формат ошибок бекенда
    if (data is Map<String, dynamic>) {
      final errorData = data['error'];
      if (errorData is Map<String, dynamic>) {
        return _parseBackendError(errorData);
      }
    }

    // Fallback по HTTP статусу
    return switch (response.statusCode) {
      401 => const ApiException.unauthorized(
          message: 'Необходима авторизация',
          code: 'UNAUTHORIZED',
        ),
      _ => const ApiException.server(
          message: 'Произошла непредвиденная ошибка',
          code: 'UNKNOWN_ERROR',
        ),
    };
  }

  ApiException _parseBackendError(Map<String, dynamic> errorData) {
    final code = errorData['code'] as String? ?? 'UNKNOWN_ERROR';
    final message = errorData['message'] as String? ?? 'Произошла ошибка';
    final validation = errorData['validation'] as List<dynamic>?;

    // Ошибки авторизации
    if (code == 'INVALID_CREDENTIALS' ||
        code == 'INVALID_TOKEN' ||
        code == 'UNAUTHORIZED') {
      return ApiException.unauthorized(message: message, code: code);
    }

    // Ошибки валидации
    if (validation != null && validation.isNotEmpty) {
      final errors = <String, String?>{};
      for (final item in validation) {
        if (item is Map<String, dynamic>) {
          final field = item['field'] as String? ?? '';
          final fieldMessage = item['message'] as String?;
          errors[field] = fieldMessage;
        }
      }
      return ApiException.validation(
        message: message,
        errors: errors,
        code: code,
      );
    }

    return ApiException.server(message: message, code: code);
  }
}
