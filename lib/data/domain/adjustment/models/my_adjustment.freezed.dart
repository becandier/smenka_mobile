// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_adjustment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyAdjustment {

 String get id; int get amountMinor; String get currency; String get reason; DateTime get occurredAt; DateTime get createdAt; String? get comment; String? get shiftId;
/// Create a copy of MyAdjustment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAdjustmentCopyWith<MyAdjustment> get copyWith => _$MyAdjustmentCopyWithImpl<MyAdjustment>(this as MyAdjustment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAdjustment&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId));
}


@override
int get hashCode => Object.hash(runtimeType,id,amountMinor,currency,reason,occurredAt,createdAt,comment,shiftId);

@override
String toString() {
  return 'MyAdjustment(id: $id, amountMinor: $amountMinor, currency: $currency, reason: $reason, occurredAt: $occurredAt, createdAt: $createdAt, comment: $comment, shiftId: $shiftId)';
}


}

/// @nodoc
abstract mixin class $MyAdjustmentCopyWith<$Res>  {
  factory $MyAdjustmentCopyWith(MyAdjustment value, $Res Function(MyAdjustment) _then) = _$MyAdjustmentCopyWithImpl;
@useResult
$Res call({
 String id, int amountMinor, String currency, String reason, DateTime occurredAt, DateTime createdAt, String? comment, String? shiftId
});




}
/// @nodoc
class _$MyAdjustmentCopyWithImpl<$Res>
    implements $MyAdjustmentCopyWith<$Res> {
  _$MyAdjustmentCopyWithImpl(this._self, this._then);

  final MyAdjustment _self;
  final $Res Function(MyAdjustment) _then;

/// Create a copy of MyAdjustment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountMinor = null,Object? currency = null,Object? reason = null,Object? occurredAt = null,Object? createdAt = null,Object? comment = freezed,Object? shiftId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyAdjustment].
extension MyAdjustmentPatterns on MyAdjustment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyAdjustment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyAdjustment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyAdjustment value)  $default,){
final _that = this;
switch (_that) {
case _MyAdjustment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyAdjustment value)?  $default,){
final _that = this;
switch (_that) {
case _MyAdjustment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int amountMinor,  String currency,  String reason,  DateTime occurredAt,  DateTime createdAt,  String? comment,  String? shiftId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAdjustment() when $default != null:
return $default(_that.id,_that.amountMinor,_that.currency,_that.reason,_that.occurredAt,_that.createdAt,_that.comment,_that.shiftId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int amountMinor,  String currency,  String reason,  DateTime occurredAt,  DateTime createdAt,  String? comment,  String? shiftId)  $default,) {final _that = this;
switch (_that) {
case _MyAdjustment():
return $default(_that.id,_that.amountMinor,_that.currency,_that.reason,_that.occurredAt,_that.createdAt,_that.comment,_that.shiftId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int amountMinor,  String currency,  String reason,  DateTime occurredAt,  DateTime createdAt,  String? comment,  String? shiftId)?  $default,) {final _that = this;
switch (_that) {
case _MyAdjustment() when $default != null:
return $default(_that.id,_that.amountMinor,_that.currency,_that.reason,_that.occurredAt,_that.createdAt,_that.comment,_that.shiftId);case _:
  return null;

}
}

}

/// @nodoc


class _MyAdjustment implements MyAdjustment {
  const _MyAdjustment({required this.id, required this.amountMinor, required this.currency, required this.reason, required this.occurredAt, required this.createdAt, this.comment, this.shiftId});
  

@override final  String id;
@override final  int amountMinor;
@override final  String currency;
@override final  String reason;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  String? comment;
@override final  String? shiftId;

/// Create a copy of MyAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyAdjustmentCopyWith<_MyAdjustment> get copyWith => __$MyAdjustmentCopyWithImpl<_MyAdjustment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAdjustment&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId));
}


@override
int get hashCode => Object.hash(runtimeType,id,amountMinor,currency,reason,occurredAt,createdAt,comment,shiftId);

@override
String toString() {
  return 'MyAdjustment(id: $id, amountMinor: $amountMinor, currency: $currency, reason: $reason, occurredAt: $occurredAt, createdAt: $createdAt, comment: $comment, shiftId: $shiftId)';
}


}

/// @nodoc
abstract mixin class _$MyAdjustmentCopyWith<$Res> implements $MyAdjustmentCopyWith<$Res> {
  factory _$MyAdjustmentCopyWith(_MyAdjustment value, $Res Function(_MyAdjustment) _then) = __$MyAdjustmentCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountMinor, String currency, String reason, DateTime occurredAt, DateTime createdAt, String? comment, String? shiftId
});




}
/// @nodoc
class __$MyAdjustmentCopyWithImpl<$Res>
    implements _$MyAdjustmentCopyWith<$Res> {
  __$MyAdjustmentCopyWithImpl(this._self, this._then);

  final _MyAdjustment _self;
  final $Res Function(_MyAdjustment) _then;

/// Create a copy of MyAdjustment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountMinor = null,Object? currency = null,Object? reason = null,Object? occurredAt = null,Object? createdAt = null,Object? comment = freezed,Object? shiftId = freezed,}) {
  return _then(_MyAdjustment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
