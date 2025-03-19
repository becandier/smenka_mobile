import 'package:shared_preferences/shared_preferences.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';
import 'package:templatecmd/features/debug/data/repository/debug_repository_imp.dart';

/// Инициализатор репозитория отладки
class DebugRepositoryInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'Debug Repository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final sharedPreferences = locator.get<SharedPreferences>();
    final debugRepository = IDebugRepositoryImp(
      sharedPreferences: sharedPreferences,
    );
    locator.register<IDebugRepositoryImp>(debugRepository);
  }
}
