// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestTemplateBrief {

 String get id; String get title; int get questionCount; int get maxAttempts; int get passThresholdPercent; String? get description; bool get shuffleQuestions;
/// Create a copy of TestTemplateBrief
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestTemplateBriefCopyWith<TestTemplateBrief> get copyWith => _$TestTemplateBriefCopyWithImpl<TestTemplateBrief>(this as TestTemplateBrief, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestTemplateBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.maxAttempts, maxAttempts) || other.maxAttempts == maxAttempts)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.description, description) || other.description == description)&&(identical(other.shuffleQuestions, shuffleQuestions) || other.shuffleQuestions == shuffleQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,questionCount,maxAttempts,passThresholdPercent,description,shuffleQuestions);

@override
String toString() {
  return 'TestTemplateBrief(id: $id, title: $title, questionCount: $questionCount, maxAttempts: $maxAttempts, passThresholdPercent: $passThresholdPercent, description: $description, shuffleQuestions: $shuffleQuestions)';
}


}

/// @nodoc
abstract mixin class $TestTemplateBriefCopyWith<$Res>  {
  factory $TestTemplateBriefCopyWith(TestTemplateBrief value, $Res Function(TestTemplateBrief) _then) = _$TestTemplateBriefCopyWithImpl;
@useResult
$Res call({
 String id, String title, int questionCount, int maxAttempts, int passThresholdPercent, String? description, bool shuffleQuestions
});




}
/// @nodoc
class _$TestTemplateBriefCopyWithImpl<$Res>
    implements $TestTemplateBriefCopyWith<$Res> {
  _$TestTemplateBriefCopyWithImpl(this._self, this._then);

  final TestTemplateBrief _self;
  final $Res Function(TestTemplateBrief) _then;

/// Create a copy of TestTemplateBrief
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? questionCount = null,Object? maxAttempts = null,Object? passThresholdPercent = null,Object? description = freezed,Object? shuffleQuestions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,maxAttempts: null == maxAttempts ? _self.maxAttempts : maxAttempts // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shuffleQuestions: null == shuffleQuestions ? _self.shuffleQuestions : shuffleQuestions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TestTemplateBrief].
extension TestTemplateBriefPatterns on TestTemplateBrief {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestTemplateBrief value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestTemplateBrief() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestTemplateBrief value)  $default,){
final _that = this;
switch (_that) {
case _TestTemplateBrief():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestTemplateBrief value)?  $default,){
final _that = this;
switch (_that) {
case _TestTemplateBrief() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int questionCount,  int maxAttempts,  int passThresholdPercent,  String? description,  bool shuffleQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestTemplateBrief() when $default != null:
return $default(_that.id,_that.title,_that.questionCount,_that.maxAttempts,_that.passThresholdPercent,_that.description,_that.shuffleQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int questionCount,  int maxAttempts,  int passThresholdPercent,  String? description,  bool shuffleQuestions)  $default,) {final _that = this;
switch (_that) {
case _TestTemplateBrief():
return $default(_that.id,_that.title,_that.questionCount,_that.maxAttempts,_that.passThresholdPercent,_that.description,_that.shuffleQuestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int questionCount,  int maxAttempts,  int passThresholdPercent,  String? description,  bool shuffleQuestions)?  $default,) {final _that = this;
switch (_that) {
case _TestTemplateBrief() when $default != null:
return $default(_that.id,_that.title,_that.questionCount,_that.maxAttempts,_that.passThresholdPercent,_that.description,_that.shuffleQuestions);case _:
  return null;

}
}

}

/// @nodoc


class _TestTemplateBrief implements TestTemplateBrief {
  const _TestTemplateBrief({required this.id, required this.title, required this.questionCount, required this.maxAttempts, required this.passThresholdPercent, this.description, this.shuffleQuestions = false});
  

@override final  String id;
@override final  String title;
@override final  int questionCount;
@override final  int maxAttempts;
@override final  int passThresholdPercent;
@override final  String? description;
@override@JsonKey() final  bool shuffleQuestions;

/// Create a copy of TestTemplateBrief
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestTemplateBriefCopyWith<_TestTemplateBrief> get copyWith => __$TestTemplateBriefCopyWithImpl<_TestTemplateBrief>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestTemplateBrief&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.maxAttempts, maxAttempts) || other.maxAttempts == maxAttempts)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.description, description) || other.description == description)&&(identical(other.shuffleQuestions, shuffleQuestions) || other.shuffleQuestions == shuffleQuestions));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,questionCount,maxAttempts,passThresholdPercent,description,shuffleQuestions);

@override
String toString() {
  return 'TestTemplateBrief(id: $id, title: $title, questionCount: $questionCount, maxAttempts: $maxAttempts, passThresholdPercent: $passThresholdPercent, description: $description, shuffleQuestions: $shuffleQuestions)';
}


}

/// @nodoc
abstract mixin class _$TestTemplateBriefCopyWith<$Res> implements $TestTemplateBriefCopyWith<$Res> {
  factory _$TestTemplateBriefCopyWith(_TestTemplateBrief value, $Res Function(_TestTemplateBrief) _then) = __$TestTemplateBriefCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int questionCount, int maxAttempts, int passThresholdPercent, String? description, bool shuffleQuestions
});




}
/// @nodoc
class __$TestTemplateBriefCopyWithImpl<$Res>
    implements _$TestTemplateBriefCopyWith<$Res> {
  __$TestTemplateBriefCopyWithImpl(this._self, this._then);

  final _TestTemplateBrief _self;
  final $Res Function(_TestTemplateBrief) _then;

/// Create a copy of TestTemplateBrief
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? questionCount = null,Object? maxAttempts = null,Object? passThresholdPercent = null,Object? description = freezed,Object? shuffleQuestions = null,}) {
  return _then(_TestTemplateBrief(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,maxAttempts: null == maxAttempts ? _self.maxAttempts : maxAttempts // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shuffleQuestions: null == shuffleQuestions ? _self.shuffleQuestions : shuffleQuestions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TestAssignmentAttemptBrief {

 int get attemptNumber; int get percent; bool get passed; String? get id; TestAttemptStatus? get status; DateTime? get submittedAt;
/// Create a copy of TestAssignmentAttemptBrief
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAssignmentAttemptBriefCopyWith<TestAssignmentAttemptBrief> get copyWith => _$TestAssignmentAttemptBriefCopyWithImpl<TestAssignmentAttemptBrief>(this as TestAssignmentAttemptBrief, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAssignmentAttemptBrief&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}


@override
int get hashCode => Object.hash(runtimeType,attemptNumber,percent,passed,id,status,submittedAt);

@override
String toString() {
  return 'TestAssignmentAttemptBrief(attemptNumber: $attemptNumber, percent: $percent, passed: $passed, id: $id, status: $status, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class $TestAssignmentAttemptBriefCopyWith<$Res>  {
  factory $TestAssignmentAttemptBriefCopyWith(TestAssignmentAttemptBrief value, $Res Function(TestAssignmentAttemptBrief) _then) = _$TestAssignmentAttemptBriefCopyWithImpl;
@useResult
$Res call({
 int attemptNumber, int percent, bool passed, String? id, TestAttemptStatus? status, DateTime? submittedAt
});




}
/// @nodoc
class _$TestAssignmentAttemptBriefCopyWithImpl<$Res>
    implements $TestAssignmentAttemptBriefCopyWith<$Res> {
  _$TestAssignmentAttemptBriefCopyWithImpl(this._self, this._then);

  final TestAssignmentAttemptBrief _self;
  final $Res Function(TestAssignmentAttemptBrief) _then;

/// Create a copy of TestAssignmentAttemptBrief
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptNumber = null,Object? percent = null,Object? passed = null,Object? id = freezed,Object? status = freezed,Object? submittedAt = freezed,}) {
  return _then(_self.copyWith(
attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAttemptStatus?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAssignmentAttemptBrief].
extension TestAssignmentAttemptBriefPatterns on TestAssignmentAttemptBrief {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAssignmentAttemptBrief value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAssignmentAttemptBrief() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAssignmentAttemptBrief value)  $default,){
final _that = this;
switch (_that) {
case _TestAssignmentAttemptBrief():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAssignmentAttemptBrief value)?  $default,){
final _that = this;
switch (_that) {
case _TestAssignmentAttemptBrief() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int attemptNumber,  int percent,  bool passed,  String? id,  TestAttemptStatus? status,  DateTime? submittedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAssignmentAttemptBrief() when $default != null:
return $default(_that.attemptNumber,_that.percent,_that.passed,_that.id,_that.status,_that.submittedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int attemptNumber,  int percent,  bool passed,  String? id,  TestAttemptStatus? status,  DateTime? submittedAt)  $default,) {final _that = this;
switch (_that) {
case _TestAssignmentAttemptBrief():
return $default(_that.attemptNumber,_that.percent,_that.passed,_that.id,_that.status,_that.submittedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int attemptNumber,  int percent,  bool passed,  String? id,  TestAttemptStatus? status,  DateTime? submittedAt)?  $default,) {final _that = this;
switch (_that) {
case _TestAssignmentAttemptBrief() when $default != null:
return $default(_that.attemptNumber,_that.percent,_that.passed,_that.id,_that.status,_that.submittedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TestAssignmentAttemptBrief extends TestAssignmentAttemptBrief {
  const _TestAssignmentAttemptBrief({required this.attemptNumber, required this.percent, required this.passed, this.id, this.status, this.submittedAt}): super._();
  

@override final  int attemptNumber;
@override final  int percent;
@override final  bool passed;
@override final  String? id;
@override final  TestAttemptStatus? status;
@override final  DateTime? submittedAt;

/// Create a copy of TestAssignmentAttemptBrief
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAssignmentAttemptBriefCopyWith<_TestAssignmentAttemptBrief> get copyWith => __$TestAssignmentAttemptBriefCopyWithImpl<_TestAssignmentAttemptBrief>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAssignmentAttemptBrief&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}


@override
int get hashCode => Object.hash(runtimeType,attemptNumber,percent,passed,id,status,submittedAt);

@override
String toString() {
  return 'TestAssignmentAttemptBrief(attemptNumber: $attemptNumber, percent: $percent, passed: $passed, id: $id, status: $status, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class _$TestAssignmentAttemptBriefCopyWith<$Res> implements $TestAssignmentAttemptBriefCopyWith<$Res> {
  factory _$TestAssignmentAttemptBriefCopyWith(_TestAssignmentAttemptBrief value, $Res Function(_TestAssignmentAttemptBrief) _then) = __$TestAssignmentAttemptBriefCopyWithImpl;
@override @useResult
$Res call({
 int attemptNumber, int percent, bool passed, String? id, TestAttemptStatus? status, DateTime? submittedAt
});




}
/// @nodoc
class __$TestAssignmentAttemptBriefCopyWithImpl<$Res>
    implements _$TestAssignmentAttemptBriefCopyWith<$Res> {
  __$TestAssignmentAttemptBriefCopyWithImpl(this._self, this._then);

  final _TestAssignmentAttemptBrief _self;
  final $Res Function(_TestAssignmentAttemptBrief) _then;

/// Create a copy of TestAssignmentAttemptBrief
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attemptNumber = null,Object? percent = null,Object? passed = null,Object? id = freezed,Object? status = freezed,Object? submittedAt = freezed,}) {
  return _then(_TestAssignmentAttemptBrief(
attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAttemptStatus?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$TestAssignment {

 String get id; String get organizationId; String get organizationName; TestTemplateBrief get template; TestAssignmentStatus get status; int get attemptsUsed; bool get passed; int? get bestPercent; DateTime? get dueAt; List<TestAssignmentAttemptBrief>? get attempts;
/// Create a copy of TestAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAssignmentCopyWith<TestAssignment> get copyWith => _$TestAssignmentCopyWithImpl<TestAssignment>(this as TestAssignment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.template, template) || other.template == template)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.bestPercent, bestPercent) || other.bestPercent == bestPercent)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&const DeepCollectionEquality().equals(other.attempts, attempts));
}


@override
int get hashCode => Object.hash(runtimeType,id,organizationId,organizationName,template,status,attemptsUsed,passed,bestPercent,dueAt,const DeepCollectionEquality().hash(attempts));

@override
String toString() {
  return 'TestAssignment(id: $id, organizationId: $organizationId, organizationName: $organizationName, template: $template, status: $status, attemptsUsed: $attemptsUsed, passed: $passed, bestPercent: $bestPercent, dueAt: $dueAt, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $TestAssignmentCopyWith<$Res>  {
  factory $TestAssignmentCopyWith(TestAssignment value, $Res Function(TestAssignment) _then) = _$TestAssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String organizationId, String organizationName, TestTemplateBrief template, TestAssignmentStatus status, int attemptsUsed, bool passed, int? bestPercent, DateTime? dueAt, List<TestAssignmentAttemptBrief>? attempts
});


$TestTemplateBriefCopyWith<$Res> get template;

}
/// @nodoc
class _$TestAssignmentCopyWithImpl<$Res>
    implements $TestAssignmentCopyWith<$Res> {
  _$TestAssignmentCopyWithImpl(this._self, this._then);

  final TestAssignment _self;
  final $Res Function(TestAssignment) _then;

/// Create a copy of TestAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? organizationId = null,Object? organizationName = null,Object? template = null,Object? status = null,Object? attemptsUsed = null,Object? passed = null,Object? bestPercent = freezed,Object? dueAt = freezed,Object? attempts = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,organizationName: null == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as TestTemplateBrief,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAssignmentStatus,attemptsUsed: null == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,bestPercent: freezed == bestPercent ? _self.bestPercent : bestPercent // ignore: cast_nullable_to_non_nullable
as int?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attempts: freezed == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<TestAssignmentAttemptBrief>?,
  ));
}
/// Create a copy of TestAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestTemplateBriefCopyWith<$Res> get template {
  
  return $TestTemplateBriefCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}


/// Adds pattern-matching-related methods to [TestAssignment].
extension TestAssignmentPatterns on TestAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAssignment value)  $default,){
final _that = this;
switch (_that) {
case _TestAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _TestAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String organizationId,  String organizationName,  TestTemplateBrief template,  TestAssignmentStatus status,  int attemptsUsed,  bool passed,  int? bestPercent,  DateTime? dueAt,  List<TestAssignmentAttemptBrief>? attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAssignment() when $default != null:
return $default(_that.id,_that.organizationId,_that.organizationName,_that.template,_that.status,_that.attemptsUsed,_that.passed,_that.bestPercent,_that.dueAt,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String organizationId,  String organizationName,  TestTemplateBrief template,  TestAssignmentStatus status,  int attemptsUsed,  bool passed,  int? bestPercent,  DateTime? dueAt,  List<TestAssignmentAttemptBrief>? attempts)  $default,) {final _that = this;
switch (_that) {
case _TestAssignment():
return $default(_that.id,_that.organizationId,_that.organizationName,_that.template,_that.status,_that.attemptsUsed,_that.passed,_that.bestPercent,_that.dueAt,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String organizationId,  String organizationName,  TestTemplateBrief template,  TestAssignmentStatus status,  int attemptsUsed,  bool passed,  int? bestPercent,  DateTime? dueAt,  List<TestAssignmentAttemptBrief>? attempts)?  $default,) {final _that = this;
switch (_that) {
case _TestAssignment() when $default != null:
return $default(_that.id,_that.organizationId,_that.organizationName,_that.template,_that.status,_that.attemptsUsed,_that.passed,_that.bestPercent,_that.dueAt,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc


class _TestAssignment implements TestAssignment {
  const _TestAssignment({required this.id, required this.organizationId, required this.organizationName, required this.template, required this.status, required this.attemptsUsed, required this.passed, this.bestPercent, this.dueAt, final  List<TestAssignmentAttemptBrief>? attempts}): _attempts = attempts;
  

@override final  String id;
@override final  String organizationId;
@override final  String organizationName;
@override final  TestTemplateBrief template;
@override final  TestAssignmentStatus status;
@override final  int attemptsUsed;
@override final  bool passed;
@override final  int? bestPercent;
@override final  DateTime? dueAt;
 final  List<TestAssignmentAttemptBrief>? _attempts;
@override List<TestAssignmentAttemptBrief>? get attempts {
  final value = _attempts;
  if (value == null) return null;
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TestAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAssignmentCopyWith<_TestAssignment> get copyWith => __$TestAssignmentCopyWithImpl<_TestAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.template, template) || other.template == template)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.bestPercent, bestPercent) || other.bestPercent == bestPercent)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&const DeepCollectionEquality().equals(other._attempts, _attempts));
}


@override
int get hashCode => Object.hash(runtimeType,id,organizationId,organizationName,template,status,attemptsUsed,passed,bestPercent,dueAt,const DeepCollectionEquality().hash(_attempts));

@override
String toString() {
  return 'TestAssignment(id: $id, organizationId: $organizationId, organizationName: $organizationName, template: $template, status: $status, attemptsUsed: $attemptsUsed, passed: $passed, bestPercent: $bestPercent, dueAt: $dueAt, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$TestAssignmentCopyWith<$Res> implements $TestAssignmentCopyWith<$Res> {
  factory _$TestAssignmentCopyWith(_TestAssignment value, $Res Function(_TestAssignment) _then) = __$TestAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String organizationId, String organizationName, TestTemplateBrief template, TestAssignmentStatus status, int attemptsUsed, bool passed, int? bestPercent, DateTime? dueAt, List<TestAssignmentAttemptBrief>? attempts
});


@override $TestTemplateBriefCopyWith<$Res> get template;

}
/// @nodoc
class __$TestAssignmentCopyWithImpl<$Res>
    implements _$TestAssignmentCopyWith<$Res> {
  __$TestAssignmentCopyWithImpl(this._self, this._then);

  final _TestAssignment _self;
  final $Res Function(_TestAssignment) _then;

/// Create a copy of TestAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? organizationId = null,Object? organizationName = null,Object? template = null,Object? status = null,Object? attemptsUsed = null,Object? passed = null,Object? bestPercent = freezed,Object? dueAt = freezed,Object? attempts = freezed,}) {
  return _then(_TestAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,organizationName: null == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as TestTemplateBrief,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAssignmentStatus,attemptsUsed: null == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,bestPercent: freezed == bestPercent ? _self.bestPercent : bestPercent // ignore: cast_nullable_to_non_nullable
as int?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attempts: freezed == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<TestAssignmentAttemptBrief>?,
  ));
}

/// Create a copy of TestAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestTemplateBriefCopyWith<$Res> get template {
  
  return $TestTemplateBriefCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}

// dart format on
