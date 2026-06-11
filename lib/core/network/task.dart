import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';

part 'task.freezed.dart';

/// Результат выполнения операции
/// Используется для обработки ошибок на уровне репозитория
@Freezed(genericArgumentFactories: true)
sealed class Task<T> with _$Task<T> {
  /// Успешный результат
  const factory Task.success(T data) = TaskSuccess<T>;

  /// Ошибка выполнения
  const factory Task.failure(ApiException error) = TaskFailure<T>;
}

/// Extension методы для удобной работы с Task
extension TaskX<T> on Task<T> {
  /// Преобразует результат в значение
  /// [onSuccess] - вызывается при успехе
  /// [onFailure] - вызывается при ошибке
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiException error) onFailure,
  }) {
    return switch (this) {
      TaskSuccess(:final data) => onSuccess(data),
      TaskFailure(:final error) => onFailure(error),
    };
  }

  /// Преобразует данные при успехе
  Task<R> map<R>(R Function(T data) mapper) {
    return switch (this) {
      TaskSuccess(:final data) => Task.success(mapper(data)),
      TaskFailure(:final error) => Task.failure(error),
    };
  }

  /// Цепочка асинхронных операций
  Future<Task<R>> flatMap<R>(Future<Task<R>> Function(T data) mapper) async {
    return switch (this) {
      TaskSuccess(:final data) => mapper(data),
      TaskFailure(:final error) => Task.failure(error),
    };
  }

  /// Возвращает данные или null при ошибке
  T? get dataOrNull => switch (this) {
    TaskSuccess(:final data) => data,
    TaskFailure() => null,
  };

  /// Возвращает ошибку или null при успехе
  ApiException? get errorOrNull => switch (this) {
    TaskSuccess() => null,
    TaskFailure(:final error) => error,
  };

  /// Проверка на успех
  bool get isSuccess => this is TaskSuccess<T>;

  /// Проверка на ошибку
  bool get isFailure => this is TaskFailure<T>;

  /// Возвращает данные или значение по умолчанию
  T getOrElse(T defaultValue) => switch (this) {
    TaskSuccess(:final data) => data,
    TaskFailure() => defaultValue,
  };

  /// Возвращает данные или вычисляет значение по умолчанию
  T getOrElseCompute(T Function(ApiException error) compute) => switch (this) {
    TaskSuccess(:final data) => data,
    TaskFailure(:final error) => compute(error),
  };
}
