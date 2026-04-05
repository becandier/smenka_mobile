import 'package:smenka_mobile/data/domain/location/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/location/datasource/dto/_dto.dart';

extension WorkLocationMapper on WorkLocationDto {
  WorkLocation toDomain() {
    return WorkLocation(
      id: id,
      organizationId: organizationId,
      name: name,
      latitude: latitude,
      longitude: longitude,
      radiusMeters: radiusMeters,
      createdAt: createdAt,
    );
  }
}
