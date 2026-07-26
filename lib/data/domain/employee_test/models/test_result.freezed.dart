// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestResult {

 int get score; int get maxScore; int get percent; bool get passed; int get passThresholdPercent; int get attemptsUsed; int get attemptsLeft; bool get revealAnswers; List<TestAttemptQuestion>? get questions;
/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestResultCopyWith<TestResult> get copyWith => _$TestResultCopyWithImpl<TestResult>(this as TestResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestResult&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&(identical(other.revealAnswers, revealAnswers) || other.revealAnswers == revealAnswers)&&const DeepCollectionEquality().equals(other.questions, questions));
}


@override
int get hashCode => Object.hash(runtimeType,score,maxScore,percent,passed,passThresholdPercent,attemptsUsed,attemptsLeft,revealAnswers,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'TestResult(score: $score, maxScore: $maxScore, percent: $percent, passed: $passed, passThresholdPercent: $passThresholdPercent, attemptsUsed: $attemptsUsed, attemptsLeft: $attemptsLeft, revealAnswers: $revealAnswers, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $TestResultCopyWith<$Res>  {
  factory $TestResultCopyWith(TestResult value, $Res Function(TestResult) _then) = _$TestResultCopyWithImpl;
@useResult
$Res call({
 int score, int maxScore, int percent, bool passed, int passThresholdPercent, int attemptsUsed, int attemptsLeft, bool revealAnswers, List<TestAttemptQuestion>? questions
});




}
/// @nodoc
class _$TestResultCopyWithImpl<$Res>
    implements $TestResultCopyWith<$Res> {
  _$TestResultCopyWithImpl(this._self, this._then);

  final TestResult _self;
  final $Res Function(TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? maxScore = null,Object? percent = null,Object? passed = null,Object? passThresholdPercent = null,Object? attemptsUsed = null,Object? attemptsLeft = null,Object? revealAnswers = null,Object? questions = freezed,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,attemptsUsed: null == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,revealAnswers: null == revealAnswers ? _self.revealAnswers : revealAnswers // ignore: cast_nullable_to_non_nullable
as bool,questions: freezed == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestResult].
extension TestResultPatterns on TestResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestResult value)  $default,){
final _that = this;
switch (_that) {
case _TestResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestResult value)?  $default,){
final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  int maxScore,  int percent,  bool passed,  int passThresholdPercent,  int attemptsUsed,  int attemptsLeft,  bool revealAnswers,  List<TestAttemptQuestion>? questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that.score,_that.maxScore,_that.percent,_that.passed,_that.passThresholdPercent,_that.attemptsUsed,_that.attemptsLeft,_that.revealAnswers,_that.questions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  int maxScore,  int percent,  bool passed,  int passThresholdPercent,  int attemptsUsed,  int attemptsLeft,  bool revealAnswers,  List<TestAttemptQuestion>? questions)  $default,) {final _that = this;
switch (_that) {
case _TestResult():
return $default(_that.score,_that.maxScore,_that.percent,_that.passed,_that.passThresholdPercent,_that.attemptsUsed,_that.attemptsLeft,_that.revealAnswers,_that.questions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  int maxScore,  int percent,  bool passed,  int passThresholdPercent,  int attemptsUsed,  int attemptsLeft,  bool revealAnswers,  List<TestAttemptQuestion>? questions)?  $default,) {final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that.score,_that.maxScore,_that.percent,_that.passed,_that.passThresholdPercent,_that.attemptsUsed,_that.attemptsLeft,_that.revealAnswers,_that.questions);case _:
  return null;

}
}

}

/// @nodoc


class _TestResult implements TestResult {
  const _TestResult({required this.score, required this.maxScore, required this.percent, required this.passed, required this.passThresholdPercent, required this.attemptsUsed, required this.attemptsLeft, required this.revealAnswers, final  List<TestAttemptQuestion>? questions}): _questions = questions;
  

@override final  int score;
@override final  int maxScore;
@override final  int percent;
@override final  bool passed;
@override final  int passThresholdPercent;
@override final  int attemptsUsed;
@override final  int attemptsLeft;
@override final  bool revealAnswers;
 final  List<TestAttemptQuestion>? _questions;
@override List<TestAttemptQuestion>? get questions {
  final value = _questions;
  if (value == null) return null;
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestResultCopyWith<_TestResult> get copyWith => __$TestResultCopyWithImpl<_TestResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestResult&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&(identical(other.revealAnswers, revealAnswers) || other.revealAnswers == revealAnswers)&&const DeepCollectionEquality().equals(other._questions, _questions));
}


@override
int get hashCode => Object.hash(runtimeType,score,maxScore,percent,passed,passThresholdPercent,attemptsUsed,attemptsLeft,revealAnswers,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'TestResult(score: $score, maxScore: $maxScore, percent: $percent, passed: $passed, passThresholdPercent: $passThresholdPercent, attemptsUsed: $attemptsUsed, attemptsLeft: $attemptsLeft, revealAnswers: $revealAnswers, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$TestResultCopyWith<$Res> implements $TestResultCopyWith<$Res> {
  factory _$TestResultCopyWith(_TestResult value, $Res Function(_TestResult) _then) = __$TestResultCopyWithImpl;
@override @useResult
$Res call({
 int score, int maxScore, int percent, bool passed, int passThresholdPercent, int attemptsUsed, int attemptsLeft, bool revealAnswers, List<TestAttemptQuestion>? questions
});




}
/// @nodoc
class __$TestResultCopyWithImpl<$Res>
    implements _$TestResultCopyWith<$Res> {
  __$TestResultCopyWithImpl(this._self, this._then);

  final _TestResult _self;
  final $Res Function(_TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? maxScore = null,Object? percent = null,Object? passed = null,Object? passThresholdPercent = null,Object? attemptsUsed = null,Object? attemptsLeft = null,Object? revealAnswers = null,Object? questions = freezed,}) {
  return _then(_TestResult(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,attemptsUsed: null == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,revealAnswers: null == revealAnswers ? _self.revealAnswers : revealAnswers // ignore: cast_nullable_to_non_nullable
as bool,questions: freezed == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>?,
  ));
}


}

// dart format on
