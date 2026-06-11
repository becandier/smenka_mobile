import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Инициализатор логгера Talker
class TalkerInitializer implements ServiceInitializer {
  TalkerInitializer({required this.crashlytics});

  final FirebaseCrashlytics crashlytics;

  @override
  String get serviceName => 'Talker';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final talker = TalkerFlutter.init();
    locator.register<Talker>(talker);
    Bloc.observer = TalkerBlocObserver(talker: talker);
    // Устанавливаем обработчик ошибок Flutter с использованием Talker
    FlutterError.onError = (errorDetails) {
      talker.handle(
        errorDetails.exception,
        errorDetails.stack,
        'Flutter error',
      );
      crashlytics.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      talker.handle(error, stack);
      crashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
