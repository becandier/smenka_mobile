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
  }) = MainAppStateSuccess;
  factory MainAppState.loading() = MainAppStateLoading;
  factory MainAppState.error({
    required Object? error,
    required StackTrace? stackTrace,
  }) = MainAppStateError;
}
