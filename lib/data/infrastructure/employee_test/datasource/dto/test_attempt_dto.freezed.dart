// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_attempt_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestAttemptOptionDto {

 String get id; String get text; int get position; bool get isSelected;/// Скрыт от сотрудника до сдачи / когда `reveal_answers=false`.
 bool? get isCorrect;
/// Create a copy of TestAttemptOptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptOptionDtoCopyWith<TestAttemptOptionDto> get copyWith => _$TestAttemptOptionDtoCopyWithImpl<TestAttemptOptionDto>(this as TestAttemptOptionDto, _$identity);

  /// Serializes this TestAttemptOptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptOptionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.position, position) || other.position == position)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,position,isSelected,isCorrect);

@override
String toString() {
  return 'TestAttemptOptionDto(id: $id, text: $text, position: $position, isSelected: $isSelected, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $TestAttemptOptionDtoCopyWith<$Res>  {
  factory $TestAttemptOptionDtoCopyWith(TestAttemptOptionDto value, $Res Function(TestAttemptOptionDto) _then) = _$TestAttemptOptionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String text, int position, bool isSelected, bool? isCorrect
});




}
/// @nodoc
class _$TestAttemptOptionDtoCopyWithImpl<$Res>
    implements $TestAttemptOptionDtoCopyWith<$Res> {
  _$TestAttemptOptionDtoCopyWithImpl(this._self, this._then);

  final TestAttemptOptionDto _self;
  final $Res Function(TestAttemptOptionDto) _then;

/// Create a copy of TestAttemptOptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? position = null,Object? isSelected = null,Object? isCorrect = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptOptionDto].
extension TestAttemptOptionDtoPatterns on TestAttemptOptionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptOptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptOptionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptOptionDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptOptionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptOptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptOptionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  int position,  bool isSelected,  bool? isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptOptionDto() when $default != null:
return $default(_that.id,_that.text,_that.position,_that.isSelected,_that.isCorrect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  int position,  bool isSelected,  bool? isCorrect)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptOptionDto():
return $default(_that.id,_that.text,_that.position,_that.isSelected,_that.isCorrect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  int position,  bool isSelected,  bool? isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptOptionDto() when $default != null:
return $default(_that.id,_that.text,_that.position,_that.isSelected,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TestAttemptOptionDto implements TestAttemptOptionDto {
  const _TestAttemptOptionDto({required this.id, required this.text, this.position = 0, this.isSelected = false, this.isCorrect});
  factory _TestAttemptOptionDto.fromJson(Map<String, dynamic> json) => _$TestAttemptOptionDtoFromJson(json);

@override final  String id;
@override final  String text;
@override@JsonKey() final  int position;
@override@JsonKey() final  bool isSelected;
/// Скрыт от сотрудника до сдачи / когда `reveal_answers=false`.
@override final  bool? isCorrect;

/// Create a copy of TestAttemptOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptOptionDtoCopyWith<_TestAttemptOptionDto> get copyWith => __$TestAttemptOptionDtoCopyWithImpl<_TestAttemptOptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAttemptOptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptOptionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.position, position) || other.position == position)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,position,isSelected,isCorrect);

@override
String toString() {
  return 'TestAttemptOptionDto(id: $id, text: $text, position: $position, isSelected: $isSelected, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptOptionDtoCopyWith<$Res> implements $TestAttemptOptionDtoCopyWith<$Res> {
  factory _$TestAttemptOptionDtoCopyWith(_TestAttemptOptionDto value, $Res Function(_TestAttemptOptionDto) _then) = __$TestAttemptOptionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, int position, bool isSelected, bool? isCorrect
});




}
/// @nodoc
class __$TestAttemptOptionDtoCopyWithImpl<$Res>
    implements _$TestAttemptOptionDtoCopyWith<$Res> {
  __$TestAttemptOptionDtoCopyWithImpl(this._self, this._then);

  final _TestAttemptOptionDto _self;
  final $Res Function(_TestAttemptOptionDto) _then;

/// Create a copy of TestAttemptOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? position = null,Object? isSelected = null,Object? isCorrect = freezed,}) {
  return _then(_TestAttemptOptionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$TestAttemptQuestionDto {

 String get id; String get text;/// Сырое значение с бэка (`single_choice`/`multiple_choice`) —
/// парсится вручную в маппере (конвенция проекта, см.
/// `ShiftFinishReason`/`KnowledgeNodeKind`), не через `@JsonValue`.
 String get type; int get points; int get position; List<TestAttemptOptionDto> get options;
/// Create a copy of TestAttemptQuestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptQuestionDtoCopyWith<TestAttemptQuestionDto> get copyWith => _$TestAttemptQuestionDtoCopyWithImpl<TestAttemptQuestionDto>(this as TestAttemptQuestionDto, _$identity);

  /// Serializes this TestAttemptQuestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TestAttemptQuestionDto(id: $id, text: $text, type: $type, points: $points, position: $position, options: $options)';
}


}

/// @nodoc
abstract mixin class $TestAttemptQuestionDtoCopyWith<$Res>  {
  factory $TestAttemptQuestionDtoCopyWith(TestAttemptQuestionDto value, $Res Function(TestAttemptQuestionDto) _then) = _$TestAttemptQuestionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String text, String type, int points, int position, List<TestAttemptOptionDto> options
});




}
/// @nodoc
class _$TestAttemptQuestionDtoCopyWithImpl<$Res>
    implements $TestAttemptQuestionDtoCopyWith<$Res> {
  _$TestAttemptQuestionDtoCopyWithImpl(this._self, this._then);

  final TestAttemptQuestionDto _self;
  final $Res Function(TestAttemptQuestionDto) _then;

/// Create a copy of TestAttemptQuestionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOptionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptQuestionDto].
extension TestAttemptQuestionDtoPatterns on TestAttemptQuestionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptQuestionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptQuestionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptQuestionDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptQuestionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptQuestionDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptQuestionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String type,  int points,  int position,  List<TestAttemptOptionDto> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptQuestionDto() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String type,  int points,  int position,  List<TestAttemptOptionDto> options)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestionDto():
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String type,  int points,  int position,  List<TestAttemptOptionDto> options)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestionDto() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TestAttemptQuestionDto implements TestAttemptQuestionDto {
  const _TestAttemptQuestionDto({required this.id, required this.text, required this.type, this.points = 1, this.position = 0, final  List<TestAttemptOptionDto> options = const <TestAttemptOptionDto>[]}): _options = options;
  factory _TestAttemptQuestionDto.fromJson(Map<String, dynamic> json) => _$TestAttemptQuestionDtoFromJson(json);

@override final  String id;
@override final  String text;
/// Сырое значение с бэка (`single_choice`/`multiple_choice`) —
/// парсится вручную в маппере (конвенция проекта, см.
/// `ShiftFinishReason`/`KnowledgeNodeKind`), не через `@JsonValue`.
@override final  String type;
@override@JsonKey() final  int points;
@override@JsonKey() final  int position;
 final  List<TestAttemptOptionDto> _options;
@override@JsonKey() List<TestAttemptOptionDto> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of TestAttemptQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptQuestionDtoCopyWith<_TestAttemptQuestionDto> get copyWith => __$TestAttemptQuestionDtoCopyWithImpl<_TestAttemptQuestionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAttemptQuestionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TestAttemptQuestionDto(id: $id, text: $text, type: $type, points: $points, position: $position, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptQuestionDtoCopyWith<$Res> implements $TestAttemptQuestionDtoCopyWith<$Res> {
  factory _$TestAttemptQuestionDtoCopyWith(_TestAttemptQuestionDto value, $Res Function(_TestAttemptQuestionDto) _then) = __$TestAttemptQuestionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String type, int points, int position, List<TestAttemptOptionDto> options
});




}
/// @nodoc
class __$TestAttemptQuestionDtoCopyWithImpl<$Res>
    implements _$TestAttemptQuestionDtoCopyWith<$Res> {
  __$TestAttemptQuestionDtoCopyWithImpl(this._self, this._then);

  final _TestAttemptQuestionDto _self;
  final $Res Function(_TestAttemptQuestionDto) _then;

/// Create a copy of TestAttemptQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? options = null,}) {
  return _then(_TestAttemptQuestionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOptionDto>,
  ));
}


}


/// @nodoc
mixin _$TestAttemptDto {

 String get id; int get attemptNumber;/// Сырое значение (`in_progress`/`submitted`) — парсится в маппере.
 String get status; int get maxScore; DateTime get startedAt; int get score; int get percent; bool get passed; DateTime? get submittedAt; List<TestAttemptQuestionDto> get questions;
/// Create a copy of TestAttemptDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptDtoCopyWith<TestAttemptDto> get copyWith => _$TestAttemptDtoCopyWithImpl<TestAttemptDto>(this as TestAttemptDto, _$identity);

  /// Serializes this TestAttemptDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,maxScore,startedAt,score,percent,passed,submittedAt,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'TestAttemptDto(id: $id, attemptNumber: $attemptNumber, status: $status, maxScore: $maxScore, startedAt: $startedAt, score: $score, percent: $percent, passed: $passed, submittedAt: $submittedAt, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $TestAttemptDtoCopyWith<$Res>  {
  factory $TestAttemptDtoCopyWith(TestAttemptDto value, $Res Function(TestAttemptDto) _then) = _$TestAttemptDtoCopyWithImpl;
@useResult
$Res call({
 String id, int attemptNumber, String status, int maxScore, DateTime startedAt, int score, int percent, bool passed, DateTime? submittedAt, List<TestAttemptQuestionDto> questions
});




}
/// @nodoc
class _$TestAttemptDtoCopyWithImpl<$Res>
    implements $TestAttemptDtoCopyWith<$Res> {
  _$TestAttemptDtoCopyWithImpl(this._self, this._then);

  final TestAttemptDto _self;
  final $Res Function(TestAttemptDto) _then;

/// Create a copy of TestAttemptDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? maxScore = null,Object? startedAt = null,Object? score = null,Object? percent = null,Object? passed = null,Object? submittedAt = freezed,Object? questions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptDto].
extension TestAttemptDtoPatterns on TestAttemptDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  String status,  int maxScore,  DateTime startedAt,  int score,  int percent,  bool passed,  DateTime? submittedAt,  List<TestAttemptQuestionDto> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptDto() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.startedAt,_that.score,_that.percent,_that.passed,_that.submittedAt,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  String status,  int maxScore,  DateTime startedAt,  int score,  int percent,  bool passed,  DateTime? submittedAt,  List<TestAttemptQuestionDto> questions)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptDto():
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.startedAt,_that.score,_that.percent,_that.passed,_that.submittedAt,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int attemptNumber,  String status,  int maxScore,  DateTime startedAt,  int score,  int percent,  bool passed,  DateTime? submittedAt,  List<TestAttemptQuestionDto> questions)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptDto() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.startedAt,_that.score,_that.percent,_that.passed,_that.submittedAt,_that.questions);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TestAttemptDto implements TestAttemptDto {
  const _TestAttemptDto({required this.id, required this.attemptNumber, required this.status, required this.maxScore, required this.startedAt, this.score = 0, this.percent = 0, this.passed = false, this.submittedAt, final  List<TestAttemptQuestionDto> questions = const <TestAttemptQuestionDto>[]}): _questions = questions;
  factory _TestAttemptDto.fromJson(Map<String, dynamic> json) => _$TestAttemptDtoFromJson(json);

@override final  String id;
@override final  int attemptNumber;
/// Сырое значение (`in_progress`/`submitted`) — парсится в маппере.
@override final  String status;
@override final  int maxScore;
@override final  DateTime startedAt;
@override@JsonKey() final  int score;
@override@JsonKey() final  int percent;
@override@JsonKey() final  bool passed;
@override final  DateTime? submittedAt;
 final  List<TestAttemptQuestionDto> _questions;
@override@JsonKey() List<TestAttemptQuestionDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of TestAttemptDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptDtoCopyWith<_TestAttemptDto> get copyWith => __$TestAttemptDtoCopyWithImpl<_TestAttemptDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAttemptDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,maxScore,startedAt,score,percent,passed,submittedAt,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'TestAttemptDto(id: $id, attemptNumber: $attemptNumber, status: $status, maxScore: $maxScore, startedAt: $startedAt, score: $score, percent: $percent, passed: $passed, submittedAt: $submittedAt, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptDtoCopyWith<$Res> implements $TestAttemptDtoCopyWith<$Res> {
  factory _$TestAttemptDtoCopyWith(_TestAttemptDto value, $Res Function(_TestAttemptDto) _then) = __$TestAttemptDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int attemptNumber, String status, int maxScore, DateTime startedAt, int score, int percent, bool passed, DateTime? submittedAt, List<TestAttemptQuestionDto> questions
});




}
/// @nodoc
class __$TestAttemptDtoCopyWithImpl<$Res>
    implements _$TestAttemptDtoCopyWith<$Res> {
  __$TestAttemptDtoCopyWithImpl(this._self, this._then);

  final _TestAttemptDto _self;
  final $Res Function(_TestAttemptDto) _then;

/// Create a copy of TestAttemptDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? maxScore = null,Object? startedAt = null,Object? score = null,Object? percent = null,Object? passed = null,Object? submittedAt = freezed,Object? questions = null,}) {
  return _then(_TestAttemptDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestionDto>,
  ));
}


}

// dart format on
