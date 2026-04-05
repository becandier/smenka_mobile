import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/location/models/_models.dart';

abstract class LocationRepository {
  Future<Task<WorkLocation>> create(
    String orgId, {
    required String name,
    required double latitude,
    required double longitude,
    int radiusMeters = 100,
  });

  Future<Task<List<WorkLocation>>> getAll(String orgId);

  Future<Task<WorkLocation>> update(
    String orgId,
    String locationId, {
    String? name,
    double? latitude,
    double? longitude,
    int? radiusMeters,
  });

  Future<Task<void>> delete(String orgId, String locationId);
}
