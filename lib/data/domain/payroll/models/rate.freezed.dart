// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Rate {

 String get id; String get memberId;/// Ставка в копейках (> 0). Смысл определяется [rateType].
 int get rateAmountMinor; RateType get rateType; String get currency;/// Момент начала действия (UTC).
 DateTime get effectiveFrom; DateTime get createdAt; String? get note;
/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateCopyWith<Rate> get copyWith => _$RateCopyWithImpl<Rate>(this as Rate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rate&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,id,memberId,rateAmountMinor,rateType,currency,effectiveFrom,createdAt,note);

@override
String toString() {
  return 'Rate(id: $id, memberId: $memberId, rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom, createdAt: $createdAt, note: $note)';
}


}

/// @nodoc
abstract mixin class $RateCopyWith<$Res>  {
  factory $RateCopyWith(Rate value, $Res Function(Rate) _then) = _$RateCopyWithImpl;
@useResult
$Res call({
 String id, String memberId, int rateAmountMinor, RateType rateType, String currency, DateTime effectiveFrom, DateTime createdAt, String? note
});




}
/// @nodoc
class _$RateCopyWithImpl<$Res>
    implements $RateCopyWith<$Res> {
  _$RateCopyWithImpl(this._self, this._then);

  final Rate _self;
  final $Res Function(Rate) _then;

/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? memberId = null,Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,Object? createdAt = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Rate].
extension RatePatterns on Rate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rate value)  $default,){
final _that = this;
switch (_that) {
case _Rate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rate value)?  $default,){
final _that = this;
switch (_that) {
case _Rate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String memberId,  int rateAmountMinor,  RateType rateType,  String currency,  DateTime effectiveFrom,  DateTime createdAt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rate() when $default != null:
return $default(_that.id,_that.memberId,_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom,_that.createdAt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String memberId,  int rateAmountMinor,  RateType rateType,  String currency,  DateTime effectiveFrom,  DateTime createdAt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _Rate():
return $default(_that.id,_that.memberId,_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom,_that.createdAt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String memberId,  int rateAmountMinor,  RateType rateType,  String currency,  DateTime effectiveFrom,  DateTime createdAt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _Rate() when $default != null:
return $default(_that.id,_that.memberId,_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom,_that.createdAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _Rate implements Rate {
  const _Rate({required this.id, required this.memberId, required this.rateAmountMinor, required this.rateType, required this.currency, required this.effectiveFrom, required this.createdAt, this.note});
  

@override final  String id;
@override final  String memberId;
/// Ставка в копейках (> 0). Смысл определяется [rateType].
@override final  int rateAmountMinor;
@override final  RateType rateType;
@override final  String currency;
/// Момент начала действия (UTC).
@override final  DateTime effectiveFrom;
@override final  DateTime createdAt;
@override final  String? note;

/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateCopyWith<_Rate> get copyWith => __$RateCopyWithImpl<_Rate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rate&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,id,memberId,rateAmountMinor,rateType,currency,effectiveFrom,createdAt,note);

@override
String toString() {
  return 'Rate(id: $id, memberId: $memberId, rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom, createdAt: $createdAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$RateCopyWith<$Res> implements $RateCopyWith<$Res> {
  factory _$RateCopyWith(_Rate value, $Res Function(_Rate) _then) = __$RateCopyWithImpl;
@override @useResult
$Res call({
 String id, String memberId, int rateAmountMinor, RateType rateType, String currency, DateTime effectiveFrom, DateTime createdAt, String? note
});




}
/// @nodoc
class __$RateCopyWithImpl<$Res>
    implements _$RateCopyWith<$Res> {
  __$RateCopyWithImpl(this._self, this._then);

  final _Rate _self;
  final $Res Function(_Rate) _then;

/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberId = null,Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,Object? createdAt = null,Object? note = freezed,}) {
  return _then(_Rate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CurrentRate {

 int get rateAmountMinor; RateType get rateType; String get currency; DateTime get effectiveFrom;
/// Create a copy of CurrentRate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentRateCopyWith<CurrentRate> get copyWith => _$CurrentRateCopyWithImpl<CurrentRate>(this as CurrentRate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentRate&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom));
}


@override
int get hashCode => Object.hash(runtimeType,rateAmountMinor,rateType,currency,effectiveFrom);

@override
String toString() {
  return 'CurrentRate(rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom)';
}


}

/// @nodoc
abstract mixin class $CurrentRateCopyWith<$Res>  {
  factory $CurrentRateCopyWith(CurrentRate value, $Res Function(CurrentRate) _then) = _$CurrentRateCopyWithImpl;
@useResult
$Res call({
 int rateAmountMinor, RateType rateType, String currency, DateTime effectiveFrom
});




}
/// @nodoc
class _$CurrentRateCopyWithImpl<$Res>
    implements $CurrentRateCopyWith<$Res> {
  _$CurrentRateCopyWithImpl(this._self, this._then);

  final CurrentRate _self;
  final $Res Function(CurrentRate) _then;

/// Create a copy of CurrentRate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,}) {
  return _then(_self.copyWith(
rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentRate].
extension CurrentRatePatterns on CurrentRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentRate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentRate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentRate value)  $default,){
final _that = this;
switch (_that) {
case _CurrentRate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentRate value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentRate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rateAmountMinor,  RateType rateType,  String currency,  DateTime effectiveFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentRate() when $default != null:
return $default(_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rateAmountMinor,  RateType rateType,  String currency,  DateTime effectiveFrom)  $default,) {final _that = this;
switch (_that) {
case _CurrentRate():
return $default(_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rateAmountMinor,  RateType rateType,  String currency,  DateTime effectiveFrom)?  $default,) {final _that = this;
switch (_that) {
case _CurrentRate() when $default != null:
return $default(_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom);case _:
  return null;

}
}

}

/// @nodoc


class _CurrentRate implements CurrentRate {
  const _CurrentRate({required this.rateAmountMinor, required this.rateType, required this.currency, required this.effectiveFrom});
  

@override final  int rateAmountMinor;
@override final  RateType rateType;
@override final  String currency;
@override final  DateTime effectiveFrom;

/// Create a copy of CurrentRate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentRateCopyWith<_CurrentRate> get copyWith => __$CurrentRateCopyWithImpl<_CurrentRate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentRate&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom));
}


@override
int get hashCode => Object.hash(runtimeType,rateAmountMinor,rateType,currency,effectiveFrom);

@override
String toString() {
  return 'CurrentRate(rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom)';
}


}

/// @nodoc
abstract mixin class _$CurrentRateCopyWith<$Res> implements $CurrentRateCopyWith<$Res> {
  factory _$CurrentRateCopyWith(_CurrentRate value, $Res Function(_CurrentRate) _then) = __$CurrentRateCopyWithImpl;
@override @useResult
$Res call({
 int rateAmountMinor, RateType rateType, String currency, DateTime effectiveFrom
});




}
/// @nodoc
class __$CurrentRateCopyWithImpl<$Res>
    implements _$CurrentRateCopyWith<$Res> {
  __$CurrentRateCopyWithImpl(this._self, this._then);

  final _CurrentRate _self;
  final $Res Function(_CurrentRate) _then;

/// Create a copy of CurrentRate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,}) {
  return _then(_CurrentRate(
rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as RateType,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
