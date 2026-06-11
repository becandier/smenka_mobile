// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeePickerState {

 SectionData<List<Member>> get members;
/// Create a copy of EmployeePickerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeePickerStateCopyWith<EmployeePickerState> get copyWith => _$EmployeePickerStateCopyWithImpl<EmployeePickerState>(this as EmployeePickerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeePickerState&&(identical(other.members, members) || other.members == members));
}


@override
int get hashCode => Object.hash(runtimeType,members);

@override
String toString() {
  return 'EmployeePickerState(members: $members)';
}


}

/// @nodoc
abstract mixin class $EmployeePickerStateCopyWith<$Res>  {
  factory $EmployeePickerStateCopyWith(EmployeePickerState value, $Res Function(EmployeePickerState) _then) = _$EmployeePickerStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<Member>> members
});


$SectionDataCopyWith<List<Member>, $Res> get members;

}
/// @nodoc
class _$EmployeePickerStateCopyWithImpl<$Res>
    implements $EmployeePickerStateCopyWith<$Res> {
  _$EmployeePickerStateCopyWithImpl(this._self, this._then);

  final EmployeePickerState _self;
  final $Res Function(EmployeePickerState) _then;

/// Create a copy of EmployeePickerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? members = null,}) {
  return _then(_self.copyWith(
members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as SectionData<List<Member>>,
  ));
}
/// Create a copy of EmployeePickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Member>, $Res> get members {
  
  return $SectionDataCopyWith<List<Member>, $Res>(_self.members, (value) {
    return _then(_self.copyWith(members: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmployeePickerState].
extension EmployeePickerStatePatterns on EmployeePickerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeePickerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeePickerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeePickerState value)  $default,){
final _that = this;
switch (_that) {
case _EmployeePickerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeePickerState value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeePickerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<Member>> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeePickerState() when $default != null:
return $default(_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<Member>> members)  $default,) {final _that = this;
switch (_that) {
case _EmployeePickerState():
return $default(_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<Member>> members)?  $default,) {final _that = this;
switch (_that) {
case _EmployeePickerState() when $default != null:
return $default(_that.members);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeePickerState implements EmployeePickerState {
  const _EmployeePickerState({this.members = const SectionData<List<Member>>()});
  

@override@JsonKey() final  SectionData<List<Member>> members;

/// Create a copy of EmployeePickerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeePickerStateCopyWith<_EmployeePickerState> get copyWith => __$EmployeePickerStateCopyWithImpl<_EmployeePickerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeePickerState&&(identical(other.members, members) || other.members == members));
}


@override
int get hashCode => Object.hash(runtimeType,members);

@override
String toString() {
  return 'EmployeePickerState(members: $members)';
}


}

/// @nodoc
abstract mixin class _$EmployeePickerStateCopyWith<$Res> implements $EmployeePickerStateCopyWith<$Res> {
  factory _$EmployeePickerStateCopyWith(_EmployeePickerState value, $Res Function(_EmployeePickerState) _then) = __$EmployeePickerStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<Member>> members
});


@override $SectionDataCopyWith<List<Member>, $Res> get members;

}
/// @nodoc
class __$EmployeePickerStateCopyWithImpl<$Res>
    implements _$EmployeePickerStateCopyWith<$Res> {
  __$EmployeePickerStateCopyWithImpl(this._self, this._then);

  final _EmployeePickerState _self;
  final $Res Function(_EmployeePickerState) _then;

/// Create a copy of EmployeePickerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? members = null,}) {
  return _then(_EmployeePickerState(
members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as SectionData<List<Member>>,
  ));
}

/// Create a copy of EmployeePickerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Member>, $Res> get members {
  
  return $SectionDataCopyWith<List<Member>, $Res>(_self.members, (value) {
    return _then(_self.copyWith(members: value));
  });
}
}

// dart format on
