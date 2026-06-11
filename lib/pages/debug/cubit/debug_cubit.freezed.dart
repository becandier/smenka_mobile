// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debug_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DebugState {

 Flavors? get flavor; bool? get isDeviceAccess; String? get errorMessage; FeatureStatus get status;
/// Create a copy of DebugState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DebugStateCopyWith<DebugState> get copyWith => _$DebugStateCopyWithImpl<DebugState>(this as DebugState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DebugState&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.isDeviceAccess, isDeviceAccess) || other.isDeviceAccess == isDeviceAccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,flavor,isDeviceAccess,errorMessage,status);

@override
String toString() {
  return 'DebugState(flavor: $flavor, isDeviceAccess: $isDeviceAccess, errorMessage: $errorMessage, status: $status)';
}


}

/// @nodoc
abstract mixin class $DebugStateCopyWith<$Res>  {
  factory $DebugStateCopyWith(DebugState value, $Res Function(DebugState) _then) = _$DebugStateCopyWithImpl;
@useResult
$Res call({
 Flavors? flavor, bool? isDeviceAccess, String? errorMessage, FeatureStatus status
});




}
/// @nodoc
class _$DebugStateCopyWithImpl<$Res>
    implements $DebugStateCopyWith<$Res> {
  _$DebugStateCopyWithImpl(this._self, this._then);

  final DebugState _self;
  final $Res Function(DebugState) _then;

/// Create a copy of DebugState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flavor = freezed,Object? isDeviceAccess = freezed,Object? errorMessage = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
flavor: freezed == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as Flavors?,isDeviceAccess: freezed == isDeviceAccess ? _self.isDeviceAccess : isDeviceAccess // ignore: cast_nullable_to_non_nullable
as bool?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [DebugState].
extension DebugStatePatterns on DebugState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DebugState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DebugState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DebugState value)  $default,){
final _that = this;
switch (_that) {
case _DebugState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DebugState value)?  $default,){
final _that = this;
switch (_that) {
case _DebugState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Flavors? flavor,  bool? isDeviceAccess,  String? errorMessage,  FeatureStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DebugState() when $default != null:
return $default(_that.flavor,_that.isDeviceAccess,_that.errorMessage,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Flavors? flavor,  bool? isDeviceAccess,  String? errorMessage,  FeatureStatus status)  $default,) {final _that = this;
switch (_that) {
case _DebugState():
return $default(_that.flavor,_that.isDeviceAccess,_that.errorMessage,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Flavors? flavor,  bool? isDeviceAccess,  String? errorMessage,  FeatureStatus status)?  $default,) {final _that = this;
switch (_that) {
case _DebugState() when $default != null:
return $default(_that.flavor,_that.isDeviceAccess,_that.errorMessage,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _DebugState implements DebugState {
  const _DebugState({this.flavor, this.isDeviceAccess, this.errorMessage, this.status = FeatureStatus.initial});
  

@override final  Flavors? flavor;
@override final  bool? isDeviceAccess;
@override final  String? errorMessage;
@override@JsonKey() final  FeatureStatus status;

/// Create a copy of DebugState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DebugStateCopyWith<_DebugState> get copyWith => __$DebugStateCopyWithImpl<_DebugState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DebugState&&(identical(other.flavor, flavor) || other.flavor == flavor)&&(identical(other.isDeviceAccess, isDeviceAccess) || other.isDeviceAccess == isDeviceAccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,flavor,isDeviceAccess,errorMessage,status);

@override
String toString() {
  return 'DebugState(flavor: $flavor, isDeviceAccess: $isDeviceAccess, errorMessage: $errorMessage, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DebugStateCopyWith<$Res> implements $DebugStateCopyWith<$Res> {
  factory _$DebugStateCopyWith(_DebugState value, $Res Function(_DebugState) _then) = __$DebugStateCopyWithImpl;
@override @useResult
$Res call({
 Flavors? flavor, bool? isDeviceAccess, String? errorMessage, FeatureStatus status
});




}
/// @nodoc
class __$DebugStateCopyWithImpl<$Res>
    implements _$DebugStateCopyWith<$Res> {
  __$DebugStateCopyWithImpl(this._self, this._then);

  final _DebugState _self;
  final $Res Function(_DebugState) _then;

/// Create a copy of DebugState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flavor = freezed,Object? isDeviceAccess = freezed,Object? errorMessage = freezed,Object? status = null,}) {
  return _then(_DebugState(
flavor: freezed == flavor ? _self.flavor : flavor // ignore: cast_nullable_to_non_nullable
as Flavors?,isDeviceAccess: freezed == isDeviceAccess ? _self.isDeviceAccess : isDeviceAccess // ignore: cast_nullable_to_non_nullable
as bool?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,
  ));
}


}

// dart format on
