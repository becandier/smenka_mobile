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
    'INVALID_PERIOD' => l10n.errorInvalidPeriod,
    'INVALID_DATE_RANGE' => l10n.errorInvalidDateRange,
    'MISSING_STATS_RANGE' => l10n.errorMissingStatsRange,
    'AMBIGUOUS_STATS_RANGE' => l10n.errorAmbiguousStatsRange,
    'RATE_NOT_FOUND' => l10n.errorRateNotFound,
    'RATE_EFFECTIVE_FROM_TAKEN' => l10n.errorRateEffectiveFromTaken,
    'MEMBER_NOT_FOUND' => l10n.errorMemberNotFound,
    'VALIDATION_ERROR' => l10n.errorValidation,
    _ => null,
  };
  return mapped ?? fallback ?? l10n.errorOccurred;
}
