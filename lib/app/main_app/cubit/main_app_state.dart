part of 'main_app_cubit.dart';

@freezed
sealed class MainAppState with _$MainAppState {
  MainAppState._();

  /// Success app with all dependencies
  factory MainAppState.success({
    required AppConfig appConfig,
    required SharedPreferences sharedPreferences,
    required PackageInfo packageInfo,
    required Talker talker,
    required Dio dio,
    required IDebugRepositoryImp debugRepository,
    required ThemeMode themeMode,
    required AuthStateNotifier authNotifier,
    required AuthRepository authRepository,
    required ShiftRepository shiftRepository,
    required OrganizationRepository organizationRepository,
    required OrganizationRoleRepository organizationRoleRepository,
    required ChecklistRepository checklistRepository,
    required UserRepository userRepository,
    required LocationRepository locationRepository,
    required PayrollRepository payrollRepository,
    required DeepLinkService deepLinkService,
    required PendingInviteStorage pendingInviteStorage,
    required ShiftContextStorage shiftContextStorage,
  }) = MainAppStateSuccess;
  factory MainAppState.loading() = MainAppStateLoading;
  factory MainAppState.error({
    required Object? error,
    required StackTrace? stackTrace,
  }) = MainAppStateError;
}
