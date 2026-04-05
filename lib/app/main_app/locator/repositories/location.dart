import 'package:dio/dio.dart';
import 'package:smenka_mobile/app/main_app/locator/_locator.dart';
import 'package:smenka_mobile/data/domain/location/_location.dart';
import 'package:smenka_mobile/data/infrastructure/location/datasource/location_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/location/repositories/location_repository_impl.dart';

class LocationRepositoryInitializer implements ServiceInitializer {
  LocationRepositoryInitializer({required this.dio});

  final Dio dio;

  @override
  String get serviceName => 'LocationRepository';

  @override
  Future<void> initialize(AppServiceLocator locator) async {
    final dataSource = LocationDataSource(dio: dio);
    locator.register<LocationRepository>(
      LocationRepositoryImpl(dataSource: dataSource),
    );
  }
}
