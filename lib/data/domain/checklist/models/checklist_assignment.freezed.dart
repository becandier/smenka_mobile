// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChecklistAssignedUser {

 String get userId; String get userName; String get userEmail;
/// Create a copy of ChecklistAssignedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistAssignedUserCopyWith<ChecklistAssignedUser> get copyWith => _$ChecklistAssignedUserCopyWithImpl<ChecklistAssignedUser>(this as ChecklistAssignedUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistAssignedUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,userEmail);

@override
String toString() {
  return 'ChecklistAssignedUser(userId: $userId, userName: $userName, userEmail: $userEmail)';
}


}

/// @nodoc
abstract mixin class $ChecklistAssignedUserCopyWith<$Res>  {
  factory $ChecklistAssignedUserCopyWith(ChecklistAssignedUser value, $Res Function(ChecklistAssignedUser) _then) = _$ChecklistAssignedUserCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, String userEmail
});




}
/// @nodoc
class _$ChecklistAssignedUserCopyWithImpl<$Res>
    implements $ChecklistAssignedUserCopyWith<$Res> {
  _$ChecklistAssignedUserCopyWithImpl(this._self, this._then);

  final ChecklistAssignedUser _self;
  final $Res Function(ChecklistAssignedUser) _then;

/// Create a copy of ChecklistAssignedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? userName = null,Object? userEmail = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistAssignedUser].
extension ChecklistAssignedUserPatterns on ChecklistAssignedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistAssignedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistAssignedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistAssignedUser value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistAssignedUser value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String userName,  String userEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistAssignedUser() when $default != null:
return $default(_that.userId,_that.userName,_that.userEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String userName,  String userEmail)  $default,) {final _that = this;
switch (_that) {
case _ChecklistAssignedUser():
return $default(_that.userId,_that.userName,_that.userEmail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String userName,  String userEmail)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistAssignedUser() when $default != null:
return $default(_that.userId,_that.userName,_that.userEmail);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistAssignedUser implements ChecklistAssignedUser {
  const _ChecklistAssignedUser({required this.userId, required this.userName, required this.userEmail});
  

@override final  String userId;
@override final  String userName;
@override final  String userEmail;

/// Create a copy of ChecklistAssignedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistAssignedUserCopyWith<_ChecklistAssignedUser> get copyWith => __$ChecklistAssignedUserCopyWithImpl<_ChecklistAssignedUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistAssignedUser&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,userEmail);

@override
String toString() {
  return 'ChecklistAssignedUser(userId: $userId, userName: $userName, userEmail: $userEmail)';
}


}

/// @nodoc
abstract mixin class _$ChecklistAssignedUserCopyWith<$Res> implements $ChecklistAssignedUserCopyWith<$Res> {
  factory _$ChecklistAssignedUserCopyWith(_ChecklistAssignedUser value, $Res Function(_ChecklistAssignedUser) _then) = __$ChecklistAssignedUserCopyWithImpl;
@override @useResult
$Res call({
 String userId, String userName, String userEmail
});




}
/// @nodoc
class __$ChecklistAssignedUserCopyWithImpl<$Res>
    implements _$ChecklistAssignedUserCopyWith<$Res> {
  __$ChecklistAssignedUserCopyWithImpl(this._self, this._then);

  final _ChecklistAssignedUser _self;
  final $Res Function(_ChecklistAssignedUser) _then;

/// Create a copy of ChecklistAssignedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? userEmail = null,}) {
  return _then(_ChecklistAssignedUser(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ChecklistAssignment {

 String get templateId; List<String> get roleIds; List<ChecklistAssignedUser> get personalAdd; List<ChecklistAssignedUser> get personalRemove;
/// Create a copy of ChecklistAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistAssignmentCopyWith<ChecklistAssignment> get copyWith => _$ChecklistAssignmentCopyWithImpl<ChecklistAssignment>(this as ChecklistAssignment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistAssignment&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other.roleIds, roleIds)&&const DeepCollectionEquality().equals(other.personalAdd, personalAdd)&&const DeepCollectionEquality().equals(other.personalRemove, personalRemove));
}


@override
int get hashCode => Object.hash(runtimeType,templateId,const DeepCollectionEquality().hash(roleIds),const DeepCollectionEquality().hash(personalAdd),const DeepCollectionEquality().hash(personalRemove));

@override
String toString() {
  return 'ChecklistAssignment(templateId: $templateId, roleIds: $roleIds, personalAdd: $personalAdd, personalRemove: $personalRemove)';
}


}

/// @nodoc
abstract mixin class $ChecklistAssignmentCopyWith<$Res>  {
  factory $ChecklistAssignmentCopyWith(ChecklistAssignment value, $Res Function(ChecklistAssignment) _then) = _$ChecklistAssignmentCopyWithImpl;
@useResult
$Res call({
 String templateId, List<String> roleIds, List<ChecklistAssignedUser> personalAdd, List<ChecklistAssignedUser> personalRemove
});




}
/// @nodoc
class _$ChecklistAssignmentCopyWithImpl<$Res>
    implements $ChecklistAssignmentCopyWith<$Res> {
  _$ChecklistAssignmentCopyWithImpl(this._self, this._then);

  final ChecklistAssignment _self;
  final $Res Function(ChecklistAssignment) _then;

/// Create a copy of ChecklistAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templateId = null,Object? roleIds = null,Object? personalAdd = null,Object? personalRemove = null,}) {
  return _then(_self.copyWith(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,roleIds: null == roleIds ? _self.roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,personalAdd: null == personalAdd ? _self.personalAdd : personalAdd // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUser>,personalRemove: null == personalRemove ? _self.personalRemove : personalRemove // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUser>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistAssignment].
extension ChecklistAssignmentPatterns on ChecklistAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistAssignment value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String templateId,  List<String> roleIds,  List<ChecklistAssignedUser> personalAdd,  List<ChecklistAssignedUser> personalRemove)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistAssignment() when $default != null:
return $default(_that.templateId,_that.roleIds,_that.personalAdd,_that.personalRemove);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String templateId,  List<String> roleIds,  List<ChecklistAssignedUser> personalAdd,  List<ChecklistAssignedUser> personalRemove)  $default,) {final _that = this;
switch (_that) {
case _ChecklistAssignment():
return $default(_that.templateId,_that.roleIds,_that.personalAdd,_that.personalRemove);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String templateId,  List<String> roleIds,  List<ChecklistAssignedUser> personalAdd,  List<ChecklistAssignedUser> personalRemove)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistAssignment() when $default != null:
return $default(_that.templateId,_that.roleIds,_that.personalAdd,_that.personalRemove);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistAssignment implements ChecklistAssignment {
  const _ChecklistAssignment({required this.templateId, required final  List<String> roleIds, required final  List<ChecklistAssignedUser> personalAdd, required final  List<ChecklistAssignedUser> personalRemove}): _roleIds = roleIds,_personalAdd = personalAdd,_personalRemove = personalRemove;
  

@override final  String templateId;
 final  List<String> _roleIds;
@override List<String> get roleIds {
  if (_roleIds is EqualUnmodifiableListView) return _roleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleIds);
}

 final  List<ChecklistAssignedUser> _personalAdd;
@override List<ChecklistAssignedUser> get personalAdd {
  if (_personalAdd is EqualUnmodifiableListView) return _personalAdd;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalAdd);
}

 final  List<ChecklistAssignedUser> _personalRemove;
@override List<ChecklistAssignedUser> get personalRemove {
  if (_personalRemove is EqualUnmodifiableListView) return _personalRemove;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalRemove);
}


/// Create a copy of ChecklistAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistAssignmentCopyWith<_ChecklistAssignment> get copyWith => __$ChecklistAssignmentCopyWithImpl<_ChecklistAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistAssignment&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other._roleIds, _roleIds)&&const DeepCollectionEquality().equals(other._personalAdd, _personalAdd)&&const DeepCollectionEquality().equals(other._personalRemove, _personalRemove));
}


@override
int get hashCode => Object.hash(runtimeType,templateId,const DeepCollectionEquality().hash(_roleIds),const DeepCollectionEquality().hash(_personalAdd),const DeepCollectionEquality().hash(_personalRemove));

@override
String toString() {
  return 'ChecklistAssignment(templateId: $templateId, roleIds: $roleIds, personalAdd: $personalAdd, personalRemove: $personalRemove)';
}


}

/// @nodoc
abstract mixin class _$ChecklistAssignmentCopyWith<$Res> implements $ChecklistAssignmentCopyWith<$Res> {
  factory _$ChecklistAssignmentCopyWith(_ChecklistAssignment value, $Res Function(_ChecklistAssignment) _then) = __$ChecklistAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String templateId, List<String> roleIds, List<ChecklistAssignedUser> personalAdd, List<ChecklistAssignedUser> personalRemove
});




}
/// @nodoc
class __$ChecklistAssignmentCopyWithImpl<$Res>
    implements _$ChecklistAssignmentCopyWith<$Res> {
  __$ChecklistAssignmentCopyWithImpl(this._self, this._then);

  final _ChecklistAssignment _self;
  final $Res Function(_ChecklistAssignment) _then;

/// Create a copy of ChecklistAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templateId = null,Object? roleIds = null,Object? personalAdd = null,Object? personalRemove = null,}) {
  return _then(_ChecklistAssignment(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,roleIds: null == roleIds ? _self._roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,personalAdd: null == personalAdd ? _self._personalAdd : personalAdd // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUser>,personalRemove: null == personalRemove ? _self._personalRemove : personalRemove // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUser>,
  ));
}


}

// dart format on
