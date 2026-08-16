import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/data/domain/adjustment/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/adjustment/datasource/dto/_dto.dart';

extension MyAdjustmentMapper on MyAdjustmentDto {
  MyAdjustment toDomain() {
    return MyAdjustment(
      id: id,
      amountMinor: amountMinor,
      currency: currency,
      reason: reason,
      occurredAt: occurredAt,
      createdAt: createdAt,
      comment: comment,
      shiftId: shiftId,
    );
  }
}

extension PaginatedMyAdjustmentsMapper on PaginatedMyAdjustmentsDto {
  DefaultPaginator<MyAdjustment> toDomain() {
    return DefaultPaginator(
      hasMore: offset + items.length < total,
      data: items.map((item) => item.toDomain()).toList(),
      total: total,
    );
  }
}
