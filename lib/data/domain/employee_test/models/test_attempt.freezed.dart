// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestAttemptOption {

 String get id; String get text; int get position; bool get isSelected; bool? get isCorrect;
/// Create a copy of TestAttemptOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptOptionCopyWith<TestAttemptOption> get copyWith => _$TestAttemptOptionCopyWithImpl<TestAttemptOption>(this as TestAttemptOption, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptOption&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.position, position) || other.position == position)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,position,isSelected,isCorrect);

@override
String toString() {
  return 'TestAttemptOption(id: $id, text: $text, position: $position, isSelected: $isSelected, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $TestAttemptOptionCopyWith<$Res>  {
  factory $TestAttemptOptionCopyWith(TestAttemptOption value, $Res Function(TestAttemptOption) _then) = _$TestAttemptOptionCopyWithImpl;
@useResult
$Res call({
 String id, String text, int position, bool isSelected, bool? isCorrect
});




}
/// @nodoc
class _$TestAttemptOptionCopyWithImpl<$Res>
    implements $TestAttemptOptionCopyWith<$Res> {
  _$TestAttemptOptionCopyWithImpl(this._self, this._then);

  final TestAttemptOption _self;
  final $Res Function(TestAttemptOption) _then;

/// Create a copy of TestAttemptOption
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


/// Adds pattern-matching-related methods to [TestAttemptOption].
extension TestAttemptOptionPatterns on TestAttemptOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptOption value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptOption value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptOption() when $default != null:
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
case _TestAttemptOption() when $default != null:
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
case _TestAttemptOption():
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
case _TestAttemptOption() when $default != null:
return $default(_that.id,_that.text,_that.position,_that.isSelected,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttemptOption implements TestAttemptOption {
  const _TestAttemptOption({required this.id, required this.text, required this.position, this.isSelected = false, this.isCorrect});
  

@override final  String id;
@override final  String text;
@override final  int position;
@override@JsonKey() final  bool isSelected;
@override final  bool? isCorrect;

/// Create a copy of TestAttemptOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptOptionCopyWith<_TestAttemptOption> get copyWith => __$TestAttemptOptionCopyWithImpl<_TestAttemptOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptOption&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.position, position) || other.position == position)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,position,isSelected,isCorrect);

@override
String toString() {
  return 'TestAttemptOption(id: $id, text: $text, position: $position, isSelected: $isSelected, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptOptionCopyWith<$Res> implements $TestAttemptOptionCopyWith<$Res> {
  factory _$TestAttemptOptionCopyWith(_TestAttemptOption value, $Res Function(_TestAttemptOption) _then) = __$TestAttemptOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, int position, bool isSelected, bool? isCorrect
});




}
/// @nodoc
class __$TestAttemptOptionCopyWithImpl<$Res>
    implements _$TestAttemptOptionCopyWith<$Res> {
  __$TestAttemptOptionCopyWithImpl(this._self, this._then);

  final _TestAttemptOption _self;
  final $Res Function(_TestAttemptOption) _then;

/// Create a copy of TestAttemptOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? position = null,Object? isSelected = null,Object? isCorrect = freezed,}) {
  return _then(_TestAttemptOption(
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
mixin _$TestAttemptQuestion {

 String get id; String get text; TestQuestionType get type; int get points; int get position; List<TestAttemptOption> get options;
/// Create a copy of TestAttemptQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptQuestionCopyWith<TestAttemptQuestion> get copyWith => _$TestAttemptQuestionCopyWithImpl<TestAttemptQuestion>(this as TestAttemptQuestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other.options, options));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TestAttemptQuestion(id: $id, text: $text, type: $type, points: $points, position: $position, options: $options)';
}


}

/// @nodoc
abstract mixin class $TestAttemptQuestionCopyWith<$Res>  {
  factory $TestAttemptQuestionCopyWith(TestAttemptQuestion value, $Res Function(TestAttemptQuestion) _then) = _$TestAttemptQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String text, TestQuestionType type, int points, int position, List<TestAttemptOption> options
});




}
/// @nodoc
class _$TestAttemptQuestionCopyWithImpl<$Res>
    implements $TestAttemptQuestionCopyWith<$Res> {
  _$TestAttemptQuestionCopyWithImpl(this._self, this._then);

  final TestAttemptQuestion _self;
  final $Res Function(TestAttemptQuestion) _then;

/// Create a copy of TestAttemptQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TestQuestionType,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptQuestion].
extension TestAttemptQuestionPatterns on TestAttemptQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptQuestion value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  TestQuestionType type,  int points,  int position,  List<TestAttemptOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptQuestion() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  TestQuestionType type,  int points,  int position,  List<TestAttemptOption> options)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestion():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  TestQuestionType type,  int points,  int position,  List<TestAttemptOption> options)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestion() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttemptQuestion implements TestAttemptQuestion {
  const _TestAttemptQuestion({required this.id, required this.text, required this.type, required this.points, required this.position, required final  List<TestAttemptOption> options}): _options = options;
  

@override final  String id;
@override final  String text;
@override final  TestQuestionType type;
@override final  int points;
@override final  int position;
 final  List<TestAttemptOption> _options;
@override List<TestAttemptOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of TestAttemptQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptQuestionCopyWith<_TestAttemptQuestion> get copyWith => __$TestAttemptQuestionCopyWithImpl<_TestAttemptQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TestAttemptQuestion(id: $id, text: $text, type: $type, points: $points, position: $position, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptQuestionCopyWith<$Res> implements $TestAttemptQuestionCopyWith<$Res> {
  factory _$TestAttemptQuestionCopyWith(_TestAttemptQuestion value, $Res Function(_TestAttemptQuestion) _then) = __$TestAttemptQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, TestQuestionType type, int points, int position, List<TestAttemptOption> options
});




}
/// @nodoc
class __$TestAttemptQuestionCopyWithImpl<$Res>
    implements _$TestAttemptQuestionCopyWith<$Res> {
  __$TestAttemptQuestionCopyWithImpl(this._self, this._then);

  final _TestAttemptQuestion _self;
  final $Res Function(_TestAttemptQuestion) _then;

/// Create a copy of TestAttemptQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? options = null,}) {
  return _then(_TestAttemptQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TestQuestionType,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOption>,
  ));
}


}

/// @nodoc
mixin _$TestAttempt {

 String get id; int get attemptNumber; TestAttemptStatus get status; int get score; int get maxScore; int get percent; bool get passed; DateTime get startedAt; List<TestAttemptQuestion> get questions; DateTime? get submittedAt;
/// Create a copy of TestAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptCopyWith<TestAttempt> get copyWith => _$TestAttemptCopyWithImpl<TestAttempt>(this as TestAttempt, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,score,maxScore,percent,passed,startedAt,const DeepCollectionEquality().hash(questions),submittedAt);

@override
String toString() {
  return 'TestAttempt(id: $id, attemptNumber: $attemptNumber, status: $status, score: $score, maxScore: $maxScore, percent: $percent, passed: $passed, startedAt: $startedAt, questions: $questions, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class $TestAttemptCopyWith<$Res>  {
  factory $TestAttemptCopyWith(TestAttempt value, $Res Function(TestAttempt) _then) = _$TestAttemptCopyWithImpl;
@useResult
$Res call({
 String id, int attemptNumber, TestAttemptStatus status, int score, int maxScore, int percent, bool passed, DateTime startedAt, List<TestAttemptQuestion> questions, DateTime? submittedAt
});




}
/// @nodoc
class _$TestAttemptCopyWithImpl<$Res>
    implements $TestAttemptCopyWith<$Res> {
  _$TestAttemptCopyWithImpl(this._self, this._then);

  final TestAttempt _self;
  final $Res Function(TestAttempt) _then;

/// Create a copy of TestAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? score = null,Object? maxScore = null,Object? percent = null,Object? passed = null,Object? startedAt = null,Object? questions = null,Object? submittedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAttemptStatus,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttempt].
extension TestAttemptPatterns on TestAttempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttempt value)  $default,){
final _that = this;
switch (_that) {
case _TestAttempt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  TestAttemptStatus status,  int score,  int maxScore,  int percent,  bool passed,  DateTime startedAt,  List<TestAttemptQuestion> questions,  DateTime? submittedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttempt() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.score,_that.maxScore,_that.percent,_that.passed,_that.startedAt,_that.questions,_that.submittedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  TestAttemptStatus status,  int score,  int maxScore,  int percent,  bool passed,  DateTime startedAt,  List<TestAttemptQuestion> questions,  DateTime? submittedAt)  $default,) {final _that = this;
switch (_that) {
case _TestAttempt():
return $default(_that.id,_that.attemptNumber,_that.status,_that.score,_that.maxScore,_that.percent,_that.passed,_that.startedAt,_that.questions,_that.submittedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int attemptNumber,  TestAttemptStatus status,  int score,  int maxScore,  int percent,  bool passed,  DateTime startedAt,  List<TestAttemptQuestion> questions,  DateTime? submittedAt)?  $default,) {final _that = this;
switch (_that) {
case _TestAttempt() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.score,_that.maxScore,_that.percent,_that.passed,_that.startedAt,_that.questions,_that.submittedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttempt implements TestAttempt {
  const _TestAttempt({required this.id, required this.attemptNumber, required this.status, required this.score, required this.maxScore, required this.percent, required this.passed, required this.startedAt, required final  List<TestAttemptQuestion> questions, this.submittedAt}): _questions = questions;
  

@override final  String id;
@override final  int attemptNumber;
@override final  TestAttemptStatus status;
@override final  int score;
@override final  int maxScore;
@override final  int percent;
@override final  bool passed;
@override final  DateTime startedAt;
 final  List<TestAttemptQuestion> _questions;
@override List<TestAttemptQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override final  DateTime? submittedAt;

/// Create a copy of TestAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptCopyWith<_TestAttempt> get copyWith => __$TestAttemptCopyWithImpl<_TestAttempt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,score,maxScore,percent,passed,startedAt,const DeepCollectionEquality().hash(_questions),submittedAt);

@override
String toString() {
  return 'TestAttempt(id: $id, attemptNumber: $attemptNumber, status: $status, score: $score, maxScore: $maxScore, percent: $percent, passed: $passed, startedAt: $startedAt, questions: $questions, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptCopyWith<$Res> implements $TestAttemptCopyWith<$Res> {
  factory _$TestAttemptCopyWith(_TestAttempt value, $Res Function(_TestAttempt) _then) = __$TestAttemptCopyWithImpl;
@override @useResult
$Res call({
 String id, int attemptNumber, TestAttemptStatus status, int score, int maxScore, int percent, bool passed, DateTime startedAt, List<TestAttemptQuestion> questions, DateTime? submittedAt
});




}
/// @nodoc
class __$TestAttemptCopyWithImpl<$Res>
    implements _$TestAttemptCopyWith<$Res> {
  __$TestAttemptCopyWithImpl(this._self, this._then);

  final _TestAttempt _self;
  final $Res Function(_TestAttempt) _then;

/// Create a copy of TestAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? score = null,Object? maxScore = null,Object? percent = null,Object? passed = null,Object? startedAt = null,Object? questions = null,Object? submittedAt = freezed,}) {
  return _then(_TestAttempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAttemptStatus,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$TestSubmitAnswer {

 String get attemptQuestionId; List<String> get selectedOptionIds;
/// Create a copy of TestSubmitAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestSubmitAnswerCopyWith<TestSubmitAnswer> get copyWith => _$TestSubmitAnswerCopyWithImpl<TestSubmitAnswer>(this as TestSubmitAnswer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestSubmitAnswer&&(identical(other.attemptQuestionId, attemptQuestionId) || other.attemptQuestionId == attemptQuestionId)&&const DeepCollectionEquality().equals(other.selectedOptionIds, selectedOptionIds));
}


@override
int get hashCode => Object.hash(runtimeType,attemptQuestionId,const DeepCollectionEquality().hash(selectedOptionIds));

@override
String toString() {
  return 'TestSubmitAnswer(attemptQuestionId: $attemptQuestionId, selectedOptionIds: $selectedOptionIds)';
}


}

/// @nodoc
abstract mixin class $TestSubmitAnswerCopyWith<$Res>  {
  factory $TestSubmitAnswerCopyWith(TestSubmitAnswer value, $Res Function(TestSubmitAnswer) _then) = _$TestSubmitAnswerCopyWithImpl;
@useResult
$Res call({
 String attemptQuestionId, List<String> selectedOptionIds
});




}
/// @nodoc
class _$TestSubmitAnswerCopyWithImpl<$Res>
    implements $TestSubmitAnswerCopyWith<$Res> {
  _$TestSubmitAnswerCopyWithImpl(this._self, this._then);

  final TestSubmitAnswer _self;
  final $Res Function(TestSubmitAnswer) _then;

/// Create a copy of TestSubmitAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptQuestionId = null,Object? selectedOptionIds = null,}) {
  return _then(_self.copyWith(
attemptQuestionId: null == attemptQuestionId ? _self.attemptQuestionId : attemptQuestionId // ignore: cast_nullable_to_non_nullable
as String,selectedOptionIds: null == selectedOptionIds ? _self.selectedOptionIds : selectedOptionIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TestSubmitAnswer].
extension TestSubmitAnswerPatterns on TestSubmitAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestSubmitAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestSubmitAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestSubmitAnswer value)  $default,){
final _that = this;
switch (_that) {
case _TestSubmitAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestSubmitAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _TestSubmitAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String attemptQuestionId,  List<String> selectedOptionIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestSubmitAnswer() when $default != null:
return $default(_that.attemptQuestionId,_that.selectedOptionIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String attemptQuestionId,  List<String> selectedOptionIds)  $default,) {final _that = this;
switch (_that) {
case _TestSubmitAnswer():
return $default(_that.attemptQuestionId,_that.selectedOptionIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String attemptQuestionId,  List<String> selectedOptionIds)?  $default,) {final _that = this;
switch (_that) {
case _TestSubmitAnswer() when $default != null:
return $default(_that.attemptQuestionId,_that.selectedOptionIds);case _:
  return null;

}
}

}

/// @nodoc


class _TestSubmitAnswer implements TestSubmitAnswer {
  const _TestSubmitAnswer({required this.attemptQuestionId, required final  List<String> selectedOptionIds}): _selectedOptionIds = selectedOptionIds;
  

@override final  String attemptQuestionId;
 final  List<String> _selectedOptionIds;
@override List<String> get selectedOptionIds {
  if (_selectedOptionIds is EqualUnmodifiableListView) return _selectedOptionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedOptionIds);
}


/// Create a copy of TestSubmitAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestSubmitAnswerCopyWith<_TestSubmitAnswer> get copyWith => __$TestSubmitAnswerCopyWithImpl<_TestSubmitAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestSubmitAnswer&&(identical(other.attemptQuestionId, attemptQuestionId) || other.attemptQuestionId == attemptQuestionId)&&const DeepCollectionEquality().equals(other._selectedOptionIds, _selectedOptionIds));
}


@override
int get hashCode => Object.hash(runtimeType,attemptQuestionId,const DeepCollectionEquality().hash(_selectedOptionIds));

@override
String toString() {
  return 'TestSubmitAnswer(attemptQuestionId: $attemptQuestionId, selectedOptionIds: $selectedOptionIds)';
}


}

/// @nodoc
abstract mixin class _$TestSubmitAnswerCopyWith<$Res> implements $TestSubmitAnswerCopyWith<$Res> {
  factory _$TestSubmitAnswerCopyWith(_TestSubmitAnswer value, $Res Function(_TestSubmitAnswer) _then) = __$TestSubmitAnswerCopyWithImpl;
@override @useResult
$Res call({
 String attemptQuestionId, List<String> selectedOptionIds
});




}
/// @nodoc
class __$TestSubmitAnswerCopyWithImpl<$Res>
    implements _$TestSubmitAnswerCopyWith<$Res> {
  __$TestSubmitAnswerCopyWithImpl(this._self, this._then);

  final _TestSubmitAnswer _self;
  final $Res Function(_TestSubmitAnswer) _then;

/// Create a copy of TestSubmitAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attemptQuestionId = null,Object? selectedOptionIds = null,}) {
  return _then(_TestSubmitAnswer(
attemptQuestionId: null == attemptQuestionId ? _self.attemptQuestionId : attemptQuestionId // ignore: cast_nullable_to_non_nullable
as String,selectedOptionIds: null == selectedOptionIds ? _self._selectedOptionIds : selectedOptionIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
