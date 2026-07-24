// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestResultDto _$TestResultDtoFromJson(Map<String, dynamic> json) =>
    _TestResultDto(
      score: (json['score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
      percent: (json['percent'] as num).toInt(),
      passed: json['passed'] as bool,
      passThresholdPercent: (json['pass_threshold_percent'] as num).toInt(),
      attemptsUsed: (json['attempts_used'] as num).toInt(),
      attemptsLeft: (json['attempts_left'] as num).toInt(),
      revealAnswers: json['reveal_answers'] as bool? ?? false,
      questions: (json['questions'] as List<dynamic>?)
          ?.map(
            (e) => TestAttemptQuestionDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$TestResultDtoToJson(_TestResultDto instance) =>
    <String, dynamic>{
      'score': instance.score,
      'max_score': instance.maxScore,
      'percent': instance.percent,
      'passed': instance.passed,
      'pass_threshold_percent': instance.passThresholdPercent,
      'attempts_used': instance.attemptsUsed,
      'attempts_left': instance.attemptsLeft,
      'reveal_answers': instance.revealAnswers,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
    };
