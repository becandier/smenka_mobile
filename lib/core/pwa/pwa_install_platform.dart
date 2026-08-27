/// Точка подключения платформенного слоя промо установки PWA.
///
/// В web-сборке резолвится реальный JS-interop, на Android/iOS и в тестах
/// (Dart VM) — no-op заглушка. Импортировать в приложении нужно именно этот
/// файл, а не конкретную реализацию.
library;

export 'pwa_install_platform_stub.dart'
    if (dart.library.js_interop) 'pwa_install_platform_web.dart';
