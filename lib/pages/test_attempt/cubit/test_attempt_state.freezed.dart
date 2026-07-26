// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_attempt_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestAttemptState {

 FeatureStatus get status; String? get error; String? get errorCode;/// Мета назначения (шаблон, лучший % за прошлые попытки, дедлайн) —
/// грузится первой, используется и в fill-режиме, и в блокирующем.
 TestAssignment? get assignment;/// Текущая попытка в процессе прохождения (снимок вопросов). `null`,
/// когда экран показывает результат или блокирующее сообщение.
 TestAttemptFill? get attempt;/// Локальный выбор варианта(ов) по `attempt_question_id`. Живёт отдельно
/// от [attempt] — снимок вопросов с сервера не мутируется.
 Map<String, Set<String>> get selectedOptionIds; bool get submitting; String? get submitErrorCode; String? get submitError;/// Результат после `submit` (или просмотр уже сданной попытки).
 TestResult? get result;/// `true` — старт попытки невозможен (уже сдан / попытки исчерпаны /
/// шаблон архивный). Причина — в [errorCode]; итоговый % — из
/// [assignment] (денормализованные `bestPercent`/`passed`), без
/// дополнительного похода за попыткой.
 bool get blocked;
/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptStateCopyWith<TestAttemptState> get copyWith => _$TestAttemptStateCopyWithImpl<TestAttemptState>(this as TestAttemptState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptState&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.attempt, attempt) || other.attempt == attempt)&&const DeepCollectionEquality().equals(other.selectedOptionIds, selectedOptionIds)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.result, result) || other.result == result)&&(identical(other.blocked, blocked) || other.blocked == blocked));
}


@override
int get hashCode => Object.hash(runtimeType,status,error,errorCode,assignment,attempt,const DeepCollectionEquality().hash(selectedOptionIds),submitting,submitErrorCode,submitError,result,blocked);

@override
String toString() {
  return 'TestAttemptState(status: $status, error: $error, errorCode: $errorCode, assignment: $assignment, attempt: $attempt, selectedOptionIds: $selectedOptionIds, submitting: $submitting, submitErrorCode: $submitErrorCode, submitError: $submitError, result: $result, blocked: $blocked)';
}


}

/// @nodoc
abstract mixin class $TestAttemptStateCopyWith<$Res>  {
  factory $TestAttemptStateCopyWith(TestAttemptState value, $Res Function(TestAttemptState) _then) = _$TestAttemptStateCopyWithImpl;
@useResult
$Res call({
 FeatureStatus status, String? error, String? errorCode, TestAssignment? assignment, TestAttemptFill? attempt, Map<String, Set<String>> selectedOptionIds, bool submitting, String? submitErrorCode, String? submitError, TestResult? result, bool blocked
});


$TestAssignmentCopyWith<$Res>? get assignment;$TestAttemptFillCopyWith<$Res>? get attempt;$TestResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$TestAttemptStateCopyWithImpl<$Res>
    implements $TestAttemptStateCopyWith<$Res> {
  _$TestAttemptStateCopyWithImpl(this._self, this._then);

  final TestAttemptState _self;
  final $Res Function(TestAttemptState) _then;

/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? error = freezed,Object? errorCode = freezed,Object? assignment = freezed,Object? attempt = freezed,Object? selectedOptionIds = null,Object? submitting = null,Object? submitErrorCode = freezed,Object? submitError = freezed,Object? result = freezed,Object? blocked = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as TestAssignment?,attempt: freezed == attempt ? _self.attempt : attempt // ignore: cast_nullable_to_non_nullable
as TestAttemptFill?,selectedOptionIds: null == selectedOptionIds ? _self.selectedOptionIds : selectedOptionIds // ignore: cast_nullable_to_non_nullable
as Map<String, Set<String>>,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TestResult?,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestAssignmentCopyWith<$Res>? get assignment {
    if (_self.assignment == null) {
    return null;
  }

  return $TestAssignmentCopyWith<$Res>(_self.assignment!, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestAttemptFillCopyWith<$Res>? get attempt {
    if (_self.attempt == null) {
    return null;
  }

  return $TestAttemptFillCopyWith<$Res>(_self.attempt!, (value) {
    return _then(_self.copyWith(attempt: value));
  });
}/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $TestResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [TestAttemptState].
extension TestAttemptStatePatterns on TestAttemptState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptState value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptState value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FeatureStatus status,  String? error,  String? errorCode,  TestAssignment? assignment,  TestAttemptFill? attempt,  Map<String, Set<String>> selectedOptionIds,  bool submitting,  String? submitErrorCode,  String? submitError,  TestResult? result,  bool blocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptState() when $default != null:
return $default(_that.status,_that.error,_that.errorCode,_that.assignment,_that.attempt,_that.selectedOptionIds,_that.submitting,_that.submitErrorCode,_that.submitError,_that.result,_that.blocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FeatureStatus status,  String? error,  String? errorCode,  TestAssignment? assignment,  TestAttemptFill? attempt,  Map<String, Set<String>> selectedOptionIds,  bool submitting,  String? submitErrorCode,  String? submitError,  TestResult? result,  bool blocked)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptState():
return $default(_that.status,_that.error,_that.errorCode,_that.assignment,_that.attempt,_that.selectedOptionIds,_that.submitting,_that.submitErrorCode,_that.submitError,_that.result,_that.blocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FeatureStatus status,  String? error,  String? errorCode,  TestAssignment? assignment,  TestAttemptFill? attempt,  Map<String, Set<String>> selectedOptionIds,  bool submitting,  String? submitErrorCode,  String? submitError,  TestResult? result,  bool blocked)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptState() when $default != null:
return $default(_that.status,_that.error,_that.errorCode,_that.assignment,_that.attempt,_that.selectedOptionIds,_that.submitting,_that.submitErrorCode,_that.submitError,_that.result,_that.blocked);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttemptState extends TestAttemptState {
  const _TestAttemptState({this.status = FeatureStatus.initial, this.error, this.errorCode, this.assignment, this.attempt, final  Map<String, Set<String>> selectedOptionIds = const <String, Set<String>>{}, this.submitting = false, this.submitErrorCode, this.submitError, this.result, this.blocked = false}): _selectedOptionIds = selectedOptionIds,super._();
  

@override@JsonKey() final  FeatureStatus status;
@override final  String? error;
@override final  String? errorCode;
/// Мета назначения (шаблон, лучший % за прошлые попытки, дедлайн) —
/// грузится первой, используется и в fill-режиме, и в блокирующем.
@override final  TestAssignment? assignment;
/// Текущая попытка в процессе прохождения (снимок вопросов). `null`,
/// когда экран показывает результат или блокирующее сообщение.
@override final  TestAttemptFill? attempt;
/// Локальный выбор варианта(ов) по `attempt_question_id`. Живёт отдельно
/// от [attempt] — снимок вопросов с сервера не мутируется.
 final  Map<String, Set<String>> _selectedOptionIds;
/// Локальный выбор варианта(ов) по `attempt_question_id`. Живёт отдельно
/// от [attempt] — снимок вопросов с сервера не мутируется.
@override@JsonKey() Map<String, Set<String>> get selectedOptionIds {
  if (_selectedOptionIds is EqualUnmodifiableMapView) return _selectedOptionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedOptionIds);
}

@override@JsonKey() final  bool submitting;
@override final  String? submitErrorCode;
@override final  String? submitError;
/// Результат после `submit` (или просмотр уже сданной попытки).
@override final  TestResult? result;
/// `true` — старт попытки невозможен (уже сдан / попытки исчерпаны /
/// шаблон архивный). Причина — в [errorCode]; итоговый % — из
/// [assignment] (денормализованные `bestPercent`/`passed`), без
/// дополнительного похода за попыткой.
@override@JsonKey() final  bool blocked;

/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptStateCopyWith<_TestAttemptState> get copyWith => __$TestAttemptStateCopyWithImpl<_TestAttemptState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptState&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.assignment, assignment) || other.assignment == assignment)&&(identical(other.attempt, attempt) || other.attempt == attempt)&&const DeepCollectionEquality().equals(other._selectedOptionIds, _selectedOptionIds)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.result, result) || other.result == result)&&(identical(other.blocked, blocked) || other.blocked == blocked));
}


@override
int get hashCode => Object.hash(runtimeType,status,error,errorCode,assignment,attempt,const DeepCollectionEquality().hash(_selectedOptionIds),submitting,submitErrorCode,submitError,result,blocked);

@override
String toString() {
  return 'TestAttemptState(status: $status, error: $error, errorCode: $errorCode, assignment: $assignment, attempt: $attempt, selectedOptionIds: $selectedOptionIds, submitting: $submitting, submitErrorCode: $submitErrorCode, submitError: $submitError, result: $result, blocked: $blocked)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptStateCopyWith<$Res> implements $TestAttemptStateCopyWith<$Res> {
  factory _$TestAttemptStateCopyWith(_TestAttemptState value, $Res Function(_TestAttemptState) _then) = __$TestAttemptStateCopyWithImpl;
@override @useResult
$Res call({
 FeatureStatus status, String? error, String? errorCode, TestAssignment? assignment, TestAttemptFill? attempt, Map<String, Set<String>> selectedOptionIds, bool submitting, String? submitErrorCode, String? submitError, TestResult? result, bool blocked
});


@override $TestAssignmentCopyWith<$Res>? get assignment;@override $TestAttemptFillCopyWith<$Res>? get attempt;@override $TestResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$TestAttemptStateCopyWithImpl<$Res>
    implements _$TestAttemptStateCopyWith<$Res> {
  __$TestAttemptStateCopyWithImpl(this._self, this._then);

  final _TestAttemptState _self;
  final $Res Function(_TestAttemptState) _then;

/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? error = freezed,Object? errorCode = freezed,Object? assignment = freezed,Object? attempt = freezed,Object? selectedOptionIds = null,Object? submitting = null,Object? submitErrorCode = freezed,Object? submitError = freezed,Object? result = freezed,Object? blocked = null,}) {
  return _then(_TestAttemptState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as TestAssignment?,attempt: freezed == attempt ? _self.attempt : attempt // ignore: cast_nullable_to_non_nullable
as TestAttemptFill?,selectedOptionIds: null == selectedOptionIds ? _self._selectedOptionIds : selectedOptionIds // ignore: cast_nullable_to_non_nullable
as Map<String, Set<String>>,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as TestResult?,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestAssignmentCopyWith<$Res>? get assignment {
    if (_self.assignment == null) {
    return null;
  }

  return $TestAssignmentCopyWith<$Res>(_self.assignment!, (value) {
    return _then(_self.copyWith(assignment: value));
  });
}/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestAttemptFillCopyWith<$Res>? get attempt {
    if (_self.attempt == null) {
    return null;
  }

  return $TestAttemptFillCopyWith<$Res>(_self.attempt!, (value) {
    return _then(_self.copyWith(attempt: value));
  });
}/// Create a copy of TestAttemptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $TestResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
