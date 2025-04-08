import 'dart:io';

import 'package:dio/dio.dart';
import 'package:templatecmd/core/network/api_exceptions.dart';

/// Интерцептор ошибок API
class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _handleError(err);
    // Создаем новый DioException с оригинальным типом исключения
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
    if (error.error is ApiException) {
      return error.error! as ApiException;
    }

    // Проверяем сетевые ошибки
    if (error.error is SocketException ||
        error.type == DioExceptionType.connectionTimeout) {
      return const ApiException.network(
        message: 'Проверьте подключение к интернету',
        code: 'NETWORK_ERROR',
      );
    }

    if (error.response == null) {
      return const ApiException.server(
        message: 'Произошла непредвиденная ошибка',
        code: 'UNKNOWN_ERROR',
      );
    }

    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    /// Преобразует карту ошибок из формата Map<String, List<String>>
    /// в Map<String, String?>
    /// Берет первый элемент из каждого списка или null, если список пуст
    Map<String, String?> convertErrorsMap(Map<String, dynamic> errorsMap) {
      final result = <String, String?>{};

      errorsMap.forEach((key, value) {
        if (value is List && value.isNotEmpty) {
          result[key] = value.first.toString();
        } else if (value is String) {
          result[key] = value;
        } else {
          result[key] = null;
        }
      });

      return result;
    }

    return switch (statusCode) {
      401 => ApiException.unauthorized(
          message: 'Необходима авторизация',
          code: 'UNAUTHORIZED',
          data: data,
        ),
      422 when data is Map && data['errors'] is Map => ApiException.validation(
          message: 'Ошибка валидации',
          errors: convertErrorsMap(data['errors'] as Map<String, dynamic>),
          code: 'VALIDATION_ERROR',
          data: data,
        ),
      403 => ApiException.server(
          message: 'Доступ запрещен',
          code: 'FORBIDDEN',
          data: data,
        ),
      404 => ApiException.server(
          message: 'Ресурс не найден',
          code: 'NOT_FOUND',
          data: data,
        ),
      500 || 502 || 503 || 504 => ApiException.server(
          message: 'Ошибка сервера',
          code: 'SERVER_ERROR',
          data: data,
        ),
      _ => ApiException.server(
          message: 'Произошла непредвиденная ошибка',
          code: 'UNKNOWN_ERROR',
          data: data,
        ),
    };
  }
}
