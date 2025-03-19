/// Абстрактный класс для инициализаторов сервисов
abstract class ServiceInitializer {
  String get serviceName;

  Future<void> initialize(AppServiceLocator locator);
}

/// Глобальный сервис-локатор для доступа к сервисам приложения
class AppServiceLocator {
  final Map<Type, Object> _instances = {};

  T get<T extends Object>() {
    final instance = _instances[T];
    if (instance == null) {
      throw Exception('Service $T not registered in ServiceLocator');
    }
    return instance as T;
  }

  void register<T extends Object>(T instance) {
    _instances[T] = instance;
  }

  bool isRegistered<T extends Object>() {
    return _instances.containsKey(T);
  }
}
