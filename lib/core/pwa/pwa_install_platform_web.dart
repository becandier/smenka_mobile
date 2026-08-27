import 'dart:async';
import 'dart:js_interop';

import 'package:smenka_mobile/core/pwa/pwa_install_platform_api.dart';
import 'package:web/web.dart' as web;

/// Web-реализация платформенного слоя промо установки PWA.
///
/// Единственное место в приложении, где есть JS-interop этой фичи: DOM-события
/// `beforeinstallprompt`/`appinstalled` и media query `display-mode`. Файл
/// подключается только в web-сборке (conditional export в
/// `pwa_install_platform.dart`), на native вместо него идёт no-op заглушка.
class PwaInstallPlatform implements PwaInstallPlatformApi {
  PwaInstallPlatform();

  final StreamController<PwaPlatformSignal> _controller =
      StreamController<PwaPlatformSignal>.broadcast();

  /// Перехваченное событие `beforeinstallprompt`. Одноразовое: после `prompt()`
  /// браузер новое присылает не всегда, поэтому ссылку сразу обнуляем.
  _BeforeInstallPromptEvent? _deferredPrompt;

  bool _started = false;

  /// Ссылки на JS-обёртки колбэков нужны для `removeEventListener`: у него и
  /// `addEventListener` должен быть один и тот же JS-объект функции.
  late final web.EventListener _beforeInstallPromptListener =
      ((web.Event event) {
        // Без preventDefault Chromium сам покажет мини-инфобар и не отдаст нам
        // событие для отложенного вызова по кнопке «Установить».
        event.preventDefault();
        _deferredPrompt = _BeforeInstallPromptEvent(event);
        _emit(PwaPlatformSignal.promptAvailable);
      }).toJS;

  late final web.EventListener _appInstalledListener = ((web.Event _) {
    _deferredPrompt = null;
    _emit(PwaPlatformSignal.installed);
  }).toJS;

  @override
  bool get isWeb => true;

  @override
  bool get isStandalone {
    // Стандартный способ (Chromium, Firefox, Safari 16.4+).
    if (web.window.matchMedia('(display-mode: standalone)').matches) {
      return true;
    }
    // Легаси-флаг старых iOS Safari: display-mode они могут не поддерживать,
    // но `navigator.standalone` = true при запуске с домашнего экрана.
    return _IosNavigator(web.window.navigator).standalone?.toDart ?? false;
  }

  @override
  bool get isIos {
    final userAgent = web.window.navigator.userAgent;
    if (userAgent.contains('iPhone') ||
        userAgent.contains('iPad') ||
        userAgent.contains('iPod')) {
      return true;
    }
    // iPadOS 13+ по умолчанию представляется как десктопный macOS — отличаем
    // по наличию тач-скрина (у настоящих маков maxTouchPoints = 0).
    return userAgent.contains('Macintosh') &&
        web.window.navigator.maxTouchPoints > 1;
  }

  @override
  bool get hasInstallPrompt => _deferredPrompt != null;

  @override
  Stream<PwaPlatformSignal> get signals => _controller.stream;

  @override
  void start() {
    if (_started) return;
    _started = true;
    web.window.addEventListener(
      'beforeinstallprompt',
      _beforeInstallPromptListener,
    );
    web.window.addEventListener('appinstalled', _appInstalledListener);
  }

  @override
  Future<void> showInstallPrompt() async {
    final prompt = _deferredPrompt;
    if (prompt == null) return;

    // Событие одноразовое — «тратим» его до await, чтобы двойной тап по кнопке
    // не привёл ко второму `prompt()` (браузер бросает на этом исключение).
    _deferredPrompt = null;
    _emit(PwaPlatformSignal.promptConsumed);

    // Исход (`userChoice`) сознательно не читаем: по ТЗ и при установке, и при
    // отказе модалка просто закрывается. Отказ пользователя браузер отдаёт
    // штатным резолвом, а не ошибкой, но подстрахуемся — падать нельзя.
    try {
      await prompt.prompt().toDart;
    } catch (_) {
      // Диалог не открылся (устаревшее событие/жест утрачен) — молча выходим,
      // пользователю остаются ручные инструкции в модалке.
    }
  }

  @override
  Future<void> dispose() async {
    if (_started) {
      web.window.removeEventListener(
        'beforeinstallprompt',
        _beforeInstallPromptListener,
      );
      web.window.removeEventListener('appinstalled', _appInstalledListener);
      _started = false;
    }
    _deferredPrompt = null;
    await _controller.close();
  }

  void _emit(PwaPlatformSignal signal) {
    if (_controller.isClosed) return;
    _controller.add(signal);
  }
}

/// `BeforeInstallPromptEvent` — вне веб-стандарта (только Chromium), поэтому в
/// `package:web` его нет и обёртку описываем сами.
extension type _BeforeInstallPromptEvent(JSObject _obj) implements web.Event {
  external JSPromise<JSAny?> prompt();
}

/// `navigator.standalone` — нестандартное расширение iOS Safari, в
/// `package:web` не описано. На других браузерах свойство отсутствует, поэтому
/// тип nullable (`undefined` приезжает как `null`).
extension type _IosNavigator(JSObject _obj) implements JSObject {
  external JSBoolean? get standalone;
}
