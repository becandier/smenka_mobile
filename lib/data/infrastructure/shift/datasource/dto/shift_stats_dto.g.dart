// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftStatsDto _$ShiftStatsDtoFromJson(Map<String, dynamic> json) =>
    _ShiftStatsDto(
      period: json['period'] as String,
      totalWorkedSeconds: (json['total_worked_seconds'] as num).toInt(),
      shiftCount: (json['shift_count'] as num).toInt(),
      averageShiftSeconds: (json['average_shift_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$ShiftStatsDtoToJson(_ShiftStatsDto instance) =>
    <String, dynamic>{
      'period': instance.period,
      'total_worked_seconds': instance.totalWorkedSeconds,
      'shift_count': instance.shiftCount,
      'average_shift_seconds': instance.averageShiftSeconds,
    };
