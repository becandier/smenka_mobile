// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_attempt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestAttemptOptionDto _$TestAttemptOptionDtoFromJson(
  Map<String, dynamic> json,
) => _TestAttemptOptionDto(
  id: json['id'] as String,
  text: json['text'] as String,
  position: (json['position'] as num?)?.toInt() ?? 0,
  isSelected: json['is_selected'] as bool? ?? false,
  isCorrect: json['is_correct'] as bool?,
);

Map<String, dynamic> _$TestAttemptOptionDtoToJson(
  _TestAttemptOptionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'position': instance.position,
  'is_selected': instance.isSelected,
  'is_correct': instance.isCorrect,
};

_TestAttemptQuestionDto _$TestAttemptQuestionDtoFromJson(
  Map<String, dynamic> json,
) => _TestAttemptQuestionDto(
  id: json['id'] as String,
  text: json['text'] as String,
  type: json['type'] as String,
  points: (json['points'] as num?)?.toInt() ?? 1,
  position: (json['position'] as num?)?.toInt() ?? 0,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => TestAttemptOptionDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TestAttemptOptionDto>[],
);

Map<String, dynamic> _$TestAttemptQuestionDtoToJson(
  _TestAttemptQuestionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'type': instance.type,
  'points': instance.points,
  'position': instance.position,
  'options': instance.options.map((e) => e.toJson()).toList(),
};

_TestAttemptDto _$TestAttemptDtoFromJson(Map<String, dynamic> json) =>
    _TestAttemptDto(
      id: json['id'] as String,
      attemptNumber: (json['attempt_number'] as num).toInt(),
      status: json['status'] as String,
      maxScore: (json['max_score'] as num).toInt(),
      startedAt: DateTime.parse(json['started_at'] as String),
      score: (json['score'] as num?)?.toInt() ?? 0,
      percent: (json['percent'] as num?)?.toInt() ?? 0,
      passed: json['passed'] as bool? ?? false,
      submittedAt: json['submitted_at'] == null
          ? null
          : DateTime.parse(json['submitted_at'] as String),
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    TestAttemptQuestionDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <TestAttemptQuestionDto>[],
    );

Map<String, dynamic> _$TestAttemptDtoToJson(_TestAttemptDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attempt_number': instance.attemptNumber,
      'status': instance.status,
      'max_score': instance.maxScore,
      'started_at': instance.startedAt.toIso8601String(),
      'score': instance.score,
      'percent': instance.percent,
      'passed': instance.passed,
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };
