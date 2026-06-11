//
//ignore_for_file: unintended_html_in_doc_comment

import 'package:dio/dio.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';

/// Миксин для обработки ошибок на уровне репозитория
/// Оборачивает вызовы в Task<T>
mixin TaskHandler {
  /// Выполняет операцию и возвращает Task<T>
  /// Автоматически обрабатывает DioException и другие ошибки
  Future<Task<T>> execute<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Task.success(result);
    } on DioException catch (e) {
      final error = e.error;
      if (error is ApiException) {
        return Task.failure(error);
      }
      return Task.failure(
        ApiException.server(
          message: e.message ?? 'Произошла непредвиденная ошибка',
          code: 'DIO_ERROR',
        ),
      );
    } catch (e) {
      return Task.failure(
        ApiException.server(message: e.toString(), code: 'UNKNOWN_ERROR'),
      );
    }
  }

  /// Выполняет операцию без возвращаемого значения
  Future<Task<void>> executeVoid(Future<void> Function() operation) async {
    return execute<void>(operation);
  }
}
