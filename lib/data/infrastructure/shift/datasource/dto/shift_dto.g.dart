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

_ShiftOvertimeRequestDto _$ShiftOvertimeRequestDtoFromJson(
  Map<String, dynamic> json,
) => _ShiftOvertimeRequestDto(
  id: json['id'] as String,
  minutes: (json['minutes'] as num).toInt(),
  status: json['status'] as String,
  comment: json['comment'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  reviewComment: json['review_comment'] as String?,
  reviewedAt: json['reviewed_at'] == null
      ? null
      : DateTime.parse(json['reviewed_at'] as String),
);

Map<String, dynamic> _$ShiftOvertimeRequestDtoToJson(
  _ShiftOvertimeRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'minutes': instance.minutes,
  'status': instance.status,
  'comment': instance.comment,
  'created_at': instance.createdAt.toIso8601String(),
  'review_comment': instance.reviewComment,
  'reviewed_at': instance.reviewedAt?.toIso8601String(),
};

_ShiftEarningsDto _$ShiftEarningsDtoFromJson(Map<String, dynamic> json) =>
    _ShiftEarningsDto(
      currency: json['currency'] as String,
      grossAmountMinor: (json['gross_amount_minor'] as num).toInt(),
      penaltyAmountMinor: (json['penalty_amount_minor'] as num).toInt(),
      penaltiesCount: (json['penalties_count'] as num).toInt(),
      adjustmentAmountMinor: (json['adjustment_amount_minor'] as num).toInt(),
      adjustmentsCount: (json['adjustments_count'] as num).toInt(),
      netAmountMinor: (json['net_amount_minor'] as num).toInt(),
      overtimeSeconds: (json['overtime_seconds'] as num).toInt(),
      hasRate: json['has_rate'] as bool,
    );

Map<String, dynamic> _$ShiftEarningsDtoToJson(_ShiftEarningsDto instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'gross_amount_minor': instance.grossAmountMinor,
      'penalty_amount_minor': instance.penaltyAmountMinor,
      'penalties_count': instance.penaltiesCount,
      'adjustment_amount_minor': instance.adjustmentAmountMinor,
      'adjustments_count': instance.adjustmentsCount,
      'net_amount_minor': instance.netAmountMinor,
      'overtime_seconds': instance.overtimeSeconds,
      'has_rate': instance.hasRate,
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
  organizationTimezone: json['organization_timezone'] as String?,
  finishedAt: json['finished_at'] == null
      ? null
      : DateTime.parse(json['finished_at'] as String),
  hasIncompleteRequiredChecklists:
      json['has_incomplete_required_checklists'] as bool? ?? false,
  workLocationId: json['work_location_id'] as String?,
  workLocation: json['work_location'] == null
      ? null
      : WorkLocationDto.fromJson(json['work_location'] as Map<String, dynamic>),
  userName: json['user_name'] as String?,
  userEmail: json['user_email'] as String?,
  role: json['role'] as String?,
  customRoleName: json['custom_role_name'] as String?,
  workScheduleId: json['work_schedule_id'] as String?,
  scheduleName: json['schedule_name'] as String?,
  scheduledStartAt: json['scheduled_start_at'] == null
      ? null
      : DateTime.parse(json['scheduled_start_at'] as String),
  scheduledEndAt: json['scheduled_end_at'] == null
      ? null
      : DateTime.parse(json['scheduled_end_at'] as String),
  lateSeconds: (json['late_seconds'] as num?)?.toInt(),
  finishReason: json['finish_reason'] as String?,
  overtime: json['overtime'] == null
      ? null
      : ShiftOvertimeRequestDto.fromJson(
          json['overtime'] as Map<String, dynamic>,
        ),
  isManual: json['is_manual'] as bool? ?? false,
  isEdited: json['is_edited'] as bool? ?? false,
  manualNote: json['manual_note'] as String?,
  editedAt: json['edited_at'] == null
      ? null
      : DateTime.parse(json['edited_at'] as String),
  createdByName: json['created_by_name'] as String?,
  editedByName: json['edited_by_name'] as String?,
  isDeleted: json['is_deleted'] as bool? ?? false,
  geoFallback: json['geo_fallback'] as bool? ?? false,
  geoFallbackReason: json['geo_fallback_reason'] as String?,
  geoFallbackPhotoFileId: json['geo_fallback_photo_file_id'] as String?,
  earnings: json['earnings'] == null
      ? null
      : ShiftEarningsDto.fromJson(json['earnings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShiftDtoToJson(_ShiftDto instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'started_at': instance.startedAt.toIso8601String(),
  'status': instance.status,
  'pauses': instance.pauses.map((e) => e.toJson()).toList(),
  'worked_seconds': instance.workedSeconds,
  'organization_id': instance.organizationId,
  'organization_timezone': instance.organizationTimezone,
  'finished_at': instance.finishedAt?.toIso8601String(),
  'has_incomplete_required_checklists':
      instance.hasIncompleteRequiredChecklists,
  'work_location_id': instance.workLocationId,
  'work_location': instance.workLocation?.toJson(),
  'user_name': instance.userName,
  'user_email': instance.userEmail,
  'role': instance.role,
  'custom_role_name': instance.customRoleName,
  'work_schedule_id': instance.workScheduleId,
  'schedule_name': instance.scheduleName,
  'scheduled_start_at': instance.scheduledStartAt?.toIso8601String(),
  'scheduled_end_at': instance.scheduledEndAt?.toIso8601String(),
  'late_seconds': instance.lateSeconds,
  'finish_reason': instance.finishReason,
  'overtime': instance.overtime?.toJson(),
  'is_manual': instance.isManual,
  'is_edited': instance.isEdited,
  'manual_note': instance.manualNote,
  'edited_at': instance.editedAt?.toIso8601String(),
  'created_by_name': instance.createdByName,
  'edited_by_name': instance.editedByName,
  'is_deleted': instance.isDeleted,
  'geo_fallback': instance.geoFallback,
  'geo_fallback_reason': instance.geoFallbackReason,
  'geo_fallback_photo_file_id': instance.geoFallbackPhotoFileId,
  'earnings': instance.earnings?.toJson(),
};
