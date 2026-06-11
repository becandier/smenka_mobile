// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateDto _$RateDtoFromJson(Map<String, dynamic> json) => _RateDto(
  id: json['id'] as String,
  memberId: json['member_id'] as String,
  rateAmountMinor: (json['rate_amount_minor'] as num).toInt(),
  rateType: json['rate_type'] as String,
  currency: json['currency'] as String,
  effectiveFrom: DateTime.parse(json['effective_from'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$RateDtoToJson(_RateDto instance) => <String, dynamic>{
  'id': instance.id,
  'member_id': instance.memberId,
  'rate_amount_minor': instance.rateAmountMinor,
  'rate_type': instance.rateType,
  'currency': instance.currency,
  'effective_from': instance.effectiveFrom.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'note': instance.note,
};

_CurrentRateDto _$CurrentRateDtoFromJson(Map<String, dynamic> json) =>
    _CurrentRateDto(
      rateAmountMinor: (json['rate_amount_minor'] as num).toInt(),
      rateType: json['rate_type'] as String,
      currency: json['currency'] as String,
      effectiveFrom: DateTime.parse(json['effective_from'] as String),
    );

Map<String, dynamic> _$CurrentRateDtoToJson(_CurrentRateDto instance) =>
    <String, dynamic>{
      'rate_amount_minor': instance.rateAmountMinor,
      'rate_type': instance.rateType,
      'currency': instance.currency,
      'effective_from': instance.effectiveFrom.toIso8601String(),
    };
