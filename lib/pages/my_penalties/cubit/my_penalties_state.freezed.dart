// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_penalties_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyPenaltiesState {

 PaginatedSectionData<MyPenalty> get penalties;/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
 PeriodPreset? get preset; DateTime? get customFrom; DateTime? get customTo;
/// Create a copy of MyPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPenaltiesStateCopyWith<MyPenaltiesState> get copyWith => _$MyPenaltiesStateCopyWithImpl<MyPenaltiesState>(this as MyPenaltiesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPenaltiesState&&(identical(other.penalties, penalties) || other.penalties == penalties)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo));
}


@override
int get hashCode => Object.hash(runtimeType,penalties,preset,customFrom,customTo);

@override
String toString() {
  return 'MyPenaltiesState(penalties: $penalties, preset: $preset, customFrom: $customFrom, customTo: $customTo)';
}


}

/// @nodoc
abstract mixin class $MyPenaltiesStateCopyWith<$Res>  {
  factory $MyPenaltiesStateCopyWith(MyPenaltiesState value, $Res Function(MyPenaltiesState) _then) = _$MyPenaltiesStateCopyWithImpl;
@useResult
$Res call({
 PaginatedSectionData<MyPenalty> penalties, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo
});


$PaginatedSectionDataCopyWith<MyPenalty, $Res> get penalties;

}
/// @nodoc
class _$MyPenaltiesStateCopyWithImpl<$Res>
    implements $MyPenaltiesStateCopyWith<$Res> {
  _$MyPenaltiesStateCopyWithImpl(this._self, this._then);

  final MyPenaltiesState _self;
  final $Res Function(MyPenaltiesState) _then;

/// Create a copy of MyPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? penalties = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,}) {
  return _then(_self.copyWith(
penalties: null == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<MyPenalty>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of MyPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<MyPenalty, $Res> get penalties {
  
  return $PaginatedSectionDataCopyWith<MyPenalty, $Res>(_self.penalties, (value) {
    return _then(_self.copyWith(penalties: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyPenaltiesState].
extension MyPenaltiesStatePatterns on MyPenaltiesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPenaltiesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPenaltiesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPenaltiesState value)  $default,){
final _that = this;
switch (_that) {
case _MyPenaltiesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPenaltiesState value)?  $default,){
final _that = this;
switch (_that) {
case _MyPenaltiesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedSectionData<MyPenalty> penalties,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPenaltiesState() when $default != null:
return $default(_that.penalties,_that.preset,_that.customFrom,_that.customTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedSectionData<MyPenalty> penalties,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo)  $default,) {final _that = this;
switch (_that) {
case _MyPenaltiesState():
return $default(_that.penalties,_that.preset,_that.customFrom,_that.customTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedSectionData<MyPenalty> penalties,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo)?  $default,) {final _that = this;
switch (_that) {
case _MyPenaltiesState() when $default != null:
return $default(_that.penalties,_that.preset,_that.customFrom,_that.customTo);case _:
  return null;

}
}

}

/// @nodoc


class _MyPenaltiesState extends MyPenaltiesState {
  const _MyPenaltiesState({this.penalties = const PaginatedSectionData<MyPenalty>(), this.preset = PeriodPreset.month, this.customFrom, this.customTo}): super._();
  

@override@JsonKey() final  PaginatedSectionData<MyPenalty> penalties;
/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
@override@JsonKey() final  PeriodPreset? preset;
@override final  DateTime? customFrom;
@override final  DateTime? customTo;

/// Create a copy of MyPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPenaltiesStateCopyWith<_MyPenaltiesState> get copyWith => __$MyPenaltiesStateCopyWithImpl<_MyPenaltiesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPenaltiesState&&(identical(other.penalties, penalties) || other.penalties == penalties)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo));
}


@override
int get hashCode => Object.hash(runtimeType,penalties,preset,customFrom,customTo);

@override
String toString() {
  return 'MyPenaltiesState(penalties: $penalties, preset: $preset, customFrom: $customFrom, customTo: $customTo)';
}


}

/// @nodoc
abstract mixin class _$MyPenaltiesStateCopyWith<$Res> implements $MyPenaltiesStateCopyWith<$Res> {
  factory _$MyPenaltiesStateCopyWith(_MyPenaltiesState value, $Res Function(_MyPenaltiesState) _then) = __$MyPenaltiesStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedSectionData<MyPenalty> penalties, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo
});


@override $PaginatedSectionDataCopyWith<MyPenalty, $Res> get penalties;

}
/// @nodoc
class __$MyPenaltiesStateCopyWithImpl<$Res>
    implements _$MyPenaltiesStateCopyWith<$Res> {
  __$MyPenaltiesStateCopyWithImpl(this._self, this._then);

  final _MyPenaltiesState _self;
  final $Res Function(_MyPenaltiesState) _then;

/// Create a copy of MyPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? penalties = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,}) {
  return _then(_MyPenaltiesState(
penalties: null == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<MyPenalty>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MyPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<MyPenalty, $Res> get penalties {
  
  return $PaginatedSectionDataCopyWith<MyPenalty, $Res>(_self.penalties, (value) {
    return _then(_self.copyWith(penalties: value));
  });
}
}

// dart format on
