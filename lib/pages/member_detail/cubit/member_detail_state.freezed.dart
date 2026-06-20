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

 Member get member; OrgMembershipRole? get viewerRole; SectionData<List<EffectiveChecklistTemplate>> get effective;
/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberDetailStateCopyWith<MemberDetailState> get copyWith => _$MemberDetailStateCopyWithImpl<MemberDetailState>(this as MemberDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberDetailState&&(identical(other.member, member) || other.member == member)&&(identical(other.viewerRole, viewerRole) || other.viewerRole == viewerRole)&&(identical(other.effective, effective) || other.effective == effective));
}


@override
int get hashCode => Object.hash(runtimeType,member,viewerRole,effective);

@override
String toString() {
  return 'MemberDetailState(member: $member, viewerRole: $viewerRole, effective: $effective)';
}


}

/// @nodoc
abstract mixin class $MemberDetailStateCopyWith<$Res>  {
  factory $MemberDetailStateCopyWith(MemberDetailState value, $Res Function(MemberDetailState) _then) = _$MemberDetailStateCopyWithImpl;
@useResult
$Res call({
 Member member, OrgMembershipRole? viewerRole, SectionData<List<EffectiveChecklistTemplate>> effective
});


$MemberCopyWith<$Res> get member;$SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective;

}
/// @nodoc
class _$MemberDetailStateCopyWithImpl<$Res>
    implements $MemberDetailStateCopyWith<$Res> {
  _$MemberDetailStateCopyWithImpl(this._self, this._then);

  final MemberDetailState _self;
  final $Res Function(MemberDetailState) _then;

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? member = null,Object? viewerRole = freezed,Object? effective = null,}) {
  return _then(_self.copyWith(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,viewerRole: freezed == viewerRole ? _self.viewerRole : viewerRole // ignore: cast_nullable_to_non_nullable
as OrgMembershipRole?,effective: null == effective ? _self.effective : effective // ignore: cast_nullable_to_non_nullable
as SectionData<List<EffectiveChecklistTemplate>>,
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
$SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective {
  
  return $SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res>(_self.effective, (value) {
    return _then(_self.copyWith(effective: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Member member,  OrgMembershipRole? viewerRole,  SectionData<List<EffectiveChecklistTemplate>> effective)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberDetailState() when $default != null:
return $default(_that.member,_that.viewerRole,_that.effective);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Member member,  OrgMembershipRole? viewerRole,  SectionData<List<EffectiveChecklistTemplate>> effective)  $default,) {final _that = this;
switch (_that) {
case _MemberDetailState():
return $default(_that.member,_that.viewerRole,_that.effective);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Member member,  OrgMembershipRole? viewerRole,  SectionData<List<EffectiveChecklistTemplate>> effective)?  $default,) {final _that = this;
switch (_that) {
case _MemberDetailState() when $default != null:
return $default(_that.member,_that.viewerRole,_that.effective);case _:
  return null;

}
}

}

/// @nodoc


class _MemberDetailState extends MemberDetailState {
  const _MemberDetailState({required this.member, this.viewerRole, this.effective = const SectionData<List<EffectiveChecklistTemplate>>()}): super._();
  

@override final  Member member;
@override final  OrgMembershipRole? viewerRole;
@override@JsonKey() final  SectionData<List<EffectiveChecklistTemplate>> effective;

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberDetailStateCopyWith<_MemberDetailState> get copyWith => __$MemberDetailStateCopyWithImpl<_MemberDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberDetailState&&(identical(other.member, member) || other.member == member)&&(identical(other.viewerRole, viewerRole) || other.viewerRole == viewerRole)&&(identical(other.effective, effective) || other.effective == effective));
}


@override
int get hashCode => Object.hash(runtimeType,member,viewerRole,effective);

@override
String toString() {
  return 'MemberDetailState(member: $member, viewerRole: $viewerRole, effective: $effective)';
}


}

/// @nodoc
abstract mixin class _$MemberDetailStateCopyWith<$Res> implements $MemberDetailStateCopyWith<$Res> {
  factory _$MemberDetailStateCopyWith(_MemberDetailState value, $Res Function(_MemberDetailState) _then) = __$MemberDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Member member, OrgMembershipRole? viewerRole, SectionData<List<EffectiveChecklistTemplate>> effective
});


@override $MemberCopyWith<$Res> get member;@override $SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective;

}
/// @nodoc
class __$MemberDetailStateCopyWithImpl<$Res>
    implements _$MemberDetailStateCopyWith<$Res> {
  __$MemberDetailStateCopyWithImpl(this._self, this._then);

  final _MemberDetailState _self;
  final $Res Function(_MemberDetailState) _then;

/// Create a copy of MemberDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,Object? viewerRole = freezed,Object? effective = null,}) {
  return _then(_MemberDetailState(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as Member,viewerRole: freezed == viewerRole ? _self.viewerRole : viewerRole // ignore: cast_nullable_to_non_nullable
as OrgMembershipRole?,effective: null == effective ? _self.effective : effective // ignore: cast_nullable_to_non_nullable
as SectionData<List<EffectiveChecklistTemplate>>,
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
$SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res> get effective {
  
  return $SectionDataCopyWith<List<EffectiveChecklistTemplate>, $Res>(_self.effective, (value) {
    return _then(_self.copyWith(effective: value));
  });
}
}

// dart format on
