/// Заглушка стратегии URL для не-web платформ.
void configureWebUrlStrategy() {}

/// На нативе адресной строки нет — no-op.
void replaceBrowserPath(String path) {}
