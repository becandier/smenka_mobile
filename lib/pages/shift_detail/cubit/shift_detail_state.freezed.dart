// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftDetailState {

 Shift get shift;
/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftDetailStateCopyWith<ShiftDetailState> get copyWith => _$ShiftDetailStateCopyWithImpl<ShiftDetailState>(this as ShiftDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftDetailState&&(identical(other.shift, shift) || other.shift == shift));
}


@override
int get hashCode => Object.hash(runtimeType,shift);

@override
String toString() {
  return 'ShiftDetailState(shift: $shift)';
}


}

/// @nodoc
abstract mixin class $ShiftDetailStateCopyWith<$Res>  {
  factory $ShiftDetailStateCopyWith(ShiftDetailState value, $Res Function(ShiftDetailState) _then) = _$ShiftDetailStateCopyWithImpl;
@useResult
$Res call({
 Shift shift
});


$ShiftCopyWith<$Res> get shift;

}
/// @nodoc
class _$ShiftDetailStateCopyWithImpl<$Res>
    implements $ShiftDetailStateCopyWith<$Res> {
  _$ShiftDetailStateCopyWithImpl(this._self, this._then);

  final ShiftDetailState _self;
  final $Res Function(ShiftDetailState) _then;

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shift = null,}) {
  return _then(_self.copyWith(
shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift,
  ));
}
/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res> get shift {
  
  return $ShiftCopyWith<$Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftDetailState].
extension ShiftDetailStatePatterns on ShiftDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Shift shift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
return $default(_that.shift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Shift shift)  $default,) {final _that = this;
switch (_that) {
case _ShiftDetailState():
return $default(_that.shift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Shift shift)?  $default,) {final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
return $default(_that.shift);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftDetailState implements ShiftDetailState {
  const _ShiftDetailState({required this.shift});
  

@override final  Shift shift;

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftDetailStateCopyWith<_ShiftDetailState> get copyWith => __$ShiftDetailStateCopyWithImpl<_ShiftDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftDetailState&&(identical(other.shift, shift) || other.shift == shift));
}


@override
int get hashCode => Object.hash(runtimeType,shift);

@override
String toString() {
  return 'ShiftDetailState(shift: $shift)';
}


}

/// @nodoc
abstract mixin class _$ShiftDetailStateCopyWith<$Res> implements $ShiftDetailStateCopyWith<$Res> {
  factory _$ShiftDetailStateCopyWith(_ShiftDetailState value, $Res Function(_ShiftDetailState) _then) = __$ShiftDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Shift shift
});


@override $ShiftCopyWith<$Res> get shift;

}
/// @nodoc
class __$ShiftDetailStateCopyWithImpl<$Res>
    implements _$ShiftDetailStateCopyWith<$Res> {
  __$ShiftDetailStateCopyWithImpl(this._self, this._then);

  final _ShiftDetailState _self;
  final $Res Function(_ShiftDetailState) _then;

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shift = null,}) {
  return _then(_ShiftDetailState(
shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift,
  ));
}

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res> get shift {
  
  return $ShiftCopyWith<$Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}
}

// dart format on
