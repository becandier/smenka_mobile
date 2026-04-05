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
    dio.options.baseUrl = appConfig.apiEndPoint;

    final authInterceptor = AuthInterceptor(
      tokenStorage: tokenStorage,
      authNotifier: authNotifier,
      dio: dio,
    );

    dio.interceptors.addAll([
      authInterceptor,
      DioHeadersIntercaption(),
      TalkerDioLogger(talker: talker),
      ApiResponseInterceptor(),
      ApiErrorInterceptor(),
    ]);

    locator.register<Dio>(dio);
  }
}
