// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_assignment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestOrganizationBriefDto {

 String get id; String get name;
/// Create a copy of TestOrganizationBriefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestOrganizationBriefDtoCopyWith<TestOrganizationBriefDto> get copyWith => _$TestOrganizationBriefDtoCopyWithImpl<TestOrganizationBriefDto>(this as TestOrganizationBriefDto, _$identity);

  /// Serializes this TestOrganizationBriefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestOrganizationBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TestOrganizationBriefDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TestOrganizationBriefDtoCopyWith<$Res>  {
  factory $TestOrganizationBriefDtoCopyWith(TestOrganizationBriefDto value, $Res Function(TestOrganizationBriefDto) _then) = _$TestOrganizationBriefDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$TestOrganizationBriefDtoCopyWithImpl<$Res>
    implements $TestOrganizationBriefDtoCopyWith<$Res> {
  _$TestOrganizationBriefDtoCopyWithImpl(this._self, this._then);

  final TestOrganizationBriefDto _self;
  final $Res Function(TestOrganizationBriefDto) _then;

/// Create a copy of TestOrganizationBriefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TestOrganizationBriefDto].
extension TestOrganizationBriefDtoPatterns on TestOrganizationBriefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestOrganizationBriefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestOrganizationBriefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestOrganizationBriefDto value)  $default,){
final _that = this;
switch (_that) {
case _TestOrganizationBriefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestOrganizationBriefDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestOrganizationBriefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestOrganizationBriefDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _TestOrganizationBriefDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _TestOrganizationBriefDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TestOrganizationBriefDto implements TestOrganizationBriefDto {
  const _TestOrganizationBriefDto({required this.id, required this.name});
  factory _TestOrganizationBriefDto.fromJson(Map<String, dynamic> json) => _$TestOrganizationBriefDtoFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of TestOrganizationBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestOrganizationBriefDtoCopyWith<_TestOrganizationBriefDto> get copyWith => __$TestOrganizationBriefDtoCopyWithImpl<_TestOrganizationBriefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestOrganizationBriefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestOrganizationBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TestOrganizationBriefDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TestOrganizationBriefDtoCopyWith<$Res> implements $TestOrganizationBriefDtoCopyWith<$Res> {
  factory _$TestOrganizationBriefDtoCopyWith(_TestOrganizationBriefDto value, $Res Function(_TestOrganizationBriefDto) _then) = __$TestOrganizationBriefDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$TestOrganizationBriefDtoCopyWithImpl<$Res>
    implements _$TestOrganizationBriefDtoCopyWith<$Res> {
  __$TestOrganizationBriefDtoCopyWithImpl(this._self, this._then);

  final _TestOrganizationBriefDto _self;
  final $Res Function(_TestOrganizationBriefDto) _then;

/// Create a copy of TestOrganizationBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TestOrganizationBriefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TestTemplateBriefDto {

 String get id; String get title; String? get description; int get questionCount; int get maxAttempts; int get passThresholdPercent;/// Аддитивное поле — см. doc-комментарий `TestTemplateBrief` (домен).
 bool get shuffleQuestions;
/// Create a copy of TestTemplateBriefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestTemplateBriefDtoCopyWith<TestTemplateBriefDto> get copyWith => _$TestTemplateBriefDtoCopyWithImpl<TestTemplateBriefDto>(this as TestTemplateBriefDto, _$identity);

  /// Serializes this TestTemplateBriefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestTemplateBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.maxAttempts, maxAttempts) || other.maxAttempts == maxAttempts)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.shuffleQuestions, shuffleQuestions) || other.shuffleQuestions == shuffleQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,questionCount,maxAttempts,passThresholdPercent,shuffleQuestions);

@override
String toString() {
  return 'TestTemplateBriefDto(id: $id, title: $title, description: $description, questionCount: $questionCount, maxAttempts: $maxAttempts, passThresholdPercent: $passThresholdPercent, shuffleQuestions: $shuffleQuestions)';
}


}

/// @nodoc
abstract mixin class $TestTemplateBriefDtoCopyWith<$Res>  {
  factory $TestTemplateBriefDtoCopyWith(TestTemplateBriefDto value, $Res Function(TestTemplateBriefDto) _then) = _$TestTemplateBriefDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, int questionCount, int maxAttempts, int passThresholdPercent, bool shuffleQuestions
});




}
/// @nodoc
class _$TestTemplateBriefDtoCopyWithImpl<$Res>
    implements $TestTemplateBriefDtoCopyWith<$Res> {
  _$TestTemplateBriefDtoCopyWithImpl(this._self, this._then);

  final TestTemplateBriefDto _self;
  final $Res Function(TestTemplateBriefDto) _then;

/// Create a copy of TestTemplateBriefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? questionCount = null,Object? maxAttempts = null,Object? passThresholdPercent = null,Object? shuffleQuestions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,maxAttempts: null == maxAttempts ? _self.maxAttempts : maxAttempts // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,shuffleQuestions: null == shuffleQuestions ? _self.shuffleQuestions : shuffleQuestions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TestTemplateBriefDto].
extension TestTemplateBriefDtoPatterns on TestTemplateBriefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestTemplateBriefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestTemplateBriefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestTemplateBriefDto value)  $default,){
final _that = this;
switch (_that) {
case _TestTemplateBriefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestTemplateBriefDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestTemplateBriefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  int questionCount,  int maxAttempts,  int passThresholdPercent,  bool shuffleQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestTemplateBriefDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.questionCount,_that.maxAttempts,_that.passThresholdPercent,_that.shuffleQuestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  int questionCount,  int maxAttempts,  int passThresholdPercent,  bool shuffleQuestions)  $default,) {final _that = this;
switch (_that) {
case _TestTemplateBriefDto():
return $default(_that.id,_that.title,_that.description,_that.questionCount,_that.maxAttempts,_that.passThresholdPercent,_that.shuffleQuestions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  int questionCount,  int maxAttempts,  int passThresholdPercent,  bool shuffleQuestions)?  $default,) {final _that = this;
switch (_that) {
case _TestTemplateBriefDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.questionCount,_that.maxAttempts,_that.passThresholdPercent,_that.shuffleQuestions);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TestTemplateBriefDto implements TestTemplateBriefDto {
  const _TestTemplateBriefDto({required this.id, required this.title, this.description, this.questionCount = 0, this.maxAttempts = 1, this.passThresholdPercent = 70, this.shuffleQuestions = false});
  factory _TestTemplateBriefDto.fromJson(Map<String, dynamic> json) => _$TestTemplateBriefDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  int questionCount;
@override@JsonKey() final  int maxAttempts;
@override@JsonKey() final  int passThresholdPercent;
/// Аддитивное поле — см. doc-комментарий `TestTemplateBrief` (домен).
@override@JsonKey() final  bool shuffleQuestions;

/// Create a copy of TestTemplateBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestTemplateBriefDtoCopyWith<_TestTemplateBriefDto> get copyWith => __$TestTemplateBriefDtoCopyWithImpl<_TestTemplateBriefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestTemplateBriefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestTemplateBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.maxAttempts, maxAttempts) || other.maxAttempts == maxAttempts)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.shuffleQuestions, shuffleQuestions) || other.shuffleQuestions == shuffleQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,questionCount,maxAttempts,passThresholdPercent,shuffleQuestions);

@override
String toString() {
  return 'TestTemplateBriefDto(id: $id, title: $title, description: $description, questionCount: $questionCount, maxAttempts: $maxAttempts, passThresholdPercent: $passThresholdPercent, shuffleQuestions: $shuffleQuestions)';
}


}

/// @nodoc
abstract mixin class _$TestTemplateBriefDtoCopyWith<$Res> implements $TestTemplateBriefDtoCopyWith<$Res> {
  factory _$TestTemplateBriefDtoCopyWith(_TestTemplateBriefDto value, $Res Function(_TestTemplateBriefDto) _then) = __$TestTemplateBriefDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, int questionCount, int maxAttempts, int passThresholdPercent, bool shuffleQuestions
});




}
/// @nodoc
class __$TestTemplateBriefDtoCopyWithImpl<$Res>
    implements _$TestTemplateBriefDtoCopyWith<$Res> {
  __$TestTemplateBriefDtoCopyWithImpl(this._self, this._then);

  final _TestTemplateBriefDto _self;
  final $Res Function(_TestTemplateBriefDto) _then;

/// Create a copy of TestTemplateBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? questionCount = null,Object? maxAttempts = null,Object? passThresholdPercent = null,Object? shuffleQuestions = null,}) {
  return _then(_TestTemplateBriefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,maxAttempts: null == maxAttempts ? _self.maxAttempts : maxAttempts // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,shuffleQuestions: null == shuffleQuestions ? _self.shuffleQuestions : shuffleQuestions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TestAssignmentAttemptBriefDto {

// Бэк (MyAttemptSummary) отдаёт поле `number`, а не `attempt_number`.
@JsonKey(name: 'number') int get attemptNumber; int get percent; bool get passed;/// Nullable — см. doc-комментарий `TestAssignmentAttemptBrief` (домен).
 String? get id; String? get status; DateTime? get submittedAt;
/// Create a copy of TestAssignmentAttemptBriefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAssignmentAttemptBriefDtoCopyWith<TestAssignmentAttemptBriefDto> get copyWith => _$TestAssignmentAttemptBriefDtoCopyWithImpl<TestAssignmentAttemptBriefDto>(this as TestAssignmentAttemptBriefDto, _$identity);

  /// Serializes this TestAssignmentAttemptBriefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAssignmentAttemptBriefDto&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptNumber,percent,passed,id,status,submittedAt);

@override
String toString() {
  return 'TestAssignmentAttemptBriefDto(attemptNumber: $attemptNumber, percent: $percent, passed: $passed, id: $id, status: $status, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class $TestAssignmentAttemptBriefDtoCopyWith<$Res>  {
  factory $TestAssignmentAttemptBriefDtoCopyWith(TestAssignmentAttemptBriefDto value, $Res Function(TestAssignmentAttemptBriefDto) _then) = _$TestAssignmentAttemptBriefDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'number') int attemptNumber, int percent, bool passed, String? id, String? status, DateTime? submittedAt
});




}
/// @nodoc
class _$TestAssignmentAttemptBriefDtoCopyWithImpl<$Res>
    implements $TestAssignmentAttemptBriefDtoCopyWith<$Res> {
  _$TestAssignmentAttemptBriefDtoCopyWithImpl(this._self, this._then);

  final TestAssignmentAttemptBriefDto _self;
  final $Res Function(TestAssignmentAttemptBriefDto) _then;

/// Create a copy of TestAssignmentAttemptBriefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptNumber = null,Object? percent = null,Object? passed = null,Object? id = freezed,Object? status = freezed,Object? submittedAt = freezed,}) {
  return _then(_self.copyWith(
attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAssignmentAttemptBriefDto].
extension TestAssignmentAttemptBriefDtoPatterns on TestAssignmentAttemptBriefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAssignmentAttemptBriefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAssignmentAttemptBriefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAssignmentAttemptBriefDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAssignmentAttemptBriefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAssignmentAttemptBriefDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAssignmentAttemptBriefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'number')  int attemptNumber,  int percent,  bool passed,  String? id,  String? status,  DateTime? submittedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAssignmentAttemptBriefDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'number')  int attemptNumber,  int percent,  bool passed,  String? id,  String? status,  DateTime? submittedAt)  $default,) {final _that = this;
switch (_that) {
case _TestAssignmentAttemptBriefDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'number')  int attemptNumber,  int percent,  bool passed,  String? id,  String? status,  DateTime? submittedAt)?  $default,) {final _that = this;
switch (_that) {
case _TestAssignmentAttemptBriefDto() when $default != null:
return $default(_that.attemptNumber,_that.percent,_that.passed,_that.id,_that.status,_that.submittedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TestAssignmentAttemptBriefDto implements TestAssignmentAttemptBriefDto {
  const _TestAssignmentAttemptBriefDto({@JsonKey(name: 'number') this.attemptNumber = 0, this.percent = 0, this.passed = false, this.id, this.status, this.submittedAt});
  factory _TestAssignmentAttemptBriefDto.fromJson(Map<String, dynamic> json) => _$TestAssignmentAttemptBriefDtoFromJson(json);

// Бэк (MyAttemptSummary) отдаёт поле `number`, а не `attempt_number`.
@override@JsonKey(name: 'number') final  int attemptNumber;
@override@JsonKey() final  int percent;
@override@JsonKey() final  bool passed;
/// Nullable — см. doc-комментарий `TestAssignmentAttemptBrief` (домен).
@override final  String? id;
@override final  String? status;
@override final  DateTime? submittedAt;

/// Create a copy of TestAssignmentAttemptBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAssignmentAttemptBriefDtoCopyWith<_TestAssignmentAttemptBriefDto> get copyWith => __$TestAssignmentAttemptBriefDtoCopyWithImpl<_TestAssignmentAttemptBriefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAssignmentAttemptBriefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAssignmentAttemptBriefDto&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptNumber,percent,passed,id,status,submittedAt);

@override
String toString() {
  return 'TestAssignmentAttemptBriefDto(attemptNumber: $attemptNumber, percent: $percent, passed: $passed, id: $id, status: $status, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class _$TestAssignmentAttemptBriefDtoCopyWith<$Res> implements $TestAssignmentAttemptBriefDtoCopyWith<$Res> {
  factory _$TestAssignmentAttemptBriefDtoCopyWith(_TestAssignmentAttemptBriefDto value, $Res Function(_TestAssignmentAttemptBriefDto) _then) = __$TestAssignmentAttemptBriefDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'number') int attemptNumber, int percent, bool passed, String? id, String? status, DateTime? submittedAt
});




}
/// @nodoc
class __$TestAssignmentAttemptBriefDtoCopyWithImpl<$Res>
    implements _$TestAssignmentAttemptBriefDtoCopyWith<$Res> {
  __$TestAssignmentAttemptBriefDtoCopyWithImpl(this._self, this._then);

  final _TestAssignmentAttemptBriefDto _self;
  final $Res Function(_TestAssignmentAttemptBriefDto) _then;

/// Create a copy of TestAssignmentAttemptBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attemptNumber = null,Object? percent = null,Object? passed = null,Object? id = freezed,Object? status = freezed,Object? submittedAt = freezed,}) {
  return _then(_TestAssignmentAttemptBriefDto(
attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$TestAssignmentDto {

 String get id; TestOrganizationBriefDto get organization; TestTemplateBriefDto get template;/// Сырое значение (`assigned`/`in_progress`/`passed`/`failed`) —
/// парсится в маппере.
 String get status; int get attemptsUsed; int? get bestPercent; bool get passed; DateTime? get dueAt; List<TestAssignmentAttemptBriefDto>? get attempts;/// Аддитивное nullable поле (`MyTestAssignmentOut.organization_timezone`,
/// backend `23dc2e3`) — та же форма используется и списком, и деталью
/// назначения (`GET /my/test-assignments`/`/{id}`). `/my/*` не scoped
/// по `{org_id}`, поэтому зона нужна на каждом элементе явно, а не
/// угадывается клиентом по уже загрученному списку организаций
/// (см. `TestAssignmentTimeContext.timeContext`).
 String? get organizationTimezone;
/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAssignmentDtoCopyWith<TestAssignmentDto> get copyWith => _$TestAssignmentDtoCopyWithImpl<TestAssignmentDto>(this as TestAssignmentDto, _$identity);

  /// Serializes this TestAssignmentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAssignmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.template, template) || other.template == template)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&(identical(other.bestPercent, bestPercent) || other.bestPercent == bestPercent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&const DeepCollectionEquality().equals(other.attempts, attempts)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organization,template,status,attemptsUsed,bestPercent,passed,dueAt,const DeepCollectionEquality().hash(attempts),organizationTimezone);

@override
String toString() {
  return 'TestAssignmentDto(id: $id, organization: $organization, template: $template, status: $status, attemptsUsed: $attemptsUsed, bestPercent: $bestPercent, passed: $passed, dueAt: $dueAt, attempts: $attempts, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class $TestAssignmentDtoCopyWith<$Res>  {
  factory $TestAssignmentDtoCopyWith(TestAssignmentDto value, $Res Function(TestAssignmentDto) _then) = _$TestAssignmentDtoCopyWithImpl;
@useResult
$Res call({
 String id, TestOrganizationBriefDto organization, TestTemplateBriefDto template, String status, int attemptsUsed, int? bestPercent, bool passed, DateTime? dueAt, List<TestAssignmentAttemptBriefDto>? attempts, String? organizationTimezone
});


$TestOrganizationBriefDtoCopyWith<$Res> get organization;$TestTemplateBriefDtoCopyWith<$Res> get template;

}
/// @nodoc
class _$TestAssignmentDtoCopyWithImpl<$Res>
    implements $TestAssignmentDtoCopyWith<$Res> {
  _$TestAssignmentDtoCopyWithImpl(this._self, this._then);

  final TestAssignmentDto _self;
  final $Res Function(TestAssignmentDto) _then;

/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? organization = null,Object? template = null,Object? status = null,Object? attemptsUsed = null,Object? bestPercent = freezed,Object? passed = null,Object? dueAt = freezed,Object? attempts = freezed,Object? organizationTimezone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as TestOrganizationBriefDto,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as TestTemplateBriefDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,attemptsUsed: null == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int,bestPercent: freezed == bestPercent ? _self.bestPercent : bestPercent // ignore: cast_nullable_to_non_nullable
as int?,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attempts: freezed == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<TestAssignmentAttemptBriefDto>?,organizationTimezone: freezed == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestOrganizationBriefDtoCopyWith<$Res> get organization {
  
  return $TestOrganizationBriefDtoCopyWith<$Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestTemplateBriefDtoCopyWith<$Res> get template {
  
  return $TestTemplateBriefDtoCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}


/// Adds pattern-matching-related methods to [TestAssignmentDto].
extension TestAssignmentDtoPatterns on TestAssignmentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAssignmentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAssignmentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAssignmentDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAssignmentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAssignmentDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAssignmentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TestOrganizationBriefDto organization,  TestTemplateBriefDto template,  String status,  int attemptsUsed,  int? bestPercent,  bool passed,  DateTime? dueAt,  List<TestAssignmentAttemptBriefDto>? attempts,  String? organizationTimezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAssignmentDto() when $default != null:
return $default(_that.id,_that.organization,_that.template,_that.status,_that.attemptsUsed,_that.bestPercent,_that.passed,_that.dueAt,_that.attempts,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TestOrganizationBriefDto organization,  TestTemplateBriefDto template,  String status,  int attemptsUsed,  int? bestPercent,  bool passed,  DateTime? dueAt,  List<TestAssignmentAttemptBriefDto>? attempts,  String? organizationTimezone)  $default,) {final _that = this;
switch (_that) {
case _TestAssignmentDto():
return $default(_that.id,_that.organization,_that.template,_that.status,_that.attemptsUsed,_that.bestPercent,_that.passed,_that.dueAt,_that.attempts,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TestOrganizationBriefDto organization,  TestTemplateBriefDto template,  String status,  int attemptsUsed,  int? bestPercent,  bool passed,  DateTime? dueAt,  List<TestAssignmentAttemptBriefDto>? attempts,  String? organizationTimezone)?  $default,) {final _that = this;
switch (_that) {
case _TestAssignmentDto() when $default != null:
return $default(_that.id,_that.organization,_that.template,_that.status,_that.attemptsUsed,_that.bestPercent,_that.passed,_that.dueAt,_that.attempts,_that.organizationTimezone);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TestAssignmentDto implements TestAssignmentDto {
  const _TestAssignmentDto({required this.id, required this.organization, required this.template, required this.status, this.attemptsUsed = 0, this.bestPercent, this.passed = false, this.dueAt, final  List<TestAssignmentAttemptBriefDto>? attempts, this.organizationTimezone}): _attempts = attempts;
  factory _TestAssignmentDto.fromJson(Map<String, dynamic> json) => _$TestAssignmentDtoFromJson(json);

@override final  String id;
@override final  TestOrganizationBriefDto organization;
@override final  TestTemplateBriefDto template;
/// Сырое значение (`assigned`/`in_progress`/`passed`/`failed`) —
/// парсится в маппере.
@override final  String status;
@override@JsonKey() final  int attemptsUsed;
@override final  int? bestPercent;
@override@JsonKey() final  bool passed;
@override final  DateTime? dueAt;
 final  List<TestAssignmentAttemptBriefDto>? _attempts;
@override List<TestAssignmentAttemptBriefDto>? get attempts {
  final value = _attempts;
  if (value == null) return null;
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Аддитивное nullable поле (`MyTestAssignmentOut.organization_timezone`,
/// backend `23dc2e3`) — та же форма используется и списком, и деталью
/// назначения (`GET /my/test-assignments`/`/{id}`). `/my/*` не scoped
/// по `{org_id}`, поэтому зона нужна на каждом элементе явно, а не
/// угадывается клиентом по уже загрученному списку организаций
/// (см. `TestAssignmentTimeContext.timeContext`).
@override final  String? organizationTimezone;

/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAssignmentDtoCopyWith<_TestAssignmentDto> get copyWith => __$TestAssignmentDtoCopyWithImpl<_TestAssignmentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAssignmentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAssignmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.template, template) || other.template == template)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptsUsed, attemptsUsed) || other.attemptsUsed == attemptsUsed)&&(identical(other.bestPercent, bestPercent) || other.bestPercent == bestPercent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&const DeepCollectionEquality().equals(other._attempts, _attempts)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organization,template,status,attemptsUsed,bestPercent,passed,dueAt,const DeepCollectionEquality().hash(_attempts),organizationTimezone);

@override
String toString() {
  return 'TestAssignmentDto(id: $id, organization: $organization, template: $template, status: $status, attemptsUsed: $attemptsUsed, bestPercent: $bestPercent, passed: $passed, dueAt: $dueAt, attempts: $attempts, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class _$TestAssignmentDtoCopyWith<$Res> implements $TestAssignmentDtoCopyWith<$Res> {
  factory _$TestAssignmentDtoCopyWith(_TestAssignmentDto value, $Res Function(_TestAssignmentDto) _then) = __$TestAssignmentDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, TestOrganizationBriefDto organization, TestTemplateBriefDto template, String status, int attemptsUsed, int? bestPercent, bool passed, DateTime? dueAt, List<TestAssignmentAttemptBriefDto>? attempts, String? organizationTimezone
});


@override $TestOrganizationBriefDtoCopyWith<$Res> get organization;@override $TestTemplateBriefDtoCopyWith<$Res> get template;

}
/// @nodoc
class __$TestAssignmentDtoCopyWithImpl<$Res>
    implements _$TestAssignmentDtoCopyWith<$Res> {
  __$TestAssignmentDtoCopyWithImpl(this._self, this._then);

  final _TestAssignmentDto _self;
  final $Res Function(_TestAssignmentDto) _then;

/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? organization = null,Object? template = null,Object? status = null,Object? attemptsUsed = null,Object? bestPercent = freezed,Object? passed = null,Object? dueAt = freezed,Object? attempts = freezed,Object? organizationTimezone = freezed,}) {
  return _then(_TestAssignmentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as TestOrganizationBriefDto,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as TestTemplateBriefDto,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,attemptsUsed: null == attemptsUsed ? _self.attemptsUsed : attemptsUsed // ignore: cast_nullable_to_non_nullable
as int,bestPercent: freezed == bestPercent ? _self.bestPercent : bestPercent // ignore: cast_nullable_to_non_nullable
as int?,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attempts: freezed == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<TestAssignmentAttemptBriefDto>?,organizationTimezone: freezed == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestOrganizationBriefDtoCopyWith<$Res> get organization {
  
  return $TestOrganizationBriefDtoCopyWith<$Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}/// Create a copy of TestAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestTemplateBriefDtoCopyWith<$Res> get template {
  
  return $TestTemplateBriefDtoCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}


/// @nodoc
mixin _$PaginatedTestAssignmentsDto {

// Бэк `GET /my/test-assignments` (MyTestAssignmentListResponse) снова
// пагинирован — отдаёт `{items, total, limit, offset}`, сортировка
// стабильная `created_at DESC`. total/limit/offset помечены `@Default(0)`
// (не required): если старый билд бэка вернёт голый `{items}`, парсинг не
// упадёт (`type Null is not a subtype of num`), а маппер отдаст безопасный
// фолбэк одной страницы (hasMore=false при total=0).
 List<TestAssignmentDto> get items; int get total; int get limit; int get offset;
/// Create a copy of PaginatedTestAssignmentsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedTestAssignmentsDtoCopyWith<PaginatedTestAssignmentsDto> get copyWith => _$PaginatedTestAssignmentsDtoCopyWithImpl<PaginatedTestAssignmentsDto>(this as PaginatedTestAssignmentsDto, _$identity);

  /// Serializes this PaginatedTestAssignmentsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedTestAssignmentsDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,limit,offset);

@override
String toString() {
  return 'PaginatedTestAssignmentsDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $PaginatedTestAssignmentsDtoCopyWith<$Res>  {
  factory $PaginatedTestAssignmentsDtoCopyWith(PaginatedTestAssignmentsDto value, $Res Function(PaginatedTestAssignmentsDto) _then) = _$PaginatedTestAssignmentsDtoCopyWithImpl;
@useResult
$Res call({
 List<TestAssignmentDto> items, int total, int limit, int offset
});




}
/// @nodoc
class _$PaginatedTestAssignmentsDtoCopyWithImpl<$Res>
    implements $PaginatedTestAssignmentsDtoCopyWith<$Res> {
  _$PaginatedTestAssignmentsDtoCopyWithImpl(this._self, this._then);

  final PaginatedTestAssignmentsDto _self;
  final $Res Function(PaginatedTestAssignmentsDto) _then;

/// Create a copy of PaginatedTestAssignmentsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TestAssignmentDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedTestAssignmentsDto].
extension PaginatedTestAssignmentsDtoPatterns on PaginatedTestAssignmentsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedTestAssignmentsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedTestAssignmentsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedTestAssignmentsDto value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedTestAssignmentsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedTestAssignmentsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedTestAssignmentsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TestAssignmentDto> items,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedTestAssignmentsDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TestAssignmentDto> items,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _PaginatedTestAssignmentsDto():
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TestAssignmentDto> items,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedTestAssignmentsDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _PaginatedTestAssignmentsDto implements PaginatedTestAssignmentsDto {
  const _PaginatedTestAssignmentsDto({required final  List<TestAssignmentDto> items, this.total = 0, this.limit = 0, this.offset = 0}): _items = items;
  factory _PaginatedTestAssignmentsDto.fromJson(Map<String, dynamic> json) => _$PaginatedTestAssignmentsDtoFromJson(json);

// Бэк `GET /my/test-assignments` (MyTestAssignmentListResponse) снова
// пагинирован — отдаёт `{items, total, limit, offset}`, сортировка
// стабильная `created_at DESC`. total/limit/offset помечены `@Default(0)`
// (не required): если старый билд бэка вернёт голый `{items}`, парсинг не
// упадёт (`type Null is not a subtype of num`), а маппер отдаст безопасный
// фолбэк одной страницы (hasMore=false при total=0).
 final  List<TestAssignmentDto> _items;
// Бэк `GET /my/test-assignments` (MyTestAssignmentListResponse) снова
// пагинирован — отдаёт `{items, total, limit, offset}`, сортировка
// стабильная `created_at DESC`. total/limit/offset помечены `@Default(0)`
// (не required): если старый билд бэка вернёт голый `{items}`, парсинг не
// упадёт (`type Null is not a subtype of num`), а маппер отдаст безопасный
// фолбэк одной страницы (hasMore=false при total=0).
@override List<TestAssignmentDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;

/// Create a copy of PaginatedTestAssignmentsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedTestAssignmentsDtoCopyWith<_PaginatedTestAssignmentsDto> get copyWith => __$PaginatedTestAssignmentsDtoCopyWithImpl<_PaginatedTestAssignmentsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedTestAssignmentsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedTestAssignmentsDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,limit,offset);

@override
String toString() {
  return 'PaginatedTestAssignmentsDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$PaginatedTestAssignmentsDtoCopyWith<$Res> implements $PaginatedTestAssignmentsDtoCopyWith<$Res> {
  factory _$PaginatedTestAssignmentsDtoCopyWith(_PaginatedTestAssignmentsDto value, $Res Function(_PaginatedTestAssignmentsDto) _then) = __$PaginatedTestAssignmentsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<TestAssignmentDto> items, int total, int limit, int offset
});




}
/// @nodoc
class __$PaginatedTestAssignmentsDtoCopyWithImpl<$Res>
    implements _$PaginatedTestAssignmentsDtoCopyWith<$Res> {
  __$PaginatedTestAssignmentsDtoCopyWithImpl(this._self, this._then);

  final _PaginatedTestAssignmentsDto _self;
  final $Res Function(_PaginatedTestAssignmentsDto) _then;

/// Create a copy of PaginatedTestAssignmentsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_PaginatedTestAssignmentsDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TestAssignmentDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
