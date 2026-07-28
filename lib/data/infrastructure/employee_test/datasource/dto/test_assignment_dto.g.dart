// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_assignment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestOrganizationBriefDto _$TestOrganizationBriefDtoFromJson(
  Map<String, dynamic> json,
) => _TestOrganizationBriefDto(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$TestOrganizationBriefDtoToJson(
  _TestOrganizationBriefDto instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_TestTemplateBriefDto _$TestTemplateBriefDtoFromJson(
  Map<String, dynamic> json,
) => _TestTemplateBriefDto(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  questionCount: (json['question_count'] as num?)?.toInt() ?? 0,
  maxAttempts: (json['max_attempts'] as num?)?.toInt() ?? 1,
  passThresholdPercent: (json['pass_threshold_percent'] as num?)?.toInt() ?? 70,
  shuffleQuestions: json['shuffle_questions'] as bool? ?? false,
);

Map<String, dynamic> _$TestTemplateBriefDtoToJson(
  _TestTemplateBriefDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'question_count': instance.questionCount,
  'max_attempts': instance.maxAttempts,
  'pass_threshold_percent': instance.passThresholdPercent,
  'shuffle_questions': instance.shuffleQuestions,
};

_TestAssignmentAttemptBriefDto _$TestAssignmentAttemptBriefDtoFromJson(
  Map<String, dynamic> json,
) => _TestAssignmentAttemptBriefDto(
  attemptNumber: (json['number'] as num?)?.toInt() ?? 0,
  percent: (json['percent'] as num?)?.toInt() ?? 0,
  passed: json['passed'] as bool? ?? false,
  id: json['id'] as String?,
  status: json['status'] as String?,
  submittedAt: json['submitted_at'] == null
      ? null
      : DateTime.parse(json['submitted_at'] as String),
);

Map<String, dynamic> _$TestAssignmentAttemptBriefDtoToJson(
  _TestAssignmentAttemptBriefDto instance,
) => <String, dynamic>{
  'number': instance.attemptNumber,
  'percent': instance.percent,
  'passed': instance.passed,
  'id': instance.id,
  'status': instance.status,
  'submitted_at': instance.submittedAt?.toIso8601String(),
};

_TestAssignmentDto _$TestAssignmentDtoFromJson(Map<String, dynamic> json) =>
    _TestAssignmentDto(
      id: json['id'] as String,
      organization: TestOrganizationBriefDto.fromJson(
        json['organization'] as Map<String, dynamic>,
      ),
      template: TestTemplateBriefDto.fromJson(
        json['template'] as Map<String, dynamic>,
      ),
      status: json['status'] as String,
      attemptsUsed: (json['attempts_used'] as num?)?.toInt() ?? 0,
      bestPercent: (json['best_percent'] as num?)?.toInt(),
      passed: json['passed'] as bool? ?? false,
      dueAt: json['due_at'] == null
          ? null
          : DateTime.parse(json['due_at'] as String),
      attempts: (json['attempts'] as List<dynamic>?)
          ?.map(
            (e) => TestAssignmentAttemptBriefDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );

Map<String, dynamic> _$TestAssignmentDtoToJson(_TestAssignmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization': instance.organization.toJson(),
      'template': instance.template.toJson(),
      'status': instance.status,
      'attempts_used': instance.attemptsUsed,
      'best_percent': instance.bestPercent,
      'passed': instance.passed,
      'due_at': instance.dueAt?.toIso8601String(),
      'attempts': instance.attempts?.map((e) => e.toJson()).toList(),
    };

_PaginatedTestAssignmentsDto _$PaginatedTestAssignmentsDtoFromJson(
  Map<String, dynamic> json,
) => _PaginatedTestAssignmentsDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => TestAssignmentDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt() ?? 0,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
  offset: (json['offset'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PaginatedTestAssignmentsDtoToJson(
  _PaginatedTestAssignmentsDto instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};
