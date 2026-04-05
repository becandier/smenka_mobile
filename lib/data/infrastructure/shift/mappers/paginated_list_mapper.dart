import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/shift_mapper.dart';

extension PaginatedShiftsMapper on PaginatedShiftsDto {
  PaginatedShifts toDomain() {
    return PaginatedShifts(
      items: items.map((s) => s.toDomain()).toList(),
      total: total,
      limit: limit,
      offset: offset,
    );
  }
}
