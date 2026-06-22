// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'penalty.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PenaltyTemplate {

 String get id; String get reason; int get amountMinor; String get currency; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of PenaltyTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyTemplateCopyWith<PenaltyTemplate> get copyWith => _$PenaltyTemplateCopyWithImpl<PenaltyTemplate>(this as PenaltyTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenaltyTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,createdAt,updatedAt);

@override
String toString() {
  return 'PenaltyTemplate(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PenaltyTemplateCopyWith<$Res>  {
  factory $PenaltyTemplateCopyWith(PenaltyTemplate value, $Res Function(PenaltyTemplate) _then) = _$PenaltyTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$PenaltyTemplateCopyWithImpl<$Res>
    implements $PenaltyTemplateCopyWith<$Res> {
  _$PenaltyTemplateCopyWithImpl(this._self, this._then);

  final PenaltyTemplate _self;
  final $Res Function(PenaltyTemplate) _then;

/// Create a copy of PenaltyTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PenaltyTemplate].
extension PenaltyTemplatePatterns on PenaltyTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenaltyTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenaltyTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenaltyTemplate value)  $default,){
final _that = this;
switch (_that) {
case _PenaltyTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenaltyTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _PenaltyTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reason,  int amountMinor,  String currency,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PenaltyTemplate() when $default != null:
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reason,  int amountMinor,  String currency,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PenaltyTemplate():
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reason,  int amountMinor,  String currency,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PenaltyTemplate() when $default != null:
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _PenaltyTemplate implements PenaltyTemplate {
  const _PenaltyTemplate({required this.id, required this.reason, required this.amountMinor, required this.currency, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String reason;
@override final  int amountMinor;
@override final  String currency;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of PenaltyTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenaltyTemplateCopyWith<_PenaltyTemplate> get copyWith => __$PenaltyTemplateCopyWithImpl<_PenaltyTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenaltyTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,createdAt,updatedAt);

@override
String toString() {
  return 'PenaltyTemplate(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PenaltyTemplateCopyWith<$Res> implements $PenaltyTemplateCopyWith<$Res> {
  factory _$PenaltyTemplateCopyWith(_PenaltyTemplate value, $Res Function(_PenaltyTemplate) _then) = __$PenaltyTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$PenaltyTemplateCopyWithImpl<$Res>
    implements _$PenaltyTemplateCopyWith<$Res> {
  __$PenaltyTemplateCopyWithImpl(this._self, this._then);

  final _PenaltyTemplate _self;
  final $Res Function(_PenaltyTemplate) _then;

/// Create a copy of PenaltyTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PenaltyTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Penalty {

 String get id; String get memberId; String get userId; String get userName; String get reason; int get amountMinor; String get currency; DateTime get occurredAt; String get createdByUserId; DateTime get createdAt; DateTime get updatedAt;/// Происхождение из шаблона; null — кастомный штраф.
 String? get templateId;/// Привязка к конкретной смене сотрудника; null — штраф без смены.
 String? get shiftId; String? get comment;
/// Create a copy of Penalty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyCopyWith<Penalty> get copyWith => _$PenaltyCopyWithImpl<Penalty>(this as Penalty, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Penalty&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,id,memberId,userId,userName,reason,amountMinor,currency,occurredAt,createdByUserId,createdAt,updatedAt,templateId,shiftId,comment);

@override
String toString() {
  return 'Penalty(id: $id, memberId: $memberId, userId: $userId, userName: $userName, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdByUserId: $createdByUserId, createdAt: $createdAt, updatedAt: $updatedAt, templateId: $templateId, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $PenaltyCopyWith<$Res>  {
  factory $PenaltyCopyWith(Penalty value, $Res Function(Penalty) _then) = _$PenaltyCopyWithImpl;
@useResult
$Res call({
 String id, String memberId, String userId, String userName, String reason, int amountMinor, String currency, DateTime occurredAt, String createdByUserId, DateTime createdAt, DateTime updatedAt, String? templateId, String? shiftId, String? comment
});




}
/// @nodoc
class _$PenaltyCopyWithImpl<$Res>
    implements $PenaltyCopyWith<$Res> {
  _$PenaltyCopyWithImpl(this._self, this._then);

  final Penalty _self;
  final $Res Function(Penalty) _then;

/// Create a copy of Penalty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? memberId = null,Object? userId = null,Object? userName = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? occurredAt = null,Object? createdByUserId = null,Object? createdAt = null,Object? updatedAt = null,Object? templateId = freezed,Object? shiftId = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdByUserId: null == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Penalty].
extension PenaltyPatterns on Penalty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Penalty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Penalty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Penalty value)  $default,){
final _that = this;
switch (_that) {
case _Penalty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Penalty value)?  $default,){
final _that = this;
switch (_that) {
case _Penalty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String memberId,  String userId,  String userName,  String reason,  int amountMinor,  String currency,  DateTime occurredAt,  String createdByUserId,  DateTime createdAt,  DateTime updatedAt,  String? templateId,  String? shiftId,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Penalty() when $default != null:
return $default(_that.id,_that.memberId,_that.userId,_that.userName,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdByUserId,_that.createdAt,_that.updatedAt,_that.templateId,_that.shiftId,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String memberId,  String userId,  String userName,  String reason,  int amountMinor,  String currency,  DateTime occurredAt,  String createdByUserId,  DateTime createdAt,  DateTime updatedAt,  String? templateId,  String? shiftId,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _Penalty():
return $default(_that.id,_that.memberId,_that.userId,_that.userName,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdByUserId,_that.createdAt,_that.updatedAt,_that.templateId,_that.shiftId,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String memberId,  String userId,  String userName,  String reason,  int amountMinor,  String currency,  DateTime occurredAt,  String createdByUserId,  DateTime createdAt,  DateTime updatedAt,  String? templateId,  String? shiftId,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _Penalty() when $default != null:
return $default(_that.id,_that.memberId,_that.userId,_that.userName,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdByUserId,_that.createdAt,_that.updatedAt,_that.templateId,_that.shiftId,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _Penalty implements Penalty {
  const _Penalty({required this.id, required this.memberId, required this.userId, required this.userName, required this.reason, required this.amountMinor, required this.currency, required this.occurredAt, required this.createdByUserId, required this.createdAt, required this.updatedAt, this.templateId, this.shiftId, this.comment});
  

@override final  String id;
@override final  String memberId;
@override final  String userId;
@override final  String userName;
@override final  String reason;
@override final  int amountMinor;
@override final  String currency;
@override final  DateTime occurredAt;
@override final  String createdByUserId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
/// Происхождение из шаблона; null — кастомный штраф.
@override final  String? templateId;
/// Привязка к конкретной смене сотрудника; null — штраф без смены.
@override final  String? shiftId;
@override final  String? comment;

/// Create a copy of Penalty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenaltyCopyWith<_Penalty> get copyWith => __$PenaltyCopyWithImpl<_Penalty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Penalty&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,id,memberId,userId,userName,reason,amountMinor,currency,occurredAt,createdByUserId,createdAt,updatedAt,templateId,shiftId,comment);

@override
String toString() {
  return 'Penalty(id: $id, memberId: $memberId, userId: $userId, userName: $userName, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdByUserId: $createdByUserId, createdAt: $createdAt, updatedAt: $updatedAt, templateId: $templateId, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$PenaltyCopyWith<$Res> implements $PenaltyCopyWith<$Res> {
  factory _$PenaltyCopyWith(_Penalty value, $Res Function(_Penalty) _then) = __$PenaltyCopyWithImpl;
@override @useResult
$Res call({
 String id, String memberId, String userId, String userName, String reason, int amountMinor, String currency, DateTime occurredAt, String createdByUserId, DateTime createdAt, DateTime updatedAt, String? templateId, String? shiftId, String? comment
});




}
/// @nodoc
class __$PenaltyCopyWithImpl<$Res>
    implements _$PenaltyCopyWith<$Res> {
  __$PenaltyCopyWithImpl(this._self, this._then);

  final _Penalty _self;
  final $Res Function(_Penalty) _then;

/// Create a copy of Penalty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberId = null,Object? userId = null,Object? userName = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? occurredAt = null,Object? createdByUserId = null,Object? createdAt = null,Object? updatedAt = null,Object? templateId = freezed,Object? shiftId = freezed,Object? comment = freezed,}) {
  return _then(_Penalty(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdByUserId: null == createdByUserId ? _self.createdByUserId : createdByUserId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$MyPenalty {

 String get id; String get reason; int get amountMinor; String get currency; DateTime get occurredAt; DateTime get createdAt; String? get shiftId; String? get comment;
/// Create a copy of MyPenalty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPenaltyCopyWith<MyPenalty> get copyWith => _$MyPenaltyCopyWithImpl<MyPenalty>(this as MyPenalty, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPenalty&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,occurredAt,createdAt,shiftId,comment);

@override
String toString() {
  return 'MyPenalty(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdAt: $createdAt, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $MyPenaltyCopyWith<$Res>  {
  factory $MyPenaltyCopyWith(MyPenalty value, $Res Function(MyPenalty) _then) = _$MyPenaltyCopyWithImpl;
@useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime occurredAt, DateTime createdAt, String? shiftId, String? comment
});




}
/// @nodoc
class _$MyPenaltyCopyWithImpl<$Res>
    implements $MyPenaltyCopyWith<$Res> {
  _$MyPenaltyCopyWithImpl(this._self, this._then);

  final MyPenalty _self;
  final $Res Function(MyPenalty) _then;

/// Create a copy of MyPenalty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? occurredAt = null,Object? createdAt = null,Object? shiftId = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyPenalty].
extension MyPenaltyPatterns on MyPenalty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPenalty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPenalty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPenalty value)  $default,){
final _that = this;
switch (_that) {
case _MyPenalty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPenalty value)?  $default,){
final _that = this;
switch (_that) {
case _MyPenalty() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reason,  int amountMinor,  String currency,  DateTime occurredAt,  DateTime createdAt,  String? shiftId,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPenalty() when $default != null:
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdAt,_that.shiftId,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reason,  int amountMinor,  String currency,  DateTime occurredAt,  DateTime createdAt,  String? shiftId,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _MyPenalty():
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdAt,_that.shiftId,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reason,  int amountMinor,  String currency,  DateTime occurredAt,  DateTime createdAt,  String? shiftId,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _MyPenalty() when $default != null:
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdAt,_that.shiftId,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _MyPenalty implements MyPenalty {
  const _MyPenalty({required this.id, required this.reason, required this.amountMinor, required this.currency, required this.occurredAt, required this.createdAt, this.shiftId, this.comment});
  

@override final  String id;
@override final  String reason;
@override final  int amountMinor;
@override final  String currency;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  String? shiftId;
@override final  String? comment;

/// Create a copy of MyPenalty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPenaltyCopyWith<_MyPenalty> get copyWith => __$MyPenaltyCopyWithImpl<_MyPenalty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPenalty&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,occurredAt,createdAt,shiftId,comment);

@override
String toString() {
  return 'MyPenalty(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdAt: $createdAt, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$MyPenaltyCopyWith<$Res> implements $MyPenaltyCopyWith<$Res> {
  factory _$MyPenaltyCopyWith(_MyPenalty value, $Res Function(_MyPenalty) _then) = __$MyPenaltyCopyWithImpl;
@override @useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime occurredAt, DateTime createdAt, String? shiftId, String? comment
});




}
/// @nodoc
class __$MyPenaltyCopyWithImpl<$Res>
    implements _$MyPenaltyCopyWith<$Res> {
  __$MyPenaltyCopyWithImpl(this._self, this._then);

  final _MyPenalty _self;
  final $Res Function(_MyPenalty) _then;

/// Create a copy of MyPenalty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? occurredAt = null,Object? createdAt = null,Object? shiftId = freezed,Object? comment = freezed,}) {
  return _then(_MyPenalty(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CreatePenaltyInput {

 String get memberId; String get reason; int get amountMinor; String? get templateId; String? get currency; String? get shiftId; DateTime? get occurredAt; String? get comment;
/// Create a copy of CreatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePenaltyInputCopyWith<CreatePenaltyInput> get copyWith => _$CreatePenaltyInputCopyWithImpl<CreatePenaltyInput>(this as CreatePenaltyInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePenaltyInput&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,memberId,reason,amountMinor,templateId,currency,shiftId,occurredAt,comment);

@override
String toString() {
  return 'CreatePenaltyInput(memberId: $memberId, reason: $reason, amountMinor: $amountMinor, templateId: $templateId, currency: $currency, shiftId: $shiftId, occurredAt: $occurredAt, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $CreatePenaltyInputCopyWith<$Res>  {
  factory $CreatePenaltyInputCopyWith(CreatePenaltyInput value, $Res Function(CreatePenaltyInput) _then) = _$CreatePenaltyInputCopyWithImpl;
@useResult
$Res call({
 String memberId, String reason, int amountMinor, String? templateId, String? currency, String? shiftId, DateTime? occurredAt, String? comment
});




}
/// @nodoc
class _$CreatePenaltyInputCopyWithImpl<$Res>
    implements $CreatePenaltyInputCopyWith<$Res> {
  _$CreatePenaltyInputCopyWithImpl(this._self, this._then);

  final CreatePenaltyInput _self;
  final $Res Function(CreatePenaltyInput) _then;

/// Create a copy of CreatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? memberId = null,Object? reason = null,Object? amountMinor = null,Object? templateId = freezed,Object? currency = freezed,Object? shiftId = freezed,Object? occurredAt = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePenaltyInput].
extension CreatePenaltyInputPatterns on CreatePenaltyInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePenaltyInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePenaltyInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePenaltyInput value)  $default,){
final _that = this;
switch (_that) {
case _CreatePenaltyInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePenaltyInput value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePenaltyInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String memberId,  String reason,  int amountMinor,  String? templateId,  String? currency,  String? shiftId,  DateTime? occurredAt,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePenaltyInput() when $default != null:
return $default(_that.memberId,_that.reason,_that.amountMinor,_that.templateId,_that.currency,_that.shiftId,_that.occurredAt,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String memberId,  String reason,  int amountMinor,  String? templateId,  String? currency,  String? shiftId,  DateTime? occurredAt,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _CreatePenaltyInput():
return $default(_that.memberId,_that.reason,_that.amountMinor,_that.templateId,_that.currency,_that.shiftId,_that.occurredAt,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String memberId,  String reason,  int amountMinor,  String? templateId,  String? currency,  String? shiftId,  DateTime? occurredAt,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _CreatePenaltyInput() when $default != null:
return $default(_that.memberId,_that.reason,_that.amountMinor,_that.templateId,_that.currency,_that.shiftId,_that.occurredAt,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePenaltyInput implements CreatePenaltyInput {
  const _CreatePenaltyInput({required this.memberId, required this.reason, required this.amountMinor, this.templateId, this.currency, this.shiftId, this.occurredAt, this.comment});
  

@override final  String memberId;
@override final  String reason;
@override final  int amountMinor;
@override final  String? templateId;
@override final  String? currency;
@override final  String? shiftId;
@override final  DateTime? occurredAt;
@override final  String? comment;

/// Create a copy of CreatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePenaltyInputCopyWith<_CreatePenaltyInput> get copyWith => __$CreatePenaltyInputCopyWithImpl<_CreatePenaltyInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePenaltyInput&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,memberId,reason,amountMinor,templateId,currency,shiftId,occurredAt,comment);

@override
String toString() {
  return 'CreatePenaltyInput(memberId: $memberId, reason: $reason, amountMinor: $amountMinor, templateId: $templateId, currency: $currency, shiftId: $shiftId, occurredAt: $occurredAt, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$CreatePenaltyInputCopyWith<$Res> implements $CreatePenaltyInputCopyWith<$Res> {
  factory _$CreatePenaltyInputCopyWith(_CreatePenaltyInput value, $Res Function(_CreatePenaltyInput) _then) = __$CreatePenaltyInputCopyWithImpl;
@override @useResult
$Res call({
 String memberId, String reason, int amountMinor, String? templateId, String? currency, String? shiftId, DateTime? occurredAt, String? comment
});




}
/// @nodoc
class __$CreatePenaltyInputCopyWithImpl<$Res>
    implements _$CreatePenaltyInputCopyWith<$Res> {
  __$CreatePenaltyInputCopyWithImpl(this._self, this._then);

  final _CreatePenaltyInput _self;
  final $Res Function(_CreatePenaltyInput) _then;

/// Create a copy of CreatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? memberId = null,Object? reason = null,Object? amountMinor = null,Object? templateId = freezed,Object? currency = freezed,Object? shiftId = freezed,Object? occurredAt = freezed,Object? comment = freezed,}) {
  return _then(_CreatePenaltyInput(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$UpdatePenaltyInput {

 String? get reason; int? get amountMinor; String? get currency; String? get shiftId; DateTime? get occurredAt; String? get comment;
/// Create a copy of UpdatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePenaltyInputCopyWith<UpdatePenaltyInput> get copyWith => _$UpdatePenaltyInputCopyWithImpl<UpdatePenaltyInput>(this as UpdatePenaltyInput, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePenaltyInput&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,reason,amountMinor,currency,shiftId,occurredAt,comment);

@override
String toString() {
  return 'UpdatePenaltyInput(reason: $reason, amountMinor: $amountMinor, currency: $currency, shiftId: $shiftId, occurredAt: $occurredAt, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $UpdatePenaltyInputCopyWith<$Res>  {
  factory $UpdatePenaltyInputCopyWith(UpdatePenaltyInput value, $Res Function(UpdatePenaltyInput) _then) = _$UpdatePenaltyInputCopyWithImpl;
@useResult
$Res call({
 String? reason, int? amountMinor, String? currency, String? shiftId, DateTime? occurredAt, String? comment
});




}
/// @nodoc
class _$UpdatePenaltyInputCopyWithImpl<$Res>
    implements $UpdatePenaltyInputCopyWith<$Res> {
  _$UpdatePenaltyInputCopyWithImpl(this._self, this._then);

  final UpdatePenaltyInput _self;
  final $Res Function(UpdatePenaltyInput) _then;

/// Create a copy of UpdatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = freezed,Object? amountMinor = freezed,Object? currency = freezed,Object? shiftId = freezed,Object? occurredAt = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,amountMinor: freezed == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatePenaltyInput].
extension UpdatePenaltyInputPatterns on UpdatePenaltyInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePenaltyInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePenaltyInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePenaltyInput value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePenaltyInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePenaltyInput value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePenaltyInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? reason,  int? amountMinor,  String? currency,  String? shiftId,  DateTime? occurredAt,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePenaltyInput() when $default != null:
return $default(_that.reason,_that.amountMinor,_that.currency,_that.shiftId,_that.occurredAt,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? reason,  int? amountMinor,  String? currency,  String? shiftId,  DateTime? occurredAt,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _UpdatePenaltyInput():
return $default(_that.reason,_that.amountMinor,_that.currency,_that.shiftId,_that.occurredAt,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? reason,  int? amountMinor,  String? currency,  String? shiftId,  DateTime? occurredAt,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePenaltyInput() when $default != null:
return $default(_that.reason,_that.amountMinor,_that.currency,_that.shiftId,_that.occurredAt,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _UpdatePenaltyInput implements UpdatePenaltyInput {
  const _UpdatePenaltyInput({this.reason, this.amountMinor, this.currency, this.shiftId, this.occurredAt, this.comment});
  

@override final  String? reason;
@override final  int? amountMinor;
@override final  String? currency;
@override final  String? shiftId;
@override final  DateTime? occurredAt;
@override final  String? comment;

/// Create a copy of UpdatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePenaltyInputCopyWith<_UpdatePenaltyInput> get copyWith => __$UpdatePenaltyInputCopyWithImpl<_UpdatePenaltyInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePenaltyInput&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,reason,amountMinor,currency,shiftId,occurredAt,comment);

@override
String toString() {
  return 'UpdatePenaltyInput(reason: $reason, amountMinor: $amountMinor, currency: $currency, shiftId: $shiftId, occurredAt: $occurredAt, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$UpdatePenaltyInputCopyWith<$Res> implements $UpdatePenaltyInputCopyWith<$Res> {
  factory _$UpdatePenaltyInputCopyWith(_UpdatePenaltyInput value, $Res Function(_UpdatePenaltyInput) _then) = __$UpdatePenaltyInputCopyWithImpl;
@override @useResult
$Res call({
 String? reason, int? amountMinor, String? currency, String? shiftId, DateTime? occurredAt, String? comment
});




}
/// @nodoc
class __$UpdatePenaltyInputCopyWithImpl<$Res>
    implements _$UpdatePenaltyInputCopyWith<$Res> {
  __$UpdatePenaltyInputCopyWithImpl(this._self, this._then);

  final _UpdatePenaltyInput _self;
  final $Res Function(_UpdatePenaltyInput) _then;

/// Create a copy of UpdatePenaltyInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = freezed,Object? amountMinor = freezed,Object? currency = freezed,Object? shiftId = freezed,Object? occurredAt = freezed,Object? comment = freezed,}) {
  return _then(_UpdatePenaltyInput(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,amountMinor: freezed == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
