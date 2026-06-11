// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateDto {

 String get id; String get memberId; int get rateAmountMinor; String get rateType; String get currency; DateTime get effectiveFrom; DateTime get createdAt; String? get note;
/// Create a copy of RateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateDtoCopyWith<RateDto> get copyWith => _$RateDtoCopyWithImpl<RateDto>(this as RateDto, _$identity);

  /// Serializes this RateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,memberId,rateAmountMinor,rateType,currency,effectiveFrom,createdAt,note);

@override
String toString() {
  return 'RateDto(id: $id, memberId: $memberId, rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom, createdAt: $createdAt, note: $note)';
}


}

/// @nodoc
abstract mixin class $RateDtoCopyWith<$Res>  {
  factory $RateDtoCopyWith(RateDto value, $Res Function(RateDto) _then) = _$RateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String memberId, int rateAmountMinor, String rateType, String currency, DateTime effectiveFrom, DateTime createdAt, String? note
});




}
/// @nodoc
class _$RateDtoCopyWithImpl<$Res>
    implements $RateDtoCopyWith<$Res> {
  _$RateDtoCopyWithImpl(this._self, this._then);

  final RateDto _self;
  final $Res Function(RateDto) _then;

/// Create a copy of RateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? memberId = null,Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,Object? createdAt = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RateDto].
extension RateDtoPatterns on RateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateDto value)  $default,){
final _that = this;
switch (_that) {
case _RateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateDto value)?  $default,){
final _that = this;
switch (_that) {
case _RateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String memberId,  int rateAmountMinor,  String rateType,  String currency,  DateTime effectiveFrom,  DateTime createdAt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String memberId,  int rateAmountMinor,  String rateType,  String currency,  DateTime effectiveFrom,  DateTime createdAt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _RateDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String memberId,  int rateAmountMinor,  String rateType,  String currency,  DateTime effectiveFrom,  DateTime createdAt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _RateDto() when $default != null:
return $default(_that.id,_that.memberId,_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom,_that.createdAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RateDto implements RateDto {
  const _RateDto({required this.id, required this.memberId, required this.rateAmountMinor, required this.rateType, required this.currency, required this.effectiveFrom, required this.createdAt, this.note});
  factory _RateDto.fromJson(Map<String, dynamic> json) => _$RateDtoFromJson(json);

@override final  String id;
@override final  String memberId;
@override final  int rateAmountMinor;
@override final  String rateType;
@override final  String currency;
@override final  DateTime effectiveFrom;
@override final  DateTime createdAt;
@override final  String? note;

/// Create a copy of RateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateDtoCopyWith<_RateDto> get copyWith => __$RateDtoCopyWithImpl<_RateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,memberId,rateAmountMinor,rateType,currency,effectiveFrom,createdAt,note);

@override
String toString() {
  return 'RateDto(id: $id, memberId: $memberId, rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom, createdAt: $createdAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$RateDtoCopyWith<$Res> implements $RateDtoCopyWith<$Res> {
  factory _$RateDtoCopyWith(_RateDto value, $Res Function(_RateDto) _then) = __$RateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String memberId, int rateAmountMinor, String rateType, String currency, DateTime effectiveFrom, DateTime createdAt, String? note
});




}
/// @nodoc
class __$RateDtoCopyWithImpl<$Res>
    implements _$RateDtoCopyWith<$Res> {
  __$RateDtoCopyWithImpl(this._self, this._then);

  final _RateDto _self;
  final $Res Function(_RateDto) _then;

/// Create a copy of RateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberId = null,Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,Object? createdAt = null,Object? note = freezed,}) {
  return _then(_RateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CurrentRateDto {

 int get rateAmountMinor; String get rateType; String get currency; DateTime get effectiveFrom;
/// Create a copy of CurrentRateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentRateDtoCopyWith<CurrentRateDto> get copyWith => _$CurrentRateDtoCopyWithImpl<CurrentRateDto>(this as CurrentRateDto, _$identity);

  /// Serializes this CurrentRateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentRateDto&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rateAmountMinor,rateType,currency,effectiveFrom);

@override
String toString() {
  return 'CurrentRateDto(rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom)';
}


}

/// @nodoc
abstract mixin class $CurrentRateDtoCopyWith<$Res>  {
  factory $CurrentRateDtoCopyWith(CurrentRateDto value, $Res Function(CurrentRateDto) _then) = _$CurrentRateDtoCopyWithImpl;
@useResult
$Res call({
 int rateAmountMinor, String rateType, String currency, DateTime effectiveFrom
});




}
/// @nodoc
class _$CurrentRateDtoCopyWithImpl<$Res>
    implements $CurrentRateDtoCopyWith<$Res> {
  _$CurrentRateDtoCopyWithImpl(this._self, this._then);

  final CurrentRateDto _self;
  final $Res Function(CurrentRateDto) _then;

/// Create a copy of CurrentRateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,}) {
  return _then(_self.copyWith(
rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentRateDto].
extension CurrentRateDtoPatterns on CurrentRateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentRateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentRateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentRateDto value)  $default,){
final _that = this;
switch (_that) {
case _CurrentRateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentRateDto value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentRateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rateAmountMinor,  String rateType,  String currency,  DateTime effectiveFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentRateDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rateAmountMinor,  String rateType,  String currency,  DateTime effectiveFrom)  $default,) {final _that = this;
switch (_that) {
case _CurrentRateDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rateAmountMinor,  String rateType,  String currency,  DateTime effectiveFrom)?  $default,) {final _that = this;
switch (_that) {
case _CurrentRateDto() when $default != null:
return $default(_that.rateAmountMinor,_that.rateType,_that.currency,_that.effectiveFrom);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CurrentRateDto implements CurrentRateDto {
  const _CurrentRateDto({required this.rateAmountMinor, required this.rateType, required this.currency, required this.effectiveFrom});
  factory _CurrentRateDto.fromJson(Map<String, dynamic> json) => _$CurrentRateDtoFromJson(json);

@override final  int rateAmountMinor;
@override final  String rateType;
@override final  String currency;
@override final  DateTime effectiveFrom;

/// Create a copy of CurrentRateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentRateDtoCopyWith<_CurrentRateDto> get copyWith => __$CurrentRateDtoCopyWithImpl<_CurrentRateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentRateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentRateDto&&(identical(other.rateAmountMinor, rateAmountMinor) || other.rateAmountMinor == rateAmountMinor)&&(identical(other.rateType, rateType) || other.rateType == rateType)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rateAmountMinor,rateType,currency,effectiveFrom);

@override
String toString() {
  return 'CurrentRateDto(rateAmountMinor: $rateAmountMinor, rateType: $rateType, currency: $currency, effectiveFrom: $effectiveFrom)';
}


}

/// @nodoc
abstract mixin class _$CurrentRateDtoCopyWith<$Res> implements $CurrentRateDtoCopyWith<$Res> {
  factory _$CurrentRateDtoCopyWith(_CurrentRateDto value, $Res Function(_CurrentRateDto) _then) = __$CurrentRateDtoCopyWithImpl;
@override @useResult
$Res call({
 int rateAmountMinor, String rateType, String currency, DateTime effectiveFrom
});




}
/// @nodoc
class __$CurrentRateDtoCopyWithImpl<$Res>
    implements _$CurrentRateDtoCopyWith<$Res> {
  __$CurrentRateDtoCopyWithImpl(this._self, this._then);

  final _CurrentRateDto _self;
  final $Res Function(_CurrentRateDto) _then;

/// Create a copy of CurrentRateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rateAmountMinor = null,Object? rateType = null,Object? currency = null,Object? effectiveFrom = null,}) {
  return _then(_CurrentRateDto(
rateAmountMinor: null == rateAmountMinor ? _self.rateAmountMinor : rateAmountMinor // ignore: cast_nullable_to_non_nullable
as int,rateType: null == rateType ? _self.rateType : rateType // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
