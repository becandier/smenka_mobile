# Data Layer — Clean Architecture

## Структура

```
lib/data/
├── _data.dart                          # главный экспорт
├── domain/                             # бизнес-логика, не зависит от реализации
│   └── auth/
│       ├── models/                     # доменные модели
│       │   ├── user.dart
│       │   └── auth_token.dart
│       └── repositories/               # абстрактные контракты
│           └── auth_repository.dart
│
└── infrastructure/                     # реализация, зависит от внешних сервисов
    └── auth/
        ├── datasource/                 # API вызовы
        │   ├── auth_datasource.dart
        │   └── dto/                    # Data Transfer Objects
        │       ├── user_dto.dart
        │       └── auth_token_dto.dart
        ├── mappers/                    # DTO → Domain конвертация
        │   ├── user_mapper.dart
        │   └── auth_token_mapper.dart
        └── repositories/               # реализация контрактов
            └── auth_repository_impl.dart
```

## Поток данных

```
API → Dio → DataSource (DTO) → Mapper → Repository (Task<Domain>)
```

---

## Task<T> — Result Type

Все операции репозитория возвращают `Task<T>` вместо `Future<T>`:

```dart
abstract class AuthRepository {
  Future<Task<AuthToken>> login({required String email, required String password});
  Future<Task<User>> getCurrentUser();
}
```

### Два состояния

```dart
sealed class Task<T> {
  const factory Task.success(T data) = TaskSuccess<T>;
  const factory Task.failure(ApiException error) = TaskFailure<T>;
}
```

### Использование

```dart
// Pattern matching (рекомендуется)
final result = await authRepository.login(email: email, password: password);
switch (result) {
  case TaskSuccess(:final data):
    saveToken(data);
  case TaskFailure(:final error):
    showError(error.message);
}

// Или через fold
result.fold(
  onSuccess: (token) => saveToken(token),
  onFailure: (error) => showError(error.message),
);

// Или через геттеры
if (result.isSuccess) {
  final token = result.dataOrNull;
}
```

### Extension методы

| Метод | Описание |
|-------|----------|
| `fold()` | Обработать оба случая |
| `map()` | Трансформировать данные при успехе |
| `flatMap()` | Цепочка async операций |
| `dataOrNull` | Данные или null |
| `errorOrNull` | Ошибка или null |
| `isSuccess` / `isFailure` | Проверки |
| `getOrElse()` | Значение по умолчанию |

---

## Создание нового модуля

### 1. Domain — модели

```dart
// lib/data/domain/products/models/product.dart
@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required double price,
  }) = _Product;
}
```

### 2. Domain — репозиторий (контракт)

```dart
// lib/data/domain/products/repositories/product_repository.dart
abstract class ProductRepository {
  Future<Task<List<Product>>> getProducts();
  Future<Task<Product>> getProduct(int id);
}
```

### 3. Infrastructure — DTO

```dart
// lib/data/infrastructure/products/datasource/dto/product_dto.dart
@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required String name,
    required double price,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
}
```

### 4. Infrastructure — DataSource

```dart
// lib/data/infrastructure/products/datasource/product_datasource.dart
class ProductDataSource {
  ProductDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<List<ProductDto>> getProducts() async {
    final response = await _dio.get<List<dynamic>>('/products');
    return response.data!.map((e) => ProductDto.fromJson(e)).toList();
  }
}
```

### 5. Infrastructure — Mapper

```dart
// lib/data/infrastructure/products/mappers/product_mapper.dart
extension ProductMapper on ProductDto {
  Product toDomain() => Product(id: id, name: name, price: price);
}
```

### 6. Infrastructure — Repository Implementation

```dart
// lib/data/infrastructure/products/repositories/product_repository_impl.dart
class ProductRepositoryImpl with TaskHandler implements ProductRepository {
  ProductRepositoryImpl({required ProductDataSource dataSource}) : _dataSource = dataSource;
  final ProductDataSource _dataSource;

  @override
  Future<Task<List<Product>>> getProducts() {
    return execute(() async {
      final dtos = await _dataSource.getProducts();
      return dtos.map((e) => e.toDomain()).toList();
    });
  }
}
```

### 7. Экспорты

```dart
// lib/data/domain/products/_products.dart
export 'models/product.dart';
export 'repositories/product_repository.dart';

// lib/data/domain/_domain.dart
export 'auth/_auth.dart';
export 'products/_products.dart';  // добавить
```

---

## Использование в UI

### В Cubit/Bloc

```dart
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._repository) : super(const ProductsState());
  final ProductRepository _repository;

  Future<void> loadProducts() async {
    emit(state.copyWith(status: Status.loading));
    
    final result = await _repository.getProducts();
    result.fold(
      onSuccess: (products) => emit(state.copyWith(
        status: Status.success,
        products: products,
      )),
      onFailure: (error) => emit(state.copyWith(
        status: Status.failure,
        error: error.message,
      )),
    );
  }
}
```

### В StatefulWidget

```dart
class _ProductsPageState extends State<ProductsPage> {
  List<Product>? _products;
  String? _error;

  Future<void> _load() async {
    final result = await widget.repository.getProducts();
    
    if (result case TaskSuccess(:final data)) {
      setState(() => _products = data);
    } else if (result case TaskFailure(:final error)) {
      setState(() => _error = error.message);
    }
  }
}
```

---

## Преимущества

- **Независимость от бекенда** — меняется API → меняем только DTO и маппер
- **Явная обработка ошибок** — компилятор заставит обработать оба случая
- **Тестируемость** — легко мокать абстрактные репозитории
- **Гибкость** — работает с любым state management или без него
