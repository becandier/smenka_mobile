// catch
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/app/_app.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/domain/auth/_auth.dart';
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
      await _initService(CrashlyticsInitializer());
      await _initService(SharedPreferencesInitializer());
      await _initService(RemoteConfigInitializer());
      await _initService(PackageInfoInitializer());

      // Фаза 2: Сервисы с зависимостями
      await _initService(
        TalkerInitializer(
          crashlytics: _serviceLocator.get(),
        ),
      );
      await _initService(
        DebugRepositoryInitializer(
          sharedPreferences: _serviceLocator.get(),
        ),
      );

      // Фаза 3: Сервисы с зависимостями на фазу 2
      await _initService(
        AppConfigInitializer(
          remoteConfig: _serviceLocator.get(),
          debugRepository: _serviceLocator.get(),
        ),
      );

      // Фаза 3.5: Auth инфраструктура
      final authTokenStorage = AuthTokenStorage(
        prefs: _serviceLocator.get<SharedPreferences>(),
      );
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
      await _initService(LocationRepositoryInitializer(dio: dio));

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
        ),
      );
    } catch (e, stackTrace) {
      // Логируем ошибку, если доступен логгер
      if (_serviceLocator.isRegistered<Talker>()) {
        _serviceLocator
            .get<Talker>()
            .handle(e, stackTrace, 'App initialization error');
      }
      emit(
        MainAppState.error(
          error: e,
          stackTrace: stackTrace,
        ),
      );
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
