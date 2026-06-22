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
    'FORBIDDEN' => l10n.errorForbidden,
    'INVALID_STATUS' => l10n.errorInvalidStatusFilter,
    'INVALID_PERIOD' => l10n.errorInvalidPeriod,
    'INVALID_DATE_RANGE' => l10n.errorInvalidDateRange,
    'MISSING_STATS_RANGE' => l10n.errorMissingStatsRange,
    'AMBIGUOUS_STATS_RANGE' => l10n.errorAmbiguousStatsRange,
    'RATE_NOT_FOUND' => l10n.errorRateNotFound,
    'RATE_EFFECTIVE_FROM_TAKEN' => l10n.errorRateEffectiveFromTaken,
    'MEMBER_NOT_FOUND' => l10n.errorMemberNotFound,
    'VALIDATION_ERROR' => l10n.errorValidation,
    // security_hardening: реакция на усиление безопасности бэка
    'ACCOUNT_LOCKED' => l10n.errorAccountLocked,
    'RATE_LIMIT_EXCEEDED' => l10n.errorRateLimitExceeded,
    'TOO_MANY_CODE_ATTEMPTS' => l10n.errorTooManyCodeAttempts,
    // file_storage: загрузка/выдача файлов
    'FILE_TOO_LARGE' => l10n.errorFileTooLarge,
    'UNSUPPORTED_FILE_TYPE' => l10n.errorUnsupportedFileType,
    'STORAGE_UNAVAILABLE' => l10n.errorStorageUnavailable,
    'FILE_NOT_FOUND' => l10n.errorFileNotFound,
    'FILE_IN_USE' => l10n.errorFileInUse,
    'INVALID_FILE_CATEGORY' => l10n.errorInvalidFileCategory,
    // checklist_photos: фото к пунктам чек-листов
    'PHOTO_NOT_ALLOWED' => l10n.errorPhotoNotAllowed,
    'PHOTO_LIMIT_EXCEEDED' => l10n.errorPhotoLimitExceeded,
    'PHOTO_NOT_FOUND' => l10n.errorPhotoNotFound,
    'PHOTO_FILE_INVALID' => l10n.errorPhotoFileInvalid,
    'SHIFT_FINISHED' => l10n.errorShiftFinished,
    'INSTANCE_NOT_FOUND' => l10n.errorInstanceNotFound,
    'ITEM_NOT_FOUND' => l10n.errorItemNotFound,
    // shift_work_location: привязка рабочей точки к смене
    'WORK_LOCATION_REQUIRED' => l10n.errorWorkLocationRequired,
    'WORK_LOCATION_NOT_FOUND' => l10n.errorWorkLocationNotFound,
    // fines: штрафы
    'PENALTY_NOT_FOUND' => l10n.errorPenaltyNotFound,
    'PENALTY_TEMPLATE_NOT_FOUND' => l10n.errorPenaltyTemplateNotFound,
    // сетевые ошибки (см. ApiErrorInterceptor) → единое «нет соединения»
    'NETWORK_ERROR' || 'CONNECTION_ERROR' => l10n.commonNoConnection,
    _ => null,
  };
  return mapped ?? fallback ?? l10n.errorOccurred;
}
