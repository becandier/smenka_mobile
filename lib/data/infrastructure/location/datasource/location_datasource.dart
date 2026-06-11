import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/location/datasource/dto/_dto.dart';

class LocationDataSource {
  LocationDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<WorkLocationDto> create(
    String orgId, {
    required String name,
    required double latitude,
    required double longitude,
    int radiusMeters = 100,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/locations',
      data: {
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'radius_meters': radiusMeters,
      },
    );
    return WorkLocationDto.fromJson(response.data!);
  }

  Future<List<WorkLocationDto>> getAll(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/locations',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(WorkLocationDto.fromJson)
        .toList();
  }

  Future<WorkLocationDto> update(
    String orgId,
    String locationId, {
    String? name,
    double? latitude,
    double? longitude,
    int? radiusMeters,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (latitude != null) data['latitude'] = latitude;
    if (longitude != null) data['longitude'] = longitude;
    if (radiusMeters != null) data['radius_meters'] = radiusMeters;

    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/locations/$locationId',
      data: data,
    );
    return WorkLocationDto.fromJson(response.data!);
  }

  Future<void> delete(String orgId, String locationId) async {
    await _dio.delete<void>('/organizations/$orgId/locations/$locationId');
  }
}
