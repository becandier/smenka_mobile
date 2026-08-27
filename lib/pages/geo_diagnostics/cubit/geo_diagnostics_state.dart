import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';

part 'geo_diagnostics_state.freezed.dart';

/// Для какой платформы показывать инструкции на странице «Проверка
/// геолокации» (`geo_troubleshooting`, сценарий 2).
///
/// На web разрешение двухуровневое: настройки сайта в браузере + разрешение
/// геолокации самому браузеру в ОС — поэтому web-варианты различают именно ОС.
enum GeoInstructionsTarget {
  webMacOs,
  webWindows,
  webAndroid,
  webIos,

  /// Web на неопознанной/прочей ОС — универсальная инструкция.
  webOther,

  /// Наше нативное приложение: настройки приложения + службы геолокации.
  nativeApp,
}

/// Определяет набор инструкций по платформе.
///
/// На web `defaultTargetPlatform` вычисляет Flutter-движок по данным браузера
/// (userAgent/navigator.platform) — это и есть требуемое ТЗ «по User-Agent»,
/// только без собственного парсера и без js-interop-зависимости.
GeoInstructionsTarget resolveGeoInstructionsTarget({
  required bool isWeb,
  required TargetPlatform platform,
}) {
  if (!isWeb) return GeoInstructionsTarget.nativeApp;
  return switch (platform) {
    TargetPlatform.macOS => GeoInstructionsTarget.webMacOs,
    TargetPlatform.windows => GeoInstructionsTarget.webWindows,
    TargetPlatform.android => GeoInstructionsTarget.webAndroid,
    TargetPlatform.iOS => GeoInstructionsTarget.webIos,
    TargetPlatform.linux ||
    TargetPlatform.fuchsia => GeoInstructionsTarget.webOther,
  };
}

@freezed
abstract class GeoDiagnosticsState with _$GeoDiagnosticsState {
  const factory GeoDiagnosticsState({
    /// Платформа для блока инструкций — известна сразу, не грузится.
    required GeoInstructionsTarget target,

    /// Текущее состояние разрешений (`GeoService.diagnose`).
    @Default(SectionData<GeoDiagnostics>()) SectionData<GeoDiagnostics> status,

    /// Результат ручного теста «Проверить геолокацию». `success` здесь значит
    /// «тест доведён до конца», а сам исход — внутри [GeoResult]: успех или
    /// классифицированный [GeoFailure].
    @Default(SectionData<GeoResult>()) SectionData<GeoResult> test,
  }) = _GeoDiagnosticsState;
  const GeoDiagnosticsState._();

  /// Web-платформа: инструкции двухуровневые, кнопок системных настроек нет.
  bool get isWeb => target != GeoInstructionsTarget.nativeApp;
}
