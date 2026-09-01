// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_earnings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftEarnings {

 String get currency; int get grossAmountMinor;/// Только активные штрафы, привязанные к этой смене (`shift_id`).
 int get penaltyAmountMinor; int get penaltiesCount;/// Только корректировки, привязанные к этой смене (`shift_id`);
/// знаковая сумма (может быть отрицательной).
 int get adjustmentAmountMinor; int get adjustmentsCount;/// `gross − penalty + adjustment`, может быть отрицательным.
 int get netAmountMinor;/// Согласованная переработка, уже учтённая в [grossAmountMinor].
 int get overtimeSeconds;/// `false` — действующей ставки на момент начала смены не было.
 bool get hasRate;
/// Create a copy of ShiftEarnings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftEarningsCopyWith<ShiftEarnings> get copyWith => _$ShiftEarningsCopyWithImpl<ShiftEarnings>(this as ShiftEarnings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftEarnings&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.penaltyAmountMinor, penaltyAmountMinor) || other.penaltyAmountMinor == penaltyAmountMinor)&&(identical(other.penaltiesCount, penaltiesCount) || other.penaltiesCount == penaltiesCount)&&(identical(other.adjustmentAmountMinor, adjustmentAmountMinor) || other.adjustmentAmountMinor == adjustmentAmountMinor)&&(identical(other.adjustmentsCount, adjustmentsCount) || other.adjustmentsCount == adjustmentsCount)&&(identical(other.netAmountMinor, netAmountMinor) || other.netAmountMinor == netAmountMinor)&&(identical(other.overtimeSeconds, overtimeSeconds) || other.overtimeSeconds == overtimeSeconds)&&(identical(other.hasRate, hasRate) || other.hasRate == hasRate));
}


@override
int get hashCode => Object.hash(runtimeType,currency,grossAmountMinor,penaltyAmountMinor,penaltiesCount,adjustmentAmountMinor,adjustmentsCount,netAmountMinor,overtimeSeconds,hasRate);

@override
String toString() {
  return 'ShiftEarnings(currency: $currency, grossAmountMinor: $grossAmountMinor, penaltyAmountMinor: $penaltyAmountMinor, penaltiesCount: $penaltiesCount, adjustmentAmountMinor: $adjustmentAmountMinor, adjustmentsCount: $adjustmentsCount, netAmountMinor: $netAmountMinor, overtimeSeconds: $overtimeSeconds, hasRate: $hasRate)';
}


}

/// @nodoc
abstract mixin class $ShiftEarningsCopyWith<$Res>  {
  factory $ShiftEarningsCopyWith(ShiftEarnings value, $Res Function(ShiftEarnings) _then) = _$ShiftEarningsCopyWithImpl;
@useResult
$Res call({
 String currency, int grossAmountMinor, int penaltyAmountMinor, int penaltiesCount, int adjustmentAmountMinor, int adjustmentsCount, int netAmountMinor, int overtimeSeconds, bool hasRate
});




}
/// @nodoc
class _$ShiftEarningsCopyWithImpl<$Res>
    implements $ShiftEarningsCopyWith<$Res> {
  _$ShiftEarningsCopyWithImpl(this._self, this._then);

  final ShiftEarnings _self;
  final $Res Function(ShiftEarnings) _then;

/// Create a copy of ShiftEarnings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? grossAmountMinor = null,Object? penaltyAmountMinor = null,Object? penaltiesCount = null,Object? adjustmentAmountMinor = null,Object? adjustmentsCount = null,Object? netAmountMinor = null,Object? overtimeSeconds = null,Object? hasRate = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,penaltyAmountMinor: null == penaltyAmountMinor ? _self.penaltyAmountMinor : penaltyAmountMinor // ignore: cast_nullable_to_non_nullable
as int,penaltiesCount: null == penaltiesCount ? _self.penaltiesCount : penaltiesCount // ignore: cast_nullable_to_non_nullable
as int,adjustmentAmountMinor: null == adjustmentAmountMinor ? _self.adjustmentAmountMinor : adjustmentAmountMinor // ignore: cast_nullable_to_non_nullable
as int,adjustmentsCount: null == adjustmentsCount ? _self.adjustmentsCount : adjustmentsCount // ignore: cast_nullable_to_non_nullable
as int,netAmountMinor: null == netAmountMinor ? _self.netAmountMinor : netAmountMinor // ignore: cast_nullable_to_non_nullable
as int,overtimeSeconds: null == overtimeSeconds ? _self.overtimeSeconds : overtimeSeconds // ignore: cast_nullable_to_non_nullable
as int,hasRate: null == hasRate ? _self.hasRate : hasRate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftEarnings].
extension ShiftEarningsPatterns on ShiftEarnings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftEarnings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftEarnings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftEarnings value)  $default,){
final _that = this;
switch (_that) {
case _ShiftEarnings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftEarnings value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftEarnings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currency,  int grossAmountMinor,  int penaltyAmountMinor,  int penaltiesCount,  int adjustmentAmountMinor,  int adjustmentsCount,  int netAmountMinor,  int overtimeSeconds,  bool hasRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftEarnings() when $default != null:
return $default(_that.currency,_that.grossAmountMinor,_that.penaltyAmountMinor,_that.penaltiesCount,_that.adjustmentAmountMinor,_that.adjustmentsCount,_that.netAmountMinor,_that.overtimeSeconds,_that.hasRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currency,  int grossAmountMinor,  int penaltyAmountMinor,  int penaltiesCount,  int adjustmentAmountMinor,  int adjustmentsCount,  int netAmountMinor,  int overtimeSeconds,  bool hasRate)  $default,) {final _that = this;
switch (_that) {
case _ShiftEarnings():
return $default(_that.currency,_that.grossAmountMinor,_that.penaltyAmountMinor,_that.penaltiesCount,_that.adjustmentAmountMinor,_that.adjustmentsCount,_that.netAmountMinor,_that.overtimeSeconds,_that.hasRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currency,  int grossAmountMinor,  int penaltyAmountMinor,  int penaltiesCount,  int adjustmentAmountMinor,  int adjustmentsCount,  int netAmountMinor,  int overtimeSeconds,  bool hasRate)?  $default,) {final _that = this;
switch (_that) {
case _ShiftEarnings() when $default != null:
return $default(_that.currency,_that.grossAmountMinor,_that.penaltyAmountMinor,_that.penaltiesCount,_that.adjustmentAmountMinor,_that.adjustmentsCount,_that.netAmountMinor,_that.overtimeSeconds,_that.hasRate);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftEarnings implements ShiftEarnings {
  const _ShiftEarnings({required this.currency, required this.grossAmountMinor, required this.penaltyAmountMinor, required this.penaltiesCount, required this.adjustmentAmountMinor, required this.adjustmentsCount, required this.netAmountMinor, required this.overtimeSeconds, required this.hasRate});
  

@override final  String currency;
@override final  int grossAmountMinor;
/// Только активные штрафы, привязанные к этой смене (`shift_id`).
@override final  int penaltyAmountMinor;
@override final  int penaltiesCount;
/// Только корректировки, привязанные к этой смене (`shift_id`);
/// знаковая сумма (может быть отрицательной).
@override final  int adjustmentAmountMinor;
@override final  int adjustmentsCount;
/// `gross − penalty + adjustment`, может быть отрицательным.
@override final  int netAmountMinor;
/// Согласованная переработка, уже учтённая в [grossAmountMinor].
@override final  int overtimeSeconds;
/// `false` — действующей ставки на момент начала смены не было.
@override final  bool hasRate;

/// Create a copy of ShiftEarnings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftEarningsCopyWith<_ShiftEarnings> get copyWith => __$ShiftEarningsCopyWithImpl<_ShiftEarnings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftEarnings&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.penaltyAmountMinor, penaltyAmountMinor) || other.penaltyAmountMinor == penaltyAmountMinor)&&(identical(other.penaltiesCount, penaltiesCount) || other.penaltiesCount == penaltiesCount)&&(identical(other.adjustmentAmountMinor, adjustmentAmountMinor) || other.adjustmentAmountMinor == adjustmentAmountMinor)&&(identical(other.adjustmentsCount, adjustmentsCount) || other.adjustmentsCount == adjustmentsCount)&&(identical(other.netAmountMinor, netAmountMinor) || other.netAmountMinor == netAmountMinor)&&(identical(other.overtimeSeconds, overtimeSeconds) || other.overtimeSeconds == overtimeSeconds)&&(identical(other.hasRate, hasRate) || other.hasRate == hasRate));
}


@override
int get hashCode => Object.hash(runtimeType,currency,grossAmountMinor,penaltyAmountMinor,penaltiesCount,adjustmentAmountMinor,adjustmentsCount,netAmountMinor,overtimeSeconds,hasRate);

@override
String toString() {
  return 'ShiftEarnings(currency: $currency, grossAmountMinor: $grossAmountMinor, penaltyAmountMinor: $penaltyAmountMinor, penaltiesCount: $penaltiesCount, adjustmentAmountMinor: $adjustmentAmountMinor, adjustmentsCount: $adjustmentsCount, netAmountMinor: $netAmountMinor, overtimeSeconds: $overtimeSeconds, hasRate: $hasRate)';
}


}

/// @nodoc
abstract mixin class _$ShiftEarningsCopyWith<$Res> implements $ShiftEarningsCopyWith<$Res> {
  factory _$ShiftEarningsCopyWith(_ShiftEarnings value, $Res Function(_ShiftEarnings) _then) = __$ShiftEarningsCopyWithImpl;
@override @useResult
$Res call({
 String currency, int grossAmountMinor, int penaltyAmountMinor, int penaltiesCount, int adjustmentAmountMinor, int adjustmentsCount, int netAmountMinor, int overtimeSeconds, bool hasRate
});




}
/// @nodoc
class __$ShiftEarningsCopyWithImpl<$Res>
    implements _$ShiftEarningsCopyWith<$Res> {
  __$ShiftEarningsCopyWithImpl(this._self, this._then);

  final _ShiftEarnings _self;
  final $Res Function(_ShiftEarnings) _then;

/// Create a copy of ShiftEarnings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? grossAmountMinor = null,Object? penaltyAmountMinor = null,Object? penaltiesCount = null,Object? adjustmentAmountMinor = null,Object? adjustmentsCount = null,Object? netAmountMinor = null,Object? overtimeSeconds = null,Object? hasRate = null,}) {
  return _then(_ShiftEarnings(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,penaltyAmountMinor: null == penaltyAmountMinor ? _self.penaltyAmountMinor : penaltyAmountMinor // ignore: cast_nullable_to_non_nullable
as int,penaltiesCount: null == penaltiesCount ? _self.penaltiesCount : penaltiesCount // ignore: cast_nullable_to_non_nullable
as int,adjustmentAmountMinor: null == adjustmentAmountMinor ? _self.adjustmentAmountMinor : adjustmentAmountMinor // ignore: cast_nullable_to_non_nullable
as int,adjustmentsCount: null == adjustmentsCount ? _self.adjustmentsCount : adjustmentsCount // ignore: cast_nullable_to_non_nullable
as int,netAmountMinor: null == netAmountMinor ? _self.netAmountMinor : netAmountMinor // ignore: cast_nullable_to_non_nullable
as int,overtimeSeconds: null == overtimeSeconds ? _self.overtimeSeconds : overtimeSeconds // ignore: cast_nullable_to_non_nullable
as int,hasRate: null == hasRate ? _self.hasRate : hasRate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
