// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payroll_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PayrollPeriodDto _$PayrollPeriodDtoFromJson(Map<String, dynamic> json) =>
    _PayrollPeriodDto(
      dateFrom: json['date_from'] == null
          ? null
          : DateTime.parse(json['date_from'] as String),
      dateTo: json['date_to'] == null
          ? null
          : DateTime.parse(json['date_to'] as String),
    );

Map<String, dynamic> _$PayrollPeriodDtoToJson(_PayrollPeriodDto instance) =>
    <String, dynamic>{
      'date_from': instance.dateFrom?.toIso8601String(),
      'date_to': instance.dateTo?.toIso8601String(),
    };

_PayrollItemDto _$PayrollItemDtoFromJson(Map<String, dynamic> json) =>
    _PayrollItemDto(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      workedSeconds: (json['worked_seconds'] as num).toInt(),
      shiftsCount: (json['shifts_count'] as num).toInt(),
      grossAmountMinor: (json['gross_amount_minor'] as num).toInt(),
      unpaidSeconds: (json['unpaid_seconds'] as num).toInt(),
      unpaidShiftsCount: (json['unpaid_shifts_count'] as num).toInt(),
      hasMissingRate: json['has_missing_rate'] as bool,
      penaltyAmountMinor: (json['penalty_amount_minor'] as num?)?.toInt() ?? 0,
      penaltiesCount: (json['penalties_count'] as num?)?.toInt() ?? 0,
      netAmountMinor: (json['net_amount_minor'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PayrollItemDtoToJson(_PayrollItemDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'worked_seconds': instance.workedSeconds,
      'shifts_count': instance.shiftsCount,
      'gross_amount_minor': instance.grossAmountMinor,
      'unpaid_seconds': instance.unpaidSeconds,
      'unpaid_shifts_count': instance.unpaidShiftsCount,
      'has_missing_rate': instance.hasMissingRate,
      'penalty_amount_minor': instance.penaltyAmountMinor,
      'penalties_count': instance.penaltiesCount,
      'net_amount_minor': instance.netAmountMinor,
    };

_PayrollTotalsDto _$PayrollTotalsDtoFromJson(Map<String, dynamic> json) =>
    _PayrollTotalsDto(
      workedSeconds: (json['worked_seconds'] as num).toInt(),
      shiftsCount: (json['shifts_count'] as num).toInt(),
      grossAmountMinor: (json['gross_amount_minor'] as num).toInt(),
      penaltyAmountMinor: (json['penalty_amount_minor'] as num?)?.toInt() ?? 0,
      penaltiesCount: (json['penalties_count'] as num?)?.toInt() ?? 0,
      netAmountMinor: (json['net_amount_minor'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PayrollTotalsDtoToJson(_PayrollTotalsDto instance) =>
    <String, dynamic>{
      'worked_seconds': instance.workedSeconds,
      'shifts_count': instance.shiftsCount,
      'gross_amount_minor': instance.grossAmountMinor,
      'penalty_amount_minor': instance.penaltyAmountMinor,
      'penalties_count': instance.penaltiesCount,
      'net_amount_minor': instance.netAmountMinor,
    };

_PayrollDto _$PayrollDtoFromJson(Map<String, dynamic> json) => _PayrollDto(
  period: PayrollPeriodDto.fromJson(json['period'] as Map<String, dynamic>),
  currency: json['currency'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => PayrollItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: PayrollTotalsDto.fromJson(json['totals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PayrollDtoToJson(_PayrollDto instance) =>
    <String, dynamic>{
      'period': instance.period.toJson(),
      'currency': instance.currency,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'totals': instance.totals.toJson(),
    };
