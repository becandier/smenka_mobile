// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RolesState {

 SectionData<List<OrganizationRole>> get roles; FeatureStatus get actionStatus; String? get actionError;
/// Create a copy of RolesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesStateCopyWith<RolesState> get copyWith => _$RolesStateCopyWithImpl<RolesState>(this as RolesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesState&&(identical(other.roles, roles) || other.roles == roles)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode => Object.hash(runtimeType,roles,actionStatus,actionError);

@override
String toString() {
  return 'RolesState(roles: $roles, actionStatus: $actionStatus, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class $RolesStateCopyWith<$Res>  {
  factory $RolesStateCopyWith(RolesState value, $Res Function(RolesState) _then) = _$RolesStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<OrganizationRole>> roles, FeatureStatus actionStatus, String? actionError
});


$SectionDataCopyWith<List<OrganizationRole>, $Res> get roles;

}
/// @nodoc
class _$RolesStateCopyWithImpl<$Res>
    implements $RolesStateCopyWith<$Res> {
  _$RolesStateCopyWithImpl(this._self, this._then);

  final RolesState _self;
  final $Res Function(RolesState) _then;

/// Create a copy of RolesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roles = null,Object? actionStatus = null,Object? actionError = freezed,}) {
  return _then(_self.copyWith(
roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as SectionData<List<OrganizationRole>>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RolesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<OrganizationRole>, $Res> get roles {
  
  return $SectionDataCopyWith<List<OrganizationRole>, $Res>(_self.roles, (value) {
    return _then(_self.copyWith(roles: value));
  });
}
}


/// Adds pattern-matching-related methods to [RolesState].
extension RolesStatePatterns on RolesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolesState value)  $default,){
final _that = this;
switch (_that) {
case _RolesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolesState value)?  $default,){
final _that = this;
switch (_that) {
case _RolesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<OrganizationRole>> roles,  FeatureStatus actionStatus,  String? actionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolesState() when $default != null:
return $default(_that.roles,_that.actionStatus,_that.actionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<OrganizationRole>> roles,  FeatureStatus actionStatus,  String? actionError)  $default,) {final _that = this;
switch (_that) {
case _RolesState():
return $default(_that.roles,_that.actionStatus,_that.actionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<OrganizationRole>> roles,  FeatureStatus actionStatus,  String? actionError)?  $default,) {final _that = this;
switch (_that) {
case _RolesState() when $default != null:
return $default(_that.roles,_that.actionStatus,_that.actionError);case _:
  return null;

}
}

}

/// @nodoc


class _RolesState implements RolesState {
  const _RolesState({this.roles = const SectionData<List<OrganizationRole>>(), this.actionStatus = FeatureStatus.initial, this.actionError});
  

@override@JsonKey() final  SectionData<List<OrganizationRole>> roles;
@override@JsonKey() final  FeatureStatus actionStatus;
@override final  String? actionError;

/// Create a copy of RolesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolesStateCopyWith<_RolesState> get copyWith => __$RolesStateCopyWithImpl<_RolesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolesState&&(identical(other.roles, roles) || other.roles == roles)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode => Object.hash(runtimeType,roles,actionStatus,actionError);

@override
String toString() {
  return 'RolesState(roles: $roles, actionStatus: $actionStatus, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class _$RolesStateCopyWith<$Res> implements $RolesStateCopyWith<$Res> {
  factory _$RolesStateCopyWith(_RolesState value, $Res Function(_RolesState) _then) = __$RolesStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<OrganizationRole>> roles, FeatureStatus actionStatus, String? actionError
});


@override $SectionDataCopyWith<List<OrganizationRole>, $Res> get roles;

}
/// @nodoc
class __$RolesStateCopyWithImpl<$Res>
    implements _$RolesStateCopyWith<$Res> {
  __$RolesStateCopyWithImpl(this._self, this._then);

  final _RolesState _self;
  final $Res Function(_RolesState) _then;

/// Create a copy of RolesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roles = null,Object? actionStatus = null,Object? actionError = freezed,}) {
  return _then(_RolesState(
roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as SectionData<List<OrganizationRole>>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RolesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<OrganizationRole>, $Res> get roles {
  
  return $SectionDataCopyWith<List<OrganizationRole>, $Res>(_self.roles, (value) {
    return _then(_self.copyWith(roles: value));
  });
}
}

// dart format on
