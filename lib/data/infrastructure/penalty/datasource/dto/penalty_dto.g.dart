// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PenaltyTemplateDto _$PenaltyTemplateDtoFromJson(Map<String, dynamic> json) =>
    _PenaltyTemplateDto(
      id: json['id'] as String,
      reason: json['reason'] as String,
      amountMinor: (json['amount_minor'] as num).toInt(),
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PenaltyTemplateDtoToJson(_PenaltyTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'amount_minor': instance.amountMinor,
      'currency': instance.currency,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_PenaltyDto _$PenaltyDtoFromJson(Map<String, dynamic> json) => _PenaltyDto(
  id: json['id'] as String,
  memberId: json['member_id'] as String,
  userId: json['user_id'] as String,
  userName: json['user_name'] as String,
  reason: json['reason'] as String,
  amountMinor: (json['amount_minor'] as num).toInt(),
  currency: json['currency'] as String,
  occurredAt: DateTime.parse(json['occurred_at'] as String),
  createdByUserId: json['created_by_user_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  templateId: json['template_id'] as String?,
  shiftId: json['shift_id'] as String?,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$PenaltyDtoToJson(_PenaltyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_id': instance.memberId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'reason': instance.reason,
      'amount_minor': instance.amountMinor,
      'currency': instance.currency,
      'occurred_at': instance.occurredAt.toIso8601String(),
      'created_by_user_id': instance.createdByUserId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'template_id': instance.templateId,
      'shift_id': instance.shiftId,
      'comment': instance.comment,
    };

_MyPenaltyDto _$MyPenaltyDtoFromJson(Map<String, dynamic> json) =>
    _MyPenaltyDto(
      id: json['id'] as String,
      reason: json['reason'] as String,
      amountMinor: (json['amount_minor'] as num).toInt(),
      currency: json['currency'] as String,
      occurredAt: DateTime.parse(json['occurred_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      shiftId: json['shift_id'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$MyPenaltyDtoToJson(_MyPenaltyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': instance.reason,
      'amount_minor': instance.amountMinor,
      'currency': instance.currency,
      'occurred_at': instance.occurredAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'shift_id': instance.shiftId,
      'comment': instance.comment,
    };

_PaginatedPenaltiesDto _$PaginatedPenaltiesDtoFromJson(
  Map<String, dynamic> json,
) => _PaginatedPenaltiesDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => PenaltyDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedPenaltiesDtoToJson(
  _PaginatedPenaltiesDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};

_PaginatedMyPenaltiesDto _$PaginatedMyPenaltiesDtoFromJson(
  Map<String, dynamic> json,
) => _PaginatedMyPenaltiesDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => MyPenaltyDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedMyPenaltiesDtoToJson(
  _PaginatedMyPenaltiesDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};
