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
    // auth: вход по логину или email (admin_created_accounts)
    'INVALID_CREDENTIALS' => l10n.authInvalidCredentials,
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
    // photo_picker_service: клиентские коды выбора/подготовки кадра
    'PHOTO_PERMISSION_DENIED' => l10n.errorPhotoPermissionDenied,
    'PHOTO_READ_FAILED' => l10n.errorPhotoReadFailed,
    'PHOTO_FILE_EMPTY' => l10n.errorPhotoFileEmpty,
    'PHOTO_DECODE_FAILED' => l10n.errorPhotoDecodeFailed,
    'PHOTO_PICK_FAILED' => l10n.errorPhotoPickFailed,
    'SHIFT_FINISHED' => l10n.errorShiftFinished,
    'INSTANCE_NOT_FOUND' => l10n.errorInstanceNotFound,
    'ITEM_NOT_FOUND' => l10n.errorItemNotFound,
    // shift_work_location: привязка рабочей точки к смене
    'WORK_LOCATION_REQUIRED' => l10n.errorWorkLocationRequired,
    'WORK_LOCATION_NOT_FOUND' => l10n.errorWorkLocationNotFound,
    // work_schedules: выбор графика при старте смены + переработки
    'SCHEDULE_REQUIRED' => l10n.errorScheduleRequired,
    'SCHEDULE_NOT_AVAILABLE' => l10n.errorScheduleNotAvailable,
    'SCHEDULE_NOT_FOUND' => l10n.errorScheduleNotFound,
    // schedule_window_enforcement: старт вне окна графика
    'SCHEDULE_WINDOW_CLOSED' => l10n.errorScheduleWindowClosed,
    // shift_geo_photo_fallback: фото вместо координат при старте смены
    'GEO_FALLBACK_PHOTO_INVALID' => l10n.errorGeoFallbackPhotoInvalid,
    'OVERTIME_ALREADY_REQUESTED' => l10n.errorOvertimeAlreadyRequested,
    'OVERTIME_PERIOD_EXPIRED' => l10n.errorOvertimePeriodExpired,
    'OVERTIME_NOT_APPLICABLE' => l10n.errorOvertimeNotApplicable,
    'OVERTIME_REQUEST_NOT_FOUND' => l10n.errorOvertimeRequestNotFound,
    'OVERTIME_ALREADY_REVIEWED' => l10n.errorOvertimeAlreadyReviewed,
    // fines: штрафы
    'PENALTY_NOT_FOUND' => l10n.errorPenaltyNotFound,
    'PENALTY_TEMPLATE_NOT_FOUND' => l10n.errorPenaltyTemplateNotFound,
    // knowledge_base: база знаний (узел не найден / доступ отозван / чужая org)
    'KNOWLEDGE_NODE_NOT_FOUND' => l10n.errorKnowledgeNodeNotFound,
    // notifications: центр уведомлений
    'NOTIFICATION_NOT_FOUND' => l10n.errorNotificationNotFound,
    // employee_tests: прохождение тестов сотрудником
    'TEST_ATTEMPTS_EXHAUSTED' => l10n.errorTestAttemptsExhausted,
    'TEST_ALREADY_PASSED' => l10n.errorTestAlreadyPassed,
    'TEST_ATTEMPT_ALREADY_SUBMITTED' => l10n.errorTestAttemptAlreadySubmitted,
    'TEST_ATTEMPT_IN_PROGRESS' => l10n.errorTestAttemptInProgress,
    'TEST_TEMPLATE_ARCHIVED' => l10n.errorTestTemplateArchived,
    'TEST_ASSIGNMENT_NOT_FOUND' => l10n.errorTestAssignmentNotFound,
    'TEST_TEMPLATE_DELETED' => l10n.errorTestTemplateDeleted,
    // Гео-отказы здесь НЕ маппятся: они клиентские (geo_service.dart) и никогда
    // не приходят как error.code с бэка. Отказы геолокации доводятся до UI
    // типизированно — StartShiftResult (shift_tracker → idle_shift_content) и
    // PhotoNotice (checklist_fill) — и локализуются напрямую через l10n.*,
    // а не через этот маппинг. Не добавлять сюда GEO_* коды: будут dead code.
    // oauth_login: вход через Google/Apple
    'INVALID_OAUTH_TOKEN' => l10n.errorInvalidOauthToken,
    'OAUTH_EMAIL_NOT_VERIFIED' => l10n.errorOauthEmailNotVerified,
    'OAUTH_PROVIDER_UNAVAILABLE' => l10n.errorOauthProviderUnavailable,
    // клиентский код (google_sign_in/sign_in_with_apple SDK) — LoginCubit
    'OAUTH_CLIENT_ERROR' => l10n.errorOauthClientError,
    // tariffs: тарифы и подписки организаций. Тексты не содержат слов
    // «оплата»/«тариф»/«долг» там, где код может увидеть employee
    // (SUBSCRIPTION_INACTIVE — старт смены; PLAN_LIMIT_REACHED — вступление
    // по инвайту) — тарифные вопросы решает руководитель, см. mobile.md.
    'SUBSCRIPTION_INACTIVE' => l10n.errorSubscriptionInactive,
    'PLAN_LIMIT_REACHED' => l10n.errorPlanLimitReached,
    'PLAN_FEATURE_UNAVAILABLE' => l10n.errorPlanFeatureUnavailable,
    // сетевые ошибки (см. ApiErrorInterceptor) → единое «нет соединения»
    'NETWORK_ERROR' || 'CONNECTION_ERROR' => l10n.commonNoConnection,
    _ => null,
  };
  return mapped ?? fallback ?? l10n.errorOccurred;
}
