part of 'app.dart';

class _SuccessApp extends StatefulWidget {
  const _SuccessApp({
    required this.appConfig,
    required this.sharedPreferences,
    required this.packageInfo,
    required this.talker,
    required this.dio,
    required this.debugRepository,
    required this.themeMode,
    required this.authNotifier,
  });
  final AppConfig appConfig;
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;
  final Talker talker;
  final Dio dio;
  final IDebugRepositoryImp debugRepository;
  final ThemeMode themeMode;
  final AuthStateNotifier authNotifier;

  @override
  State<_SuccessApp> createState() => _SuccessAppState();
}

class _SuccessAppState extends State<_SuccessApp> {
  // Local device
  Locale? _deviceLocale;

  // Router
  late AppRouter _router;
  @override
  void initState() {
    super.initState();
    _deviceLocale = PlatformDispatcher.instance.locale;
    _router = AppRouter(authNotifier: widget.authNotifier);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.appConfig),
        RepositoryProvider.value(value: widget.sharedPreferences),
        RepositoryProvider.value(value: widget.packageInfo),
        RepositoryProvider.value(value: widget.talker),
        RepositoryProvider.value(value: widget.dio),
        RepositoryProvider<IDebugRepositoryImp>.value(
          value: widget.debugRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DebugCubit(
              debugRepository: context.read<IDebugRepositoryImp>(),
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              themeLocalStorageApi: ThemeLocalStorageApi(
                key: PrefsKeys.theme,
                localApi: widget.sharedPreferences,
              ),
              initialValue: widget.themeMode,
            ),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return MaterialApp.router(
              /// Theme
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state,

              routerConfig: _router.config(
                reevaluateListenable: widget.authNotifier,
                navigatorObservers: () => [
                  TalkerRouteObserver(widget.talker),
                ],
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _deviceLocale,
              builder: (context, child) {
                return DevModeBannerWrapper(
                  isDevMode: widget.appConfig.flavor == Flavors.dev,
                  child: TalkerWrapper(
                    talker: widget.talker,
                    options: const TalkerWrapperOptions(
                      enableErrorAlerts: true,
                    ),
                    child: UpgradeAlert(
                      navigatorKey: _router.navigatorKey,
                      upgrader: Upgrader(
                        languageCode: _deviceLocale?.languageCode,
                        minAppVersion: widget.appConfig.minVersion,
                      ),
                      child: TechWorksWrapper(
                        navigatorKey: _router.navigatorKey,
                        techWorks: widget.appConfig.techWork,
                        child: DebugGestureDetector(
                          navigatorKey: _router.navigatorKey,
                          password: context.read<AppConfig>().debugModePassword,
                          child: GestureDetector(
                            onTap: () =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            child: child ?? const SizedBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
