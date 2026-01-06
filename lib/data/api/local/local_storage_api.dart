import 'dart:async';

abstract class LocalStorageApi<T> {
  LocalStorageApi({required this.key});

  /// Ключ для хранения данных
  final String key;

  /// Универсальные методы для работы с хранилищем
  Future<T?> get currentValue;
  Future<void> write(T value);
  Future<void> delete();
}
