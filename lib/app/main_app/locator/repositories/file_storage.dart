import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/infrastructure/file_storage/_file_storage.dart';

class FilesRepositoryInitializer implements ServiceInitializer {
  FilesRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'FilesRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = FilesDataSource(dio: dio);
    locator.register<FilesRepository>(
      FilesRepositoryImpl(dataSource: dataSource),
    );
  }
}
