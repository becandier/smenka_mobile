// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeStatsDto _$EmployeeStatsDtoFromJson(Map<String, dynamic> json) =>
    _EmployeeStatsDto(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      shiftCount: (json['shift_count'] as num).toInt(),
      totalWorkedSeconds: (json['total_worked_seconds'] as num).toInt(),
      averageShiftSeconds: (json['average_shift_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$EmployeeStatsDtoToJson(_EmployeeStatsDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'shift_count': instance.shiftCount,
      'total_worked_seconds': instance.totalWorkedSeconds,
      'average_shift_seconds': instance.averageShiftSeconds,
    };

_OrgStatsDto _$OrgStatsDtoFromJson(Map<String, dynamic> json) => _OrgStatsDto(
      period: json['period'] as String,
      totalWorkedSeconds: (json['total_worked_seconds'] as num).toInt(),
      shiftCount: (json['shift_count'] as num).toInt(),
      averageShiftSeconds: (json['average_shift_seconds'] as num).toInt(),
      perEmployee: (json['per_employee'] as List<dynamic>)
          .map((e) => EmployeeStatsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrgStatsDtoToJson(_OrgStatsDto instance) =>
    <String, dynamic>{
      'period': instance.period,
      'total_worked_seconds': instance.totalWorkedSeconds,
      'shift_count': instance.shiftCount,
      'average_shift_seconds': instance.averageShiftSeconds,
      'per_employee': instance.perEmployee,
    };
