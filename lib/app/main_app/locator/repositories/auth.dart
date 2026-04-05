import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/domain/auth/_auth.dart';
import 'package:smenka_mobile/data/infrastructure/auth/datasource/auth_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/auth/repositories/auth_repository_impl.dart';

class AuthRepositoryInitializer implements ServiceInitializer {
  AuthRepositoryInitializer({
    required this.dio,
    required this.tokenStorage,
    required this.authNotifier,
  });

  final Dio dio;
  final AuthTokenStorage tokenStorage;
  final AuthStateNotifier authNotifier;

  @override
  String get serviceName => 'AuthRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = AuthDataSource(dio: dio);
    final repository = AuthRepositoryImpl(
      dataSource: dataSource,
      tokenStorage: tokenStorage,
      authNotifier: authNotifier,
    );
    locator.register<AuthRepository>(repository);
  }
}
