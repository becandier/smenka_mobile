// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_earnings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyEarningsDto _$MyEarningsDtoFromJson(Map<String, dynamic> json) =>
    _MyEarningsDto(
      period: PayrollPeriodDto.fromJson(json['period'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      workedSeconds: (json['worked_seconds'] as num).toInt(),
      shiftsCount: (json['shifts_count'] as num).toInt(),
      grossAmountMinor: (json['gross_amount_minor'] as num).toInt(),
      hasMissingRate: json['has_missing_rate'] as bool,
      currentRate: json['current_rate'] == null
          ? null
          : CurrentRateDto.fromJson(
              json['current_rate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyEarningsDtoToJson(_MyEarningsDto instance) =>
    <String, dynamic>{
      'period': instance.period.toJson(),
      'currency': instance.currency,
      'worked_seconds': instance.workedSeconds,
      'shifts_count': instance.shiftsCount,
      'gross_amount_minor': instance.grossAmountMinor,
      'has_missing_rate': instance.hasMissingRate,
      'current_rate': instance.currentRate?.toJson(),
    };
