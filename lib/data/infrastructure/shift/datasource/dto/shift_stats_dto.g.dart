// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftStatsDto _$ShiftStatsDtoFromJson(Map<String, dynamic> json) =>
    _ShiftStatsDto(
      totalWorkedSeconds: (json['total_worked_seconds'] as num).toInt(),
      shiftCount: (json['shift_count'] as num).toInt(),
      averageShiftSeconds: (json['average_shift_seconds'] as num).toInt(),
      period: json['period'] as String?,
      rangeFrom: json['range_from'] == null
          ? null
          : DateTime.parse(json['range_from'] as String),
      rangeTo: json['range_to'] == null
          ? null
          : DateTime.parse(json['range_to'] as String),
    );

Map<String, dynamic> _$ShiftStatsDtoToJson(_ShiftStatsDto instance) =>
    <String, dynamic>{
      'total_worked_seconds': instance.totalWorkedSeconds,
      'shift_count': instance.shiftCount,
      'average_shift_seconds': instance.averageShiftSeconds,
      'period': instance.period,
      'range_from': instance.rangeFrom?.toIso8601String(),
      'range_to': instance.rangeTo?.toIso8601String(),
    };
