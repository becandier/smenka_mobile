// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_shift_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrgShiftDetailState {

 SectionData<Shift> get shift;
/// Create a copy of OrgShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgShiftDetailStateCopyWith<OrgShiftDetailState> get copyWith => _$OrgShiftDetailStateCopyWithImpl<OrgShiftDetailState>(this as OrgShiftDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgShiftDetailState&&(identical(other.shift, shift) || other.shift == shift));
}


@override
int get hashCode => Object.hash(runtimeType,shift);

@override
String toString() {
  return 'OrgShiftDetailState(shift: $shift)';
}


}

/// @nodoc
abstract mixin class $OrgShiftDetailStateCopyWith<$Res>  {
  factory $OrgShiftDetailStateCopyWith(OrgShiftDetailState value, $Res Function(OrgShiftDetailState) _then) = _$OrgShiftDetailStateCopyWithImpl;
@useResult
$Res call({
 SectionData<Shift> shift
});


$SectionDataCopyWith<Shift, $Res> get shift;

}
/// @nodoc
class _$OrgShiftDetailStateCopyWithImpl<$Res>
    implements $OrgShiftDetailStateCopyWith<$Res> {
  _$OrgShiftDetailStateCopyWithImpl(this._self, this._then);

  final OrgShiftDetailState _self;
  final $Res Function(OrgShiftDetailState) _then;

/// Create a copy of OrgShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shift = null,}) {
  return _then(_self.copyWith(
shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as SectionData<Shift>,
  ));
}
/// Create a copy of OrgShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Shift, $Res> get shift {
  
  return $SectionDataCopyWith<Shift, $Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrgShiftDetailState].
extension OrgShiftDetailStatePatterns on OrgShiftDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgShiftDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgShiftDetailState value)  $default,){
final _that = this;
switch (_that) {
case _OrgShiftDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgShiftDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _OrgShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<Shift> shift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrgShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<Shift> shift)  $default,) {final _that = this;
switch (_that) {
case _OrgShiftDetailState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<Shift> shift)?  $default,) {final _that = this;
switch (_that) {
case _OrgShiftDetailState() when $default != null:
return $default(_that.shift);case _:
  return null;

}
}

}

/// @nodoc


class _OrgShiftDetailState implements OrgShiftDetailState {
  const _OrgShiftDetailState({this.shift = const SectionData<Shift>()});
  

@override@JsonKey() final  SectionData<Shift> shift;

/// Create a copy of OrgShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgShiftDetailStateCopyWith<_OrgShiftDetailState> get copyWith => __$OrgShiftDetailStateCopyWithImpl<_OrgShiftDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgShiftDetailState&&(identical(other.shift, shift) || other.shift == shift));
}


@override
int get hashCode => Object.hash(runtimeType,shift);

@override
String toString() {
  return 'OrgShiftDetailState(shift: $shift)';
}


}

/// @nodoc
abstract mixin class _$OrgShiftDetailStateCopyWith<$Res> implements $OrgShiftDetailStateCopyWith<$Res> {
  factory _$OrgShiftDetailStateCopyWith(_OrgShiftDetailState value, $Res Function(_OrgShiftDetailState) _then) = __$OrgShiftDetailStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<Shift> shift
});


@override $SectionDataCopyWith<Shift, $Res> get shift;

}
/// @nodoc
class __$OrgShiftDetailStateCopyWithImpl<$Res>
    implements _$OrgShiftDetailStateCopyWith<$Res> {
  __$OrgShiftDetailStateCopyWithImpl(this._self, this._then);

  final _OrgShiftDetailState _self;
  final $Res Function(_OrgShiftDetailState) _then;

/// Create a copy of OrgShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shift = null,}) {
  return _then(_OrgShiftDetailState(
shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as SectionData<Shift>,
  ));
}

/// Create a copy of OrgShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Shift, $Res> get shift {
  
  return $SectionDataCopyWith<Shift, $Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}
}

// dart format on
