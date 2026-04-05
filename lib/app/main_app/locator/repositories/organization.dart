import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/organization_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/organization/repositories/organization_repository_impl.dart';

class OrganizationRepositoryInitializer implements ServiceInitializer {
  OrganizationRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'OrganizationRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = OrganizationDataSource(dio: dio);
    locator.register<OrganizationRepository>(
      OrganizationRepositoryImpl(dataSource: dataSource),
    );
  }
}
