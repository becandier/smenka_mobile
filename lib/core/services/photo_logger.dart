import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Пошаговый структурированный логгер `PhotoPickerService` (образец —
/// `GeoLogger`).
///
/// Что и куда пишется:
/// - **debug-консоль** (`dart:developer`, `name: 'PhotoPickerService'`) —
///   только под [kDebugMode], чтобы при локальной отладке видеть источник,
///   платформу, этап пайплайна, длины буферов и реальную причину исключения;
/// - **хлебные крошки Crashlytics** — в любой сборке, чтобы по цепочке крошек
///   восстановить, на каком шаге выбора/подготовки кадра всё пошло не так;
/// - **non-fatal-репорты Crashlytics** ([error]) — с настоящим объектом
///   исключения и его стеком: главный инструмент диагностики, которого не
///   хватало (раньше причина глоталась слепым `catch`).
///
/// В крошки и репорты **никогда** не попадают байты/содержимое кадра — только
/// этап, `runtimeType`, `toString`, длины и `name`/`mimeType` файла.
///
/// Логгер намеренно «не падает»: любой сбой логирования (Firebase не
/// инициализирован в тестах/на web/раннем старте) молча проглатывается —
/// диагностика не должна ронять бизнес-флоу выбора фото.
///
/// Расширяемость: и крошка, и репорт — инъектируемые функции. Второй sink
/// прод-телеметрии web (Sentry/бэкенд-эндпоинт, см. ТЗ §8) добавляется здесь,
/// без правок сервиса.
class PhotoLogger {
  PhotoLogger({
    void Function(String message)? breadcrumb,
    void Function(String stage, Object error, StackTrace stackTrace)?
    recordError,
  }) : _breadcrumb = breadcrumb ?? _crashlyticsBreadcrumb,
       _recordError = recordError ?? _crashlyticsRecordError;

  /// Логгер без побочных эффектов — для юнит-тестов и сред без Firebase.
  PhotoLogger.silent()
    : _breadcrumb = _noopBreadcrumb,
      _recordError = _noopError;

  final void Function(String message) _breadcrumb;
  final void Function(String stage, Object error, StackTrace stackTrace)
  _recordError;

  /// Крошка о шаге пайплайна: под [kDebugMode] дублируется в debug-консоль.
  void step(String message) {
    if (kDebugMode) {
      developer.log(message, name: 'PhotoPickerService');
    }
    try {
      _breadcrumb(message);
    } catch (_) {
      // Крошки не критичны — глотаем любые сбои логгера.
    }
  }

  /// Ошибка этапа [stage]: крошка (тип + текст, без байтов кадра) + non-fatal
  /// репорт в Crashlytics с настоящим исключением и стеком.
  void error(String stage, Object e, StackTrace st) {
    step('error stage=$stage type=${e.runtimeType}: $e');
    try {
      _recordError(stage, e, st);
    } catch (_) {
      // Репорт не критичен — глотаем любые сбои логгера.
    }
  }

  static void _noopBreadcrumb(String _) {}

  static void _noopError(String _, Object __, StackTrace ___) {}

  static void _crashlyticsBreadcrumb(String message) {
    try {
      FirebaseCrashlytics.instance.log('[photo] $message');
    } catch (_) {
      // Firebase может быть не инициализирован (web/тесты) — молча пропускаем.
    }
  }

  static void _crashlyticsRecordError(String stage, Object e, StackTrace st) {
    try {
      FirebaseCrashlytics.instance.recordError(
        e,
        st,
        reason: 'photo/$stage',
        // Явно non-fatal: фото-сбой не крэш, а диагностический сигнал.
        // ignore: avoid_redundant_argument_values
        fatal: false,
      );
    } catch (_) {
      // Firebase может быть не инициализирован (web/тесты) — молча пропускаем.
    }
  }
}
