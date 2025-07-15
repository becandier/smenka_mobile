// catch
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:templatecmd/app/_app.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';
import 'package:templatecmd/pages/debug/data/repository/_repository.dart';

part 'main_app_cubit.freezed.dart';
part 'main_app_state.dart';

/// Основной Cubit для инициализации приложения
class MainAppCubit extends Cubit<MainAppState> {
  MainAppCubit() : super(MainAppState.loading()) {
    _init();
  }

  /// Service Locator для доступа к сервисам приложения
  final _serviceLocator = AppServiceLocator();

  /// Список инициализаторов сервисов в порядке инициализации
  final List<ServiceInitializer> _initializers = [
    FirebaseInitializer(),
    CrashlyticsInitializer(),
    TalkerInitializer(),
    SharedPreferencesInitializer(),
    DebugRepositoryInitializer(),
    RemoteConfigInitializer(),
    AppConfigInitializer(),
    DioInitializer(),
    PackageInfoInitializer(),
  ];

  Future<void> refreshApp() async {
    await _init();
  }

  /// Инициализация приложения
  Future<void> _init() async {
    try {
      emit(MainAppState.loading());

      // Инициализируем все сервисы последовательно
      for (final initializer in _initializers) {
        await _initService(initializer);
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
        ),
      );
    } catch (e, stackTrace) {
      // Логируем ошибку, если доступен логгер
      if (_serviceLocator.isRegistered<Talker>()) {
        _serviceLocator
            .get<Talker>()
            .handle(e, stackTrace, 'App initialization error');
      }
      emit(MainAppState.error());
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
