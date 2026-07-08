import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Диалог «сервис геолокации выключен» (native). На web не показывается —
/// у браузера нет системного переключателя геолокации.
class GeoServiceDisabledDialog extends StatelessWidget {
  const GeoServiceDisabledDialog({this.onOpenLocationSettings, super.key});

  /// Открыть системные настройки геолокации (native).
  final VoidCallback? onOpenLocationSettings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.geoServiceDisabledTitle),
      content: Text(l10n.geoServiceDisabledMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onOpenLocationSettings?.call();
          },
          child: Text(l10n.geoOpenSettings),
        ),
      ],
    );
  }
}

/// Диалог «доступ к геолокации запрещён навсегда». Платформо-зависимый:
/// - **native** — кнопка «Открыть настройки приложения» ([onOpenAppSettings]);
/// - **web** — инструкция по включению доступа в настройках сайта и кнопка
///   «Повторить» ([onRetry]); кнопки системных настроек НЕТ (это был бы no-op).
class GeoDeniedForeverDialog extends StatelessWidget {
  const GeoDeniedForeverDialog({
    required this.isWeb,
    this.onRetry,
    this.onOpenAppSettings,
    super.key,
  });

  /// Ветка web (инструкция + «Повторить») vs native (настройки приложения).
  final bool isWeb;

  /// Повторный запрос доступа (web).
  final VoidCallback? onRetry;

  /// Открыть системные настройки приложения (native).
  final VoidCallback? onOpenAppSettings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(
        isWeb
            ? l10n.geoPermissionWebTitle
            : l10n.geoPermissionDeniedForeverTitle,
      ),
      content: Text(
        isWeb
            ? l10n.geoPermissionWebMessage
            : l10n.geoPermissionDeniedForeverMessage,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        if (isWeb)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onRetry?.call();
            },
            child: Text(l10n.geoRetry),
          )
        else
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onOpenAppSettings?.call();
            },
            child: Text(l10n.geoOpenAppSettings),
          ),
      ],
    );
  }
}

/// Показать диалог выключенного сервиса геолокации (native-флоу).
Future<void> showGeoServiceDisabledDialog(
  BuildContext context,
  GeoService geoService,
) {
  return showDialog<void>(
    context: context,
    builder: (_) => GeoServiceDisabledDialog(
      onOpenLocationSettings: geoService.openLocationSettings,
    ),
  );
}

/// Показать диалог «запрещено навсегда» с платформо-корректными действиями.
/// [isWeb] по умолчанию — [kIsWeb]; параметр вынесен для тестируемости.
Future<void> showGeoDeniedForeverDialog(
  BuildContext context, {
  required GeoService geoService,
  required VoidCallback onRetry,
  bool? isWeb,
}) {
  return showDialog<void>(
    context: context,
    builder: (_) => GeoDeniedForeverDialog(
      isWeb: isWeb ?? kIsWeb,
      onRetry: onRetry,
      onOpenAppSettings: geoService.openAppSettings,
    ),
  );
}
