// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_earnings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyEarnings {

 PayrollPeriod get period; String get currency; int get workedSeconds; int get shiftsCount; int get grossAmountMinor; bool get hasMissingRate;/// Действующая ставка; null — ставка ещё не задана.
 CurrentRate? get currentRate;
/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyEarningsCopyWith<MyEarnings> get copyWith => _$MyEarningsCopyWithImpl<MyEarnings>(this as MyEarnings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyEarnings&&(identical(other.period, period) || other.period == period)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.hasMissingRate, hasMissingRate) || other.hasMissingRate == hasMissingRate)&&(identical(other.currentRate, currentRate) || other.currentRate == currentRate));
}


@override
int get hashCode => Object.hash(runtimeType,period,currency,workedSeconds,shiftsCount,grossAmountMinor,hasMissingRate,currentRate);

@override
String toString() {
  return 'MyEarnings(period: $period, currency: $currency, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, hasMissingRate: $hasMissingRate, currentRate: $currentRate)';
}


}

/// @nodoc
abstract mixin class $MyEarningsCopyWith<$Res>  {
  factory $MyEarningsCopyWith(MyEarnings value, $Res Function(MyEarnings) _then) = _$MyEarningsCopyWithImpl;
@useResult
$Res call({
 PayrollPeriod period, String currency, int workedSeconds, int shiftsCount, int grossAmountMinor, bool hasMissingRate, CurrentRate? currentRate
});


$PayrollPeriodCopyWith<$Res> get period;$CurrentRateCopyWith<$Res>? get currentRate;

}
/// @nodoc
class _$MyEarningsCopyWithImpl<$Res>
    implements $MyEarningsCopyWith<$Res> {
  _$MyEarningsCopyWithImpl(this._self, this._then);

  final MyEarnings _self;
  final $Res Function(MyEarnings) _then;

/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? currency = null,Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,Object? hasMissingRate = null,Object? currentRate = freezed,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PayrollPeriod,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,hasMissingRate: null == hasMissingRate ? _self.hasMissingRate : hasMissingRate // ignore: cast_nullable_to_non_nullable
as bool,currentRate: freezed == currentRate ? _self.currentRate : currentRate // ignore: cast_nullable_to_non_nullable
as CurrentRate?,
  ));
}
/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollPeriodCopyWith<$Res> get period {
  
  return $PayrollPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentRateCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
    return null;
  }

  return $CurrentRateCopyWith<$Res>(_self.currentRate!, (value) {
    return _then(_self.copyWith(currentRate: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyEarnings].
extension MyEarningsPatterns on MyEarnings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyEarnings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyEarnings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyEarnings value)  $default,){
final _that = this;
switch (_that) {
case _MyEarnings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyEarnings value)?  $default,){
final _that = this;
switch (_that) {
case _MyEarnings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PayrollPeriod period,  String currency,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  bool hasMissingRate,  CurrentRate? currentRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyEarnings() when $default != null:
return $default(_that.period,_that.currency,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.hasMissingRate,_that.currentRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PayrollPeriod period,  String currency,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  bool hasMissingRate,  CurrentRate? currentRate)  $default,) {final _that = this;
switch (_that) {
case _MyEarnings():
return $default(_that.period,_that.currency,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.hasMissingRate,_that.currentRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PayrollPeriod period,  String currency,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  bool hasMissingRate,  CurrentRate? currentRate)?  $default,) {final _that = this;
switch (_that) {
case _MyEarnings() when $default != null:
return $default(_that.period,_that.currency,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.hasMissingRate,_that.currentRate);case _:
  return null;

}
}

}

/// @nodoc


class _MyEarnings implements MyEarnings {
  const _MyEarnings({required this.period, required this.currency, required this.workedSeconds, required this.shiftsCount, required this.grossAmountMinor, required this.hasMissingRate, this.currentRate});
  

@override final  PayrollPeriod period;
@override final  String currency;
@override final  int workedSeconds;
@override final  int shiftsCount;
@override final  int grossAmountMinor;
@override final  bool hasMissingRate;
/// Действующая ставка; null — ставка ещё не задана.
@override final  CurrentRate? currentRate;

/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyEarningsCopyWith<_MyEarnings> get copyWith => __$MyEarningsCopyWithImpl<_MyEarnings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyEarnings&&(identical(other.period, period) || other.period == period)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.hasMissingRate, hasMissingRate) || other.hasMissingRate == hasMissingRate)&&(identical(other.currentRate, currentRate) || other.currentRate == currentRate));
}


@override
int get hashCode => Object.hash(runtimeType,period,currency,workedSeconds,shiftsCount,grossAmountMinor,hasMissingRate,currentRate);

@override
String toString() {
  return 'MyEarnings(period: $period, currency: $currency, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, hasMissingRate: $hasMissingRate, currentRate: $currentRate)';
}


}

/// @nodoc
abstract mixin class _$MyEarningsCopyWith<$Res> implements $MyEarningsCopyWith<$Res> {
  factory _$MyEarningsCopyWith(_MyEarnings value, $Res Function(_MyEarnings) _then) = __$MyEarningsCopyWithImpl;
@override @useResult
$Res call({
 PayrollPeriod period, String currency, int workedSeconds, int shiftsCount, int grossAmountMinor, bool hasMissingRate, CurrentRate? currentRate
});


@override $PayrollPeriodCopyWith<$Res> get period;@override $CurrentRateCopyWith<$Res>? get currentRate;

}
/// @nodoc
class __$MyEarningsCopyWithImpl<$Res>
    implements _$MyEarningsCopyWith<$Res> {
  __$MyEarningsCopyWithImpl(this._self, this._then);

  final _MyEarnings _self;
  final $Res Function(_MyEarnings) _then;

/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? currency = null,Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,Object? hasMissingRate = null,Object? currentRate = freezed,}) {
  return _then(_MyEarnings(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PayrollPeriod,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,hasMissingRate: null == hasMissingRate ? _self.hasMissingRate : hasMissingRate // ignore: cast_nullable_to_non_nullable
as bool,currentRate: freezed == currentRate ? _self.currentRate : currentRate // ignore: cast_nullable_to_non_nullable
as CurrentRate?,
  ));
}

/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollPeriodCopyWith<$Res> get period {
  
  return $PayrollPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of MyEarnings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentRateCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
    return null;
  }

  return $CurrentRateCopyWith<$Res>(_self.currentRate!, (value) {
    return _then(_self.copyWith(currentRate: value));
  });
}
}

// dart format on
