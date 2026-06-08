import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/checklist_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/repositories/checklist_repository_impl.dart';

class ChecklistRepositoryInitializer implements ServiceInitializer {
  ChecklistRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'ChecklistRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = ChecklistDataSource(dio: dio);
    locator.register<ChecklistRepository>(
      ChecklistRepositoryImpl(dataSource: dataSource),
    );
  }
}
