import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/pages/geo_diagnostics/cubit/geo_diagnostics_state.dart';

/// Кубит страницы «Проверка геолокации» (`geo_troubleshooting`).
///
/// Ни от каких других кубитов не зависит: единственный источник данных —
/// [GeoService]. Состояние разрешений и результат ручного теста живут в
/// отдельных `SectionData`, чтобы тест не затирал статус и наоборот.
class GeoDiagnosticsCubit extends Cubit<GeoDiagnosticsState> {
  GeoDiagnosticsCubit({
    required GeoService geoService,
    TargetPlatform? platform,
  }) : _geoService = geoService,
       super(
         GeoDiagnosticsState(
           target: resolveGeoInstructionsTarget(
             isWeb: geoService.isWeb,
             platform: platform ?? defaultTargetPlatform,
           ),
         ),
       ) {
    unawaited(loadStatus());
  }

  final GeoService _geoService;

  /// Перечитать состояние разрешений (при открытии экрана, по кнопке
  /// «Обновить статус» и после теста — браузерный prompt мог его изменить).
  Future<void> loadStatus() async {
    emit(state.copyWith(status: state.status.toLoading()));
    final diagnostics = await _geoService.diagnose();
    if (isClosed) return;
    emit(state.copyWith(status: state.status.toSuccess(diagnostics)));
  }

  /// Прогнать боевой сценарий получения позиции — тем же путём, что и старт
  /// смены, чтобы пользователь увидел ровно ту ошибку, которая ему мешает.
  Future<void> runTest() async {
    if (state.test.isLoading) return;
    emit(state.copyWith(test: state.test.toLoading()));
    final result = await _geoService.getCurrentPosition();
    if (isClosed) return;
    emit(state.copyWith(test: state.test.toSuccess(result)));
    // Тест мог показать браузерный prompt и изменить состояние разрешения —
    // сразу подтягиваем актуальный статус.
    await loadStatus();
  }

  /// Системные настройки приложения (native; на web — no-op в [GeoService]).
  Future<void> openAppSettings() => _geoService.openAppSettings();

  /// Системные настройки геолокации (native; на web — no-op).
  Future<void> openLocationSettings() => _geoService.openLocationSettings();
}
