import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension WorkLocationMapper on WorkLocationDto {
  WorkLocation toDomain() => WorkLocation(id: id, name: name, address: address);
}
