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
    required this.authRepository,
    required this.shiftRepository,
    required this.organizationRepository,
    required this.organizationRoleRepository,
    required this.checklistRepository,
    required this.userRepository,
    required this.locationRepository,
    required this.payrollRepository,
    required this.deepLinkService,
    required this.pendingInviteStorage,
    required this.shiftContextStorage,
  });
  final AppConfig appConfig;
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;
  final Talker talker;
  final Dio dio;
  final IDebugRepositoryImp debugRepository;
  final ThemeMode themeMode;
  final AuthStateNotifier authNotifier;
  final AuthRepository authRepository;
  final ShiftRepository shiftRepository;
  final OrganizationRepository organizationRepository;
  final OrganizationRoleRepository organizationRoleRepository;
  final ChecklistRepository checklistRepository;
  final UserRepository userRepository;
  final LocationRepository locationRepository;
  final PayrollRepository payrollRepository;
  final DeepLinkService deepLinkService;
  final PendingInviteStorage pendingInviteStorage;
  final ShiftContextStorage shiftContextStorage;

  @override
  State<_SuccessApp> createState() => _SuccessAppState();
}

class _SuccessAppState extends State<_SuccessApp> {
  // Local device
  Locale? _deviceLocale;

  // Router
  late AppRouter _router;

  StreamSubscription<String>? _deepLinkSubscription;

  @override
  void initState() {
    super.initState();
    _deviceLocale = PlatformDispatcher.instance.locale;
    _router = AppRouter(authNotifier: widget.authNotifier);
    _deepLinkSubscription = widget.deepLinkService.inviteCodeStream.listen(
      _handleInviteCode,
    );
  }

  @override
  void dispose() {
    _deepLinkSubscription?.cancel();
    super.dispose();
  }

  Future<void> _handleInviteCode(String code) async {
    if (!widget.authNotifier.isAuthenticated) {
      await widget.pendingInviteStorage.save(code);
      return;
    }
    await _joinByInviteCode(code);
  }

  Future<void> _joinByInviteCode(String code) async {
    final result = await widget.organizationRepository.join(code);
    if (!mounted) return;

    final context = _router.navigatorKey.currentContext;
    if (context == null) return;

    result.fold(
      onSuccess: (JoinResult joinResult) {
        context.modals.showSuccess(
          context.l10n.deepLinkJoinSuccess(joinResult.organizationName),
        );
      },
      onFailure: (_) {
        context.modals.showError(context.l10n.deepLinkJoinError);
      },
    );
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
        RepositoryProvider<AuthRepository>.value(value: widget.authRepository),
        RepositoryProvider<ShiftRepository>.value(
          value: widget.shiftRepository,
        ),
        RepositoryProvider<OrganizationRepository>.value(
          value: widget.organizationRepository,
        ),
        RepositoryProvider<OrganizationRoleRepository>.value(
          value: widget.organizationRoleRepository,
        ),
        RepositoryProvider<ChecklistRepository>.value(
          value: widget.checklistRepository,
        ),
        RepositoryProvider<UserRepository>.value(value: widget.userRepository),
        RepositoryProvider<LocationRepository>.value(
          value: widget.locationRepository,
        ),
        RepositoryProvider<PayrollRepository>.value(
          value: widget.payrollRepository,
        ),
        RepositoryProvider<ShiftContextStorage>.value(
          value: widget.shiftContextStorage,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthCubit(
              authRepository: widget.authRepository,
              authNotifier: widget.authNotifier,
              organizationRepository: widget.organizationRepository,
            ),
          ),
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
        child: BlocListener<AuthCubit, AuthCubitState>(
          listener: (context, authState) async {
            if (authState is AuthCubitAuthenticated) {
              final code = await widget.pendingInviteStorage.consume();
              if (code != null) {
                await _joinByInviteCode(code);
              }
            }
          },
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
                            password: context
                                .read<AppConfig>()
                                .debugModePassword,
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
      ),
    );
  }
}
