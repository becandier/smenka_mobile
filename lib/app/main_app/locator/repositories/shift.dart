import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/shift/_shift.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/shift_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/shift/repositories/shift_repository_impl.dart';

class ShiftRepositoryInitializer implements ServiceInitializer {
  ShiftRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'ShiftRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = ShiftDataSource(dio: dio);
    locator.register<ShiftRepository>(
      ShiftRepositoryImpl(dataSource: dataSource),
    );
  }
}
