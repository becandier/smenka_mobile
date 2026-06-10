// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PauseDto _$PauseDtoFromJson(Map<String, dynamic> json) => _PauseDto(
      id: json['id'] as String,
      shiftId: json['shift_id'] as String,
      startedAt: DateTime.parse(json['started_at'] as String),
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
    );

Map<String, dynamic> _$PauseDtoToJson(_PauseDto instance) => <String, dynamic>{
      'id': instance.id,
      'shift_id': instance.shiftId,
      'started_at': instance.startedAt.toIso8601String(),
      'finished_at': instance.finishedAt?.toIso8601String(),
    };

_ShiftDto _$ShiftDtoFromJson(Map<String, dynamic> json) => _ShiftDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      startedAt: DateTime.parse(json['started_at'] as String),
      status: json['status'] as String,
      pauses: (json['pauses'] as List<dynamic>)
          .map((e) => PauseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      workedSeconds: (json['worked_seconds'] as num).toInt(),
      organizationId: json['organization_id'] as String?,
      finishedAt: json['finished_at'] == null
          ? null
          : DateTime.parse(json['finished_at'] as String),
      hasIncompleteRequiredChecklists:
          json['has_incomplete_required_checklists'] as bool? ?? false,
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      role: json['role'] as String?,
      customRoleName: json['custom_role_name'] as String?,
    );

Map<String, dynamic> _$ShiftDtoToJson(_ShiftDto instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'started_at': instance.startedAt.toIso8601String(),
      'status': instance.status,
      'pauses': instance.pauses,
      'worked_seconds': instance.workedSeconds,
      'organization_id': instance.organizationId,
      'finished_at': instance.finishedAt?.toIso8601String(),
      'has_incomplete_required_checklists':
          instance.hasIncompleteRequiredChecklists,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'role': instance.role,
      'custom_role_name': instance.customRoleName,
    };
