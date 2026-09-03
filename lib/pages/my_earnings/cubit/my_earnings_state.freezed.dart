// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_earnings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyEarningsState {

 SectionData<MyEarnings> get earnings;/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
/// По умолчанию — текущий месяц (ТЗ payroll).
 PeriodPreset? get preset;/// Границы произвольного окна (UTC); активны при `preset == null`.
 DateTime? get customFrom; DateTime? get customTo;/// IANA-таймзона организации — заработок всегда её бизнес-события.
/// Дефолт до загрузки совпадает с server_default `Organization.timezone`.
 String get organizationTimezone;
/// Create a copy of MyEarningsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyEarningsStateCopyWith<MyEarningsState> get copyWith => _$MyEarningsStateCopyWithImpl<MyEarningsState>(this as MyEarningsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyEarningsState&&(identical(other.earnings, earnings) || other.earnings == earnings)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}


@override
int get hashCode => Object.hash(runtimeType,earnings,preset,customFrom,customTo,organizationTimezone);

@override
String toString() {
  return 'MyEarningsState(earnings: $earnings, preset: $preset, customFrom: $customFrom, customTo: $customTo, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class $MyEarningsStateCopyWith<$Res>  {
  factory $MyEarningsStateCopyWith(MyEarningsState value, $Res Function(MyEarningsState) _then) = _$MyEarningsStateCopyWithImpl;
@useResult
$Res call({
 SectionData<MyEarnings> earnings, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo, String organizationTimezone
});


$SectionDataCopyWith<MyEarnings, $Res> get earnings;

}
/// @nodoc
class _$MyEarningsStateCopyWithImpl<$Res>
    implements $MyEarningsStateCopyWith<$Res> {
  _$MyEarningsStateCopyWithImpl(this._self, this._then);

  final MyEarningsState _self;
  final $Res Function(MyEarningsState) _then;

/// Create a copy of MyEarningsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? earnings = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,Object? organizationTimezone = null,}) {
  return _then(_self.copyWith(
earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as SectionData<MyEarnings>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,organizationTimezone: null == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MyEarningsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<MyEarnings, $Res> get earnings {
  
  return $SectionDataCopyWith<MyEarnings, $Res>(_self.earnings, (value) {
    return _then(_self.copyWith(earnings: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyEarningsState].
extension MyEarningsStatePatterns on MyEarningsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyEarningsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyEarningsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyEarningsState value)  $default,){
final _that = this;
switch (_that) {
case _MyEarningsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyEarningsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyEarningsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<MyEarnings> earnings,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo,  String organizationTimezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyEarningsState() when $default != null:
return $default(_that.earnings,_that.preset,_that.customFrom,_that.customTo,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<MyEarnings> earnings,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo,  String organizationTimezone)  $default,) {final _that = this;
switch (_that) {
case _MyEarningsState():
return $default(_that.earnings,_that.preset,_that.customFrom,_that.customTo,_that.organizationTimezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<MyEarnings> earnings,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo,  String organizationTimezone)?  $default,) {final _that = this;
switch (_that) {
case _MyEarningsState() when $default != null:
return $default(_that.earnings,_that.preset,_that.customFrom,_that.customTo,_that.organizationTimezone);case _:
  return null;

}
}

}

/// @nodoc


class _MyEarningsState extends MyEarningsState {
  const _MyEarningsState({this.earnings = const SectionData<MyEarnings>(), this.preset = PeriodPreset.month, this.customFrom, this.customTo, this.organizationTimezone = 'Europe/Moscow'}): super._();
  

@override@JsonKey() final  SectionData<MyEarnings> earnings;
/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
/// По умолчанию — текущий месяц (ТЗ payroll).
@override@JsonKey() final  PeriodPreset? preset;
/// Границы произвольного окна (UTC); активны при `preset == null`.
@override final  DateTime? customFrom;
@override final  DateTime? customTo;
/// IANA-таймзона организации — заработок всегда её бизнес-события.
/// Дефолт до загрузки совпадает с server_default `Organization.timezone`.
@override@JsonKey() final  String organizationTimezone;

/// Create a copy of MyEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyEarningsStateCopyWith<_MyEarningsState> get copyWith => __$MyEarningsStateCopyWithImpl<_MyEarningsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyEarningsState&&(identical(other.earnings, earnings) || other.earnings == earnings)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo)&&(identical(other.organizationTimezone, organizationTimezone) || other.organizationTimezone == organizationTimezone));
}


@override
int get hashCode => Object.hash(runtimeType,earnings,preset,customFrom,customTo,organizationTimezone);

@override
String toString() {
  return 'MyEarningsState(earnings: $earnings, preset: $preset, customFrom: $customFrom, customTo: $customTo, organizationTimezone: $organizationTimezone)';
}


}

/// @nodoc
abstract mixin class _$MyEarningsStateCopyWith<$Res> implements $MyEarningsStateCopyWith<$Res> {
  factory _$MyEarningsStateCopyWith(_MyEarningsState value, $Res Function(_MyEarningsState) _then) = __$MyEarningsStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<MyEarnings> earnings, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo, String organizationTimezone
});


@override $SectionDataCopyWith<MyEarnings, $Res> get earnings;

}
/// @nodoc
class __$MyEarningsStateCopyWithImpl<$Res>
    implements _$MyEarningsStateCopyWith<$Res> {
  __$MyEarningsStateCopyWithImpl(this._self, this._then);

  final _MyEarningsState _self;
  final $Res Function(_MyEarningsState) _then;

/// Create a copy of MyEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? earnings = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,Object? organizationTimezone = null,}) {
  return _then(_MyEarningsState(
earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as SectionData<MyEarnings>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,organizationTimezone: null == organizationTimezone ? _self.organizationTimezone : organizationTimezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MyEarningsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<MyEarnings, $Res> get earnings {
  
  return $SectionDataCopyWith<MyEarnings, $Res>(_self.earnings, (value) {
    return _then(_self.copyWith(earnings: value));
  });
}
}

// dart format on
