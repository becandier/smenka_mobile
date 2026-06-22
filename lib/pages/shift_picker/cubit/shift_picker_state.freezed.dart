// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftPickerState {

 SectionData<List<Shift>> get shifts;
/// Create a copy of ShiftPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftPickerStateCopyWith<ShiftPickerState> get copyWith => _$ShiftPickerStateCopyWithImpl<ShiftPickerState>(this as ShiftPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftPickerState&&(identical(other.shifts, shifts) || other.shifts == shifts));
}


@override
int get hashCode => Object.hash(runtimeType,shifts);

@override
String toString() {
  return 'ShiftPickerState(shifts: $shifts)';
}


}

/// @nodoc
abstract mixin class $ShiftPickerStateCopyWith<$Res>  {
  factory $ShiftPickerStateCopyWith(ShiftPickerState value, $Res Function(ShiftPickerState) _then) = _$ShiftPickerStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<Shift>> shifts
});


$SectionDataCopyWith<List<Shift>, $Res> get shifts;

}
/// @nodoc
class _$ShiftPickerStateCopyWithImpl<$Res>
    implements $ShiftPickerStateCopyWith<$Res> {
  _$ShiftPickerStateCopyWithImpl(this._self, this._then);

  final ShiftPickerState _self;
  final $Res Function(ShiftPickerState) _then;

/// Create a copy of ShiftPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shifts = null,}) {
  return _then(_self.copyWith(
shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as SectionData<List<Shift>>,
  ));
}
/// Create a copy of ShiftPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Shift>, $Res> get shifts {
  
  return $SectionDataCopyWith<List<Shift>, $Res>(_self.shifts, (value) {
    return _then(_self.copyWith(shifts: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftPickerState].
extension ShiftPickerStatePatterns on ShiftPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftPickerState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<Shift>> shifts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftPickerState() when $default != null:
return $default(_that.shifts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<Shift>> shifts)  $default,) {final _that = this;
switch (_that) {
case _ShiftPickerState():
return $default(_that.shifts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<Shift>> shifts)?  $default,) {final _that = this;
switch (_that) {
case _ShiftPickerState() when $default != null:
return $default(_that.shifts);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftPickerState implements ShiftPickerState {
  const _ShiftPickerState({this.shifts = const SectionData<List<Shift>>()});
  

@override@JsonKey() final  SectionData<List<Shift>> shifts;

/// Create a copy of ShiftPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftPickerStateCopyWith<_ShiftPickerState> get copyWith => __$ShiftPickerStateCopyWithImpl<_ShiftPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftPickerState&&(identical(other.shifts, shifts) || other.shifts == shifts));
}


@override
int get hashCode => Object.hash(runtimeType,shifts);

@override
String toString() {
  return 'ShiftPickerState(shifts: $shifts)';
}


}

/// @nodoc
abstract mixin class _$ShiftPickerStateCopyWith<$Res> implements $ShiftPickerStateCopyWith<$Res> {
  factory _$ShiftPickerStateCopyWith(_ShiftPickerState value, $Res Function(_ShiftPickerState) _then) = __$ShiftPickerStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<Shift>> shifts
});


@override $SectionDataCopyWith<List<Shift>, $Res> get shifts;

}
/// @nodoc
class __$ShiftPickerStateCopyWithImpl<$Res>
    implements _$ShiftPickerStateCopyWith<$Res> {
  __$ShiftPickerStateCopyWithImpl(this._self, this._then);

  final _ShiftPickerState _self;
  final $Res Function(_ShiftPickerState) _then;

/// Create a copy of ShiftPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shifts = null,}) {
  return _then(_ShiftPickerState(
shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as SectionData<List<Shift>>,
  ));
}

/// Create a copy of ShiftPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Shift>, $Res> get shifts {
  
  return $SectionDataCopyWith<List<Shift>, $Res>(_self.shifts, (value) {
    return _then(_self.copyWith(shifts: value));
  });
}
}

// dart format on
