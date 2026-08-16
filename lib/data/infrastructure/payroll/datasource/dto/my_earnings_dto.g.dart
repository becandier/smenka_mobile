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
      penaltyAmountMinor: (json['penalty_amount_minor'] as num?)?.toInt() ?? 0,
      penaltiesCount: (json['penalties_count'] as num?)?.toInt() ?? 0,
      adjustmentAmountMinor:
          (json['adjustment_amount_minor'] as num?)?.toInt() ?? 0,
      adjustmentsCount: (json['adjustments_count'] as num?)?.toInt() ?? 0,
      netAmountMinor: (json['net_amount_minor'] as num?)?.toInt() ?? 0,
      plannedAmountMinor: (json['planned_amount_minor'] as num?)?.toInt() ?? 0,
      deltaAmountMinor: (json['delta_amount_minor'] as num?)?.toInt() ?? 0,
      overtimeSeconds: (json['overtime_seconds'] as num?)?.toInt() ?? 0,
      currentRate: json['current_rate'] == null
          ? null
          : CurrentRateDto.fromJson(
              json['current_rate'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MyEarningsDtoToJson(_MyEarningsDto instance) =>
    <String, dynamic>{
      'period': instance.period.toJson(),
      'currency': instance.currency,
      'worked_seconds': instance.workedSeconds,
      'shifts_count': instance.shiftsCount,
      'gross_amount_minor': instance.grossAmountMinor,
      'has_missing_rate': instance.hasMissingRate,
      'penalty_amount_minor': instance.penaltyAmountMinor,
      'penalties_count': instance.penaltiesCount,
      'adjustment_amount_minor': instance.adjustmentAmountMinor,
      'adjustments_count': instance.adjustmentsCount,
      'net_amount_minor': instance.netAmountMinor,
      'planned_amount_minor': instance.plannedAmountMinor,
      'delta_amount_minor': instance.deltaAmountMinor,
      'overtime_seconds': instance.overtimeSeconds,
      'current_rate': instance.currentRate?.toJson(),
    };
