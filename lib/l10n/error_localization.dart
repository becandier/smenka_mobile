import 'package:flutter/widgets.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Маппинг машинного `error.code` в локализованный текст.
///
/// Логику строим ТОЛЬКО по [code] (см. `docs/ERROR_FORMAT.md`), не по тексту
/// сообщения. Незнакомый код → фолбэк на [fallback] (обычно `error.message`
/// от бэка), а если и его нет — на общий «Произошла ошибка».
String localizedErrorMessage(
  BuildContext context, {
  String? code,
  String? fallback,
}) {
  final l10n = context.l10n;
  final mapped = switch (code) {
    'SHIFT_NOT_FOUND' => l10n.errorShiftNotFound,
    'ORG_NOT_FOUND' => l10n.errorOrgNotFound,
    'FORBIDDEN' => l10n.errorForbiddenShift,
    'INVALID_STATUS' => l10n.errorInvalidStatusFilter,
    _ => null,
  };
  return mapped ?? fallback ?? l10n.errorOccurred;
}
