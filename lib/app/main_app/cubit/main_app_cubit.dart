// catch
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/app/_app.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/core/deep_link/deep_link_service.dart';
import 'package:smenka_mobile/core/deep_link/pending_invite_storage.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/api/local/shift_context_storage.dart';
import 'package:smenka_mobile/data/domain/auth/_auth.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/data/domain/shift/_shift.dart';
import 'package:smenka_mobile/data/domain/user/_user.dart';
import 'package:smenka_mobile/pages/debug/data/repository/_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'main_app_cubit.freezed.dart';
part 'main_app_state.dart';

/// Основной Cubit для инициализации приложения
class MainAppCubit extends Cubit<MainAppState> {
  MainAppCubit() : super(MainAppState.loading()) {
    _init();
  }

  /// Service Locator для доступа к сервисам приложения
  final _serviceLocator = AppServiceLocator();

  Future<void> refreshApp() async {
    await _init();
  }

  /// Инициализация приложения
  Future<void> _init() async {
    try {
      emit(MainAppState.loading());

      // Фаза 1: Базовые сервисы без зависимостей
      await _initService(FirebaseInitializer());
      // Crashlytics не поддерживается на web — пропускаем регистрацию,
      // чтобы фаза 2 не падала при попытке получить сервис из локатора.
      if (!kIsWeb) {
        await _initService(CrashlyticsInitializer());
      }
      await _initService(SharedPreferencesInitializer());
      await _initService(RemoteConfigInitializer());
      await _initService(PackageInfoInitializer());

      // Фаза 2: Сервисы с зависимостями
      await _initService(
        TalkerInitializer(
          crashlytics: _serviceLocator.isRegistered<FirebaseCrashlytics>()
              ? _serviceLocator.get<FirebaseCrashlytics>()
              : null,
        ),
      );
      await _initService(
        DebugRepositoryInitializer(sharedPreferences: _serviceLocator.get()),
      );

      // Фаза 3: Сервисы с зависимостями на фазу 2
      await _initService(
        AppConfigInitializer(
          remoteConfig: _serviceLocator.get(),
          debugRepository: _serviceLocator.get(),
        ),
      );

      // Фатальная проверка конфигурации: с дефолтами Remote Config endPoint
      // пустым быть не должен. Если он всё же пуст (нет дефолтов И неудачный
      // fetch) — нет смысла поднимать Dio в никуда: показываем понятный экран
      // ошибки конфигурации (error_app.dart) вместо мёртвого белого экрана.
      final appConfig = _serviceLocator.get<AppConfig>();
      if (appConfig.endPoint.isEmpty) {
        throw const AppConfigException(
          'ENDPOINT пуст — проверьте Remote Config',
        );
      }

      // Фаза 3.5: Auth инфраструктура
      // init() наполняет in-memory кэш из secure storage и однократно
      // мигрирует токены из открытого SharedPreferences — до создания Dio
      // и проверки авторизации, чтобы первый же запрос увидел токены.
      final authTokenStorage = AuthTokenStorage(
        prefs: _serviceLocator.get<SharedPreferences>(),
      );
      await authTokenStorage.init();
      _serviceLocator.register<AuthTokenStorage>(authTokenStorage);

      final authNotifier = AuthStateNotifier();
      _serviceLocator.register<AuthStateNotifier>(authNotifier);

      // Фаза 4: Dio (с AuthInterceptor)
      await _initService(
        DioInitializer(
          talker: _serviceLocator.get(),
          appConfig: _serviceLocator.get(),
          tokenStorage: authTokenStorage,
          authNotifier: authNotifier,
        ),
      );

      // Фаза 5: Репозитории (зависят от Dio)
      final dio = _serviceLocator.get<Dio>();

      await _initService(
        AuthRepositoryInitializer(
          dio: dio,
          tokenStorage: authTokenStorage,
          authNotifier: authNotifier,
        ),
      );
      await _initService(UserRepositoryInitializer(dio: dio));
      await _initService(ShiftRepositoryInitializer(dio: dio));
      await _initService(OrganizationRepositoryInitializer(dio: dio));
      await _initService(ChecklistRepositoryInitializer(dio: dio));
      await _initService(PayrollRepositoryInitializer(dio: dio));
      await _initService(FilesRepositoryInitializer(dio: dio));

      // Фаза 5.5: Deep Links
      final deepLinkService = DeepLinkService();
      await deepLinkService.init();
      _serviceLocator.register<DeepLinkService>(deepLinkService);

      final pendingInviteStorage = PendingInviteStorage(
        prefs: _serviceLocator.get<SharedPreferences>(),
      );
      _serviceLocator.register<PendingInviteStorage>(pendingInviteStorage);

      // Фаза 5.6: Локальный стор последнего контекста смены
      final shiftContextStorage = ShiftContextStorage(
        prefs: _serviceLocator.get<SharedPreferences>(),
      );
      _serviceLocator.register<ShiftContextStorage>(shiftContextStorage);

      // Фаза 6: Сервисы с зависимостями на SharedPreferences
      await _initService(ThemeModeServiceInitializer());

      // Проверяем авторизацию при старте
      if (_serviceLocator.isRegistered<AuthRepository>()) {
        await _serviceLocator.get<AuthRepository>().checkAuthStatus();
      }

      // Успешно инициализировали приложение
      emit(
        MainAppState.success(
          appConfig: _serviceLocator.get<AppConfig>(),
          sharedPreferences: _serviceLocator.get<SharedPreferences>(),
          packageInfo: _serviceLocator.get<PackageInfo>(),
          talker: _serviceLocator.get<Talker>(),
          dio: _serviceLocator.get<Dio>(),
          debugRepository: _serviceLocator.get<IDebugRepositoryImp>(),
          themeMode: _serviceLocator.get<ThemeMode>(),
          authNotifier: _serviceLocator.get<AuthStateNotifier>(),
          authRepository: _serviceLocator.get<AuthRepository>(),
          shiftRepository: _serviceLocator.get<ShiftRepository>(),
          organizationRepository: _serviceLocator.get<OrganizationRepository>(),
          checklistRepository: _serviceLocator.get<ChecklistRepository>(),
          userRepository: _serviceLocator.get<UserRepository>(),
          payrollRepository: _serviceLocator.get<PayrollRepository>(),
          filesRepository: _serviceLocator.get<FilesRepository>(),
          deepLinkService: _serviceLocator.get<DeepLinkService>(),
          pendingInviteStorage: _serviceLocator.get<PendingInviteStorage>(),
          shiftContextStorage: _serviceLocator.get<ShiftContextStorage>(),
        ),
      );
    } catch (e, stackTrace) {
      // Логируем ошибку, если доступен логгер
      if (_serviceLocator.isRegistered<Talker>()) {
        _serviceLocator.get<Talker>().handle(
          e,
          stackTrace,
          'App initialization error',
        );
      }
      emit(MainAppState.error(error: e, stackTrace: stackTrace));
    }
  }

  /// Безопасная инициализация отдельного сервиса
  Future<void> _initService(ServiceInitializer initializer) async {
    try {
      await initializer.initialize(_serviceLocator);
    } catch (e, stackTrace) {
      // Логируем ошибку инициализации
      if (_serviceLocator.isRegistered<Talker>()) {
        _serviceLocator.get<Talker>().handle(
          e,
          stackTrace,
          'Failed to initialize ${initializer.serviceName}',
        );
      }
    }
  }
}
