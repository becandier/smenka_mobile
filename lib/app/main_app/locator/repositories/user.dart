import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/user/_user.dart';
import 'package:smenka_mobile/data/infrastructure/user/datasource/user_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/user/repositories/user_repository_impl.dart';

class UserRepositoryInitializer implements ServiceInitializer {
  UserRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'UserRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = UserDataSource(dio: dio);
    locator.register<UserRepository>(
      UserRepositoryImpl(dataSource: dataSource),
    );
  }
}
