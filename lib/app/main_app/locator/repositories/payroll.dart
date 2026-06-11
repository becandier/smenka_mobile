import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/payroll_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/repositories/payroll_repository_impl.dart';

class PayrollRepositoryInitializer implements ServiceInitializer {
  PayrollRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'PayrollRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = PayrollDataSource(dio: dio);
    locator.register<PayrollRepository>(
      PayrollRepositoryImpl(dataSource: dataSource),
    );
  }
}
