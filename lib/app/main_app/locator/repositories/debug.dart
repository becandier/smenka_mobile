import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/pages/debug/data/repository/debug_repository_imp.dart';

/// Инициализатор репозитория отладки
class DebugRepositoryInitializer implements ServiceInitializer {
  DebugRepositoryInitializer({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  String get serviceName => 'Debug Repository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final debugRepository = IDebugRepositoryImp(
      sharedPreferences: sharedPreferences,
    );
    locator.register<IDebugRepositoryImp>(debugRepository);
  }
}
