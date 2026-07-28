# build: компилируем Flutter web (prod-флейвор по умолчанию, см. debug_repository_imp.dart)
# Версия Flutter пиннится под dev-тулчейн (Dart 3.11) ради воспроизводимости.
ARG FLUTTER_VERSION=3.41.2
FROM ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION} AS build
WORKDIR /app

# Зависимости — отдельным слоем для кэша Docker.
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

# Исходники и сборка. l10n генерится автоматически (generate: true в pubspec),
# build_runner не нужен — *.freezed.dart/*.g.dart закоммичены в репозиторий.
# --csp: dart2js не использует new Function()/eval → CSP без 'unsafe-eval'
# (в index.html достаточно 'wasm-unsafe-eval' для CanvasKit).
# --no-tree-shake-icons: кладём ПОЛНЫЙ шрифт MaterialIcons, а не подмножество
# использованных глифов. Иначе добавление новой иконки меняет содержимое файла
# /assets/fonts/MaterialIcons-Regular.otf при СТАБИЛЬНОМ имени — и закэшированный
# у клиента старый субсет не содержит новых глифов (иконка не рендерится). Полный
# шрифт стабилен между билдами → проблема исключена в корне.
COPY . .
RUN flutter build web --release --csp --no-tree-shake-icons --base-href=/

# serve: статика через nginx с SPA-fallback (по аналогии с smenka_admin).
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
