import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/adjustment/_adjustment.dart';
import 'package:smenka_mobile/data/infrastructure/adjustment/datasource/adjustment_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/adjustment/mappers/adjustment_mapper.dart';

class AdjustmentRepositoryImpl
    with TaskHandler
    implements AdjustmentRepository {
  AdjustmentRepositoryImpl({required AdjustmentDataSource dataSource})
    : _dataSource = dataSource;

  final AdjustmentDataSource _dataSource;

  @override
  Future<Task<DefaultPaginator<MyAdjustment>>> getMyAdjustments(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) {
    return execute(() async {
      final dto = await _dataSource.getMyAdjustments(
        orgId,
        dateFrom: dateFrom,
        dateTo: dateTo,
        limit: limit,
        offset: offset,
      );
      return dto.toDomain();
    });
  }
}
