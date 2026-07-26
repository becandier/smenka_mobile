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
    required this.checklistRepository,
    required this.userRepository,
    required this.payrollRepository,
    required this.filesRepository,
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
  final ChecklistRepository checklistRepository;
  final UserRepository userRepository;
  final PayrollRepository payrollRepository;
  final FilesRepository filesRepository;
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
    // Холодный старт по deep link (native): `DeepLinkService.init()` уже
    // отработал на фазе 5.5 `MainAppCubit`, то есть раньше, чем мы успели
    // подписаться на `inviteCodeStream` выше — код холодного старта заберём
    // отдельно, а не из широковещательного стрима (см. deep_link_service.dart).
    final initialCode = widget.deepLinkService.consumeInitialCode();
    if (initialCode != null) {
      unawaited(_handleInviteCode(initialCode));
    }
  }

  @override
  void dispose() {
    _deepLinkSubscription?.cancel();
    super.dispose();
  }

  /// Приглашение из deep link (native) — единая точка обработки, экран
  /// `/invite/:code`, доводит и до вступления, и до результата (см. ТЗ
  /// docs/tasks/invite_links/mobile.md). Здесь только маршрутизация: сам
  /// join и разбор ошибок по коду живут в InviteCubit.
  Future<void> _handleInviteCode(String code) async {
    if (!widget.authNotifier.isAuthenticated) {
      await widget.pendingInviteStorage.save(code);
      return;
    }
    _navigateToInvite(code);
  }

  void _navigateToInvite(String code) {
    _router.push(InviteRoute(code: code));
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
        RepositoryProvider<ChecklistRepository>.value(
          value: widget.checklistRepository,
        ),
        RepositoryProvider<UserRepository>.value(value: widget.userRepository),
        RepositoryProvider<PayrollRepository>.value(
          value: widget.payrollRepository,
        ),
        // Фиче-репозиторий fines: принимает готовый Dio → создаётся лениво
        // здесь (не в локаторе, см. конвенции DI).
        RepositoryProvider<PenaltyRepository>(
          create: (_) => PenaltyRepositoryImpl(
            dataSource: PenaltyDataSource(dio: widget.dio),
          ),
        ),
        // Фиче-репозиторий knowledge_base (read-only): принимает готовый Dio →
        // создаётся лениво здесь (не в локаторе, см. конвенции DI).
        RepositoryProvider<KnowledgeRepository>(
          create: (_) => KnowledgeRepositoryImpl(
            dataSource: KnowledgeDataSource(dio: widget.dio),
          ),
        ),
        RepositoryProvider<FilesRepository>.value(
          value: widget.filesRepository,
        ),
        // Фиче-репозиторий work_schedules: принимает готовый Dio → создаётся
        // лениво здесь (не в локаторе, см. конвенции DI).
        RepositoryProvider<WorkScheduleRepository>(
          create: (_) => WorkScheduleRepositoryImpl(
            dataSource: WorkScheduleDataSource(dio: widget.dio),
          ),
        ),
        // Фиче-репозиторий notifications: принимает готовый Dio → создаётся
        // лениво здесь (не в локаторе, см. конвенции DI).
        RepositoryProvider<NotificationRepository>(
          create: (_) => NotificationRepositoryImpl(
            dataSource: NotificationDataSource(dio: widget.dio),
          ),
        ),
        // Фиче-репозиторий employee_tests: принимает готовый Dio → создаётся
        // лениво здесь (не в локаторе, см. конвенции DI).
        RepositoryProvider<TestRepository>(
          create: (_) =>
              TestRepositoryImpl(dataSource: TestDataSource(dio: widget.dio)),
        ),
        RepositoryProvider<ShiftContextStorage>.value(
          value: widget.shiftContextStorage,
        ),
        // Нужны экрану приглашения (InvitePage/InviteCubit) — уже создаются
        // в MainAppCubit, просто не были раздаваемы вниз по дереву.
        RepositoryProvider<AuthStateNotifier>.value(value: widget.authNotifier),
        RepositoryProvider<PendingInviteStorage>.value(
          value: widget.pendingInviteStorage,
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
          // Глобальный кубит (по образцу AuthCubit, см. lib/shared/) — счётчик
          // непрочитанных нужен в аппбаре всех табов шелла одновременно.
          BlocProvider(
            create: (context) => NotificationsCubit(
              repository: context.read<NotificationRepository>(),
            ),
          ),
        ],
        child: BlocListener<AuthCubit, AuthCubitState>(
          listener: (context, authState) async {
            if (authState is AuthCubitAuthenticated) {
              final code = await widget.pendingInviteStorage.consume();
              if (code != null) {
                _navigateToInvite(code);
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
                  final appContent = TechWorksWrapper(
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
                  );

                  // Upgrader (проверка версии в сторе) бессмысленен на web —
                  // там нет App Store / Google Play. Рендерим контент напрямую.
                  final upgradeAwareContent = kIsWeb
                      ? appContent
                      : UpgradeAlert(
                          navigatorKey: _router.navigatorKey,
                          upgrader: Upgrader(
                            languageCode: _deviceLocale?.languageCode,
                            minAppVersion: widget.appConfig.minVersion,
                          ),
                          child: appContent,
                        );

                  return DevModeBannerWrapper(
                    isDevMode: widget.appConfig.flavor == Flavors.dev,
                    child: TalkerWrapper(
                      talker: widget.talker,
                      child: upgradeAwareContent,
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
