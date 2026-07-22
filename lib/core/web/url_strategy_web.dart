import 'package:flutter_web_plugins/url_strategy.dart';

/// Включает path-based URL без `#` в web-сборке.
void configureWebUrlStrategy() => usePathUrlStrategy();

/// Подменяет адресную строку браузера (`history.replaceState`) БЕЗ навигации
/// Flutter-роутера — уже отрисованный экран не перестраивается.
///
/// Нужно для идемпотентности `/invite/{code}`: как только приглашение
/// обработано (успех/финальная ошибка), адрес чистим на [path], чтобы
/// перезагрузка страницы (F5) открывала [path], а не исходную ссылку с кодом,
/// и `join` не вызывался повторно.
void replaceBrowserPath(String path) {
  urlStrategy?.replaceState(null, '', path);
}
