// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pause {

 String get id; String get shiftId; DateTime get startedAt; DateTime? get finishedAt;
/// Create a copy of Pause
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PauseCopyWith<Pause> get copyWith => _$PauseCopyWithImpl<Pause>(this as Pause, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pause&&(identical(other.id, id) || other.id == id)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,shiftId,startedAt,finishedAt);

@override
String toString() {
  return 'Pause(id: $id, shiftId: $shiftId, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $PauseCopyWith<$Res>  {
  factory $PauseCopyWith(Pause value, $Res Function(Pause) _then) = _$PauseCopyWithImpl;
@useResult
$Res call({
 String id, String shiftId, DateTime startedAt, DateTime? finishedAt
});




}
/// @nodoc
class _$PauseCopyWithImpl<$Res>
    implements $PauseCopyWith<$Res> {
  _$PauseCopyWithImpl(this._self, this._then);

  final Pause _self;
  final $Res Function(Pause) _then;

/// Create a copy of Pause
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


/// Adds pattern-matching-related methods to [Pause].
extension PausePatterns on Pause {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pause value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pause() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pause value)  $default,){
final _that = this;
switch (_that) {
case _Pause():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pause value)?  $default,){
final _that = this;
switch (_that) {
case _Pause() when $default != null:
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
case _Pause() when $default != null:
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
case _Pause():
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
case _Pause() when $default != null:
return $default(_that.id,_that.shiftId,_that.startedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Pause implements Pause {
  const _Pause({required this.id, required this.shiftId, required this.startedAt, this.finishedAt});
  

@override final  String id;
@override final  String shiftId;
@override final  DateTime startedAt;
@override final  DateTime? finishedAt;

/// Create a copy of Pause
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PauseCopyWith<_Pause> get copyWith => __$PauseCopyWithImpl<_Pause>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pause&&(identical(other.id, id) || other.id == id)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,shiftId,startedAt,finishedAt);

@override
String toString() {
  return 'Pause(id: $id, shiftId: $shiftId, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$PauseCopyWith<$Res> implements $PauseCopyWith<$Res> {
  factory _$PauseCopyWith(_Pause value, $Res Function(_Pause) _then) = __$PauseCopyWithImpl;
@override @useResult
$Res call({
 String id, String shiftId, DateTime startedAt, DateTime? finishedAt
});




}
/// @nodoc
class __$PauseCopyWithImpl<$Res>
    implements _$PauseCopyWith<$Res> {
  __$PauseCopyWithImpl(this._self, this._then);

  final _Pause _self;
  final $Res Function(_Pause) _then;

/// Create a copy of Pause
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? shiftId = null,Object? startedAt = null,Object? finishedAt = freezed,}) {
  return _then(_Pause(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,shiftId: null == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$Shift {

 String get id; String get userId; DateTime get startedAt; ShiftStatus get status; List<Pause> get pauses; int get workedSeconds; String? get organizationId; DateTime? get finishedAt; bool get hasIncompleteRequiredChecklists;/// Рабочая точка, на которой открыта смена. `null` — не определена
/// (персональная смена, гео-старт старого билда, либо точку не выбирали).
 String? get workLocationId; WorkLocation? get workLocation;/// Данные автора смены. Заполняются только в орг-ответах
/// (`GET /organizations/{org_id}/shifts[/{shift_id}]`); в персональном
/// трекере (`GET /shifts`) всегда `null`.
 String? get userName; String? get userEmail;/// Системная роль автора в этой организации: `admin` | `employee`.
/// `null`, если участник исключён из org или персональный контекст.
 String? get role;/// Плоское имя кастомной роли (НЕ объект). `null`, если не назначена.
 String? get customRoleName;
/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftCopyWith<Shift> get copyWith => _$ShiftCopyWithImpl<Shift>(this as Shift, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shift&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pauses, pauses)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.hasIncompleteRequiredChecklists, hasIncompleteRequiredChecklists) || other.hasIncompleteRequiredChecklists == hasIncompleteRequiredChecklists)&&(identical(other.workLocationId, workLocationId) || other.workLocationId == workLocationId)&&(identical(other.workLocation, workLocation) || other.workLocation == workLocation)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.role, role) || other.role == role)&&(identical(other.customRoleName, customRoleName) || other.customRoleName == customRoleName));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,startedAt,status,const DeepCollectionEquality().hash(pauses),workedSeconds,organizationId,finishedAt,hasIncompleteRequiredChecklists,workLocationId,workLocation,userName,userEmail,role,customRoleName);

@override
String toString() {
  return 'Shift(id: $id, userId: $userId, startedAt: $startedAt, status: $status, pauses: $pauses, workedSeconds: $workedSeconds, organizationId: $organizationId, finishedAt: $finishedAt, hasIncompleteRequiredChecklists: $hasIncompleteRequiredChecklists, workLocationId: $workLocationId, workLocation: $workLocation, userName: $userName, userEmail: $userEmail, role: $role, customRoleName: $customRoleName)';
}


}

/// @nodoc
abstract mixin class $ShiftCopyWith<$Res>  {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) _then) = _$ShiftCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime startedAt, ShiftStatus status, List<Pause> pauses, int workedSeconds, String? organizationId, DateTime? finishedAt, bool hasIncompleteRequiredChecklists, String? workLocationId, WorkLocation? workLocation, String? userName, String? userEmail, String? role, String? customRoleName
});


$WorkLocationCopyWith<$Res>? get workLocation;

}
/// @nodoc
class _$ShiftCopyWithImpl<$Res>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._self, this._then);

  final Shift _self;
  final $Res Function(Shift) _then;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? startedAt = null,Object? status = null,Object? pauses = null,Object? workedSeconds = null,Object? organizationId = freezed,Object? finishedAt = freezed,Object? hasIncompleteRequiredChecklists = null,Object? workLocationId = freezed,Object? workLocation = freezed,Object? userName = freezed,Object? userEmail = freezed,Object? role = freezed,Object? customRoleName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShiftStatus,pauses: null == pauses ? _self.pauses : pauses // ignore: cast_nullable_to_non_nullable
as List<Pause>,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hasIncompleteRequiredChecklists: null == hasIncompleteRequiredChecklists ? _self.hasIncompleteRequiredChecklists : hasIncompleteRequiredChecklists // ignore: cast_nullable_to_non_nullable
as bool,workLocationId: freezed == workLocationId ? _self.workLocationId : workLocationId // ignore: cast_nullable_to_non_nullable
as String?,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as WorkLocation?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,customRoleName: freezed == customRoleName ? _self.customRoleName : customRoleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<$Res>? get workLocation {
    if (_self.workLocation == null) {
    return null;
  }

  return $WorkLocationCopyWith<$Res>(_self.workLocation!, (value) {
    return _then(_self.copyWith(workLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Shift].
extension ShiftPatterns on Shift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shift value)  $default,){
final _that = this;
switch (_that) {
case _Shift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shift value)?  $default,){
final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime startedAt,  ShiftStatus status,  List<Pause> pauses,  int workedSeconds,  String? organizationId,  DateTime? finishedAt,  bool hasIncompleteRequiredChecklists,  String? workLocationId,  WorkLocation? workLocation,  String? userName,  String? userEmail,  String? role,  String? customRoleName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shift() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime startedAt,  ShiftStatus status,  List<Pause> pauses,  int workedSeconds,  String? organizationId,  DateTime? finishedAt,  bool hasIncompleteRequiredChecklists,  String? workLocationId,  WorkLocation? workLocation,  String? userName,  String? userEmail,  String? role,  String? customRoleName)  $default,) {final _that = this;
switch (_that) {
case _Shift():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime startedAt,  ShiftStatus status,  List<Pause> pauses,  int workedSeconds,  String? organizationId,  DateTime? finishedAt,  bool hasIncompleteRequiredChecklists,  String? workLocationId,  WorkLocation? workLocation,  String? userName,  String? userEmail,  String? role,  String? customRoleName)?  $default,) {final _that = this;
switch (_that) {
case _Shift() when $default != null:
return $default(_that.id,_that.userId,_that.startedAt,_that.status,_that.pauses,_that.workedSeconds,_that.organizationId,_that.finishedAt,_that.hasIncompleteRequiredChecklists,_that.workLocationId,_that.workLocation,_that.userName,_that.userEmail,_that.role,_that.customRoleName);case _:
  return null;

}
}

}

/// @nodoc


class _Shift implements Shift {
  const _Shift({required this.id, required this.userId, required this.startedAt, required this.status, required final  List<Pause> pauses, required this.workedSeconds, this.organizationId, this.finishedAt, this.hasIncompleteRequiredChecklists = false, this.workLocationId, this.workLocation, this.userName, this.userEmail, this.role, this.customRoleName}): _pauses = pauses;
  

@override final  String id;
@override final  String userId;
@override final  DateTime startedAt;
@override final  ShiftStatus status;
 final  List<Pause> _pauses;
@override List<Pause> get pauses {
  if (_pauses is EqualUnmodifiableListView) return _pauses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pauses);
}

@override final  int workedSeconds;
@override final  String? organizationId;
@override final  DateTime? finishedAt;
@override@JsonKey() final  bool hasIncompleteRequiredChecklists;
/// Рабочая точка, на которой открыта смена. `null` — не определена
/// (персональная смена, гео-старт старого билда, либо точку не выбирали).
@override final  String? workLocationId;
@override final  WorkLocation? workLocation;
/// Данные автора смены. Заполняются только в орг-ответах
/// (`GET /organizations/{org_id}/shifts[/{shift_id}]`); в персональном
/// трекере (`GET /shifts`) всегда `null`.
@override final  String? userName;
@override final  String? userEmail;
/// Системная роль автора в этой организации: `admin` | `employee`.
/// `null`, если участник исключён из org или персональный контекст.
@override final  String? role;
/// Плоское имя кастомной роли (НЕ объект). `null`, если не назначена.
@override final  String? customRoleName;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftCopyWith<_Shift> get copyWith => __$ShiftCopyWithImpl<_Shift>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shift&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._pauses, _pauses)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.hasIncompleteRequiredChecklists, hasIncompleteRequiredChecklists) || other.hasIncompleteRequiredChecklists == hasIncompleteRequiredChecklists)&&(identical(other.workLocationId, workLocationId) || other.workLocationId == workLocationId)&&(identical(other.workLocation, workLocation) || other.workLocation == workLocation)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.role, role) || other.role == role)&&(identical(other.customRoleName, customRoleName) || other.customRoleName == customRoleName));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,startedAt,status,const DeepCollectionEquality().hash(_pauses),workedSeconds,organizationId,finishedAt,hasIncompleteRequiredChecklists,workLocationId,workLocation,userName,userEmail,role,customRoleName);

@override
String toString() {
  return 'Shift(id: $id, userId: $userId, startedAt: $startedAt, status: $status, pauses: $pauses, workedSeconds: $workedSeconds, organizationId: $organizationId, finishedAt: $finishedAt, hasIncompleteRequiredChecklists: $hasIncompleteRequiredChecklists, workLocationId: $workLocationId, workLocation: $workLocation, userName: $userName, userEmail: $userEmail, role: $role, customRoleName: $customRoleName)';
}


}

/// @nodoc
abstract mixin class _$ShiftCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$ShiftCopyWith(_Shift value, $Res Function(_Shift) _then) = __$ShiftCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime startedAt, ShiftStatus status, List<Pause> pauses, int workedSeconds, String? organizationId, DateTime? finishedAt, bool hasIncompleteRequiredChecklists, String? workLocationId, WorkLocation? workLocation, String? userName, String? userEmail, String? role, String? customRoleName
});


@override $WorkLocationCopyWith<$Res>? get workLocation;

}
/// @nodoc
class __$ShiftCopyWithImpl<$Res>
    implements _$ShiftCopyWith<$Res> {
  __$ShiftCopyWithImpl(this._self, this._then);

  final _Shift _self;
  final $Res Function(_Shift) _then;

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? startedAt = null,Object? status = null,Object? pauses = null,Object? workedSeconds = null,Object? organizationId = freezed,Object? finishedAt = freezed,Object? hasIncompleteRequiredChecklists = null,Object? workLocationId = freezed,Object? workLocation = freezed,Object? userName = freezed,Object? userEmail = freezed,Object? role = freezed,Object? customRoleName = freezed,}) {
  return _then(_Shift(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShiftStatus,pauses: null == pauses ? _self._pauses : pauses // ignore: cast_nullable_to_non_nullable
as List<Pause>,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,hasIncompleteRequiredChecklists: null == hasIncompleteRequiredChecklists ? _self.hasIncompleteRequiredChecklists : hasIncompleteRequiredChecklists // ignore: cast_nullable_to_non_nullable
as bool,workLocationId: freezed == workLocationId ? _self.workLocationId : workLocationId // ignore: cast_nullable_to_non_nullable
as String?,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as WorkLocation?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userEmail: freezed == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,customRoleName: freezed == customRoleName ? _self.customRoleName : customRoleName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Shift
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<$Res>? get workLocation {
    if (_self.workLocation == null) {
    return null;
  }

  return $WorkLocationCopyWith<$Res>(_self.workLocation!, (value) {
    return _then(_self.copyWith(workLocation: value));
  });
}
}

// dart format on
