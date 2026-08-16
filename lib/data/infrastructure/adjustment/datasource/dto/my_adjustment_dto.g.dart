// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_adjustment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyAdjustmentDto _$MyAdjustmentDtoFromJson(Map<String, dynamic> json) =>
    _MyAdjustmentDto(
      id: json['id'] as String,
      amountMinor: (json['amount_minor'] as num).toInt(),
      currency: json['currency'] as String,
      reason: json['reason'] as String,
      occurredAt: DateTime.parse(json['occurred_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      comment: json['comment'] as String?,
      shiftId: json['shift_id'] as String?,
    );

Map<String, dynamic> _$MyAdjustmentDtoToJson(_MyAdjustmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount_minor': instance.amountMinor,
      'currency': instance.currency,
      'reason': instance.reason,
      'occurred_at': instance.occurredAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'comment': instance.comment,
      'shift_id': instance.shiftId,
    };

_PaginatedMyAdjustmentsDto _$PaginatedMyAdjustmentsDtoFromJson(
  Map<String, dynamic> json,
) => _PaginatedMyAdjustmentsDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => MyAdjustmentDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedMyAdjustmentsDtoToJson(
  _PaginatedMyAdjustmentsDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};
