import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/data/domain/penalty/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/penalty/datasource/dto/_dto.dart';

extension PenaltyTemplateMapper on PenaltyTemplateDto {
  PenaltyTemplate toDomain() {
    return PenaltyTemplate(
      id: id,
      reason: reason,
      amountMinor: amountMinor,
      currency: currency,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension PenaltyMapper on PenaltyDto {
  Penalty toDomain() {
    return Penalty(
      id: id,
      memberId: memberId,
      userId: userId,
      userName: userName,
      reason: reason,
      amountMinor: amountMinor,
      currency: currency,
      occurredAt: occurredAt,
      createdByUserId: createdByUserId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      templateId: templateId,
      shiftId: shiftId,
      comment: comment,
    );
  }
}

extension MyPenaltyMapper on MyPenaltyDto {
  MyPenalty toDomain() {
    return MyPenalty(
      id: id,
      reason: reason,
      amountMinor: amountMinor,
      currency: currency,
      occurredAt: occurredAt,
      createdAt: createdAt,
      shiftId: shiftId,
      comment: comment,
    );
  }
}

extension PaginatedPenaltiesMapper on PaginatedPenaltiesDto {
  DefaultPaginator<Penalty> toDomain() {
    return DefaultPaginator(
      hasMore: offset + items.length < total,
      data: items.map((item) => item.toDomain()).toList(),
      total: total,
    );
  }
}

extension PaginatedMyPenaltiesMapper on PaginatedMyPenaltiesDto {
  DefaultPaginator<MyPenalty> toDomain() {
    return DefaultPaginator(
      hasMore: offset + items.length < total,
      data: items.map((item) => item.toDomain()).toList(),
      total: total,
    );
  }
}
