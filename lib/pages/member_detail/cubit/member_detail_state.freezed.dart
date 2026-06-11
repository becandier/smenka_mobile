// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberDetailState {

 Member get member; OrgMembershipRole? get viewerRole; SectionData<List<MemberChecklistOverride>> get overrides; SectionData<List<EffectiveChecklistTemplate>> get effective; SectionData<List<OrganizationRole>> get availableRoles; Set<String> get pendingTemplateIds; FeatureStatus get actionStatus; String? get actionError;
/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberDetailStateCopyWith<MemberDetailState> get copyWith => _$MemberDetailStateCopyWithImpl<MemberDetailState>(this as MemberDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberDetailState&&(identical(other.member, member) || other.member == member)&&(identical(other.viewerRole, viewerRole) || other.viewerRole == viewerRole)&&(identical(other.overrides, overrides) || other.overrides == overrides)&&(identical(other.effective, effective) || other.effective == effective)&&(identical(other.availableRoles, availableRoles) || other.availableRoles == availableRoles)&&const DeepCollectionEquality().equals(other.pendingTemplateIds, pendingTemplateIds)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode => Object.hash(runtimeType,member,viewerRole,overrides,effective,availableRoles,const DeepCollectionEquality().hash(pendingTemplateIds),actionStatus,actionError);

@override
String toString() {
  return 'MemberDetailState(member: $member, viewerRole: $viewerRole, overrides: $overrides, effective: $effective, availableRoles: $availableRoles, pendingTemplateIds: $pendingTemplateIds, actionStatus: $actionStatus, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class $MemberDetailStateCopyWith<$Res>  {
  factory $MemberDetailStateCopyWith(MemberDetailState value, $Res Function(MemberDetailState) _then) = _$MemberDetailStateCopyWithImpl;
@useResult
$Res call({
 Member member, OrgMembershipRole? viewerRole, SectionData<List<MemberChecklistOverride>> overrides, SectionData<List<EffectiveChecklistTemplate>> effective, SectionData<List<OrganizationRole>> availableRoles, Set<String> pendingTemplateIds, FeatureStatus actionStatus, String? actionError
});


$MemberCopyWith<$Res> get member;$SectionDataCopyWith<List<MemberChecklistOverride>, $Res> get overrides;$SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective;$SectionDataCopyWith<List<OrganizationRole>, $Res> get availableRoles;

}
/// @nodoc
class _$MemberDetailStateCopyWithImpl<$Res>
    implements $MemberDetailStateCopyWith<$Res> {
  _$MemberDetailStateCopyWithImpl(this._self, this._then);

  final MemberDetailState _self;
  final $Res Function(MemberDetailState) _then;

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? member = null,Object? viewerRole = freezed,Object? overrides = null,Object? effective = null,Object? availableRoles = null,Object? pendingTemplateIds = null,Object? actionStatus = null,Object? actionError = freezed,}) {
  return _then(_self.copyWith(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,viewerRole: freezed == viewerRole ? _self.viewerRole : viewerRole // ignore: cast_nullable_to_non_nullable
as OrgMembershipRole?,overrides: null == overrides ? _self.overrides : overrides // ignore: cast_nullable_to_non_nullable
as SectionData<List<MemberChecklistOverride>>,effective: null == effective ? _self.effective : effective // ignore: cast_nullable_to_non_nullable
as SectionData<List<EffectiveChecklistTemplate>>,availableRoles: null == availableRoles ? _self.availableRoles : availableRoles // ignore: cast_nullable_to_non_nullable
as SectionData<List<OrganizationRole>>,pendingTemplateIds: null == pendingTemplateIds ? _self.pendingTemplateIds : pendingTemplateIds // ignore: cast_nullable_to_non_nullable
as Set<String>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberCopyWith<$Res> get member {
  
  return $MemberCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<MemberChecklistOverride>, $Res> get overrides {
  
  return $SectionDataCopyWith<List<MemberChecklistOverride>, $Res>(_self.overrides, (value) {
    return _then(_self.copyWith(overrides: value));
  });
}/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective {
  
  return $SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res>(_self.effective, (value) {
    return _then(_self.copyWith(effective: value));
  });
}/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<OrganizationRole>, $Res> get availableRoles {
  
  return $SectionDataCopyWith<List<OrganizationRole>, $Res>(_self.availableRoles, (value) {
    return _then(_self.copyWith(availableRoles: value));
  });
}
}


/// Adds pattern-matching-related methods to [MemberDetailState].
extension MemberDetailStatePatterns on MemberDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MemberDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MemberDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Member member,  OrgMembershipRole? viewerRole,  SectionData<List<MemberChecklistOverride>> overrides,  SectionData<List<EffectiveChecklistTemplate>> effective,  SectionData<List<OrganizationRole>> availableRoles,  Set<String> pendingTemplateIds,  FeatureStatus actionStatus,  String? actionError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberDetailState() when $default != null:
return $default(_that.member,_that.viewerRole,_that.overrides,_that.effective,_that.availableRoles,_that.pendingTemplateIds,_that.actionStatus,_that.actionError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Member member,  OrgMembershipRole? viewerRole,  SectionData<List<MemberChecklistOverride>> overrides,  SectionData<List<EffectiveChecklistTemplate>> effective,  SectionData<List<OrganizationRole>> availableRoles,  Set<String> pendingTemplateIds,  FeatureStatus actionStatus,  String? actionError)  $default,) {final _that = this;
switch (_that) {
case _MemberDetailState():
return $default(_that.member,_that.viewerRole,_that.overrides,_that.effective,_that.availableRoles,_that.pendingTemplateIds,_that.actionStatus,_that.actionError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Member member,  OrgMembershipRole? viewerRole,  SectionData<List<MemberChecklistOverride>> overrides,  SectionData<List<EffectiveChecklistTemplate>> effective,  SectionData<List<OrganizationRole>> availableRoles,  Set<String> pendingTemplateIds,  FeatureStatus actionStatus,  String? actionError)?  $default,) {final _that = this;
switch (_that) {
case _MemberDetailState() when $default != null:
return $default(_that.member,_that.viewerRole,_that.overrides,_that.effective,_that.availableRoles,_that.pendingTemplateIds,_that.actionStatus,_that.actionError);case _:
  return null;

}
}

}

/// @nodoc


class _MemberDetailState extends MemberDetailState {
  const _MemberDetailState({required this.member, this.viewerRole, this.overrides = const SectionData<List<MemberChecklistOverride>>(), this.effective = const SectionData<List<EffectiveChecklistTemplate>>(), this.availableRoles = const SectionData<List<OrganizationRole>>(), final  Set<String> pendingTemplateIds = const <String>{}, this.actionStatus = FeatureStatus.initial, this.actionError}): _pendingTemplateIds = pendingTemplateIds,super._();
  

@override final  Member member;
@override final  OrgMembershipRole? viewerRole;
@override@JsonKey() final  SectionData<List<MemberChecklistOverride>> overrides;
@override@JsonKey() final  SectionData<List<EffectiveChecklistTemplate>> effective;
@override@JsonKey() final  SectionData<List<OrganizationRole>> availableRoles;
 final  Set<String> _pendingTemplateIds;
@override@JsonKey() Set<String> get pendingTemplateIds {
  if (_pendingTemplateIds is EqualUnmodifiableSetView) return _pendingTemplateIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_pendingTemplateIds);
}

@override@JsonKey() final  FeatureStatus actionStatus;
@override final  String? actionError;

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberDetailStateCopyWith<_MemberDetailState> get copyWith => __$MemberDetailStateCopyWithImpl<_MemberDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberDetailState&&(identical(other.member, member) || other.member == member)&&(identical(other.viewerRole, viewerRole) || other.viewerRole == viewerRole)&&(identical(other.overrides, overrides) || other.overrides == overrides)&&(identical(other.effective, effective) || other.effective == effective)&&(identical(other.availableRoles, availableRoles) || other.availableRoles == availableRoles)&&const DeepCollectionEquality().equals(other._pendingTemplateIds, _pendingTemplateIds)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError));
}


@override
int get hashCode => Object.hash(runtimeType,member,viewerRole,overrides,effective,availableRoles,const DeepCollectionEquality().hash(_pendingTemplateIds),actionStatus,actionError);

@override
String toString() {
  return 'MemberDetailState(member: $member, viewerRole: $viewerRole, overrides: $overrides, effective: $effective, availableRoles: $availableRoles, pendingTemplateIds: $pendingTemplateIds, actionStatus: $actionStatus, actionError: $actionError)';
}


}

/// @nodoc
abstract mixin class _$MemberDetailStateCopyWith<$Res> implements $MemberDetailStateCopyWith<$Res> {
  factory _$MemberDetailStateCopyWith(_MemberDetailState value, $Res Function(_MemberDetailState) _then) = __$MemberDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Member member, OrgMembershipRole? viewerRole, SectionData<List<MemberChecklistOverride>> overrides, SectionData<List<EffectiveChecklistTemplate>> effective, SectionData<List<OrganizationRole>> availableRoles, Set<String> pendingTemplateIds, FeatureStatus actionStatus, String? actionError
});


@override $MemberCopyWith<$Res> get member;@override $SectionDataCopyWith<List<MemberChecklistOverride>, $Res> get overrides;@override $SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective;@override $SectionDataCopyWith<List<OrganizationRole>, $Res> get availableRoles;

}
/// @nodoc
class __$MemberDetailStateCopyWithImpl<$Res>
    implements _$MemberDetailStateCopyWith<$Res> {
  __$MemberDetailStateCopyWithImpl(this._self, this._then);

  final _MemberDetailState _self;
  final $Res Function(_MemberDetailState) _then;

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,Object? viewerRole = freezed,Object? overrides = null,Object? effective = null,Object? availableRoles = null,Object? pendingTemplateIds = null,Object? actionStatus = null,Object? actionError = freezed,}) {
  return _then(_MemberDetailState(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,viewerRole: freezed == viewerRole ? _self.viewerRole : viewerRole // ignore: cast_nullable_to_non_nullable
as OrgMembershipRole?,overrides: null == overrides ? _self.overrides : overrides // ignore: cast_nullable_to_non_nullable
as SectionData<List<MemberChecklistOverride>>,effective: null == effective ? _self.effective : effective // ignore: cast_nullable_to_non_nullable
as SectionData<List<EffectiveChecklistTemplate>>,availableRoles: null == availableRoles ? _self.availableRoles : availableRoles // ignore: cast_nullable_to_non_nullable
as SectionData<List<OrganizationRole>>,pendingTemplateIds: null == pendingTemplateIds ? _self._pendingTemplateIds : pendingTemplateIds // ignore: cast_nullable_to_non_nullable
as Set<String>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberCopyWith<$Res> get member {
  
  return $MemberCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<MemberChecklistOverride>, $Res> get overrides {
  
  return $SectionDataCopyWith<List<MemberChecklistOverride>, $Res>(_self.overrides, (value) {
    return _then(_self.copyWith(overrides: value));
  });
}/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective {
  
  return $SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res>(_self.effective, (value) {
    return _then(_self.copyWith(effective: value));
  });
}/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<OrganizationRole>, $Res> get availableRoles {
  
  return $SectionDataCopyWith<List<OrganizationRole>, $Res>(_self.availableRoles, (value) {
    return _then(_self.copyWith(availableRoles: value));
  });
}
}

// dart format on
