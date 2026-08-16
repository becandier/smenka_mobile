// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkScheduleDto _$WorkScheduleDtoFromJson(Map<String, dynamic> json) =>
    _WorkScheduleDto(
      id: json['id'] as String,
      name: json['name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      crossesMidnight: json['crosses_midnight'] as bool,
      nextStartAt: DateTime.parse(json['next_start_at'] as String),
      nextEndAt: DateTime.parse(json['next_end_at'] as String),
      isCurrent: json['is_current'] as bool,
      startsInMinutes: (json['starts_in_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$WorkScheduleDtoToJson(_WorkScheduleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'duration_minutes': instance.durationMinutes,
      'crosses_midnight': instance.crossesMidnight,
      'next_start_at': instance.nextStartAt.toIso8601String(),
      'next_end_at': instance.nextEndAt.toIso8601String(),
      'is_current': instance.isCurrent,
      'starts_in_minutes': instance.startsInMinutes,
    };

_MySchedulesDto _$MySchedulesDtoFromJson(Map<String, dynamic> json) =>
    _MySchedulesDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => WorkScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      requireSchedule: json['require_schedule'] as bool,
      earlyStartMinutes: (json['early_start_minutes'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MySchedulesDtoToJson(_MySchedulesDto instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'require_schedule': instance.requireSchedule,
      'early_start_minutes': instance.earlyStartMinutes,
    };
