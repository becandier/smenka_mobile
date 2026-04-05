import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/shift/mappers/shift_mapper.dart';

extension PaginatedShiftsMapper on PaginatedShiftsDto {
  DefaultPaginator<Shift> toDomain() {
    return DefaultPaginator<Shift>(
      hasMore: offset + items.length < total,
      data: items.map((s) => s.toDomain()).toList(),
      total: total,
    );
  }
}
