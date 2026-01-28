import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:templatecmd/app/config/app_config.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';
import 'package:templatecmd/core/network/dio_errors_interception.dart';
import 'package:templatecmd/core/network/dio_headers_intercaption.dart';

/// Инициализатор dio клиента приложения
class DioInitializer implements ServiceInitializer {
  DioInitializer({
    required this.talker,
    required this.appConfig,
  });

  final Talker talker;
  final AppConfig appConfig;

  @override
  String get serviceName => 'Dio';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dio = Dio();

    dio.interceptors.add(TalkerDioLogger(talker: talker));
    dio.interceptors.add(ApiErrorInterceptor());
    dio.interceptors.add(DioHeadersIntercaption());
    dio.options.baseUrl = appConfig.apiEndPoint;

    locator.register<Dio>(dio);
  }
}
