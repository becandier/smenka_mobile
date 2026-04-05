import 'package:dio/dio.dart';

/// Интерцептор для разворачивания ответов бекенда.
/// Бекенд оборачивает все ответы в формат с полями `data` и `error`.
/// Этот интерцептор извлекает payload из data для удобства работы.
class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('data')) {
      response.data = data['data'];
    }
    handler.next(response);
  }
}
