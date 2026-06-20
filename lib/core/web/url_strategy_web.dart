import 'package:flutter_web_plugins/url_strategy.dart';

/// Включает path-based URL без `#` в web-сборке.
void configureWebUrlStrategy() => usePathUrlStrategy();
