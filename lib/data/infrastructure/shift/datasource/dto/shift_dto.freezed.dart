// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PauseDto {

 String get id; String get shiftId; DateTime get startedAt; DateTime? get finishedAt;
/// Create a copy of PauseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PauseDtoCopyWith<PauseDto> get copyWith => _$PauseDtoCopyWithImpl<PauseDto>(this as PauseDto, _$identity);

  /// Serializes this PauseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PauseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,shiftId,startedAt,finishedAt);

@override
String toString() {
  return 'PauseDto(id: $id, shiftId: $shiftId, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $PauseDtoCopyWith<$Res>  {
  factory $PauseDtoCopyWith(PauseDto value, $Res Function(PauseDto) _then) = _$PauseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String shiftId, DateTime startedAt, DateTime? finishedAt
});




}
/// @nodoc
class _$PauseDtoCopyWithImpl<$Res>
    implements $PauseDtoCopyWith<$Res> {
  _$PauseDtoCopyWithImpl(this._self, this._then);

  final PauseDto _self;
  final $Res Function(PauseDto) _then;

/// Create a copy of PauseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? shiftId = null,Object? startedAt = null,Object? finishedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shiftId: null == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PauseDto].
extension PauseDtoPatterns on PauseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PauseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PauseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PauseDto value)  $default,){
final _that = this;
switch (_that) {
case _PauseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PauseDto value)?  $default,){
final _that = this;
switch (_that) {
case _PauseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String shiftId,  DateTime startedAt,  DateTime? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PauseDto() when $default != null:
return $default(_that.id,_that.shiftId,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String shiftId,  DateTime startedAt,  DateTime? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _PauseDto():
return $default(_that.id,_that.shiftId,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String shiftId,  DateTime startedAt,  DateTime? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _PauseDto() when $default != null:
return $default(_that.id,_that.shiftId,_that.startedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PauseDto implements PauseDto {
  const _PauseDto({required this.id, required this.shiftId, required this.startedAt, this.finishedAt});
  factory _PauseDto.fromJson(Map<String, dynamic> json) => _$PauseDtoFromJson(json);

@override final  String id;
@override final  String shiftId;
@override final  DateTime startedAt;
@override final  DateTime? finishedAt;

/// Create a copy of PauseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PauseDtoCopyWith<_PauseDto> get copyWith => __$PauseDtoCopyWithImpl<_PauseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PauseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PauseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,shiftId,startedAt,finishedAt);

@override
String toString() {
  return 'PauseDto(id: $id, shiftId: $shiftId, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$PauseDtoCopyWith<$Res> implements $PauseDtoCopyWith<$Res> {
  factory _$PauseDtoCopyWith(_PauseDto value, $Res Function(_PauseDto) _then) = __$PauseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String shiftId, DateTime startedAt, DateTime? finishedAt
});




}
/// @nodoc
class __$PauseDtoCopyWithImpl<$Res>
    implements _$PauseDtoCopyWith<$Res> {
  __$PauseDtoCopyWithImpl(this._self, this._then);

  final _PauseDto _self;
  final $Res Function(_PauseDto) _then;

/// Create a copy of PauseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shiftId = null,Object? startedAt = null,Object? finishedAt = freezed,}) {
  return _then(_PauseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shiftId: null == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ShiftDto {

 String get id; String get userId; DateTime get startedAt; String get status; List<PauseDto> get pauses; int get workedSeconds; String? get organizationId; DateTime? get finishedAt; bool get hasIncompleteRequiredChecklists;/// Рабочая точка смены (additive, nullable). Старый бэк не шлёт → `null`.
 String? get workLocationId; WorkLocationDto? get workLocation;/// Additive-поля автора смены (орг-ответ). В персональном — `null`.
 String? get userName; String? get userEmail; String? get role; String? get customRoleName;
/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftDtoCopyWith<ShiftDto> get copyWith => _$ShiftDtoCopyWithImpl<ShiftDto>(this as ShiftDto, _$identity);

  /// Serializes this ShiftDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pauses, pauses)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.hasIncompleteRequiredChecklists, hasIncompleteRequiredChecklists) || other.hasIncompleteRequiredChecklists == hasIncompleteRequiredChecklists)&&(identical(other.workLocationId, workLocationId) || other.workLocationId == workLocationId)&&(identical(other.workLocation, workLocation) || other.workLocation == workLocation)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.role, role) || other.role == role)&&(identical(other.customRoleName, customRoleName) || other.customRoleName == customRoleName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,startedAt,status,const DeepCollectionEquality().hash(pauses),workedSeconds,organizationId,finishedAt,hasIncompleteRequiredChecklists,workLocationId,workLocation,userName,userEmail,role,customRoleName);

@override
String toString() {
  return 'ShiftDto(id: $id, userId: $userId, startedAt: $startedAt, status: $status, pauses: $pauses, workedSeconds: $workedSeconds, organizationId: $organizationId, finishedAt: $finishedAt, hasIncompleteRequiredChecklists: $hasIncompleteRequiredChecklists, workLocationId: $workLocationId, workLocation: $workLocation, userName: $userName, userEmail: $userEmail, role: $role, customRoleName: $customRoleName)';
}


}

/// @nodoc
abstract mixin class $ShiftDtoCopyWith<$Res>  {
  factory $ShiftDtoCopyWith(ShiftDto value, $Res Function(ShiftDto) _then) = _$ShiftDtoCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime startedAt, String status, List<PauseDto> pauses, int workedSeconds, String? organizationId, DateTime? finishedAt, bool hasIncompleteRequiredChecklists, String? workLocationId, WorkLocationDto? workLocation, String? userName, String? userEmail, String? role, String? customRoleName
});


$WorkLocationDtoCopyWith<$Res>? get workLocation;

}
/// @nodoc
class _$ShiftDtoCopyWithImpl<$Res>
    implements $ShiftDtoCopyWith<$Res> {
  _$ShiftDtoCopyWithImpl(this._self, this._then);

  final ShiftDto _self;
  final $Res Function(ShiftDto) _then;

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? startedAt = null,Object? status = null,Object? pauses = null,Object? workedSeconds = null,Object? organizationId = freezed,Object? finishedAt = freezed,Object? hasIncompleteRequiredChecklists = null,Object? workLocationId = freezed,Object? workLocation = freezed,Object? userName = freezed,Object? userEmail = freezed,Object? role = freezed,Object? customRoleName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pauses: null == pauses ? _self.pauses : pauses // ignore: cast_nullable_to_non_nullable
as List<PauseDto>,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hasIncompleteRequiredChecklists: null == hasIncompleteRequiredChecklists ? _self.hasIncompleteRequiredChecklists : hasIncompleteRequiredChecklists // ignore: cast_nullable_to_non_nullable
as bool,workLocationId: freezed == workLocationId ? _self.workLocationId : workLocationId // ignore: cast_nullable_to_non_nullable
as String?,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as WorkLocationDto?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,customRoleName: freezed == customRoleName ? _self.customRoleName : customRoleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationDtoCopyWith<$Res>? get workLocation {
    if (_self.workLocation == null) {
    return null;
  }

  return $WorkLocationDtoCopyWith<$Res>(_self.workLocation!, (value) {
    return _then(_self.copyWith(workLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftDto].
extension ShiftDtoPatterns on ShiftDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftDto value)  $default,){
final _that = this;
switch (_that) {
case _ShiftDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftDto value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime startedAt,  String status,  List<PauseDto> pauses,  int workedSeconds,  String? organizationId,  DateTime? finishedAt,  bool hasIncompleteRequiredChecklists,  String? workLocationId,  WorkLocationDto? workLocation,  String? userName,  String? userEmail,  String? role,  String? customRoleName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
return $default(_that.id,_that.userId,_that.startedAt,_that.status,_that.pauses,_that.workedSeconds,_that.organizationId,_that.finishedAt,_that.hasIncompleteRequiredChecklists,_that.workLocationId,_that.workLocation,_that.userName,_that.userEmail,_that.role,_that.customRoleName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime startedAt,  String status,  List<PauseDto> pauses,  int workedSeconds,  String? organizationId,  DateTime? finishedAt,  bool hasIncompleteRequiredChecklists,  String? workLocationId,  WorkLocationDto? workLocation,  String? userName,  String? userEmail,  String? role,  String? customRoleName)  $default,) {final _that = this;
switch (_that) {
case _ShiftDto():
return $default(_that.id,_that.userId,_that.startedAt,_that.status,_that.pauses,_that.workedSeconds,_that.organizationId,_that.finishedAt,_that.hasIncompleteRequiredChecklists,_that.workLocationId,_that.workLocation,_that.userName,_that.userEmail,_that.role,_that.customRoleName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime startedAt,  String status,  List<PauseDto> pauses,  int workedSeconds,  String? organizationId,  DateTime? finishedAt,  bool hasIncompleteRequiredChecklists,  String? workLocationId,  WorkLocationDto? workLocation,  String? userName,  String? userEmail,  String? role,  String? customRoleName)?  $default,) {final _that = this;
switch (_that) {
case _ShiftDto() when $default != null:
return $default(_that.id,_that.userId,_that.startedAt,_that.status,_that.pauses,_that.workedSeconds,_that.organizationId,_that.finishedAt,_that.hasIncompleteRequiredChecklists,_that.workLocationId,_that.workLocation,_that.userName,_that.userEmail,_that.role,_that.customRoleName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ShiftDto implements ShiftDto {
  const _ShiftDto({required this.id, required this.userId, required this.startedAt, required this.status, required final  List<PauseDto> pauses, required this.workedSeconds, this.organizationId, this.finishedAt, this.hasIncompleteRequiredChecklists = false, this.workLocationId, this.workLocation, this.userName, this.userEmail, this.role, this.customRoleName}): _pauses = pauses;
  factory _ShiftDto.fromJson(Map<String, dynamic> json) => _$ShiftDtoFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DateTime startedAt;
@override final  String status;
 final  List<PauseDto> _pauses;
@override List<PauseDto> get pauses {
  if (_pauses is EqualUnmodifiableListView) return _pauses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pauses);
}

@override final  int workedSeconds;
@override final  String? organizationId;
@override final  DateTime? finishedAt;
@override@JsonKey() final  bool hasIncompleteRequiredChecklists;
/// Рабочая точка смены (additive, nullable). Старый бэк не шлёт → `null`.
@override final  String? workLocationId;
@override final  WorkLocationDto? workLocation;
/// Additive-поля автора смены (орг-ответ). В персональном — `null`.
@override final  String? userName;
@override final  String? userEmail;
@override final  String? role;
@override final  String? customRoleName;

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftDtoCopyWith<_ShiftDto> get copyWith => __$ShiftDtoCopyWithImpl<_ShiftDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._pauses, _pauses)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.hasIncompleteRequiredChecklists, hasIncompleteRequiredChecklists) || other.hasIncompleteRequiredChecklists == hasIncompleteRequiredChecklists)&&(identical(other.workLocationId, workLocationId) || other.workLocationId == workLocationId)&&(identical(other.workLocation, workLocation) || other.workLocation == workLocation)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.role, role) || other.role == role)&&(identical(other.customRoleName, customRoleName) || other.customRoleName == customRoleName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,startedAt,status,const DeepCollectionEquality().hash(_pauses),workedSeconds,organizationId,finishedAt,hasIncompleteRequiredChecklists,workLocationId,workLocation,userName,userEmail,role,customRoleName);

@override
String toString() {
  return 'ShiftDto(id: $id, userId: $userId, startedAt: $startedAt, status: $status, pauses: $pauses, workedSeconds: $workedSeconds, organizationId: $organizationId, finishedAt: $finishedAt, hasIncompleteRequiredChecklists: $hasIncompleteRequiredChecklists, workLocationId: $workLocationId, workLocation: $workLocation, userName: $userName, userEmail: $userEmail, role: $role, customRoleName: $customRoleName)';
}


}

/// @nodoc
abstract mixin class _$ShiftDtoCopyWith<$Res> implements $ShiftDtoCopyWith<$Res> {
  factory _$ShiftDtoCopyWith(_ShiftDto value, $Res Function(_ShiftDto) _then) = __$ShiftDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime startedAt, String status, List<PauseDto> pauses, int workedSeconds, String? organizationId, DateTime? finishedAt, bool hasIncompleteRequiredChecklists, String? workLocationId, WorkLocationDto? workLocation, String? userName, String? userEmail, String? role, String? customRoleName
});


@override $WorkLocationDtoCopyWith<$Res>? get workLocation;

}
/// @nodoc
class __$ShiftDtoCopyWithImpl<$Res>
    implements _$ShiftDtoCopyWith<$Res> {
  __$ShiftDtoCopyWithImpl(this._self, this._then);

  final _ShiftDto _self;
  final $Res Function(_ShiftDto) _then;

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? startedAt = null,Object? status = null,Object? pauses = null,Object? workedSeconds = null,Object? organizationId = freezed,Object? finishedAt = freezed,Object? hasIncompleteRequiredChecklists = null,Object? workLocationId = freezed,Object? workLocation = freezed,Object? userName = freezed,Object? userEmail = freezed,Object? role = freezed,Object? customRoleName = freezed,}) {
  return _then(_ShiftDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pauses: null == pauses ? _self._pauses : pauses // ignore: cast_nullable_to_non_nullable
as List<PauseDto>,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hasIncompleteRequiredChecklists: null == hasIncompleteRequiredChecklists ? _self.hasIncompleteRequiredChecklists : hasIncompleteRequiredChecklists // ignore: cast_nullable_to_non_nullable
as bool,workLocationId: freezed == workLocationId ? _self.workLocationId : workLocationId // ignore: cast_nullable_to_non_nullable
as String?,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as WorkLocationDto?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,customRoleName: freezed == customRoleName ? _self.customRoleName : customRoleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShiftDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationDtoCopyWith<$Res>? get workLocation {
    if (_self.workLocation == null) {
    return null;
  }

  return $WorkLocationDtoCopyWith<$Res>(_self.workLocation!, (value) {
    return _then(_self.copyWith(workLocation: value));
  });
}
}

// dart format on
