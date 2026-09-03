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

 String get id; String get text; int get position; bool get isSelected;/// Скрыт от сотрудника до сдачи / когда `reveal_answers=false`, либо
/// отсутствует в fill-форме — `null` в обоих случаях.
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
/// Скрыт от сотрудника до сдачи / когда `reveal_answers=false`, либо
/// отсутствует в fill-форме — `null` в обоих случаях.
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
 String get type; int get points;/// Есть в fill/detail-форме; в result-форме (`POST .../submit`) бэк это
/// поле не присылает — дефолт `0` (не рендерится).
 int get position;/// Начисленные баллы за вопрос — только в result-форме
/// (`reveal_answers=true`); в fill/detail-форме отсутствует.
 int? get awarded; List<TestAttemptOptionDto> get options;
/// Create a copy of TestAttemptQuestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptQuestionDtoCopyWith<TestAttemptQuestionDto> get copyWith => _$TestAttemptQuestionDtoCopyWithImpl<TestAttemptQuestionDto>(this as TestAttemptQuestionDto, _$identity);

  /// Serializes this TestAttemptQuestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&(identical(other.awarded, awarded) || other.awarded == awarded)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,awarded,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TestAttemptQuestionDto(id: $id, text: $text, type: $type, points: $points, position: $position, awarded: $awarded, options: $options)';
}


}

/// @nodoc
abstract mixin class $TestAttemptQuestionDtoCopyWith<$Res>  {
  factory $TestAttemptQuestionDtoCopyWith(TestAttemptQuestionDto value, $Res Function(TestAttemptQuestionDto) _then) = _$TestAttemptQuestionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String text, String type, int points, int position, int? awarded, List<TestAttemptOptionDto> options
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? awarded = freezed,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,awarded: freezed == awarded ? _self.awarded : awarded // ignore: cast_nullable_to_non_nullable
as int?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  String type,  int points,  int position,  int? awarded,  List<TestAttemptOptionDto> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptQuestionDto() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.awarded,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  String type,  int points,  int position,  int? awarded,  List<TestAttemptOptionDto> options)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestionDto():
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.awarded,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  String type,  int points,  int position,  int? awarded,  List<TestAttemptOptionDto> options)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptQuestionDto() when $default != null:
return $default(_that.id,_that.text,_that.type,_that.points,_that.position,_that.awarded,_that.options);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TestAttemptQuestionDto implements TestAttemptQuestionDto {
  const _TestAttemptQuestionDto({required this.id, required this.text, required this.type, this.points = 1, this.position = 0, this.awarded, final  List<TestAttemptOptionDto> options = const <TestAttemptOptionDto>[]}): _options = options;
  factory _TestAttemptQuestionDto.fromJson(Map<String, dynamic> json) => _$TestAttemptQuestionDtoFromJson(json);

@override final  String id;
@override final  String text;
/// Сырое значение с бэка (`single_choice`/`multiple_choice`) —
/// парсится вручную в маппере (конвенция проекта, см.
/// `ShiftFinishReason`/`KnowledgeNodeKind`), не через `@JsonValue`.
@override final  String type;
@override@JsonKey() final  int points;
/// Есть в fill/detail-форме; в result-форме (`POST .../submit`) бэк это
/// поле не присылает — дефолт `0` (не рендерится).
@override@JsonKey() final  int position;
/// Начисленные баллы за вопрос — только в result-форме
/// (`reveal_answers=true`); в fill/detail-форме отсутствует.
@override final  int? awarded;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.type, type) || other.type == type)&&(identical(other.points, points) || other.points == points)&&(identical(other.position, position) || other.position == position)&&(identical(other.awarded, awarded) || other.awarded == awarded)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,type,points,position,awarded,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TestAttemptQuestionDto(id: $id, text: $text, type: $type, points: $points, position: $position, awarded: $awarded, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptQuestionDtoCopyWith<$Res> implements $TestAttemptQuestionDtoCopyWith<$Res> {
  factory _$TestAttemptQuestionDtoCopyWith(_TestAttemptQuestionDto value, $Res Function(_TestAttemptQuestionDto) _then) = __$TestAttemptQuestionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, String type, int points, int position, int? awarded, List<TestAttemptOptionDto> options
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? type = null,Object? points = null,Object? position = null,Object? awarded = freezed,Object? options = null,}) {
  return _then(_TestAttemptQuestionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,awarded: freezed == awarded ? _self.awarded : awarded // ignore: cast_nullable_to_non_nullable
as int?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<TestAttemptOptionDto>,
  ));
}


}


/// @nodoc
mixin _$TestAttemptForFillDto {

 String get id; DateTime get startedAt; List<TestAttemptQuestionDto> get questions;/// Аддитивное nullable поле (`TestAttemptForFill.organization_timezone`,
/// backend `ce32b62`) — `/my/*` не scoped по `{org_id}`, зона нужна
/// клиенту явно на каждой попытке.
 String? get organizationTimezone;
/// Create a copy of TestAttemptForFillDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptForFillDtoCopyWith<TestAttemptForFillDto> get copyWith => _$TestAttemptForFillDtoCopyWithImpl<TestAttemptForFillDto>(this as TestAttemptForFillDto, _$identity);

  /// Serializes this TestAttemptForFillDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptForFillDto&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startedAt,const DeepCollectionEquality().hash(questions),organizationTimezone);

@override
String toString() {
  return 'TestAttemptForFillDto(id: $id, startedAt: $startedAt, questions: $questions, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class $TestAttemptForFillDtoCopyWith<$Res>  {
  factory $TestAttemptForFillDtoCopyWith(TestAttemptForFillDto value, $Res Function(TestAttemptForFillDto) _then) = _$TestAttemptForFillDtoCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startedAt, List<TestAttemptQuestionDto> questions, String? organizationTimezone
});




}
/// @nodoc
class _$TestAttemptForFillDtoCopyWithImpl<$Res>
    implements $TestAttemptForFillDtoCopyWith<$Res> {
  _$TestAttemptForFillDtoCopyWithImpl(this._self, this._then);

  final TestAttemptForFillDto _self;
  final $Res Function(TestAttemptForFillDto) _then;

/// Create a copy of TestAttemptForFillDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? questions = null,Object? organizationTimezone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestionDto>,organizationTimezone: freezed == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptForFillDto].
extension TestAttemptForFillDtoPatterns on TestAttemptForFillDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptForFillDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptForFillDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptForFillDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptForFillDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptForFillDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptForFillDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  List<TestAttemptQuestionDto> questions,  String? organizationTimezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptForFillDto() when $default != null:
return $default(_that.id,_that.startedAt,_that.questions,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  List<TestAttemptQuestionDto> questions,  String? organizationTimezone)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptForFillDto():
return $default(_that.id,_that.startedAt,_that.questions,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startedAt,  List<TestAttemptQuestionDto> questions,  String? organizationTimezone)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptForFillDto() when $default != null:
return $default(_that.id,_that.startedAt,_that.questions,_that.organizationTimezone);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TestAttemptForFillDto implements TestAttemptForFillDto {
  const _TestAttemptForFillDto({required this.id, required this.startedAt, final  List<TestAttemptQuestionDto> questions = const <TestAttemptQuestionDto>[], this.organizationTimezone}): _questions = questions;
  factory _TestAttemptForFillDto.fromJson(Map<String, dynamic> json) => _$TestAttemptForFillDtoFromJson(json);

@override final  String id;
@override final  DateTime startedAt;
 final  List<TestAttemptQuestionDto> _questions;
@override@JsonKey() List<TestAttemptQuestionDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

/// Аддитивное nullable поле (`TestAttemptForFill.organization_timezone`,
/// backend `ce32b62`) — `/my/*` не scoped по `{org_id}`, зона нужна
/// клиенту явно на каждой попытке.
@override final  String? organizationTimezone;

/// Create a copy of TestAttemptForFillDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptForFillDtoCopyWith<_TestAttemptForFillDto> get copyWith => __$TestAttemptForFillDtoCopyWithImpl<_TestAttemptForFillDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAttemptForFillDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptForFillDto&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startedAt,const DeepCollectionEquality().hash(_questions),organizationTimezone);

@override
String toString() {
  return 'TestAttemptForFillDto(id: $id, startedAt: $startedAt, questions: $questions, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptForFillDtoCopyWith<$Res> implements $TestAttemptForFillDtoCopyWith<$Res> {
  factory _$TestAttemptForFillDtoCopyWith(_TestAttemptForFillDto value, $Res Function(_TestAttemptForFillDto) _then) = __$TestAttemptForFillDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startedAt, List<TestAttemptQuestionDto> questions, String? organizationTimezone
});




}
/// @nodoc
class __$TestAttemptForFillDtoCopyWithImpl<$Res>
    implements _$TestAttemptForFillDtoCopyWith<$Res> {
  __$TestAttemptForFillDtoCopyWithImpl(this._self, this._then);

  final _TestAttemptForFillDto _self;
  final $Res Function(_TestAttemptForFillDto) _then;

/// Create a copy of TestAttemptForFillDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? questions = null,Object? organizationTimezone = freezed,}) {
  return _then(_TestAttemptForFillDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestionDto>,organizationTimezone: freezed == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TestAttemptDetailDto {

 String get id; int get attemptNumber;/// Сырое значение (`in_progress`/`submitted`) — парсится в маппере.
 String get status; int get maxScore; int get passThresholdPercent; DateTime get startedAt; int? get score; int? get percent; bool? get passed; DateTime? get submittedAt; List<TestAttemptQuestionDto> get questions;/// Аддитивное nullable поле (`MyAttemptDetail.organization_timezone`,
/// backend `23dc2e3`) — `/my/*` не scoped по `{org_id}`, зона нужна
/// клиенту явно на каждой попытке.
 String? get organizationTimezone;
/// Create a copy of TestAttemptDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAttemptDetailDtoCopyWith<TestAttemptDetailDto> get copyWith => _$TestAttemptDetailDtoCopyWithImpl<TestAttemptDetailDto>(this as TestAttemptDetailDto, _$identity);

  /// Serializes this TestAttemptDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAttemptDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,maxScore,passThresholdPercent,startedAt,score,percent,passed,submittedAt,const DeepCollectionEquality().hash(questions),organizationTimezone);

@override
String toString() {
  return 'TestAttemptDetailDto(id: $id, attemptNumber: $attemptNumber, status: $status, maxScore: $maxScore, passThresholdPercent: $passThresholdPercent, startedAt: $startedAt, score: $score, percent: $percent, passed: $passed, submittedAt: $submittedAt, questions: $questions, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class $TestAttemptDetailDtoCopyWith<$Res>  {
  factory $TestAttemptDetailDtoCopyWith(TestAttemptDetailDto value, $Res Function(TestAttemptDetailDto) _then) = _$TestAttemptDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, int attemptNumber, String status, int maxScore, int passThresholdPercent, DateTime startedAt, int? score, int? percent, bool? passed, DateTime? submittedAt, List<TestAttemptQuestionDto> questions, String? organizationTimezone
});




}
/// @nodoc
class _$TestAttemptDetailDtoCopyWithImpl<$Res>
    implements $TestAttemptDetailDtoCopyWith<$Res> {
  _$TestAttemptDetailDtoCopyWithImpl(this._self, this._then);

  final TestAttemptDetailDto _self;
  final $Res Function(TestAttemptDetailDto) _then;

/// Create a copy of TestAttemptDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? maxScore = null,Object? passThresholdPercent = null,Object? startedAt = null,Object? score = freezed,Object? percent = freezed,Object? passed = freezed,Object? submittedAt = freezed,Object? questions = null,Object? organizationTimezone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int?,passed: freezed == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestionDto>,organizationTimezone: freezed == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAttemptDetailDto].
extension TestAttemptDetailDtoPatterns on TestAttemptDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAttemptDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAttemptDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAttemptDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _TestAttemptDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAttemptDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _TestAttemptDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  String status,  int maxScore,  int passThresholdPercent,  DateTime startedAt,  int? score,  int? percent,  bool? passed,  DateTime? submittedAt,  List<TestAttemptQuestionDto> questions,  String? organizationTimezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAttemptDetailDto() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.passThresholdPercent,_that.startedAt,_that.score,_that.percent,_that.passed,_that.submittedAt,_that.questions,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int attemptNumber,  String status,  int maxScore,  int passThresholdPercent,  DateTime startedAt,  int? score,  int? percent,  bool? passed,  DateTime? submittedAt,  List<TestAttemptQuestionDto> questions,  String? organizationTimezone)  $default,) {final _that = this;
switch (_that) {
case _TestAttemptDetailDto():
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.passThresholdPercent,_that.startedAt,_that.score,_that.percent,_that.passed,_that.submittedAt,_that.questions,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int attemptNumber,  String status,  int maxScore,  int passThresholdPercent,  DateTime startedAt,  int? score,  int? percent,  bool? passed,  DateTime? submittedAt,  List<TestAttemptQuestionDto> questions,  String? organizationTimezone)?  $default,) {final _that = this;
switch (_that) {
case _TestAttemptDetailDto() when $default != null:
return $default(_that.id,_that.attemptNumber,_that.status,_that.maxScore,_that.passThresholdPercent,_that.startedAt,_that.score,_that.percent,_that.passed,_that.submittedAt,_that.questions,_that.organizationTimezone);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TestAttemptDetailDto implements TestAttemptDetailDto {
  const _TestAttemptDetailDto({required this.id, required this.attemptNumber, required this.status, required this.maxScore, required this.passThresholdPercent, required this.startedAt, this.score, this.percent, this.passed, this.submittedAt, final  List<TestAttemptQuestionDto> questions = const <TestAttemptQuestionDto>[], this.organizationTimezone}): _questions = questions;
  factory _TestAttemptDetailDto.fromJson(Map<String, dynamic> json) => _$TestAttemptDetailDtoFromJson(json);

@override final  String id;
@override final  int attemptNumber;
/// Сырое значение (`in_progress`/`submitted`) — парсится в маппере.
@override final  String status;
@override final  int maxScore;
@override final  int passThresholdPercent;
@override final  DateTime startedAt;
@override final  int? score;
@override final  int? percent;
@override final  bool? passed;
@override final  DateTime? submittedAt;
 final  List<TestAttemptQuestionDto> _questions;
@override@JsonKey() List<TestAttemptQuestionDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

/// Аддитивное nullable поле (`MyAttemptDetail.organization_timezone`,
/// backend `23dc2e3`) — `/my/*` не scoped по `{org_id}`, зона нужна
/// клиенту явно на каждой попытке.
@override final  String? organizationTimezone;

/// Create a copy of TestAttemptDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAttemptDetailDtoCopyWith<_TestAttemptDetailDto> get copyWith => __$TestAttemptDetailDtoCopyWithImpl<_TestAttemptDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAttemptDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAttemptDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptNumber, attemptNumber) || other.attemptNumber == attemptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.passThresholdPercent, passThresholdPercent) || other.passThresholdPercent == passThresholdPercent)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attemptNumber,status,maxScore,passThresholdPercent,startedAt,score,percent,passed,submittedAt,const DeepCollectionEquality().hash(_questions),organizationTimezone);

@override
String toString() {
  return 'TestAttemptDetailDto(id: $id, attemptNumber: $attemptNumber, status: $status, maxScore: $maxScore, passThresholdPercent: $passThresholdPercent, startedAt: $startedAt, score: $score, percent: $percent, passed: $passed, submittedAt: $submittedAt, questions: $questions, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class _$TestAttemptDetailDtoCopyWith<$Res> implements $TestAttemptDetailDtoCopyWith<$Res> {
  factory _$TestAttemptDetailDtoCopyWith(_TestAttemptDetailDto value, $Res Function(_TestAttemptDetailDto) _then) = __$TestAttemptDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int attemptNumber, String status, int maxScore, int passThresholdPercent, DateTime startedAt, int? score, int? percent, bool? passed, DateTime? submittedAt, List<TestAttemptQuestionDto> questions, String? organizationTimezone
});




}
/// @nodoc
class __$TestAttemptDetailDtoCopyWithImpl<$Res>
    implements _$TestAttemptDetailDtoCopyWith<$Res> {
  __$TestAttemptDetailDtoCopyWithImpl(this._self, this._then);

  final _TestAttemptDetailDto _self;
  final $Res Function(_TestAttemptDetailDto) _then;

/// Create a copy of TestAttemptDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attemptNumber = null,Object? status = null,Object? maxScore = null,Object? passThresholdPercent = null,Object? startedAt = null,Object? score = freezed,Object? percent = freezed,Object? passed = freezed,Object? submittedAt = freezed,Object? questions = null,Object? organizationTimezone = freezed,}) {
  return _then(_TestAttemptDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptNumber: null == attemptNumber ? _self.attemptNumber : attemptNumber // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,passThresholdPercent: null == passThresholdPercent ? _self.passThresholdPercent : passThresholdPercent // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as int?,passed: freezed == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<TestAttemptQuestionDto>,organizationTimezone: freezed == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
