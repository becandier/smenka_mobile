import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exceptions.freezed.dart';

/// Базовый класс для всех исключений API
@freezed
sealed class ApiException with _$ApiException implements Exception {
  /// Ошибка сервера
  const factory ApiException.server({
    required String message,
    String? code,
    dynamic data,
  }) = ServerException;

  /// Ошибка сети
  const factory ApiException.network({
    required String message,
    String? code,
    dynamic data,
  }) = NetworkException;

  /// Ошибка авторизации
  const factory ApiException.unauthorized({
    required String message,
    String? code,
    dynamic data,
  }) = UnauthorizedException;

  /// Ошибка валидации
  const factory ApiException.validation({
    required String message,
    required Map<String, String?> errors,
    String? code,
    dynamic data,
  }) = ValidationException;
}

/// Расширение для получения сообщения об ошибке
extension ApiExceptionX on ApiException {
  /// Возвращает сообщение об ошибке
  String get message {
    return switch (this) {
      ServerException(:final message) => message,
      NetworkException(:final message) => message,
      UnauthorizedException(:final message) => message,
      ValidationException(:final message) => message,
    };
  }
}
