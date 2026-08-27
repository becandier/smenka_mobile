/// Контракт платформенного слоя промо установки PWA (`pwa_install_promo`).
///
/// Реализаций две и подключаются они conditional export'ом
/// (`pwa_install_platform.dart`):
/// - `pwa_install_platform_web.dart` — реальный JS-interop (DOM: media query
///   `display-mode`, события `beforeinstallprompt`/`appinstalled`);
/// - `pwa_install_platform_stub.dart` — no-op для Android/iOS, где ни DOM, ни
///   `dart:js_interop` не существуют.
///
/// Весь браузерный код живёт ТОЛЬКО в web-реализации: остальное приложение
/// (кубит, виджеты) знает лишь про этот интерфейс, поэтому native-сборки и
/// `flutter test` (VM) собираются без единого web-импорта.
abstract interface class PwaInstallPlatformApi {
  /// Приложение открыто в браузере (web-сборка). На native — `false`, и все
  /// точки входа промо скрываются целиком.
  bool get isWeb;

  /// Запущено как установленное PWA (`display-mode: standalone` либо
  /// `navigator.standalone` у iOS Safari) — промо показывать не нужно.
  bool get isStandalone;

  /// iOS/iPadOS: нативного диалога установки нет ни в одном браузере (все на
  /// WebKit), установка только вручную через «Поделиться → На экран „Домой“».
  bool get isIos;

  /// Пойман и сохранён `beforeinstallprompt` — можно показать нативный диалог
  /// установки через [showInstallPrompt].
  bool get hasInstallPrompt;

  /// Поток изменений, приходящих из браузера уже после старта приложения.
  Stream<PwaPlatformSignal> get signals;

  /// Подписывается на браузерные события. Вызывается один раз при создании
  /// состояния фичи; на native — no-op.
  void start();

  /// Показывает нативный диалог установки и ждёт выбор пользователя.
  ///
  /// Исход (принял/отклонил) наружу не отдаётся намеренно — по ТЗ модалка в
  /// обоих случаях просто закрывается. Сохранённое событие одноразовое,
  /// поэтому после вызова прилетает [PwaPlatformSignal.promptConsumed].
  Future<void> showInstallPrompt();

  /// Отписывается от браузерных событий и закрывает [signals].
  Future<void> dispose();
}

/// Сигналы браузера об установке PWA, приходящие уже после старта приложения.
enum PwaPlatformSignal {
  /// Пойман `beforeinstallprompt` — доступен нативный диалог установки
  /// (Chromium: Chrome/Edge на десктопе и Android).
  promptAvailable,

  /// Сохранённое событие израсходовано вызовом `prompt()` — повторно его
  /// использовать нельзя, пока браузер не пришлёт новое.
  promptConsumed,

  /// Пойман `appinstalled` — приложение установлено, точки входа скрываем.
  installed,
}
