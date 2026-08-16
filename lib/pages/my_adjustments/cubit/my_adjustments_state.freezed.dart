// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_adjustments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyAdjustmentsState {

 PaginatedSectionData<MyAdjustment> get adjustments;/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
 PeriodPreset? get preset; DateTime? get customFrom; DateTime? get customTo;
/// Create a copy of MyAdjustmentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAdjustmentsStateCopyWith<MyAdjustmentsState> get copyWith => _$MyAdjustmentsStateCopyWithImpl<MyAdjustmentsState>(this as MyAdjustmentsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAdjustmentsState&&(identical(other.adjustments, adjustments) || other.adjustments == adjustments)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo));
}


@override
int get hashCode => Object.hash(runtimeType,adjustments,preset,customFrom,customTo);

@override
String toString() {
  return 'MyAdjustmentsState(adjustments: $adjustments, preset: $preset, customFrom: $customFrom, customTo: $customTo)';
}


}

/// @nodoc
abstract mixin class $MyAdjustmentsStateCopyWith<$Res>  {
  factory $MyAdjustmentsStateCopyWith(MyAdjustmentsState value, $Res Function(MyAdjustmentsState) _then) = _$MyAdjustmentsStateCopyWithImpl;
@useResult
$Res call({
 PaginatedSectionData<MyAdjustment> adjustments, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo
});


$PaginatedSectionDataCopyWith<MyAdjustment, $Res> get adjustments;

}
/// @nodoc
class _$MyAdjustmentsStateCopyWithImpl<$Res>
    implements $MyAdjustmentsStateCopyWith<$Res> {
  _$MyAdjustmentsStateCopyWithImpl(this._self, this._then);

  final MyAdjustmentsState _self;
  final $Res Function(MyAdjustmentsState) _then;

/// Create a copy of MyAdjustmentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adjustments = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,}) {
  return _then(_self.copyWith(
adjustments: null == adjustments ? _self.adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<MyAdjustment>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of MyAdjustmentsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<MyAdjustment, $Res> get adjustments {
  
  return $PaginatedSectionDataCopyWith<MyAdjustment, $Res>(_self.adjustments, (value) {
    return _then(_self.copyWith(adjustments: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyAdjustmentsState].
extension MyAdjustmentsStatePatterns on MyAdjustmentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyAdjustmentsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyAdjustmentsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyAdjustmentsState value)  $default,){
final _that = this;
switch (_that) {
case _MyAdjustmentsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyAdjustmentsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyAdjustmentsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedSectionData<MyAdjustment> adjustments,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAdjustmentsState() when $default != null:
return $default(_that.adjustments,_that.preset,_that.customFrom,_that.customTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedSectionData<MyAdjustment> adjustments,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo)  $default,) {final _that = this;
switch (_that) {
case _MyAdjustmentsState():
return $default(_that.adjustments,_that.preset,_that.customFrom,_that.customTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedSectionData<MyAdjustment> adjustments,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo)?  $default,) {final _that = this;
switch (_that) {
case _MyAdjustmentsState() when $default != null:
return $default(_that.adjustments,_that.preset,_that.customFrom,_that.customTo);case _:
  return null;

}
}

}

/// @nodoc


class _MyAdjustmentsState extends MyAdjustmentsState {
  const _MyAdjustmentsState({this.adjustments = const PaginatedSectionData<MyAdjustment>(), this.preset = PeriodPreset.month, this.customFrom, this.customTo}): super._();
  

@override@JsonKey() final  PaginatedSectionData<MyAdjustment> adjustments;
/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
@override@JsonKey() final  PeriodPreset? preset;
@override final  DateTime? customFrom;
@override final  DateTime? customTo;

/// Create a copy of MyAdjustmentsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyAdjustmentsStateCopyWith<_MyAdjustmentsState> get copyWith => __$MyAdjustmentsStateCopyWithImpl<_MyAdjustmentsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAdjustmentsState&&(identical(other.adjustments, adjustments) || other.adjustments == adjustments)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo));
}


@override
int get hashCode => Object.hash(runtimeType,adjustments,preset,customFrom,customTo);

@override
String toString() {
  return 'MyAdjustmentsState(adjustments: $adjustments, preset: $preset, customFrom: $customFrom, customTo: $customTo)';
}


}

/// @nodoc
abstract mixin class _$MyAdjustmentsStateCopyWith<$Res> implements $MyAdjustmentsStateCopyWith<$Res> {
  factory _$MyAdjustmentsStateCopyWith(_MyAdjustmentsState value, $Res Function(_MyAdjustmentsState) _then) = __$MyAdjustmentsStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedSectionData<MyAdjustment> adjustments, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo
});


@override $PaginatedSectionDataCopyWith<MyAdjustment, $Res> get adjustments;

}
/// @nodoc
class __$MyAdjustmentsStateCopyWithImpl<$Res>
    implements _$MyAdjustmentsStateCopyWith<$Res> {
  __$MyAdjustmentsStateCopyWithImpl(this._self, this._then);

  final _MyAdjustmentsState _self;
  final $Res Function(_MyAdjustmentsState) _then;

/// Create a copy of MyAdjustmentsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adjustments = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,}) {
  return _then(_MyAdjustmentsState(
adjustments: null == adjustments ? _self.adjustments : adjustments // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<MyAdjustment>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MyAdjustmentsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<MyAdjustment, $Res> get adjustments {
  
  return $PaginatedSectionDataCopyWith<MyAdjustment, $Res>(_self.adjustments, (value) {
    return _then(_self.copyWith(adjustments: value));
  });
}
}

// dart format on
