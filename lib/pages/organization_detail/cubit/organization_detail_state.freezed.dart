// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganizationDetailState {

 SectionData<Organization> get organization; SectionData<List<Member>> get members; FeatureStatus get actionStatus; String? get actionError; String? get inviteCode; String get currentUserId; MemberRole? get currentMemberRole; UserRole get currentUserRole;
/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationDetailStateCopyWith<OrganizationDetailState> get copyWith => _$OrganizationDetailStateCopyWithImpl<OrganizationDetailState>(this as OrganizationDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationDetailState&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.members, members) || other.members == members)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.currentMemberRole, currentMemberRole) || other.currentMemberRole == currentMemberRole)&&(identical(other.currentUserRole, currentUserRole) || other.currentUserRole == currentUserRole));
}


@override
int get hashCode => Object.hash(runtimeType,organization,members,actionStatus,actionError,inviteCode,currentUserId,currentMemberRole,currentUserRole);

@override
String toString() {
  return 'OrganizationDetailState(organization: $organization, members: $members, actionStatus: $actionStatus, actionError: $actionError, inviteCode: $inviteCode, currentUserId: $currentUserId, currentMemberRole: $currentMemberRole, currentUserRole: $currentUserRole)';
}


}

/// @nodoc
abstract mixin class $OrganizationDetailStateCopyWith<$Res>  {
  factory $OrganizationDetailStateCopyWith(OrganizationDetailState value, $Res Function(OrganizationDetailState) _then) = _$OrganizationDetailStateCopyWithImpl;
@useResult
$Res call({
 SectionData<Organization> organization, SectionData<List<Member>> members, FeatureStatus actionStatus, String? actionError, String? inviteCode, String currentUserId, MemberRole? currentMemberRole, UserRole currentUserRole
});


$SectionDataCopyWith<Organization, $Res> get organization;$SectionDataCopyWith<List<Member>, $Res> get members;

}
/// @nodoc
class _$OrganizationDetailStateCopyWithImpl<$Res>
    implements $OrganizationDetailStateCopyWith<$Res> {
  _$OrganizationDetailStateCopyWithImpl(this._self, this._then);

  final OrganizationDetailState _self;
  final $Res Function(OrganizationDetailState) _then;

/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? organization = null,Object? members = null,Object? actionStatus = null,Object? actionError = freezed,Object? inviteCode = freezed,Object? currentUserId = null,Object? currentMemberRole = freezed,Object? currentUserRole = null,}) {
  return _then(_self.copyWith(
organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as SectionData<Organization>,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as SectionData<List<Member>>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,currentMemberRole: freezed == currentMemberRole ? _self.currentMemberRole : currentMemberRole // ignore: cast_nullable_to_non_nullable
as MemberRole?,currentUserRole: null == currentUserRole ? _self.currentUserRole : currentUserRole // ignore: cast_nullable_to_non_nullable
as UserRole,
  ));
}
/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Organization, $Res> get organization {
  
  return $SectionDataCopyWith<Organization, $Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Member>, $Res> get members {
  
  return $SectionDataCopyWith<List<Member>, $Res>(_self.members, (value) {
    return _then(_self.copyWith(members: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrganizationDetailState].
extension OrganizationDetailStatePatterns on OrganizationDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationDetailState value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<Organization> organization,  SectionData<List<Member>> members,  FeatureStatus actionStatus,  String? actionError,  String? inviteCode,  String currentUserId,  MemberRole? currentMemberRole,  UserRole currentUserRole)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationDetailState() when $default != null:
return $default(_that.organization,_that.members,_that.actionStatus,_that.actionError,_that.inviteCode,_that.currentUserId,_that.currentMemberRole,_that.currentUserRole);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<Organization> organization,  SectionData<List<Member>> members,  FeatureStatus actionStatus,  String? actionError,  String? inviteCode,  String currentUserId,  MemberRole? currentMemberRole,  UserRole currentUserRole)  $default,) {final _that = this;
switch (_that) {
case _OrganizationDetailState():
return $default(_that.organization,_that.members,_that.actionStatus,_that.actionError,_that.inviteCode,_that.currentUserId,_that.currentMemberRole,_that.currentUserRole);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<Organization> organization,  SectionData<List<Member>> members,  FeatureStatus actionStatus,  String? actionError,  String? inviteCode,  String currentUserId,  MemberRole? currentMemberRole,  UserRole currentUserRole)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationDetailState() when $default != null:
return $default(_that.organization,_that.members,_that.actionStatus,_that.actionError,_that.inviteCode,_that.currentUserId,_that.currentMemberRole,_that.currentUserRole);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationDetailState implements OrganizationDetailState {
  const _OrganizationDetailState({this.organization = const SectionData<Organization>(), this.members = const SectionData<List<Member>>(), this.actionStatus = FeatureStatus.initial, this.actionError, this.inviteCode, this.currentUserId = '', this.currentMemberRole, this.currentUserRole = UserRole.user});
  

@override@JsonKey() final  SectionData<Organization> organization;
@override@JsonKey() final  SectionData<List<Member>> members;
@override@JsonKey() final  FeatureStatus actionStatus;
@override final  String? actionError;
@override final  String? inviteCode;
@override@JsonKey() final  String currentUserId;
@override final  MemberRole? currentMemberRole;
@override@JsonKey() final  UserRole currentUserRole;

/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationDetailStateCopyWith<_OrganizationDetailState> get copyWith => __$OrganizationDetailStateCopyWithImpl<_OrganizationDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationDetailState&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.members, members) || other.members == members)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.currentMemberRole, currentMemberRole) || other.currentMemberRole == currentMemberRole)&&(identical(other.currentUserRole, currentUserRole) || other.currentUserRole == currentUserRole));
}


@override
int get hashCode => Object.hash(runtimeType,organization,members,actionStatus,actionError,inviteCode,currentUserId,currentMemberRole,currentUserRole);

@override
String toString() {
  return 'OrganizationDetailState(organization: $organization, members: $members, actionStatus: $actionStatus, actionError: $actionError, inviteCode: $inviteCode, currentUserId: $currentUserId, currentMemberRole: $currentMemberRole, currentUserRole: $currentUserRole)';
}


}

/// @nodoc
abstract mixin class _$OrganizationDetailStateCopyWith<$Res> implements $OrganizationDetailStateCopyWith<$Res> {
  factory _$OrganizationDetailStateCopyWith(_OrganizationDetailState value, $Res Function(_OrganizationDetailState) _then) = __$OrganizationDetailStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<Organization> organization, SectionData<List<Member>> members, FeatureStatus actionStatus, String? actionError, String? inviteCode, String currentUserId, MemberRole? currentMemberRole, UserRole currentUserRole
});


@override $SectionDataCopyWith<Organization, $Res> get organization;@override $SectionDataCopyWith<List<Member>, $Res> get members;

}
/// @nodoc
class __$OrganizationDetailStateCopyWithImpl<$Res>
    implements _$OrganizationDetailStateCopyWith<$Res> {
  __$OrganizationDetailStateCopyWithImpl(this._self, this._then);

  final _OrganizationDetailState _self;
  final $Res Function(_OrganizationDetailState) _then;

/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? organization = null,Object? members = null,Object? actionStatus = null,Object? actionError = freezed,Object? inviteCode = freezed,Object? currentUserId = null,Object? currentMemberRole = freezed,Object? currentUserRole = null,}) {
  return _then(_OrganizationDetailState(
organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as SectionData<Organization>,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as SectionData<List<Member>>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,currentMemberRole: freezed == currentMemberRole ? _self.currentMemberRole : currentMemberRole // ignore: cast_nullable_to_non_nullable
as MemberRole?,currentUserRole: null == currentUserRole ? _self.currentUserRole : currentUserRole // ignore: cast_nullable_to_non_nullable
as UserRole,
  ));
}

/// Create a copy of OrganizationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Organization, $Res> get organization {
  
  return $SectionDataCopyWith<Organization, $Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}/// Create a copy of OrganizationDetailState
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
