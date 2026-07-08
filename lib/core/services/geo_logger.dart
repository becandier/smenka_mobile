import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Пошаговый структурированный логгер `GeoService`.
///
/// Что и куда пишется:
/// - **debug-консоль** (`dart:developer`, `name: 'GeoService'`) — только под
///   [kDebugMode], чтобы при локальной отладке видеть платформу, состояние
///   разрешения, выбранную точность, номер попытки и ошибку;
/// - **хлебные крошки Crashlytics** — в любой сборке, чтобы на проде по
///   последовательности крошек восстановить, на каком шаге гео-флоу всё пошло
///   не так (модалка «Открыть настройки», таймаут GPS и т.п.).
///
/// Логгер намеренно «не падает»: любой сбой логирования (Firebase не
/// инициализирован в тестах/раннем старте) молча проглатывается — диагностика
/// не должна ронять бизнес-флоу получения позиции.
class GeoLogger {
  GeoLogger({void Function(String message)? breadcrumb})
    : _breadcrumb = breadcrumb ?? _crashlyticsBreadcrumb;

  /// Логгер без побочных эффектов — для юнит-тестов и сред без Firebase.
  GeoLogger.silent() : _breadcrumb = _noop;

  final void Function(String message) _breadcrumb;

  void step(String message) {
    if (kDebugMode) {
      developer.log(message, name: 'GeoService');
    }
    try {
      _breadcrumb(message);
    } catch (_) {
      // Крошки не критичны — глотаем любые сбои логгера.
    }
  }

  static void _noop(String _) {}

  static void _crashlyticsBreadcrumb(String message) {
    try {
      FirebaseCrashlytics.instance.log('[geo] $message');
    } catch (_) {
      // Firebase может быть не инициализирован — молча пропускаем.
    }
  }
}
