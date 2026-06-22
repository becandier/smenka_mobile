// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_earnings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyEarningsDto {

 PayrollPeriodDto get period; String get currency; int get workedSeconds; int get shiftsCount; int get grossAmountMinor; bool get hasMissingRate; int get penaltyAmountMinor; int get penaltiesCount; int get netAmountMinor; CurrentRateDto? get currentRate;
/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyEarningsDtoCopyWith<MyEarningsDto> get copyWith => _$MyEarningsDtoCopyWithImpl<MyEarningsDto>(this as MyEarningsDto, _$identity);

  /// Serializes this MyEarningsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyEarningsDto&&(identical(other.period, period) || other.period == period)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.hasMissingRate, hasMissingRate) || other.hasMissingRate == hasMissingRate)&&(identical(other.penaltyAmountMinor, penaltyAmountMinor) || other.penaltyAmountMinor == penaltyAmountMinor)&&(identical(other.penaltiesCount, penaltiesCount) || other.penaltiesCount == penaltiesCount)&&(identical(other.netAmountMinor, netAmountMinor) || other.netAmountMinor == netAmountMinor)&&(identical(other.currentRate, currentRate) || other.currentRate == currentRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,currency,workedSeconds,shiftsCount,grossAmountMinor,hasMissingRate,penaltyAmountMinor,penaltiesCount,netAmountMinor,currentRate);

@override
String toString() {
  return 'MyEarningsDto(period: $period, currency: $currency, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, hasMissingRate: $hasMissingRate, penaltyAmountMinor: $penaltyAmountMinor, penaltiesCount: $penaltiesCount, netAmountMinor: $netAmountMinor, currentRate: $currentRate)';
}


}

/// @nodoc
abstract mixin class $MyEarningsDtoCopyWith<$Res>  {
  factory $MyEarningsDtoCopyWith(MyEarningsDto value, $Res Function(MyEarningsDto) _then) = _$MyEarningsDtoCopyWithImpl;
@useResult
$Res call({
 PayrollPeriodDto period, String currency, int workedSeconds, int shiftsCount, int grossAmountMinor, bool hasMissingRate, int penaltyAmountMinor, int penaltiesCount, int netAmountMinor, CurrentRateDto? currentRate
});


$PayrollPeriodDtoCopyWith<$Res> get period;$CurrentRateDtoCopyWith<$Res>? get currentRate;

}
/// @nodoc
class _$MyEarningsDtoCopyWithImpl<$Res>
    implements $MyEarningsDtoCopyWith<$Res> {
  _$MyEarningsDtoCopyWithImpl(this._self, this._then);

  final MyEarningsDto _self;
  final $Res Function(MyEarningsDto) _then;

/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? currency = null,Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,Object? hasMissingRate = null,Object? penaltyAmountMinor = null,Object? penaltiesCount = null,Object? netAmountMinor = null,Object? currentRate = freezed,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PayrollPeriodDto,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,hasMissingRate: null == hasMissingRate ? _self.hasMissingRate : hasMissingRate // ignore: cast_nullable_to_non_nullable
as bool,penaltyAmountMinor: null == penaltyAmountMinor ? _self.penaltyAmountMinor : penaltyAmountMinor // ignore: cast_nullable_to_non_nullable
as int,penaltiesCount: null == penaltiesCount ? _self.penaltiesCount : penaltiesCount // ignore: cast_nullable_to_non_nullable
as int,netAmountMinor: null == netAmountMinor ? _self.netAmountMinor : netAmountMinor // ignore: cast_nullable_to_non_nullable
as int,currentRate: freezed == currentRate ? _self.currentRate : currentRate // ignore: cast_nullable_to_non_nullable
as CurrentRateDto?,
  ));
}
/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollPeriodDtoCopyWith<$Res> get period {
  
  return $PayrollPeriodDtoCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentRateDtoCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
    return null;
  }

  return $CurrentRateDtoCopyWith<$Res>(_self.currentRate!, (value) {
    return _then(_self.copyWith(currentRate: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyEarningsDto].
extension MyEarningsDtoPatterns on MyEarningsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyEarningsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyEarningsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyEarningsDto value)  $default,){
final _that = this;
switch (_that) {
case _MyEarningsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyEarningsDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyEarningsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PayrollPeriodDto period,  String currency,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  bool hasMissingRate,  int penaltyAmountMinor,  int penaltiesCount,  int netAmountMinor,  CurrentRateDto? currentRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyEarningsDto() when $default != null:
return $default(_that.period,_that.currency,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.hasMissingRate,_that.penaltyAmountMinor,_that.penaltiesCount,_that.netAmountMinor,_that.currentRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PayrollPeriodDto period,  String currency,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  bool hasMissingRate,  int penaltyAmountMinor,  int penaltiesCount,  int netAmountMinor,  CurrentRateDto? currentRate)  $default,) {final _that = this;
switch (_that) {
case _MyEarningsDto():
return $default(_that.period,_that.currency,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.hasMissingRate,_that.penaltyAmountMinor,_that.penaltiesCount,_that.netAmountMinor,_that.currentRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PayrollPeriodDto period,  String currency,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  bool hasMissingRate,  int penaltyAmountMinor,  int penaltiesCount,  int netAmountMinor,  CurrentRateDto? currentRate)?  $default,) {final _that = this;
switch (_that) {
case _MyEarningsDto() when $default != null:
return $default(_that.period,_that.currency,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.hasMissingRate,_that.penaltyAmountMinor,_that.penaltiesCount,_that.netAmountMinor,_that.currentRate);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _MyEarningsDto implements MyEarningsDto {
  const _MyEarningsDto({required this.period, required this.currency, required this.workedSeconds, required this.shiftsCount, required this.grossAmountMinor, required this.hasMissingRate, this.penaltyAmountMinor = 0, this.penaltiesCount = 0, this.netAmountMinor = 0, this.currentRate});
  factory _MyEarningsDto.fromJson(Map<String, dynamic> json) => _$MyEarningsDtoFromJson(json);

@override final  PayrollPeriodDto period;
@override final  String currency;
@override final  int workedSeconds;
@override final  int shiftsCount;
@override final  int grossAmountMinor;
@override final  bool hasMissingRate;
@override@JsonKey() final  int penaltyAmountMinor;
@override@JsonKey() final  int penaltiesCount;
@override@JsonKey() final  int netAmountMinor;
@override final  CurrentRateDto? currentRate;

/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyEarningsDtoCopyWith<_MyEarningsDto> get copyWith => __$MyEarningsDtoCopyWithImpl<_MyEarningsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyEarningsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyEarningsDto&&(identical(other.period, period) || other.period == period)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.hasMissingRate, hasMissingRate) || other.hasMissingRate == hasMissingRate)&&(identical(other.penaltyAmountMinor, penaltyAmountMinor) || other.penaltyAmountMinor == penaltyAmountMinor)&&(identical(other.penaltiesCount, penaltiesCount) || other.penaltiesCount == penaltiesCount)&&(identical(other.netAmountMinor, netAmountMinor) || other.netAmountMinor == netAmountMinor)&&(identical(other.currentRate, currentRate) || other.currentRate == currentRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,currency,workedSeconds,shiftsCount,grossAmountMinor,hasMissingRate,penaltyAmountMinor,penaltiesCount,netAmountMinor,currentRate);

@override
String toString() {
  return 'MyEarningsDto(period: $period, currency: $currency, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, hasMissingRate: $hasMissingRate, penaltyAmountMinor: $penaltyAmountMinor, penaltiesCount: $penaltiesCount, netAmountMinor: $netAmountMinor, currentRate: $currentRate)';
}


}

/// @nodoc
abstract mixin class _$MyEarningsDtoCopyWith<$Res> implements $MyEarningsDtoCopyWith<$Res> {
  factory _$MyEarningsDtoCopyWith(_MyEarningsDto value, $Res Function(_MyEarningsDto) _then) = __$MyEarningsDtoCopyWithImpl;
@override @useResult
$Res call({
 PayrollPeriodDto period, String currency, int workedSeconds, int shiftsCount, int grossAmountMinor, bool hasMissingRate, int penaltyAmountMinor, int penaltiesCount, int netAmountMinor, CurrentRateDto? currentRate
});


@override $PayrollPeriodDtoCopyWith<$Res> get period;@override $CurrentRateDtoCopyWith<$Res>? get currentRate;

}
/// @nodoc
class __$MyEarningsDtoCopyWithImpl<$Res>
    implements _$MyEarningsDtoCopyWith<$Res> {
  __$MyEarningsDtoCopyWithImpl(this._self, this._then);

  final _MyEarningsDto _self;
  final $Res Function(_MyEarningsDto) _then;

/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? currency = null,Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,Object? hasMissingRate = null,Object? penaltyAmountMinor = null,Object? penaltiesCount = null,Object? netAmountMinor = null,Object? currentRate = freezed,}) {
  return _then(_MyEarningsDto(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PayrollPeriodDto,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,hasMissingRate: null == hasMissingRate ? _self.hasMissingRate : hasMissingRate // ignore: cast_nullable_to_non_nullable
as bool,penaltyAmountMinor: null == penaltyAmountMinor ? _self.penaltyAmountMinor : penaltyAmountMinor // ignore: cast_nullable_to_non_nullable
as int,penaltiesCount: null == penaltiesCount ? _self.penaltiesCount : penaltiesCount // ignore: cast_nullable_to_non_nullable
as int,netAmountMinor: null == netAmountMinor ? _self.netAmountMinor : netAmountMinor // ignore: cast_nullable_to_non_nullable
as int,currentRate: freezed == currentRate ? _self.currentRate : currentRate // ignore: cast_nullable_to_non_nullable
as CurrentRateDto?,
  ));
}

/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollPeriodDtoCopyWith<$Res> get period {
  
  return $PayrollPeriodDtoCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of MyEarningsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentRateDtoCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
    return null;
  }

  return $CurrentRateDtoCopyWith<$Res>(_self.currentRate!, (value) {
    return _then(_self.copyWith(currentRate: value));
  });
}
}

// dart format on
