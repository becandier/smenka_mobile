import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smenka_mobile/core/services/geo_logger.dart';

// =============================================================================
// Таксономия результата
// =============================================================================

/// Машинные коды гео-ошибок для локализации (см. `l10n/error_localization.dart`
/// и `docs/ERROR_FORMAT.md` — вся логика строится по коду, не по тексту).
const geoServiceDisabledCode = 'GEO_SERVICE_DISABLED';
const geoPermissionDeniedCode = 'GEO_PERMISSION_DENIED';
const geoPermissionDeniedForeverCode = 'GEO_PERMISSION_DENIED_FOREVER';
const geoUnavailableCode = 'GEO_UNAVAILABLE';
const geoUnsupportedCode = 'GEO_UNSUPPORTED';
const geoInsecureContextCode = 'GEO_INSECURE_CONTEXT';

/// Результат попытки получить геопозицию. `sealed` — вызывающий код обязан
/// разобрать все ветки (exhaustive switch) и показать платформо-корректный UX.
sealed class GeoResult {
  const GeoResult();
}

/// Позиция получена. [lowAccuracy] — точность хуже порога (десктоп без GPS,
/// IP-геолокация): UI показывает предупреждение, но старт не блокирует.
class GeoSuccess extends GeoResult {
  const GeoSuccess({
    required this.latitude,
    required this.longitude,
    required this.lowAccuracy,
  });

  final double latitude;
  final double longitude;
  final bool lowAccuracy;
}

/// База всех неуспешных исходов. Несёт машинный [code] для локализации и
/// необязательный [detail] (сырой текст исключения — только для логов, не для
/// показа пользователю).
sealed class GeoFailure extends GeoResult {
  const GeoFailure({this.detail});

  final String? detail;

  String get code;
}

/// Сервис геолокации устройства выключен (только native). UX: диалог +
/// «Открыть настройки геолокации».
class GeoServiceDisabled extends GeoFailure {
  const GeoServiceDisabled({super.detail});

  @override
  String get code => geoServiceDisabledCode;
}

/// Доступ отклонён, но не навсегда — можно повторно запросить. UX: короткий
/// тост + повтор (пользователь снова инициирует запрос).
class GeoPermissionDenied extends GeoFailure {
  const GeoPermissionDenied({super.detail});

  @override
  String get code => geoPermissionDeniedCode;
}

/// Доступ отклонён «навсегда». UX платформо-зависим:
/// - **native** — диалог + «Открыть настройки приложения»;
/// - **web** — диалог-инструкция по включению доступа в настройках сайта +
///   «Повторить» (системных настроек у браузера нет — кнопки настроек нет).
class GeoPermissionDeniedForever extends GeoFailure {
  const GeoPermissionDeniedForever({super.detail});

  @override
  String get code => geoPermissionDeniedForeverCode;
}

/// Позиция не получена (таймаут / `PositionUnavailable` / нет фикса, кэш пуст).
/// UX: тост «Не удалось определить геопозицию, повторите» + повтор.
class GeoUnavailable extends GeoFailure {
  const GeoUnavailable({super.detail});

  @override
  String get code => geoUnavailableCode;
}

/// Небезопасный контекст на web (страница открыта не по HTTPS) — браузер
/// блокирует геолокацию. UX: сообщение «нужен HTTPS», без кнопки настроек.
class GeoInsecureContext extends GeoFailure {
  const GeoInsecureContext({super.detail});

  @override
  String get code => geoInsecureContextCode;
}

/// Геолокация не поддерживается (нет `navigator.geolocation` /
/// `navigator.permissions`, несовместимый браузер). UX: сообщение «обновите
/// браузер», без кнопки настроек.
class GeoUnsupported extends GeoFailure {
  const GeoUnsupported({super.detail});

  @override
  String get code => geoUnsupportedCode;
}

// =============================================================================
// Сервис
// =============================================================================

/// Единая точка получения геопозиции во всём приложении (старт смены,
/// антифрод-штамп на фото чек-листов и далее).
///
/// Ключевые решения (подтверждены по исходникам `geolocator_web@4.1.4`):
/// - **Платформо-зависимый флоу.** На web `checkPermission()` не различает «не
///   спрашивали» и «запрещено» (`prompt→denied`, `denied→deniedForever`), а
///   `requestPermission()` трактует ЛЮБУЮ ошибку `getCurrentPosition` (в т.ч.
///   таймаут) как `deniedForever`. Поэтому на web мы не полагаемся на них для
///   решения: сразу запрашиваем позицию (это триггерит браузерный prompt) и
///   классифицируем реальную ошибку.
/// - **Точность.** Web — `enableHighAccuracy:false` (десктоп без GPS часто даёт
///   timeout при high). Native — high с fallback на medium и на
///   `getLastKnownPosition` (последний строго под `!kIsWeb` — на web бросает
///   `UnsupportedError`).
/// - **Повторы/таймауты** — параметры с разумными дефолтами (ниже).
class GeoService {
  GeoService({
    GeolocatorPlatform? geolocator,
    GeoLogger? logger,
    bool? isWeb,
    bool Function()? insecureContextProbe,
    this.webTimeout = const Duration(seconds: 20),
    this.nativePrimaryTimeout = const Duration(seconds: 15),
    this.nativeFallbackTimeout = const Duration(seconds: 20),
    this.nativeFallbackRetries = 1,
  }) : _geolocator = geolocator ?? GeolocatorPlatform.instance,
       _log = logger ?? GeoLogger(),
       _isWeb = isWeb ?? kIsWeb,
       _insecureContextProbe = insecureContextProbe ?? _defaultInsecureProbe;

  final GeolocatorPlatform _geolocator;
  final GeoLogger _log;
  final bool _isWeb;
  final bool Function() _insecureContextProbe;

  /// Таймаут единственной попытки на web (medium accuracy).
  final Duration webTimeout;

  /// Таймаут основной (high accuracy) попытки на native.
  final Duration nativePrimaryTimeout;

  /// Таймаут fallback-попыток (medium accuracy) на native.
  final Duration nativeFallbackTimeout;

  /// Сколько раз повторить с пониженной точностью на native, прежде чем уйти в
  /// `getLastKnownPosition` / [GeoUnavailable].
  final int nativeFallbackRetries;

  /// Точность (в метрах) хуже этого порога считается низкой.
  static const _lowAccuracyThreshold = 100.0;

  /// Получить текущую позицию. Никогда не бросает — всегда отдаёт [GeoResult].
  Future<GeoResult> getCurrentPosition() async {
    _log.step('start platform=${_isWeb ? 'web' : 'native'}');
    try {
      return _isWeb ? await _getWeb() : await _getNative();
    } on Object catch (e) {
      // Последний рубеж: любую неклассифицированную ошибку отдаём как
      // «недоступно» (retryable), а не роняем вызывающий код.
      _log.step('unexpected error: $e');
      return GeoUnavailable(detail: e.toString());
    }
  }

  // --- Web -------------------------------------------------------------------

  Future<GeoResult> _getWeb() async {
    if (_insecureContextProbe()) {
      _log.step('web insecure context');
      return const GeoInsecureContext();
    }

    // На web сразу запрашиваем позицию: это триггерит браузерный prompt (если
    // доступ ещё не выдан) и даёт настоящую ошибку для классификации. Мы НЕ
    // используем checkPermission()/requestPermission() — они на web лживы (см.
    // док-стринг класса).
    try {
      final position = await _requestPosition(
        // enableHighAccuracy:false — на десктоп-браузере без GPS high часто
        // уходит в timeout / PositionUnavailable.
        accuracy: LocationAccuracy.medium,
        timeout: webTimeout,
        attempt: 1,
      );
      return _success(position);
    } on PermissionDeniedException catch (e) {
      // Пользователь заблокировал доступ (или сайт в состоянии denied).
      // Повторный prompt браузер обычно не показывает — вернуть доступ можно
      // только через настройки сайта. UX web-ветки: инструкция + «Повторить».
      _log.step('web permission denied');
      return GeoPermissionDeniedForever(detail: e.message);
    } on TimeoutException catch (e) {
      _log.step('web timeout');
      return GeoUnavailable(detail: e.message);
    } on PositionUpdateException catch (e) {
      _log.step('web position unavailable');
      return GeoUnavailable(detail: e.message);
    } on Object catch (e) {
      // Всё прочее на web — как правило отсутствие `navigator.geolocation`
      // (несовместимый/устаревший браузер): позиция получена не будет ни при
      // повторе, ни в настройках — отдаём отдельный статус «не поддерживается».
      _log.step('web unsupported: $e');
      return GeoUnsupported(detail: e.toString());
    }
  }

  // --- Native ----------------------------------------------------------------

  Future<GeoResult> _getNative() async {
    final serviceEnabled = await _geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _log.step('native service disabled');
      return const GeoServiceDisabled();
    }

    var permission = await _geolocator.checkPermission();
    _log.step('native permission=$permission');

    if (permission == LocationPermission.denied) {
      permission = await _geolocator.requestPermission();
      _log.step('native permission after request=$permission');
      if (permission == LocationPermission.denied) {
        return const GeoPermissionDenied();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const GeoPermissionDeniedForever();
    }

    // Разрешение есть (whileInUse/always/unableToDetermine) — получаем позицию:
    // основная попытка high accuracy → fallback(и) medium → кэш последней
    // известной позиции → [GeoUnavailable].
    Position? position;
    String? lastDetail;

    try {
      position = await _requestPosition(
        accuracy: LocationAccuracy.high,
        timeout: nativePrimaryTimeout,
        attempt: 1,
      );
    } on LocationServiceDisabledException {
      // Сервис успели выключить между проверкой и запросом.
      _log.step('native service disabled mid-request');
      return const GeoServiceDisabled();
    } on PermissionDeniedException catch (e) {
      _log.step('native permission revoked mid-request');
      return GeoPermissionDenied(detail: e.message);
    } on TimeoutException catch (e) {
      lastDetail = e.message;
      _log.step('native high-accuracy timeout');
    } on PositionUpdateException catch (e) {
      lastDetail = e.message;
      _log.step('native high-accuracy position unavailable');
    } on Object catch (e) {
      // Неожиданная ошибка основной попытки не должна проваливать весь флоу
      // мимо fallback/кэша: даём пониженной точности и last-known-position шанс
      // вместо мгновенного GeoUnavailable.
      lastDetail = e.toString();
      _log.step('native high-accuracy unexpected error: $e');
    }

    for (
      var attempt = 1;
      position == null && attempt <= nativeFallbackRetries;
      attempt++
    ) {
      try {
        position = await _requestPosition(
          accuracy: LocationAccuracy.medium,
          timeout: nativeFallbackTimeout,
          attempt: attempt + 1,
        );
      } on TimeoutException catch (e) {
        lastDetail = e.message;
        _log.step('native fallback timeout attempt=$attempt');
      } on PositionUpdateException catch (e) {
        lastDetail = e.message;
        _log.step('native fallback position unavailable attempt=$attempt');
      } on Object catch (e) {
        // Симметрично основной попытке: неожиданная ошибка fallback не рушит
        // флоу мимо last-known-position — даём кэшу шанс, иначе GeoUnavailable.
        lastDetail = e.toString();
        _log.step('native fallback unexpected error attempt=$attempt: $e');
      }
    }

    // Кэш последней известной позиции — только native (на web бросает
    // UnsupportedError). Лучше показать чуть устаревшие координаты, чем ничего.
    if (position == null) {
      _log.step('native getLastKnownPosition');
      try {
        position = await _geolocator.getLastKnownPosition();
      } on Object catch (e) {
        _log.step('native getLastKnownPosition failed: $e');
        position = null;
      }
    }

    if (position == null) {
      _log.step('native unavailable');
      return GeoUnavailable(detail: lastDetail);
    }
    return _success(position);
  }

  // --- Общее -----------------------------------------------------------------

  Future<Position> _requestPosition({
    required LocationAccuracy accuracy,
    required Duration timeout,
    required int attempt,
  }) async {
    _log.step('getCurrentPosition accuracy=$accuracy attempt=$attempt');
    // .timeout() — страховка на случай, если платформа проигнорирует timeLimit
    // и Future зависнет: гарантируем типизированный TimeoutException.
    return _geolocator
        .getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: accuracy,
            timeLimit: timeout,
          ),
        )
        .timeout(timeout);
  }

  GeoSuccess _success(Position position) {
    final lowAccuracy = position.accuracy > _lowAccuracyThreshold;
    _log.step('success accuracy=${position.accuracy} low=$lowAccuracy');
    return GeoSuccess(
      latitude: position.latitude,
      longitude: position.longitude,
      lowAccuracy: lowAccuracy,
    );
  }

  /// Небезопасный (не-HTTPS) контекст на web. `localhost`/loopback браузеры
  /// считают безопасными. Вне web — всегда `false`.
  static bool _defaultInsecureProbe() {
    if (!kIsWeb) return false;
    final uri = Uri.base;
    if (uri.scheme == 'https' || uri.scheme == 'file' || uri.scheme == 'wss') {
      return false;
    }
    final host = uri.host;
    const secureHosts = {'localhost', '127.0.0.1', '::1'};
    if (secureHosts.contains(host) || host.endsWith('.localhost')) {
      return false;
    }
    return true;
  }

  /// Открыть системные настройки приложения (native). На web — no-op: у
  /// браузера нет системных настроек, а UI web-веток кнопку настроек не рисует.
  Future<void> openAppSettings() async {
    if (_isWeb) return;
    await _geolocator.openAppSettings();
  }

  /// Открыть системные настройки геолокации (native). На web — no-op.
  Future<void> openLocationSettings() async {
    if (_isWeb) return;
    await _geolocator.openLocationSettings();
  }
}
