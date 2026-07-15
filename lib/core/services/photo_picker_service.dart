import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smenka_mobile/core/services/photo_logger.dart';

// =============================================================================
// Таксономия результата
// =============================================================================

/// Машинные коды ошибок выбора/подготовки фото для локализации (см.
/// `l10n/error_localization.dart`). По коду строится UX — не по тексту.
///
/// Серверный `PHOTO_FILE_INVALID` (ошибка attach, см. `docs/ERROR_FORMAT.md`) в
/// эту таксономию НЕ входит: он остаётся ошибкой бэкенда на плитке черновика.
/// Клиентский флоу его больше не эмитит.
const photoPermissionDeniedCode = 'PHOTO_PERMISSION_DENIED';
const photoReadFailedCode = 'PHOTO_READ_FAILED';
const photoFileEmptyCode = 'PHOTO_FILE_EMPTY';
const photoDecodeFailedCode = 'PHOTO_DECODE_FAILED';
const photoPickFailedCode = 'PHOTO_PICK_FAILED';

/// Результат выбора и подготовки фото. `sealed` — вызывающий код обязан
/// разобрать все ветки (exhaustive switch).
sealed class PhotoPickResult {
  const PhotoPickResult();
}

/// Кадр выбран, прочитан и подготовлен: JPEG, ориентация впечатана. **Меньшая**
/// сторона приведена к ~`maxSide`; большая сторона НЕ гарантируется — детали
/// `compressWithList` расходятся по платформам (native скейлит по min-сторонам:
/// `4032×3024 → 2133×1600`; web 0.1.5 капит только ширину). Точный кап по
/// большей стороне — на потребителе (для чек-листов это `burnStamp`). Готов к
/// дальнейшей обработке (штамп) и аплоаду.
class PhotoPickSuccess extends PhotoPickResult {
  const PhotoPickSuccess({
    required this.bytes,
    this.sourceName,
    this.sourceMimeType,
    this.unprocessed = false,
  });

  final Uint8List bytes;

  /// `XFile.name` — для логов/диагностики.
  final String? sourceName;

  /// `XFile.mimeType` — для логов/диагностики.
  final String? sourceMimeType;

  /// `true` — ресайз/пере-кодирование не удалось, отданы исходные байты
  /// (fallback только web, см. пайплайн). Потребитель может учитывать при
  /// лимитах аплоада.
  final bool unprocessed;
}

/// Пользователь закрыл пикер. НЕ ошибка: ни тоста, ни лога уровня error.
class PhotoPickCancelled extends PhotoPickResult {
  const PhotoPickCancelled();
}

/// База всех неуспешных исходов. Несёт машинный [code] для локализации и
/// необязательный [detail] (сырой текст исключения — только для логов).
sealed class PhotoPickFailure extends PhotoPickResult {
  const PhotoPickFailure({this.detail});

  final String? detail;

  String get code;
}

/// Native `PlatformException` доступа: `camera_access_denied` /
/// `photo_access_denied`. UX: тост «Нет доступа — разрешите в настройках».
class PhotoPermissionDenied extends PhotoPickFailure {
  const PhotoPermissionDenied({super.detail});

  @override
  String get code => photoPermissionDeniedCode;
}

/// `readAsBytes()` упал после ретрая (blob инвалидирован: page eviction iOS
/// Safari, файл вычищен ОС). UX: «Не удалось прочитать фото, снимите заново».
class PhotoReadFailed extends PhotoPickFailure {
  const PhotoReadFailed({super.detail});

  @override
  String get code => photoReadFailedCode;
}

/// После успешного чтения `bytes.isEmpty` (известный кейс iOS Safari). Тот же
/// UX, что [PhotoReadFailed] — отдельный код ради диагностики.
class PhotoFileEmpty extends PhotoPickFailure {
  const PhotoFileEmpty({super.detail});

  @override
  String get code => photoFileEmptyCode;
}

/// Кадр не декодится/не пере-кодируется и fallback невозможен (native). UX:
/// «Не удалось обработать фото, попробуйте другое».
class PhotoDecodeFailed extends PhotoPickFailure {
  const PhotoDecodeFailed({super.detail});

  @override
  String get code => photoDecodeFailedCode;
}

/// Любая прочая ошибка этапа pick (`already_active`, `web.Event` из onerror
/// пикера и т.п.). UX: «Не удалось открыть камеру/галерею, повторите».
class PhotoPickFailed extends PhotoPickFailure {
  const PhotoPickFailed({super.detail});

  @override
  String get code => photoPickFailedCode;
}

// =============================================================================
// Сервис
// =============================================================================

/// Источник кадра.
enum PhotoSource { camera, gallery }

/// Ресайз + пере-кодирование в JPEG. По умолчанию — обёртка над
/// `FlutterImageCompress.compressWithList`; инъекция для тестов.
typedef PhotoCompressor =
    Future<Uint8List> Function(Uint8List bytes, {int maxSide, int quality});

/// Единая точка выбора и подготовки фото во всём приложении (пока единственный
/// потребитель — заполнение чек-листов, но сервис общий: аватарки и др.).
///
/// Контракт — как у `GeoService`: **никогда не бросает**, всегда возвращает
/// типизированный [PhotoPickResult]. Публичный метод оборачивает весь пайплайн
/// в финальный `on Object` (последний рубеж → [PhotoPickFailed]), внутри —
/// этапы с точечной классификацией.
///
/// Почему `on Object`, а не `on Exception`: JS-интероп-ошибки на web
/// (`DOMException` от `createImageBitmap`, `web.Event` из `onerror` пикера) —
/// **не** Dart `Exception`, `on Exception` их не ловит и они пролетают как
/// uncaught без фидбека.
///
/// Антифрод-штамп в сервис НЕ входит (см. ТЗ §3.6): он зависит от результата
/// `GeoService`, который потребитель запрашивает уже после показа
/// плейсхолдера, — пайплайн всё равно разрывается на границе «подготовленные
/// байты».
class PhotoPickerService {
  PhotoPickerService({
    ImagePicker? picker,
    PhotoLogger? logger,
    bool? isWeb,
    PhotoCompressor? compressor,
    this.readRetryDelay = const Duration(milliseconds: 300),
  }) : _picker = picker ?? ImagePicker(),
       _log = logger ?? PhotoLogger(),
       _isWeb = isWeb ?? kIsWeb,
       _compress = compressor ?? _defaultCompressor;

  final ImagePicker _picker;
  final PhotoLogger _log;
  final bool _isWeb;
  final PhotoCompressor _compress;

  /// Пауза перед единственным ретраем чтения байтов (транзиентные сбои
  /// blob/файловой системы).
  final Duration readRetryDelay;

  /// Выбрать и подготовить фото. Никогда не бросает — всегда [PhotoPickResult].
  Future<PhotoPickResult> pickPhoto({
    required PhotoSource source,
    int maxSide = 1600,
    int quality = 88,
  }) async {
    _log.step(
      'start source=${source.name} platform=${_isWeb ? 'web' : 'native'}',
    );
    try {
      // --- Этап 1: pick ---
      // Без imageQuality/maxWidth: любой из них форсирует в
      // image_picker_for_web полный canvas-пере-энкод каждого кадра (лишний
      // ~48 МБ RGBA на iOS Safari, риск зависания при toBlob → null).
      // Единственный ресайз — этап 3.
      final XFile? picked;
      try {
        picked = await _picker.pickImage(
          source: source == PhotoSource.camera
              ? ImageSource.camera
              : ImageSource.gallery,
        );
      } on PlatformException catch (e, st) {
        _log.error('pick', e, st);
        if (e.code == 'camera_access_denied' ||
            e.code == 'photo_access_denied') {
          return PhotoPermissionDenied(detail: e.toString());
        }
        return PhotoPickFailed(detail: e.toString());
      } on Object catch (e, st) {
        // Сюда попадают JS-интероп значения (web.Event из onerror пикера) —
        // это не Dart Exception, `on Exception` их бы не поймал.
        _log.error('pick', e, st);
        return PhotoPickFailed(detail: e.toString());
      }

      if (picked == null) {
        _log.step('cancelled');
        return const PhotoPickCancelled();
      }
      _log.step('picked name=${picked.name} mime=${picked.mimeType}');

      // --- Этап 2: read ---
      final read = await _read(picked);
      final Uint8List original;
      switch (read) {
        case _ReadOk(:final bytes):
          original = bytes;
        case _ReadError(:final detail):
          return PhotoReadFailed(detail: detail);
        case _ReadEmpty():
          return const PhotoFileEmpty();
      }
      _log.step('read bytes=${original.length}');

      // --- Этап 3: prepare (единственный проход ресайза/пере-кодирования) ---
      final prepared = await _prepare(
        original: original,
        maxSide: maxSide,
        quality: quality,
      );
      if (prepared == null) {
        // native: fallback невозможен (битый кадр / возможен HEIC).
        return const PhotoDecodeFailed();
      }
      return PhotoPickSuccess(
        bytes: prepared.bytes,
        sourceName: picked.name,
        sourceMimeType: picked.mimeType,
        unprocessed: prepared.unprocessed,
      );
    } on Object catch (e, st) {
      // Последний рубеж: любую неклассифицированную ошибку отдаём как
      // PhotoPickFailed, а не роняем вызывающий код.
      _log.error('unexpected', e, st);
      return PhotoPickFailed(detail: e.toString());
    }
  }

  /// Чтение байтов кадра: `on Object` (не `Exception`), один ретрай через
  /// [readRetryDelay] при сбое, отдельный ретрай при пустом результате.
  Future<_ReadOutcome> _read(XFile picked) async {
    Uint8List bytes;
    try {
      bytes = await picked.readAsBytes();
    } on Object catch (e, st) {
      _log.error('read', e, st);
      await Future<void>.delayed(readRetryDelay);
      try {
        bytes = await picked.readAsBytes();
      } on Object catch (e2, st2) {
        _log.error('read-retry', e2, st2);
        return _ReadError(e2.toString());
      }
    }

    if (bytes.isEmpty) {
      // Известный кейс iOS Safari: первое чтение отдаёт 0 байт без исключения.
      _log.step('read empty, retry');
      await Future<void>.delayed(readRetryDelay);
      try {
        bytes = await picked.readAsBytes();
      } on Object catch (e, st) {
        _log.error('read-empty-retry', e, st);
        return _ReadError(e.toString());
      }
      if (bytes.isEmpty) {
        _log.step('read empty after retry');
        return const _ReadEmpty();
      }
    }

    return _ReadOk(bytes);
  }

  /// Ресайз + JPEG. `null` → декод/пере-кодирование провалено и fallback
  /// невозможен (native). Иначе — байты (ресайзнутые либо оригинал при
  /// web-fallback) и флаг `unprocessed`.
  Future<({Uint8List bytes, bool unprocessed})?> _prepare({
    required Uint8List original,
    required int maxSide,
    required int quality,
  }) async {
    try {
      // Native: нативный декод (в т.ч. HEIC), выправление ориентации по EXIF
      // (autoCorrectionAngle), JPEG. Web (flutter_image_compress_web):
      // createImageBitmap(Blob) → canvas → toDataURL.
      final resized = await _compress(
        original,
        maxSide: maxSide,
        quality: quality,
      );
      if (resized.isEmpty) {
        // Известный кейс iOS Safari: лимиты canvas → toDataURL возвращает
        // "data:," → base64Decode('') — пустые байты без исключения. Без этой
        // проверки на сервер уехал бы 0-байтный файл.
        _log.step('prepare empty result');
        return _fallbackOrFail(original, reason: 'empty compressor result');
      }
      _log.step('prepare bytes=${resized.length}');
      return (bytes: resized, unprocessed: false);
    } on Object catch (e, st) {
      // Reject промиса createImageBitmap прилетает как JS DOMException/JSObject
      // — не Dart Exception.
      _log.error('prepare', e, st);
      return _fallbackOrFail(original, reason: e.toString());
    }
  }

  /// Fallback только на web: браузерные/iOS-камеры отдают валидный JPEG —
  /// лучше загрузить неужатый кадр, чем заблокировать сотрудника на смене. На
  /// native fallback нет: сбой означает реально битый кадр (или HEIC, который
  /// сервер/штамп не переварят) → `null` (потребитель отдаст [PhotoDecodeFailed]).
  ({Uint8List bytes, bool unprocessed})? _fallbackOrFail(
    Uint8List original, {
    required String reason,
  }) {
    if (_isWeb) {
      _log.step('prepare fallback (web) unprocessed reason=$reason');
      return (bytes: original, unprocessed: true);
    }
    _log.step('prepare failed (native) reason=$reason');
    return null;
  }

  static Future<Uint8List> _defaultCompressor(
    Uint8List bytes, {
    int maxSide = 1600,
    int quality = 88,
  }) {
    // minWidth/minHeight ограничивают МЕНЬШУЮ сторону: кадр скейлится так, что
    // меньшая сторона ≈ maxSide, а большая остаётся больше (напр. 4032×3024 →
    // 2133×1600). autoCorrectionAngle по умолчанию true. Точный кап по большей
    // стороне здесь НЕ делаем (второй decode-проход дорог и не нужен) — его
    // выполняет burnStamp у потребителя перед аплоадом.
    return FlutterImageCompress.compressWithList(
      bytes,
      minWidth: maxSide,
      minHeight: maxSide,
      quality: quality,
    );
  }
}

// --- Внутренние исходы этапа чтения (не экспортируются) ---

sealed class _ReadOutcome {
  const _ReadOutcome();
}

class _ReadOk extends _ReadOutcome {
  const _ReadOk(this.bytes);

  final Uint8List bytes;
}

class _ReadError extends _ReadOutcome {
  const _ReadError(this.detail);

  final String? detail;
}

class _ReadEmpty extends _ReadOutcome {
  const _ReadEmpty();
}
