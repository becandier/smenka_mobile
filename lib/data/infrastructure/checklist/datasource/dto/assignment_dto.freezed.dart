// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistAssignedUserDto {

 String get userId; String get userName; String get userEmail;
/// Create a copy of ChecklistAssignedUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistAssignedUserDtoCopyWith<ChecklistAssignedUserDto> get copyWith => _$ChecklistAssignedUserDtoCopyWithImpl<ChecklistAssignedUserDto>(this as ChecklistAssignedUserDto, _$identity);

  /// Serializes this ChecklistAssignedUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistAssignedUserDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,userName,userEmail);

@override
String toString() {
  return 'ChecklistAssignedUserDto(userId: $userId, userName: $userName, userEmail: $userEmail)';
}


}

/// @nodoc
abstract mixin class $ChecklistAssignedUserDtoCopyWith<$Res>  {
  factory $ChecklistAssignedUserDtoCopyWith(ChecklistAssignedUserDto value, $Res Function(ChecklistAssignedUserDto) _then) = _$ChecklistAssignedUserDtoCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, String userEmail
});




}
/// @nodoc
class _$ChecklistAssignedUserDtoCopyWithImpl<$Res>
    implements $ChecklistAssignedUserDtoCopyWith<$Res> {
  _$ChecklistAssignedUserDtoCopyWithImpl(this._self, this._then);

  final ChecklistAssignedUserDto _self;
  final $Res Function(ChecklistAssignedUserDto) _then;

/// Create a copy of ChecklistAssignedUserDto
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


/// Adds pattern-matching-related methods to [ChecklistAssignedUserDto].
extension ChecklistAssignedUserDtoPatterns on ChecklistAssignedUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistAssignedUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistAssignedUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistAssignedUserDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignedUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistAssignedUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignedUserDto() when $default != null:
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
case _ChecklistAssignedUserDto() when $default != null:
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
case _ChecklistAssignedUserDto():
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
case _ChecklistAssignedUserDto() when $default != null:
return $default(_that.userId,_that.userName,_that.userEmail);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistAssignedUserDto implements ChecklistAssignedUserDto {
  const _ChecklistAssignedUserDto({required this.userId, required this.userName, required this.userEmail});
  factory _ChecklistAssignedUserDto.fromJson(Map<String, dynamic> json) => _$ChecklistAssignedUserDtoFromJson(json);

@override final  String userId;
@override final  String userName;
@override final  String userEmail;

/// Create a copy of ChecklistAssignedUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistAssignedUserDtoCopyWith<_ChecklistAssignedUserDto> get copyWith => __$ChecklistAssignedUserDtoCopyWithImpl<_ChecklistAssignedUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistAssignedUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistAssignedUserDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,userName,userEmail);

@override
String toString() {
  return 'ChecklistAssignedUserDto(userId: $userId, userName: $userName, userEmail: $userEmail)';
}


}

/// @nodoc
abstract mixin class _$ChecklistAssignedUserDtoCopyWith<$Res> implements $ChecklistAssignedUserDtoCopyWith<$Res> {
  factory _$ChecklistAssignedUserDtoCopyWith(_ChecklistAssignedUserDto value, $Res Function(_ChecklistAssignedUserDto) _then) = __$ChecklistAssignedUserDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, String userName, String userEmail
});




}
/// @nodoc
class __$ChecklistAssignedUserDtoCopyWithImpl<$Res>
    implements _$ChecklistAssignedUserDtoCopyWith<$Res> {
  __$ChecklistAssignedUserDtoCopyWithImpl(this._self, this._then);

  final _ChecklistAssignedUserDto _self;
  final $Res Function(_ChecklistAssignedUserDto) _then;

/// Create a copy of ChecklistAssignedUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? userEmail = null,}) {
  return _then(_ChecklistAssignedUserDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userEmail: null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChecklistAssignmentDto {

 String get templateId; List<String> get roleIds; List<ChecklistAssignedUserDto> get personalAdd; List<ChecklistAssignedUserDto> get personalRemove;
/// Create a copy of ChecklistAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistAssignmentDtoCopyWith<ChecklistAssignmentDto> get copyWith => _$ChecklistAssignmentDtoCopyWithImpl<ChecklistAssignmentDto>(this as ChecklistAssignmentDto, _$identity);

  /// Serializes this ChecklistAssignmentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistAssignmentDto&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other.roleIds, roleIds)&&const DeepCollectionEquality().equals(other.personalAdd, personalAdd)&&const DeepCollectionEquality().equals(other.personalRemove, personalRemove));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,templateId,const DeepCollectionEquality().hash(roleIds),const DeepCollectionEquality().hash(personalAdd),const DeepCollectionEquality().hash(personalRemove));

@override
String toString() {
  return 'ChecklistAssignmentDto(templateId: $templateId, roleIds: $roleIds, personalAdd: $personalAdd, personalRemove: $personalRemove)';
}


}

/// @nodoc
abstract mixin class $ChecklistAssignmentDtoCopyWith<$Res>  {
  factory $ChecklistAssignmentDtoCopyWith(ChecklistAssignmentDto value, $Res Function(ChecklistAssignmentDto) _then) = _$ChecklistAssignmentDtoCopyWithImpl;
@useResult
$Res call({
 String templateId, List<String> roleIds, List<ChecklistAssignedUserDto> personalAdd, List<ChecklistAssignedUserDto> personalRemove
});




}
/// @nodoc
class _$ChecklistAssignmentDtoCopyWithImpl<$Res>
    implements $ChecklistAssignmentDtoCopyWith<$Res> {
  _$ChecklistAssignmentDtoCopyWithImpl(this._self, this._then);

  final ChecklistAssignmentDto _self;
  final $Res Function(ChecklistAssignmentDto) _then;

/// Create a copy of ChecklistAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templateId = null,Object? roleIds = null,Object? personalAdd = null,Object? personalRemove = null,}) {
  return _then(_self.copyWith(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,roleIds: null == roleIds ? _self.roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,personalAdd: null == personalAdd ? _self.personalAdd : personalAdd // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUserDto>,personalRemove: null == personalRemove ? _self.personalRemove : personalRemove // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUserDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistAssignmentDto].
extension ChecklistAssignmentDtoPatterns on ChecklistAssignmentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistAssignmentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistAssignmentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistAssignmentDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignmentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistAssignmentDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistAssignmentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String templateId,  List<String> roleIds,  List<ChecklistAssignedUserDto> personalAdd,  List<ChecklistAssignedUserDto> personalRemove)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistAssignmentDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String templateId,  List<String> roleIds,  List<ChecklistAssignedUserDto> personalAdd,  List<ChecklistAssignedUserDto> personalRemove)  $default,) {final _that = this;
switch (_that) {
case _ChecklistAssignmentDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String templateId,  List<String> roleIds,  List<ChecklistAssignedUserDto> personalAdd,  List<ChecklistAssignedUserDto> personalRemove)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistAssignmentDto() when $default != null:
return $default(_that.templateId,_that.roleIds,_that.personalAdd,_that.personalRemove);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistAssignmentDto implements ChecklistAssignmentDto {
  const _ChecklistAssignmentDto({required this.templateId, required final  List<String> roleIds, required final  List<ChecklistAssignedUserDto> personalAdd, required final  List<ChecklistAssignedUserDto> personalRemove}): _roleIds = roleIds,_personalAdd = personalAdd,_personalRemove = personalRemove;
  factory _ChecklistAssignmentDto.fromJson(Map<String, dynamic> json) => _$ChecklistAssignmentDtoFromJson(json);

@override final  String templateId;
 final  List<String> _roleIds;
@override List<String> get roleIds {
  if (_roleIds is EqualUnmodifiableListView) return _roleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleIds);
}

 final  List<ChecklistAssignedUserDto> _personalAdd;
@override List<ChecklistAssignedUserDto> get personalAdd {
  if (_personalAdd is EqualUnmodifiableListView) return _personalAdd;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalAdd);
}

 final  List<ChecklistAssignedUserDto> _personalRemove;
@override List<ChecklistAssignedUserDto> get personalRemove {
  if (_personalRemove is EqualUnmodifiableListView) return _personalRemove;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personalRemove);
}


/// Create a copy of ChecklistAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistAssignmentDtoCopyWith<_ChecklistAssignmentDto> get copyWith => __$ChecklistAssignmentDtoCopyWithImpl<_ChecklistAssignmentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistAssignmentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistAssignmentDto&&(identical(other.templateId, templateId) || other.templateId == templateId)&&const DeepCollectionEquality().equals(other._roleIds, _roleIds)&&const DeepCollectionEquality().equals(other._personalAdd, _personalAdd)&&const DeepCollectionEquality().equals(other._personalRemove, _personalRemove));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,templateId,const DeepCollectionEquality().hash(_roleIds),const DeepCollectionEquality().hash(_personalAdd),const DeepCollectionEquality().hash(_personalRemove));

@override
String toString() {
  return 'ChecklistAssignmentDto(templateId: $templateId, roleIds: $roleIds, personalAdd: $personalAdd, personalRemove: $personalRemove)';
}


}

/// @nodoc
abstract mixin class _$ChecklistAssignmentDtoCopyWith<$Res> implements $ChecklistAssignmentDtoCopyWith<$Res> {
  factory _$ChecklistAssignmentDtoCopyWith(_ChecklistAssignmentDto value, $Res Function(_ChecklistAssignmentDto) _then) = __$ChecklistAssignmentDtoCopyWithImpl;
@override @useResult
$Res call({
 String templateId, List<String> roleIds, List<ChecklistAssignedUserDto> personalAdd, List<ChecklistAssignedUserDto> personalRemove
});




}
/// @nodoc
class __$ChecklistAssignmentDtoCopyWithImpl<$Res>
    implements _$ChecklistAssignmentDtoCopyWith<$Res> {
  __$ChecklistAssignmentDtoCopyWithImpl(this._self, this._then);

  final _ChecklistAssignmentDto _self;
  final $Res Function(_ChecklistAssignmentDto) _then;

/// Create a copy of ChecklistAssignmentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templateId = null,Object? roleIds = null,Object? personalAdd = null,Object? personalRemove = null,}) {
  return _then(_ChecklistAssignmentDto(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,roleIds: null == roleIds ? _self._roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,personalAdd: null == personalAdd ? _self._personalAdd : personalAdd // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUserDto>,personalRemove: null == personalRemove ? _self._personalRemove : personalRemove // ignore: cast_nullable_to_non_nullable
as List<ChecklistAssignedUserDto>,
  ));
}


}

// dart format on
