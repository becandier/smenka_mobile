import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/location/_location.dart';
import 'package:smenka_mobile/data/infrastructure/location/datasource/location_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/location/mappers/_mappers.dart';

class LocationRepositoryImpl with TaskHandler implements LocationRepository {
  LocationRepositoryImpl({required LocationDataSource dataSource})
      : _dataSource = dataSource;

  final LocationDataSource _dataSource;

  @override
  Future<Task<WorkLocation>> create(
    String orgId, {
    required String name,
    required double latitude,
    required double longitude,
    int radiusMeters = 100,
  }) {
    return execute(() async {
      final dto = await _dataSource.create(
        orgId,
        name: name,
        latitude: latitude,
        longitude: longitude,
        radiusMeters: radiusMeters,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<List<WorkLocation>>> getAll(String orgId) {
    return execute(() async {
      final dtos = await _dataSource.getAll(orgId);
      return dtos.map((d) => d.toDomain()).toList();
    });
  }

  @override
  Future<Task<WorkLocation>> update(
    String orgId,
    String locationId, {
    String? name,
    double? latitude,
    double? longitude,
    int? radiusMeters,
  }) {
    return execute(() async {
      final dto = await _dataSource.update(
        orgId,
        locationId,
        name: name,
        latitude: latitude,
        longitude: longitude,
        radiusMeters: radiusMeters,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<void>> delete(String orgId, String locationId) {
    return executeVoid(() => _dataSource.delete(orgId, locationId));
  }
}
