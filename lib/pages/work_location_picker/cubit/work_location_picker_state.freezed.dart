// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_location_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkLocationPickerState {

 SectionData<List<WorkLocation>> get locations;
/// Create a copy of WorkLocationPickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkLocationPickerStateCopyWith<WorkLocationPickerState> get copyWith => _$WorkLocationPickerStateCopyWithImpl<WorkLocationPickerState>(this as WorkLocationPickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkLocationPickerState&&(identical(other.locations, locations) || other.locations == locations));
}


@override
int get hashCode => Object.hash(runtimeType,locations);

@override
String toString() {
  return 'WorkLocationPickerState(locations: $locations)';
}


}

/// @nodoc
abstract mixin class $WorkLocationPickerStateCopyWith<$Res>  {
  factory $WorkLocationPickerStateCopyWith(WorkLocationPickerState value, $Res Function(WorkLocationPickerState) _then) = _$WorkLocationPickerStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<WorkLocation>> locations
});


$SectionDataCopyWith<List<WorkLocation>, $Res> get locations;

}
/// @nodoc
class _$WorkLocationPickerStateCopyWithImpl<$Res>
    implements $WorkLocationPickerStateCopyWith<$Res> {
  _$WorkLocationPickerStateCopyWithImpl(this._self, this._then);

  final WorkLocationPickerState _self;
  final $Res Function(WorkLocationPickerState) _then;

/// Create a copy of WorkLocationPickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locations = null,}) {
  return _then(_self.copyWith(
locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as SectionData<List<WorkLocation>>,
  ));
}
/// Create a copy of WorkLocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<WorkLocation>, $Res> get locations {
  
  return $SectionDataCopyWith<List<WorkLocation>, $Res>(_self.locations, (value) {
    return _then(_self.copyWith(locations: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkLocationPickerState].
extension WorkLocationPickerStatePatterns on WorkLocationPickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkLocationPickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkLocationPickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkLocationPickerState value)  $default,){
final _that = this;
switch (_that) {
case _WorkLocationPickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkLocationPickerState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkLocationPickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<WorkLocation>> locations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkLocationPickerState() when $default != null:
return $default(_that.locations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<WorkLocation>> locations)  $default,) {final _that = this;
switch (_that) {
case _WorkLocationPickerState():
return $default(_that.locations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<WorkLocation>> locations)?  $default,) {final _that = this;
switch (_that) {
case _WorkLocationPickerState() when $default != null:
return $default(_that.locations);case _:
  return null;

}
}

}

/// @nodoc


class _WorkLocationPickerState implements WorkLocationPickerState {
  const _WorkLocationPickerState({this.locations = const SectionData<List<WorkLocation>>()});
  

@override@JsonKey() final  SectionData<List<WorkLocation>> locations;

/// Create a copy of WorkLocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkLocationPickerStateCopyWith<_WorkLocationPickerState> get copyWith => __$WorkLocationPickerStateCopyWithImpl<_WorkLocationPickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkLocationPickerState&&(identical(other.locations, locations) || other.locations == locations));
}


@override
int get hashCode => Object.hash(runtimeType,locations);

@override
String toString() {
  return 'WorkLocationPickerState(locations: $locations)';
}


}

/// @nodoc
abstract mixin class _$WorkLocationPickerStateCopyWith<$Res> implements $WorkLocationPickerStateCopyWith<$Res> {
  factory _$WorkLocationPickerStateCopyWith(_WorkLocationPickerState value, $Res Function(_WorkLocationPickerState) _then) = __$WorkLocationPickerStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<WorkLocation>> locations
});


@override $SectionDataCopyWith<List<WorkLocation>, $Res> get locations;

}
/// @nodoc
class __$WorkLocationPickerStateCopyWithImpl<$Res>
    implements _$WorkLocationPickerStateCopyWith<$Res> {
  __$WorkLocationPickerStateCopyWithImpl(this._self, this._then);

  final _WorkLocationPickerState _self;
  final $Res Function(_WorkLocationPickerState) _then;

/// Create a copy of WorkLocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locations = null,}) {
  return _then(_WorkLocationPickerState(
locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as SectionData<List<WorkLocation>>,
  ));
}

/// Create a copy of WorkLocationPickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<WorkLocation>, $Res> get locations {
  
  return $SectionDataCopyWith<List<WorkLocation>, $Res>(_self.locations, (value) {
    return _then(_self.copyWith(locations: value));
  });
}
}

// dart format on
