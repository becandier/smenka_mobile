import 'package:firebase_core/firebase_core.dart';
import 'package:templatecmd/app/main_app/locator/_locator.dart';
import 'package:templatecmd/firebase_options.dart';

/// Инициализатор Firebase
class FirebaseInitializer implements ServiceInitializer {
  @override
  String get serviceName => 'Firebase';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    locator.register<FirebaseApp>(firebaseApp);
  }
}
