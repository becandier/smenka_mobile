import 'package:smenka_mobile/core/pwa/pwa_install_platform_api.dart';

/// Заглушка платформенного слоя промо установки PWA для Android/iOS.
///
/// Устанавливать «на домашний экран» нативное приложение незачем, а
/// `dart:js_interop`/DOM на native недоступны — поэтому всё no-op, а
/// [isWeb] = `false` гасит промо и иконку «Установить приложение» целиком.
class PwaInstallPlatform implements PwaInstallPlatformApi {
  // Намеренно НЕ const: web-реализация const быть не может (внутри
  // StreamController), а сигнатуры двух веток conditional import должны
  // совпадать — иначе `const PwaInstallPlatform()` сломает web-сборку.
  PwaInstallPlatform();

  @override
  bool get isWeb => false;

  @override
  bool get isStandalone => false;

  @override
  bool get isIos => false;

  @override
  bool get hasInstallPrompt => false;

  @override
  Stream<PwaPlatformSignal> get signals =>
      const Stream<PwaPlatformSignal>.empty();

  @override
  void start() {}

  @override
  Future<void> showInstallPrompt() async {}

  @override
  Future<void> dispose() async {}
}
