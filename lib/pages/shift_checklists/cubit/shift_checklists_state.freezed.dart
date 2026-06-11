// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_checklists_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftChecklistsState {

 SectionData<List<ChecklistInstance>> get instances;
/// Create a copy of ShiftChecklistsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftChecklistsStateCopyWith<ShiftChecklistsState> get copyWith => _$ShiftChecklistsStateCopyWithImpl<ShiftChecklistsState>(this as ShiftChecklistsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftChecklistsState&&(identical(other.instances, instances) || other.instances == instances));
}


@override
int get hashCode => Object.hash(runtimeType,instances);

@override
String toString() {
  return 'ShiftChecklistsState(instances: $instances)';
}


}

/// @nodoc
abstract mixin class $ShiftChecklistsStateCopyWith<$Res>  {
  factory $ShiftChecklistsStateCopyWith(ShiftChecklistsState value, $Res Function(ShiftChecklistsState) _then) = _$ShiftChecklistsStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<ChecklistInstance>> instances
});


$SectionDataCopyWith<List<ChecklistInstance>, $Res> get instances;

}
/// @nodoc
class _$ShiftChecklistsStateCopyWithImpl<$Res>
    implements $ShiftChecklistsStateCopyWith<$Res> {
  _$ShiftChecklistsStateCopyWithImpl(this._self, this._then);

  final ShiftChecklistsState _self;
  final $Res Function(ShiftChecklistsState) _then;

/// Create a copy of ShiftChecklistsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? instances = null,}) {
  return _then(_self.copyWith(
instances: null == instances ? _self.instances : instances // ignore: cast_nullable_to_non_nullable
as SectionData<List<ChecklistInstance>>,
  ));
}
/// Create a copy of ShiftChecklistsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<ChecklistInstance>, $Res> get instances {
  
  return $SectionDataCopyWith<List<ChecklistInstance>, $Res>(_self.instances, (value) {
    return _then(_self.copyWith(instances: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftChecklistsState].
extension ShiftChecklistsStatePatterns on ShiftChecklistsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftChecklistsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftChecklistsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftChecklistsState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftChecklistsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftChecklistsState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftChecklistsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<ChecklistInstance>> instances)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftChecklistsState() when $default != null:
return $default(_that.instances);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<ChecklistInstance>> instances)  $default,) {final _that = this;
switch (_that) {
case _ShiftChecklistsState():
return $default(_that.instances);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<ChecklistInstance>> instances)?  $default,) {final _that = this;
switch (_that) {
case _ShiftChecklistsState() when $default != null:
return $default(_that.instances);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftChecklistsState implements ShiftChecklistsState {
  const _ShiftChecklistsState({this.instances = const SectionData<List<ChecklistInstance>>()});
  

@override@JsonKey() final  SectionData<List<ChecklistInstance>> instances;

/// Create a copy of ShiftChecklistsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftChecklistsStateCopyWith<_ShiftChecklistsState> get copyWith => __$ShiftChecklistsStateCopyWithImpl<_ShiftChecklistsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftChecklistsState&&(identical(other.instances, instances) || other.instances == instances));
}


@override
int get hashCode => Object.hash(runtimeType,instances);

@override
String toString() {
  return 'ShiftChecklistsState(instances: $instances)';
}


}

/// @nodoc
abstract mixin class _$ShiftChecklistsStateCopyWith<$Res> implements $ShiftChecklistsStateCopyWith<$Res> {
  factory _$ShiftChecklistsStateCopyWith(_ShiftChecklistsState value, $Res Function(_ShiftChecklistsState) _then) = __$ShiftChecklistsStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<ChecklistInstance>> instances
});


@override $SectionDataCopyWith<List<ChecklistInstance>, $Res> get instances;

}
/// @nodoc
class __$ShiftChecklistsStateCopyWithImpl<$Res>
    implements _$ShiftChecklistsStateCopyWith<$Res> {
  __$ShiftChecklistsStateCopyWithImpl(this._self, this._then);

  final _ShiftChecklistsState _self;
  final $Res Function(_ShiftChecklistsState) _then;

/// Create a copy of ShiftChecklistsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instances = null,}) {
  return _then(_ShiftChecklistsState(
instances: null == instances ? _self.instances : instances // ignore: cast_nullable_to_non_nullable
as SectionData<List<ChecklistInstance>>,
  ));
}

/// Create a copy of ShiftChecklistsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<ChecklistInstance>, $Res> get instances {
  
  return $SectionDataCopyWith<List<ChecklistInstance>, $Res>(_self.instances, (value) {
    return _then(_self.copyWith(instances: value));
  });
}
}

// dart format on
