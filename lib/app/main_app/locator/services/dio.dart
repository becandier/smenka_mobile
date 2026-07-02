import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/config/app_config.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/core/network/api_response_interceptor.dart';
import 'package:smenka_mobile/core/network/auth_interceptor.dart';
import 'package:smenka_mobile/core/network/dio_errors_interception.dart';
import 'package:smenka_mobile/core/network/dio_headers_intercaption.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Инициализатор dio клиента приложения
class DioInitializer implements ServiceInitializer {
  DioInitializer({
    required this.talker,
    required this.appConfig,
    required this.tokenStorage,
    required this.authNotifier,
  });

  final Talker talker;
  final AppConfig appConfig;
  final AuthTokenStorage tokenStorage;
  final AuthStateNotifier authNotifier;

  @override
  String get serviceName => 'Dio';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dio = Dio();
    dio.options.baseUrl = '${appConfig.endPoint}/api/v1';

    final authInterceptor = AuthInterceptor(
      tokenStorage: tokenStorage,
      authNotifier: authNotifier,
      dio: dio,
    );

    dio.interceptors.addAll([
      authInterceptor,
      DioHeadersIntercaption(),
      TalkerDioLogger(
        talker: talker,
        // security_hardening: не светим Bearer-токен в логах. По умолчанию
        // printErrorHeaders=true, поэтому на ошибочных ответах заголовки
        // (включая Authorization) попали бы в Talker/Crashlytics.
        //
        // oauth_login: пакет не умеет маскировать отдельные поля тела —
        // только целиком включать/выключать лог запроса/ответа
        // (requestFilter/responseFilter). Тела `/auth/*` содержат пароль,
        // access/refresh_token, а теперь и id_token/identity_token — эти
        // логи доступны в проде через debug-экран (пароль + 3 тапа), поэтому
        // тело запросов/ответов `/auth/*` целиком исключаем из лога.
        settings: TalkerDioLoggerSettings(
          hiddenHeaders: const {'Authorization', 'authorization'},
          requestFilter: (options) => !options.path.contains('/auth/'),
          responseFilter: (response) =>
              !response.requestOptions.path.contains('/auth/'),
          errorFilter: (error) => !error.requestOptions.path.contains('/auth/'),
        ),
      ),
      ApiResponseInterceptor(),
      ApiErrorInterceptor(),
    ]);

    locator.register<Dio>(dio);
  }
}
