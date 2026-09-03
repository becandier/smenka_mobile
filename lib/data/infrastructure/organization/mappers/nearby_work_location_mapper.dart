import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension NearbyWorkLocationMapper on NearbyWorkLocationDto {
  NearbyWorkLocation toDomain() => NearbyWorkLocation(
    id: id,
    name: name,
    address: address,
    distanceMeters: distanceMeters,
    isNearest: isNearest,
  );
}

extension NearestOutsideWorkLocationMapper on NearestOutsideWorkLocationDto {
  NearestOutsideWorkLocation toDomain() =>
      NearestOutsideWorkLocation(name: name, distanceMeters: distanceMeters);
}

extension NearbyWorkLocationsMapper on NearbyWorkLocationsDto {
  NearbyWorkLocations toDomain() => NearbyWorkLocations(
    items: items.map((e) => e.toDomain()).toList(),
    nearestOutside: nearestOutside?.toDomain(),
  );
}
