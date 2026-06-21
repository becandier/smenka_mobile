// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkLocation {

 String get id; String get name; String? get address;
/// Create a copy of WorkLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<WorkLocation> get copyWith => _$WorkLocationCopyWithImpl<WorkLocation>(this as WorkLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'WorkLocation(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $WorkLocationCopyWith<$Res>  {
  factory $WorkLocationCopyWith(WorkLocation value, $Res Function(WorkLocation) _then) = _$WorkLocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? address
});




}
/// @nodoc
class _$WorkLocationCopyWithImpl<$Res>
    implements $WorkLocationCopyWith<$Res> {
  _$WorkLocationCopyWithImpl(this._self, this._then);

  final WorkLocation _self;
  final $Res Function(WorkLocation) _then;

/// Create a copy of WorkLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkLocation].
extension WorkLocationPatterns on WorkLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkLocation value)  $default,){
final _that = this;
switch (_that) {
case _WorkLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkLocation value)?  $default,){
final _that = this;
switch (_that) {
case _WorkLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkLocation() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? address)  $default,) {final _that = this;
switch (_that) {
case _WorkLocation():
return $default(_that.id,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _WorkLocation() when $default != null:
return $default(_that.id,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _WorkLocation implements WorkLocation {
  const _WorkLocation({required this.id, required this.name, this.address});
  

@override final  String id;
@override final  String name;
@override final  String? address;

/// Create a copy of WorkLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkLocationCopyWith<_WorkLocation> get copyWith => __$WorkLocationCopyWithImpl<_WorkLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address);

@override
String toString() {
  return 'WorkLocation(id: $id, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$WorkLocationCopyWith<$Res> implements $WorkLocationCopyWith<$Res> {
  factory _$WorkLocationCopyWith(_WorkLocation value, $Res Function(_WorkLocation) _then) = __$WorkLocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? address
});




}
/// @nodoc
class __$WorkLocationCopyWithImpl<$Res>
    implements _$WorkLocationCopyWith<$Res> {
  __$WorkLocationCopyWithImpl(this._self, this._then);

  final _WorkLocation _self;
  final $Res Function(_WorkLocation) _then;

/// Create a copy of WorkLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = freezed,}) {
  return _then(_WorkLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
