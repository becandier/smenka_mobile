import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Что выбрал пользователь в [GeoFailureDialog]. Диалог сам ничего не делает —
/// возвращает намерение, а навигацию/повтор выполняет вызывающий экран (иначе
/// пришлось бы тащить в виджет роутер и кубит старта смены).
enum GeoFailureAction {
  /// «Повторить» — вызывающий код заново запускает то же действие.
  retry,

  /// «Как исправить» — открыть страницу «Проверка геолокации»
  /// (`geo_troubleshooting`).
  howToFix,

  /// «Открыть настройки приложения» (native, доступ запрещён навсегда).
  openAppSettings,

  /// «Включить» — системные настройки геолокации (native, сервис выключен).
  openLocationSettings,

  /// «Начать по фото» — фолбэк-старт смены (`shift_geo_photo_fallback`).
  startWithPhoto,
}

/// Единый диалог финальной гео-неудачи: покрывает все ветки [GeoFailure] и
/// показывает набор действий, осмысленный именно для этой ветки и платформы.
///
/// Почему один диалог на все ветки: набор действий у них общий («Повторить» +
/// «Как исправить» из `geo_troubleshooting` + «Начать по фото» из
/// `shift_geo_photo_fallback`), а различается только текст. Раздельные виджеты
/// пришлось бы синхронно расширять четырежды.
///
/// Для [GeoPermissionDeniedForever] на web текст выбирается по [blockLevel] —
/// результату пост-диагностики [GeoService.diagnoseBlockLevel] (см.
/// `docs/tasks/geo_troubleshooting/mobile.md`, сценарий 1).
class GeoFailureDialog extends StatelessWidget {
  const GeoFailureDialog({
    required this.failure,
    required this.isWeb,
    this.blockLevel = GeoBlockLevel.unknown,
    this.allowPhotoFallback = false,
    super.key,
  });

  /// Классифицированный отказ геолокации (`geo_service.dart`). Логика строится
  /// по типу/[GeoFailure.code], не по текстам.
  final GeoFailure failure;

  /// Ветка web (нет системных настроек у браузера) vs native.
  final bool isWeb;

  /// На каком уровне блок — только для [GeoPermissionDeniedForever] на web.
  final GeoBlockLevel blockLevel;

  /// Показывать ли «Начать по фото» (`shift_geo_photo_fallback`). Доступно
  /// только на старте смены в организации с геопроверкой; при серверном
  /// `GEO_CHECK_FAILED` (координаты есть, сотрудник вне зоны) этот диалог не
  /// показывается вовсе — обходить проверку зоны фото нельзя.
  final bool allowPhotoFallback;

  /// Повтор осмыслен везде, кроме «браузер не умеет геолокацию» — там ни
  /// повтор, ни настройки ничего не изменят.
  bool get _canRetry => failure is! GeoUnsupported;

  String _title(BuildContext context) {
    final l10n = context.l10n;
    return switch (failure) {
      GeoServiceDisabled() => l10n.geoServiceDisabledTitle,
      GeoPermissionDenied() => l10n.geoPermissionDeniedTitle,
      GeoPermissionDeniedForever() when !isWeb =>
        l10n.geoPermissionDeniedForeverTitle,
      GeoPermissionDeniedForever() =>
        blockLevel == GeoBlockLevel.system
            ? l10n.geoBlockedBySystemTitle
            : l10n.geoPermissionWebTitle,
      GeoUnavailable() => l10n.geoUnavailableTitle,
      GeoInsecureContext() => l10n.geoInsecureContextTitle,
      GeoUnsupported() => l10n.geoUnsupportedTitle,
    };
  }

  String _message(BuildContext context) {
    final l10n = context.l10n;
    return switch (failure) {
      GeoServiceDisabled() => l10n.geoServiceDisabledMessage,
      GeoPermissionDenied() => l10n.geoPermissionDenied,
      GeoPermissionDeniedForever() when !isWeb =>
        l10n.geoPermissionDeniedForeverMessage,
      GeoPermissionDeniedForever() => switch (blockLevel) {
        // Сайту доступ выдан, а позиции нет → запрещает ОС/браузер глобально.
        GeoBlockLevel.system => l10n.geoBlockedBySystemMessage,
        GeoBlockLevel.site => l10n.geoPermissionWebMessage,
        // Permissions API недоступен — универсальный текст про оба уровня.
        GeoBlockLevel.unknown => l10n.geoBlockedUnknownLevelMessage,
      },
      GeoUnavailable() => l10n.errorGeoUnavailable,
      GeoInsecureContext() => l10n.geoInsecureContextMessage,
      GeoUnsupported() => l10n.geoUnsupportedMessage,
    };
  }

  /// Кнопка системных настроек имеет смысл только на native: у браузера
  /// системных настроек нет, [GeoService.openAppSettings] там no-op.
  GeoFailureAction? get _settingsAction {
    if (isWeb) return null;
    return switch (failure) {
      GeoServiceDisabled() => GeoFailureAction.openLocationSettings,
      GeoPermissionDeniedForever() => GeoFailureAction.openAppSettings,
      _ => null,
    };
  }

  String _settingsLabel(BuildContext context, GeoFailureAction action) =>
      switch (action) {
        GeoFailureAction.openLocationSettings => context.l10n.geoOpenSettings,
        _ => context.l10n.geoOpenAppSettings,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settingsAction = _settingsAction;

    return AlertDialog(
      title: Text(_title(context)),
      content: Text(_message(context)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(GeoFailureAction.howToFix),
          child: Text(l10n.geoHowToFix),
        ),
        if (allowPhotoFallback)
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(GeoFailureAction.startWithPhoto),
            child: Text(l10n.shiftStartWithPhoto),
          ),
        if (settingsAction != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop(settingsAction),
            child: Text(_settingsLabel(context, settingsAction)),
          )
        else if (_canRetry)
          TextButton(
            onPressed: () => Navigator.of(context).pop(GeoFailureAction.retry),
            child: Text(l10n.geoRetry),
          ),
      ],
    );
  }
}

/// Показать [GeoFailureDialog] и вернуть выбранное действие (`null` — закрыт
/// без выбора). [isWeb] по умолчанию — [kIsWeb]; параметр вынесен для тестов.
Future<GeoFailureAction?> showGeoFailureDialog(
  BuildContext context, {
  required GeoFailure failure,
  GeoBlockLevel blockLevel = GeoBlockLevel.unknown,
  bool allowPhotoFallback = false,
  bool? isWeb,
}) {
  return showDialog<GeoFailureAction>(
    context: context,
    builder: (_) => GeoFailureDialog(
      failure: failure,
      isWeb: isWeb ?? kIsWeb,
      blockLevel: blockLevel,
      allowPhotoFallback: allowPhotoFallback,
    ),
  );
}
