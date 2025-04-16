import 'package:dio/dio.dart';
import 'package:templatecmd/core/constants/feature_statuses.dart';
import 'package:templatecmd/core/network/api_exceptions.dart';

/// Миксин для обработки ошибок в кубитах
mixin ErrorHandlerMixin<T> {
  /// Выполняет действие с обработкой ошибок
  Future<void> safeCall({
    required Future<void> Function() call,
    required void Function(FeatureStatus status) updateStatus,
    required void Function(String? errorMessage) updateErrorMessage,
    required void Function(Map<String, String?>? errors) updateErrors,
    void Function()? onSuccess,
    void Function(Object error)? onError,
  }) async {
    try {
      // Выполняем основное действие
      await call();

      // Вызываем колбэк успеха, если он предоставлен
      onSuccess?.call();
    } on DioException catch (e) {
      final error = e.error;
      if (error is ValidationException) {
        // Обрабатываем ошибки валидации
        updateErrors(error.errors);
        updateErrorMessage(error.message);
      } else if (error is ApiException) {
        // Обрабатываем ошибку API
        updateErrorMessage(error.message);
      }

      // Устанавливаем статус ошибки
      updateStatus(FeatureStatus.error);

      // Вызываем колбэк ошибки, если он предоставлен
      onError?.call(e);
    } catch (e) {
      // Обрабатываем общую ошибку
      updateStatus(FeatureStatus.error);

      // Вызываем колбэк ошибки, если он предоставлен
      onError?.call(e);
    }
  }
}
