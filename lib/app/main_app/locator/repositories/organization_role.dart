import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/organization_role/_organization_role.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/datasource/organization_role_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/organization_role/repositories/organization_role_repository_impl.dart';

class OrganizationRoleRepositoryInitializer implements ServiceInitializer {
  OrganizationRoleRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'OrganizationRoleRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = OrganizationRoleDataSource(dio: dio);
    locator.register<OrganizationRoleRepository>(
      OrganizationRoleRepositoryImpl(dataSource: dataSource),
    );
  }
}
