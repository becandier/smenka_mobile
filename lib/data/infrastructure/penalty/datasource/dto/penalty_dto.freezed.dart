// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'penalty_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PenaltyTemplateDto {

 String get id; String get reason; int get amountMinor; String get currency; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of PenaltyTemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyTemplateDtoCopyWith<PenaltyTemplateDto> get copyWith => _$PenaltyTemplateDtoCopyWithImpl<PenaltyTemplateDto>(this as PenaltyTemplateDto, _$identity);

  /// Serializes this PenaltyTemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenaltyTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,createdAt,updatedAt);

@override
String toString() {
  return 'PenaltyTemplateDto(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PenaltyTemplateDtoCopyWith<$Res>  {
  factory $PenaltyTemplateDtoCopyWith(PenaltyTemplateDto value, $Res Function(PenaltyTemplateDto) _then) = _$PenaltyTemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$PenaltyTemplateDtoCopyWithImpl<$Res>
    implements $PenaltyTemplateDtoCopyWith<$Res> {
  _$PenaltyTemplateDtoCopyWithImpl(this._self, this._then);

  final PenaltyTemplateDto _self;
  final $Res Function(PenaltyTemplateDto) _then;

/// Create a copy of PenaltyTemplateDto
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


/// Adds pattern-matching-related methods to [PenaltyTemplateDto].
extension PenaltyTemplateDtoPatterns on PenaltyTemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenaltyTemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenaltyTemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenaltyTemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _PenaltyTemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenaltyTemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _PenaltyTemplateDto() when $default != null:
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
case _PenaltyTemplateDto() when $default != null:
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
case _PenaltyTemplateDto():
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
case _PenaltyTemplateDto() when $default != null:
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PenaltyTemplateDto implements PenaltyTemplateDto {
  const _PenaltyTemplateDto({required this.id, required this.reason, required this.amountMinor, required this.currency, required this.createdAt, required this.updatedAt});
  factory _PenaltyTemplateDto.fromJson(Map<String, dynamic> json) => _$PenaltyTemplateDtoFromJson(json);

@override final  String id;
@override final  String reason;
@override final  int amountMinor;
@override final  String currency;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of PenaltyTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenaltyTemplateDtoCopyWith<_PenaltyTemplateDto> get copyWith => __$PenaltyTemplateDtoCopyWithImpl<_PenaltyTemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PenaltyTemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenaltyTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,createdAt,updatedAt);

@override
String toString() {
  return 'PenaltyTemplateDto(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PenaltyTemplateDtoCopyWith<$Res> implements $PenaltyTemplateDtoCopyWith<$Res> {
  factory _$PenaltyTemplateDtoCopyWith(_PenaltyTemplateDto value, $Res Function(_PenaltyTemplateDto) _then) = __$PenaltyTemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$PenaltyTemplateDtoCopyWithImpl<$Res>
    implements _$PenaltyTemplateDtoCopyWith<$Res> {
  __$PenaltyTemplateDtoCopyWithImpl(this._self, this._then);

  final _PenaltyTemplateDto _self;
  final $Res Function(_PenaltyTemplateDto) _then;

/// Create a copy of PenaltyTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PenaltyTemplateDto(
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
mixin _$PenaltyDto {

 String get id; String get memberId; String get userId; String get userName; String get reason; int get amountMinor; String get currency; DateTime get occurredAt; String get createdByUserId; DateTime get createdAt; DateTime get updatedAt; String? get templateId; String? get shiftId; String? get comment;
/// Create a copy of PenaltyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyDtoCopyWith<PenaltyDto> get copyWith => _$PenaltyDtoCopyWithImpl<PenaltyDto>(this as PenaltyDto, _$identity);

  /// Serializes this PenaltyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenaltyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,memberId,userId,userName,reason,amountMinor,currency,occurredAt,createdByUserId,createdAt,updatedAt,templateId,shiftId,comment);

@override
String toString() {
  return 'PenaltyDto(id: $id, memberId: $memberId, userId: $userId, userName: $userName, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdByUserId: $createdByUserId, createdAt: $createdAt, updatedAt: $updatedAt, templateId: $templateId, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $PenaltyDtoCopyWith<$Res>  {
  factory $PenaltyDtoCopyWith(PenaltyDto value, $Res Function(PenaltyDto) _then) = _$PenaltyDtoCopyWithImpl;
@useResult
$Res call({
 String id, String memberId, String userId, String userName, String reason, int amountMinor, String currency, DateTime occurredAt, String createdByUserId, DateTime createdAt, DateTime updatedAt, String? templateId, String? shiftId, String? comment
});




}
/// @nodoc
class _$PenaltyDtoCopyWithImpl<$Res>
    implements $PenaltyDtoCopyWith<$Res> {
  _$PenaltyDtoCopyWithImpl(this._self, this._then);

  final PenaltyDto _self;
  final $Res Function(PenaltyDto) _then;

/// Create a copy of PenaltyDto
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


/// Adds pattern-matching-related methods to [PenaltyDto].
extension PenaltyDtoPatterns on PenaltyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenaltyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenaltyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenaltyDto value)  $default,){
final _that = this;
switch (_that) {
case _PenaltyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenaltyDto value)?  $default,){
final _that = this;
switch (_that) {
case _PenaltyDto() when $default != null:
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
case _PenaltyDto() when $default != null:
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
case _PenaltyDto():
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
case _PenaltyDto() when $default != null:
return $default(_that.id,_that.memberId,_that.userId,_that.userName,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdByUserId,_that.createdAt,_that.updatedAt,_that.templateId,_that.shiftId,_that.comment);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PenaltyDto implements PenaltyDto {
  const _PenaltyDto({required this.id, required this.memberId, required this.userId, required this.userName, required this.reason, required this.amountMinor, required this.currency, required this.occurredAt, required this.createdByUserId, required this.createdAt, required this.updatedAt, this.templateId, this.shiftId, this.comment});
  factory _PenaltyDto.fromJson(Map<String, dynamic> json) => _$PenaltyDtoFromJson(json);

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
@override final  String? templateId;
@override final  String? shiftId;
@override final  String? comment;

/// Create a copy of PenaltyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenaltyDtoCopyWith<_PenaltyDto> get copyWith => __$PenaltyDtoCopyWithImpl<_PenaltyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PenaltyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenaltyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdByUserId, createdByUserId) || other.createdByUserId == createdByUserId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,memberId,userId,userName,reason,amountMinor,currency,occurredAt,createdByUserId,createdAt,updatedAt,templateId,shiftId,comment);

@override
String toString() {
  return 'PenaltyDto(id: $id, memberId: $memberId, userId: $userId, userName: $userName, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdByUserId: $createdByUserId, createdAt: $createdAt, updatedAt: $updatedAt, templateId: $templateId, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$PenaltyDtoCopyWith<$Res> implements $PenaltyDtoCopyWith<$Res> {
  factory _$PenaltyDtoCopyWith(_PenaltyDto value, $Res Function(_PenaltyDto) _then) = __$PenaltyDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String memberId, String userId, String userName, String reason, int amountMinor, String currency, DateTime occurredAt, String createdByUserId, DateTime createdAt, DateTime updatedAt, String? templateId, String? shiftId, String? comment
});




}
/// @nodoc
class __$PenaltyDtoCopyWithImpl<$Res>
    implements _$PenaltyDtoCopyWith<$Res> {
  __$PenaltyDtoCopyWithImpl(this._self, this._then);

  final _PenaltyDto _self;
  final $Res Function(_PenaltyDto) _then;

/// Create a copy of PenaltyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberId = null,Object? userId = null,Object? userName = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? occurredAt = null,Object? createdByUserId = null,Object? createdAt = null,Object? updatedAt = null,Object? templateId = freezed,Object? shiftId = freezed,Object? comment = freezed,}) {
  return _then(_PenaltyDto(
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
mixin _$MyPenaltyDto {

 String get id; String get reason; int get amountMinor; String get currency; DateTime get occurredAt; DateTime get createdAt; String? get shiftId; String? get comment;
/// Create a copy of MyPenaltyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPenaltyDtoCopyWith<MyPenaltyDto> get copyWith => _$MyPenaltyDtoCopyWithImpl<MyPenaltyDto>(this as MyPenaltyDto, _$identity);

  /// Serializes this MyPenaltyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPenaltyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,occurredAt,createdAt,shiftId,comment);

@override
String toString() {
  return 'MyPenaltyDto(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdAt: $createdAt, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $MyPenaltyDtoCopyWith<$Res>  {
  factory $MyPenaltyDtoCopyWith(MyPenaltyDto value, $Res Function(MyPenaltyDto) _then) = _$MyPenaltyDtoCopyWithImpl;
@useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime occurredAt, DateTime createdAt, String? shiftId, String? comment
});




}
/// @nodoc
class _$MyPenaltyDtoCopyWithImpl<$Res>
    implements $MyPenaltyDtoCopyWith<$Res> {
  _$MyPenaltyDtoCopyWithImpl(this._self, this._then);

  final MyPenaltyDto _self;
  final $Res Function(MyPenaltyDto) _then;

/// Create a copy of MyPenaltyDto
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


/// Adds pattern-matching-related methods to [MyPenaltyDto].
extension MyPenaltyDtoPatterns on MyPenaltyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPenaltyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPenaltyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPenaltyDto value)  $default,){
final _that = this;
switch (_that) {
case _MyPenaltyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPenaltyDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyPenaltyDto() when $default != null:
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
case _MyPenaltyDto() when $default != null:
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
case _MyPenaltyDto():
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
case _MyPenaltyDto() when $default != null:
return $default(_that.id,_that.reason,_that.amountMinor,_that.currency,_that.occurredAt,_that.createdAt,_that.shiftId,_that.comment);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MyPenaltyDto implements MyPenaltyDto {
  const _MyPenaltyDto({required this.id, required this.reason, required this.amountMinor, required this.currency, required this.occurredAt, required this.createdAt, this.shiftId, this.comment});
  factory _MyPenaltyDto.fromJson(Map<String, dynamic> json) => _$MyPenaltyDtoFromJson(json);

@override final  String id;
@override final  String reason;
@override final  int amountMinor;
@override final  String currency;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  String? shiftId;
@override final  String? comment;

/// Create a copy of MyPenaltyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPenaltyDtoCopyWith<_MyPenaltyDto> get copyWith => __$MyPenaltyDtoCopyWithImpl<_MyPenaltyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyPenaltyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPenaltyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reason,amountMinor,currency,occurredAt,createdAt,shiftId,comment);

@override
String toString() {
  return 'MyPenaltyDto(id: $id, reason: $reason, amountMinor: $amountMinor, currency: $currency, occurredAt: $occurredAt, createdAt: $createdAt, shiftId: $shiftId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$MyPenaltyDtoCopyWith<$Res> implements $MyPenaltyDtoCopyWith<$Res> {
  factory _$MyPenaltyDtoCopyWith(_MyPenaltyDto value, $Res Function(_MyPenaltyDto) _then) = __$MyPenaltyDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String reason, int amountMinor, String currency, DateTime occurredAt, DateTime createdAt, String? shiftId, String? comment
});




}
/// @nodoc
class __$MyPenaltyDtoCopyWithImpl<$Res>
    implements _$MyPenaltyDtoCopyWith<$Res> {
  __$MyPenaltyDtoCopyWithImpl(this._self, this._then);

  final _MyPenaltyDto _self;
  final $Res Function(_MyPenaltyDto) _then;

/// Create a copy of MyPenaltyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reason = null,Object? amountMinor = null,Object? currency = null,Object? occurredAt = null,Object? createdAt = null,Object? shiftId = freezed,Object? comment = freezed,}) {
  return _then(_MyPenaltyDto(
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
mixin _$PaginatedPenaltiesDto {

 List<PenaltyDto> get items; int get total; int get limit; int get offset;
/// Create a copy of PaginatedPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedPenaltiesDtoCopyWith<PaginatedPenaltiesDto> get copyWith => _$PaginatedPenaltiesDtoCopyWithImpl<PaginatedPenaltiesDto>(this as PaginatedPenaltiesDto, _$identity);

  /// Serializes this PaginatedPenaltiesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedPenaltiesDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,limit,offset);

@override
String toString() {
  return 'PaginatedPenaltiesDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $PaginatedPenaltiesDtoCopyWith<$Res>  {
  factory $PaginatedPenaltiesDtoCopyWith(PaginatedPenaltiesDto value, $Res Function(PaginatedPenaltiesDto) _then) = _$PaginatedPenaltiesDtoCopyWithImpl;
@useResult
$Res call({
 List<PenaltyDto> items, int total, int limit, int offset
});




}
/// @nodoc
class _$PaginatedPenaltiesDtoCopyWithImpl<$Res>
    implements $PaginatedPenaltiesDtoCopyWith<$Res> {
  _$PaginatedPenaltiesDtoCopyWithImpl(this._self, this._then);

  final PaginatedPenaltiesDto _self;
  final $Res Function(PaginatedPenaltiesDto) _then;

/// Create a copy of PaginatedPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PenaltyDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedPenaltiesDto].
extension PaginatedPenaltiesDtoPatterns on PaginatedPenaltiesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedPenaltiesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedPenaltiesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedPenaltiesDto value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedPenaltiesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedPenaltiesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedPenaltiesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PenaltyDto> items,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedPenaltiesDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PenaltyDto> items,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _PaginatedPenaltiesDto():
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PenaltyDto> items,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedPenaltiesDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedPenaltiesDto implements PaginatedPenaltiesDto {
  const _PaginatedPenaltiesDto({required final  List<PenaltyDto> items, required this.total, required this.limit, required this.offset}): _items = items;
  factory _PaginatedPenaltiesDto.fromJson(Map<String, dynamic> json) => _$PaginatedPenaltiesDtoFromJson(json);

 final  List<PenaltyDto> _items;
@override List<PenaltyDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of PaginatedPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedPenaltiesDtoCopyWith<_PaginatedPenaltiesDto> get copyWith => __$PaginatedPenaltiesDtoCopyWithImpl<_PaginatedPenaltiesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedPenaltiesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedPenaltiesDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,limit,offset);

@override
String toString() {
  return 'PaginatedPenaltiesDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$PaginatedPenaltiesDtoCopyWith<$Res> implements $PaginatedPenaltiesDtoCopyWith<$Res> {
  factory _$PaginatedPenaltiesDtoCopyWith(_PaginatedPenaltiesDto value, $Res Function(_PaginatedPenaltiesDto) _then) = __$PaginatedPenaltiesDtoCopyWithImpl;
@override @useResult
$Res call({
 List<PenaltyDto> items, int total, int limit, int offset
});




}
/// @nodoc
class __$PaginatedPenaltiesDtoCopyWithImpl<$Res>
    implements _$PaginatedPenaltiesDtoCopyWith<$Res> {
  __$PaginatedPenaltiesDtoCopyWithImpl(this._self, this._then);

  final _PaginatedPenaltiesDto _self;
  final $Res Function(_PaginatedPenaltiesDto) _then;

/// Create a copy of PaginatedPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_PaginatedPenaltiesDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PenaltyDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaginatedMyPenaltiesDto {

 List<MyPenaltyDto> get items; int get total; int get limit; int get offset;
/// Create a copy of PaginatedMyPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedMyPenaltiesDtoCopyWith<PaginatedMyPenaltiesDto> get copyWith => _$PaginatedMyPenaltiesDtoCopyWithImpl<PaginatedMyPenaltiesDto>(this as PaginatedMyPenaltiesDto, _$identity);

  /// Serializes this PaginatedMyPenaltiesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedMyPenaltiesDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,limit,offset);

@override
String toString() {
  return 'PaginatedMyPenaltiesDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $PaginatedMyPenaltiesDtoCopyWith<$Res>  {
  factory $PaginatedMyPenaltiesDtoCopyWith(PaginatedMyPenaltiesDto value, $Res Function(PaginatedMyPenaltiesDto) _then) = _$PaginatedMyPenaltiesDtoCopyWithImpl;
@useResult
$Res call({
 List<MyPenaltyDto> items, int total, int limit, int offset
});




}
/// @nodoc
class _$PaginatedMyPenaltiesDtoCopyWithImpl<$Res>
    implements $PaginatedMyPenaltiesDtoCopyWith<$Res> {
  _$PaginatedMyPenaltiesDtoCopyWithImpl(this._self, this._then);

  final PaginatedMyPenaltiesDto _self;
  final $Res Function(PaginatedMyPenaltiesDto) _then;

/// Create a copy of PaginatedMyPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MyPenaltyDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedMyPenaltiesDto].
extension PaginatedMyPenaltiesDtoPatterns on PaginatedMyPenaltiesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedMyPenaltiesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedMyPenaltiesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedMyPenaltiesDto value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedMyPenaltiesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedMyPenaltiesDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedMyPenaltiesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MyPenaltyDto> items,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedMyPenaltiesDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MyPenaltyDto> items,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _PaginatedMyPenaltiesDto():
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MyPenaltyDto> items,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedMyPenaltiesDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedMyPenaltiesDto implements PaginatedMyPenaltiesDto {
  const _PaginatedMyPenaltiesDto({required final  List<MyPenaltyDto> items, required this.total, required this.limit, required this.offset}): _items = items;
  factory _PaginatedMyPenaltiesDto.fromJson(Map<String, dynamic> json) => _$PaginatedMyPenaltiesDtoFromJson(json);

 final  List<MyPenaltyDto> _items;
@override List<MyPenaltyDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of PaginatedMyPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedMyPenaltiesDtoCopyWith<_PaginatedMyPenaltiesDto> get copyWith => __$PaginatedMyPenaltiesDtoCopyWithImpl<_PaginatedMyPenaltiesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedMyPenaltiesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedMyPenaltiesDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,limit,offset);

@override
String toString() {
  return 'PaginatedMyPenaltiesDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$PaginatedMyPenaltiesDtoCopyWith<$Res> implements $PaginatedMyPenaltiesDtoCopyWith<$Res> {
  factory _$PaginatedMyPenaltiesDtoCopyWith(_PaginatedMyPenaltiesDto value, $Res Function(_PaginatedMyPenaltiesDto) _then) = __$PaginatedMyPenaltiesDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MyPenaltyDto> items, int total, int limit, int offset
});




}
/// @nodoc
class __$PaginatedMyPenaltiesDtoCopyWithImpl<$Res>
    implements _$PaginatedMyPenaltiesDtoCopyWith<$Res> {
  __$PaginatedMyPenaltiesDtoCopyWithImpl(this._self, this._then);

  final _PaginatedMyPenaltiesDto _self;
  final $Res Function(_PaginatedMyPenaltiesDto) _then;

/// Create a copy of PaginatedMyPenaltiesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_PaginatedMyPenaltiesDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MyPenaltyDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
