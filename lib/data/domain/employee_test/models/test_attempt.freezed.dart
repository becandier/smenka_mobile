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

 String get id; String get text; TestQuestionType get type; int get points; int get position; List<TestAttemptOption> get options;/// Начисленные баллы за вопрос — только в результате `submit`
/// (`reveal_answers=true`), иначе `null`.
 int? get awarded;
/// Create a copy of TestAttemptQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptQuestionCopyWith<TestAttemptQuestion> get copyWith => _$TestAttemptQuestionCopyWithImpl<TestAttemptQuestion>(this as TestAttemptQuestion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.awarded, awarded) || other.awarded == awarded));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,const DeepCollectionEquality().hash(options),awarded);

@override
String toString() {
  return 'TestAttemptQuestion(id: $id, text: $text, type: $type, points: $points, position: $position, options: $options, awarded: $awarded)';
}


}

/// @nodoc
abstract mixin class $TestAttemptQuestionCopyWith<$Res>  {
  factory $TestAttemptQuestionCopyWith(TestAttemptQuestion value, $Res Function(TestAttemptQuestion) _then) = _$TestAttemptQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String text, TestQuestionType type, int points, int position, List<TestAttemptOption> options, int? awarded
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? options = null,Object? awarded = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TestQuestionType,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOption>,awarded: freezed == awarded ? _self.awarded : awarded // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  TestQuestionType type,  int points,  int position,  List<TestAttemptOption> options,  int? awarded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptQuestion() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options,_that.awarded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  TestQuestionType type,  int points,  int position,  List<TestAttemptOption> options,  int? awarded)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestion():
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options,_that.awarded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  TestQuestionType type,  int points,  int position,  List<TestAttemptOption> options,  int? awarded)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestion() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.options,_that.awarded);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttemptQuestion implements TestAttemptQuestion {
  const _TestAttemptQuestion({required this.id, required this.text, required this.type, required this.points, required this.position, required final  List<TestAttemptOption> options, this.awarded}): _options = options;
  

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

/// Начисленные баллы за вопрос — только в результате `submit`
/// (`reveal_answers=true`), иначе `null`.
@override final  int? awarded;

/// Create a copy of TestAttemptQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptQuestionCopyWith<_TestAttemptQuestion> get copyWith => __$TestAttemptQuestionCopyWithImpl<_TestAttemptQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.awarded, awarded) || other.awarded == awarded));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,const DeepCollectionEquality().hash(_options),awarded);

@override
String toString() {
  return 'TestAttemptQuestion(id: $id, text: $text, type: $type, points: $points, position: $position, options: $options, awarded: $awarded)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptQuestionCopyWith<$Res> implements $TestAttemptQuestionCopyWith<$Res> {
  factory _$TestAttemptQuestionCopyWith(_TestAttemptQuestion value, $Res Function(_TestAttemptQuestion) _then) = __$TestAttemptQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, TestQuestionType type, int points, int position, List<TestAttemptOption> options, int? awarded
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? options = null,Object? awarded = freezed,}) {
  return _then(_TestAttemptQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TestQuestionType,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOption>,awarded: freezed == awarded ? _self.awarded : awarded // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$TestAttemptFill {

 String get id; DateTime get startedAt; List<TestAttemptQuestion> get questions;
/// Create a copy of TestAttemptFill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptFillCopyWith<TestAttemptFill> get copyWith => _$TestAttemptFillCopyWithImpl<TestAttemptFill>(this as TestAttemptFill, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptFill&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other.questions, questions));
}


@override
int get hashCode => Object.hash(runtimeType,id,startedAt,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'TestAttemptFill(id: $id, startedAt: $startedAt, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $TestAttemptFillCopyWith<$Res>  {
  factory $TestAttemptFillCopyWith(TestAttemptFill value, $Res Function(TestAttemptFill) _then) = _$TestAttemptFillCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startedAt, List<TestAttemptQuestion> questions
});




}
/// @nodoc
class _$TestAttemptFillCopyWithImpl<$Res>
    implements $TestAttemptFillCopyWith<$Res> {
  _$TestAttemptFillCopyWithImpl(this._self, this._then);

  final TestAttemptFill _self;
  final $Res Function(TestAttemptFill) _then;

/// Create a copy of TestAttemptFill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? questions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptFill].
extension TestAttemptFillPatterns on TestAttemptFill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptFill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptFill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptFill value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptFill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptFill value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptFill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  List<TestAttemptQuestion> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptFill() when $default != null:
return $default(_that.id,_that.startedAt,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  List<TestAttemptQuestion> questions)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptFill():
return $default(_that.id,_that.startedAt,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startedAt,  List<TestAttemptQuestion> questions)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptFill() when $default != null:
return $default(_that.id,_that.startedAt,_that.questions);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttemptFill implements TestAttemptFill {
  const _TestAttemptFill({required this.id, required this.startedAt, required final  List<TestAttemptQuestion> questions}): _questions = questions;
  

@override final  String id;
@override final  DateTime startedAt;
 final  List<TestAttemptQuestion> _questions;
@override List<TestAttemptQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of TestAttemptFill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptFillCopyWith<_TestAttemptFill> get copyWith => __$TestAttemptFillCopyWithImpl<_TestAttemptFill>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptFill&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other._questions, _questions));
}


@override
int get hashCode => Object.hash(runtimeType,id,startedAt,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'TestAttemptFill(id: $id, startedAt: $startedAt, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptFillCopyWith<$Res> implements $TestAttemptFillCopyWith<$Res> {
  factory _$TestAttemptFillCopyWith(_TestAttemptFill value, $Res Function(_TestAttemptFill) _then) = __$TestAttemptFillCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startedAt, List<TestAttemptQuestion> questions
});




}
/// @nodoc
class __$TestAttemptFillCopyWithImpl<$Res>
    implements _$TestAttemptFillCopyWith<$Res> {
  __$TestAttemptFillCopyWithImpl(this._self, this._then);

  final _TestAttemptFill _self;
  final $Res Function(_TestAttemptFill) _then;

/// Create a copy of TestAttemptFill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? questions = null,}) {
  return _then(_TestAttemptFill(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>,
  ));
}


}

/// @nodoc
mixin _$TestAttemptDetail {

 String get id; int get attemptNumber; TestAttemptStatus get status; int get maxScore; int get passThresholdPercent; DateTime get startedAt; List<TestAttemptQuestion> get questions; int? get score; int? get percent; bool? get passed; DateTime? get submittedAt;
/// Create a copy of TestAttemptDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptDetailCopyWith<TestAttemptDetail> get copyWith => _$TestAttemptDetailCopyWithImpl<TestAttemptDetail>(this as TestAttemptDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.score, score) || other.score == score)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,maxScore,passThresholdPercent,startedAt,const DeepCollectionEquality().hash(questions),score,percent,passed,submittedAt);

@override
String toString() {
  return 'TestAttemptDetail(id: $id, attemptNumber: $attemptNumber, status: $status, maxScore: $maxScore, passThresholdPercent: $passThresholdPercent, startedAt: $startedAt, questions: $questions, score: $score, percent: $percent, passed: $passed, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class $TestAttemptDetailCopyWith<$Res>  {
  factory $TestAttemptDetailCopyWith(TestAttemptDetail value, $Res Function(TestAttemptDetail) _then) = _$TestAttemptDetailCopyWithImpl;
@useResult
$Res call({
 String id, int attemptNumber, TestAttemptStatus status, int maxScore, int passThresholdPercent, DateTime startedAt, List<TestAttemptQuestion> questions, int? score, int? percent, bool? passed, DateTime? submittedAt
});




}
/// @nodoc
class _$TestAttemptDetailCopyWithImpl<$Res>
    implements $TestAttemptDetailCopyWith<$Res> {
  _$TestAttemptDetailCopyWithImpl(this._self, this._then);

  final TestAttemptDetail _self;
  final $Res Function(TestAttemptDetail) _then;

/// Create a copy of TestAttemptDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? maxScore = null,Object? passThresholdPercent = null,Object? startedAt = null,Object? questions = null,Object? score = freezed,Object? percent = freezed,Object? passed = freezed,Object? submittedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAttemptStatus,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int?,passed: freezed == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptDetail].
extension TestAttemptDetailPatterns on TestAttemptDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptDetail value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  TestAttemptStatus status,  int maxScore,  int passThresholdPercent,  DateTime startedAt,  List<TestAttemptQuestion> questions,  int? score,  int? percent,  bool? passed,  DateTime? submittedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptDetail() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.passThresholdPercent,_that.startedAt,_that.questions,_that.score,_that.percent,_that.passed,_that.submittedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  TestAttemptStatus status,  int maxScore,  int passThresholdPercent,  DateTime startedAt,  List<TestAttemptQuestion> questions,  int? score,  int? percent,  bool? passed,  DateTime? submittedAt)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptDetail():
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.passThresholdPercent,_that.startedAt,_that.questions,_that.score,_that.percent,_that.passed,_that.submittedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int attemptNumber,  TestAttemptStatus status,  int maxScore,  int passThresholdPercent,  DateTime startedAt,  List<TestAttemptQuestion> questions,  int? score,  int? percent,  bool? passed,  DateTime? submittedAt)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptDetail() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.passThresholdPercent,_that.startedAt,_that.questions,_that.score,_that.percent,_that.passed,_that.submittedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TestAttemptDetail extends TestAttemptDetail {
  const _TestAttemptDetail({required this.id, required this.attemptNumber, required this.status, required this.maxScore, required this.passThresholdPercent, required this.startedAt, required final  List<TestAttemptQuestion> questions, this.score, this.percent, this.passed, this.submittedAt}): _questions = questions,super._();
  

@override final  String id;
@override final  int attemptNumber;
@override final  TestAttemptStatus status;
@override final  int maxScore;
@override final  int passThresholdPercent;
@override final  DateTime startedAt;
 final  List<TestAttemptQuestion> _questions;
@override List<TestAttemptQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override final  int? score;
@override final  int? percent;
@override final  bool? passed;
@override final  DateTime? submittedAt;

/// Create a copy of TestAttemptDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptDetailCopyWith<_TestAttemptDetail> get copyWith => __$TestAttemptDetailCopyWithImpl<_TestAttemptDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.score, score) || other.score == score)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,maxScore,passThresholdPercent,startedAt,const DeepCollectionEquality().hash(_questions),score,percent,passed,submittedAt);

@override
String toString() {
  return 'TestAttemptDetail(id: $id, attemptNumber: $attemptNumber, status: $status, maxScore: $maxScore, passThresholdPercent: $passThresholdPercent, startedAt: $startedAt, questions: $questions, score: $score, percent: $percent, passed: $passed, submittedAt: $submittedAt)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptDetailCopyWith<$Res> implements $TestAttemptDetailCopyWith<$Res> {
  factory _$TestAttemptDetailCopyWith(_TestAttemptDetail value, $Res Function(_TestAttemptDetail) _then) = __$TestAttemptDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, int attemptNumber, TestAttemptStatus status, int maxScore, int passThresholdPercent, DateTime startedAt, List<TestAttemptQuestion> questions, int? score, int? percent, bool? passed, DateTime? submittedAt
});




}
/// @nodoc
class __$TestAttemptDetailCopyWithImpl<$Res>
    implements _$TestAttemptDetailCopyWith<$Res> {
  __$TestAttemptDetailCopyWithImpl(this._self, this._then);

  final _TestAttemptDetail _self;
  final $Res Function(_TestAttemptDetail) _then;

/// Create a copy of TestAttemptDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? maxScore = null,Object? passThresholdPercent = null,Object? startedAt = null,Object? questions = null,Object? score = freezed,Object? percent = freezed,Object? passed = freezed,Object? submittedAt = freezed,}) {
  return _then(_TestAttemptDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TestAttemptStatus,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestion>,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int?,passed: freezed == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
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
