// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payroll.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PayrollPeriod {

 DateTime? get dateFrom; DateTime? get dateTo;
/// Create a copy of PayrollPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayrollPeriodCopyWith<PayrollPeriod> get copyWith => _$PayrollPeriodCopyWithImpl<PayrollPeriod>(this as PayrollPeriod, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayrollPeriod&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,dateFrom,dateTo);

@override
String toString() {
  return 'PayrollPeriod(dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class $PayrollPeriodCopyWith<$Res>  {
  factory $PayrollPeriodCopyWith(PayrollPeriod value, $Res Function(PayrollPeriod) _then) = _$PayrollPeriodCopyWithImpl;
@useResult
$Res call({
 DateTime? dateFrom, DateTime? dateTo
});




}
/// @nodoc
class _$PayrollPeriodCopyWithImpl<$Res>
    implements $PayrollPeriodCopyWith<$Res> {
  _$PayrollPeriodCopyWithImpl(this._self, this._then);

  final PayrollPeriod _self;
  final $Res Function(PayrollPeriod) _then;

/// Create a copy of PayrollPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(_self.copyWith(
dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayrollPeriod].
extension PayrollPeriodPatterns on PayrollPeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayrollPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayrollPeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayrollPeriod value)  $default,){
final _that = this;
switch (_that) {
case _PayrollPeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayrollPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _PayrollPeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? dateFrom,  DateTime? dateTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayrollPeriod() when $default != null:
return $default(_that.dateFrom,_that.dateTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? dateFrom,  DateTime? dateTo)  $default,) {final _that = this;
switch (_that) {
case _PayrollPeriod():
return $default(_that.dateFrom,_that.dateTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? dateFrom,  DateTime? dateTo)?  $default,) {final _that = this;
switch (_that) {
case _PayrollPeriod() when $default != null:
return $default(_that.dateFrom,_that.dateTo);case _:
  return null;

}
}

}

/// @nodoc


class _PayrollPeriod implements PayrollPeriod {
  const _PayrollPeriod({this.dateFrom, this.dateTo});
  

@override final  DateTime? dateFrom;
@override final  DateTime? dateTo;

/// Create a copy of PayrollPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayrollPeriodCopyWith<_PayrollPeriod> get copyWith => __$PayrollPeriodCopyWithImpl<_PayrollPeriod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayrollPeriod&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,dateFrom,dateTo);

@override
String toString() {
  return 'PayrollPeriod(dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class _$PayrollPeriodCopyWith<$Res> implements $PayrollPeriodCopyWith<$Res> {
  factory _$PayrollPeriodCopyWith(_PayrollPeriod value, $Res Function(_PayrollPeriod) _then) = __$PayrollPeriodCopyWithImpl;
@override @useResult
$Res call({
 DateTime? dateFrom, DateTime? dateTo
});




}
/// @nodoc
class __$PayrollPeriodCopyWithImpl<$Res>
    implements _$PayrollPeriodCopyWith<$Res> {
  __$PayrollPeriodCopyWithImpl(this._self, this._then);

  final _PayrollPeriod _self;
  final $Res Function(_PayrollPeriod) _then;

/// Create a copy of PayrollPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(_PayrollPeriod(
dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$PayrollItem {

 String get userId; String get userName; int get workedSeconds; int get shiftsCount; int get grossAmountMinor;/// Время/число смен без действующей ставки (не вошли в gross).
 int get unpaidSeconds; int get unpaidShiftsCount; bool get hasMissingRate;
/// Create a copy of PayrollItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayrollItemCopyWith<PayrollItem> get copyWith => _$PayrollItemCopyWithImpl<PayrollItem>(this as PayrollItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayrollItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.unpaidSeconds, unpaidSeconds) || other.unpaidSeconds == unpaidSeconds)&&(identical(other.unpaidShiftsCount, unpaidShiftsCount) || other.unpaidShiftsCount == unpaidShiftsCount)&&(identical(other.hasMissingRate, hasMissingRate) || other.hasMissingRate == hasMissingRate));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,workedSeconds,shiftsCount,grossAmountMinor,unpaidSeconds,unpaidShiftsCount,hasMissingRate);

@override
String toString() {
  return 'PayrollItem(userId: $userId, userName: $userName, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, unpaidSeconds: $unpaidSeconds, unpaidShiftsCount: $unpaidShiftsCount, hasMissingRate: $hasMissingRate)';
}


}

/// @nodoc
abstract mixin class $PayrollItemCopyWith<$Res>  {
  factory $PayrollItemCopyWith(PayrollItem value, $Res Function(PayrollItem) _then) = _$PayrollItemCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, int workedSeconds, int shiftsCount, int grossAmountMinor, int unpaidSeconds, int unpaidShiftsCount, bool hasMissingRate
});




}
/// @nodoc
class _$PayrollItemCopyWithImpl<$Res>
    implements $PayrollItemCopyWith<$Res> {
  _$PayrollItemCopyWithImpl(this._self, this._then);

  final PayrollItem _self;
  final $Res Function(PayrollItem) _then;

/// Create a copy of PayrollItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? userName = null,Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,Object? unpaidSeconds = null,Object? unpaidShiftsCount = null,Object? hasMissingRate = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,unpaidSeconds: null == unpaidSeconds ? _self.unpaidSeconds : unpaidSeconds // ignore: cast_nullable_to_non_nullable
as int,unpaidShiftsCount: null == unpaidShiftsCount ? _self.unpaidShiftsCount : unpaidShiftsCount // ignore: cast_nullable_to_non_nullable
as int,hasMissingRate: null == hasMissingRate ? _self.hasMissingRate : hasMissingRate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PayrollItem].
extension PayrollItemPatterns on PayrollItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayrollItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayrollItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayrollItem value)  $default,){
final _that = this;
switch (_that) {
case _PayrollItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayrollItem value)?  $default,){
final _that = this;
switch (_that) {
case _PayrollItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String userName,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  int unpaidSeconds,  int unpaidShiftsCount,  bool hasMissingRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayrollItem() when $default != null:
return $default(_that.userId,_that.userName,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.unpaidSeconds,_that.unpaidShiftsCount,_that.hasMissingRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String userName,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  int unpaidSeconds,  int unpaidShiftsCount,  bool hasMissingRate)  $default,) {final _that = this;
switch (_that) {
case _PayrollItem():
return $default(_that.userId,_that.userName,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.unpaidSeconds,_that.unpaidShiftsCount,_that.hasMissingRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String userName,  int workedSeconds,  int shiftsCount,  int grossAmountMinor,  int unpaidSeconds,  int unpaidShiftsCount,  bool hasMissingRate)?  $default,) {final _that = this;
switch (_that) {
case _PayrollItem() when $default != null:
return $default(_that.userId,_that.userName,_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor,_that.unpaidSeconds,_that.unpaidShiftsCount,_that.hasMissingRate);case _:
  return null;

}
}

}

/// @nodoc


class _PayrollItem implements PayrollItem {
  const _PayrollItem({required this.userId, required this.userName, required this.workedSeconds, required this.shiftsCount, required this.grossAmountMinor, required this.unpaidSeconds, required this.unpaidShiftsCount, required this.hasMissingRate});
  

@override final  String userId;
@override final  String userName;
@override final  int workedSeconds;
@override final  int shiftsCount;
@override final  int grossAmountMinor;
/// Время/число смен без действующей ставки (не вошли в gross).
@override final  int unpaidSeconds;
@override final  int unpaidShiftsCount;
@override final  bool hasMissingRate;

/// Create a copy of PayrollItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayrollItemCopyWith<_PayrollItem> get copyWith => __$PayrollItemCopyWithImpl<_PayrollItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayrollItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor)&&(identical(other.unpaidSeconds, unpaidSeconds) || other.unpaidSeconds == unpaidSeconds)&&(identical(other.unpaidShiftsCount, unpaidShiftsCount) || other.unpaidShiftsCount == unpaidShiftsCount)&&(identical(other.hasMissingRate, hasMissingRate) || other.hasMissingRate == hasMissingRate));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,workedSeconds,shiftsCount,grossAmountMinor,unpaidSeconds,unpaidShiftsCount,hasMissingRate);

@override
String toString() {
  return 'PayrollItem(userId: $userId, userName: $userName, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, unpaidSeconds: $unpaidSeconds, unpaidShiftsCount: $unpaidShiftsCount, hasMissingRate: $hasMissingRate)';
}


}

/// @nodoc
abstract mixin class _$PayrollItemCopyWith<$Res> implements $PayrollItemCopyWith<$Res> {
  factory _$PayrollItemCopyWith(_PayrollItem value, $Res Function(_PayrollItem) _then) = __$PayrollItemCopyWithImpl;
@override @useResult
$Res call({
 String userId, String userName, int workedSeconds, int shiftsCount, int grossAmountMinor, int unpaidSeconds, int unpaidShiftsCount, bool hasMissingRate
});




}
/// @nodoc
class __$PayrollItemCopyWithImpl<$Res>
    implements _$PayrollItemCopyWith<$Res> {
  __$PayrollItemCopyWithImpl(this._self, this._then);

  final _PayrollItem _self;
  final $Res Function(_PayrollItem) _then;

/// Create a copy of PayrollItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,Object? unpaidSeconds = null,Object? unpaidShiftsCount = null,Object? hasMissingRate = null,}) {
  return _then(_PayrollItem(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,unpaidSeconds: null == unpaidSeconds ? _self.unpaidSeconds : unpaidSeconds // ignore: cast_nullable_to_non_nullable
as int,unpaidShiftsCount: null == unpaidShiftsCount ? _self.unpaidShiftsCount : unpaidShiftsCount // ignore: cast_nullable_to_non_nullable
as int,hasMissingRate: null == hasMissingRate ? _self.hasMissingRate : hasMissingRate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PayrollTotals {

 int get workedSeconds; int get shiftsCount; int get grossAmountMinor;
/// Create a copy of PayrollTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayrollTotalsCopyWith<PayrollTotals> get copyWith => _$PayrollTotalsCopyWithImpl<PayrollTotals>(this as PayrollTotals, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayrollTotals&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor));
}


@override
int get hashCode => Object.hash(runtimeType,workedSeconds,shiftsCount,grossAmountMinor);

@override
String toString() {
  return 'PayrollTotals(workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor)';
}


}

/// @nodoc
abstract mixin class $PayrollTotalsCopyWith<$Res>  {
  factory $PayrollTotalsCopyWith(PayrollTotals value, $Res Function(PayrollTotals) _then) = _$PayrollTotalsCopyWithImpl;
@useResult
$Res call({
 int workedSeconds, int shiftsCount, int grossAmountMinor
});




}
/// @nodoc
class _$PayrollTotalsCopyWithImpl<$Res>
    implements $PayrollTotalsCopyWith<$Res> {
  _$PayrollTotalsCopyWithImpl(this._self, this._then);

  final PayrollTotals _self;
  final $Res Function(PayrollTotals) _then;

/// Create a copy of PayrollTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,}) {
  return _then(_self.copyWith(
workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PayrollTotals].
extension PayrollTotalsPatterns on PayrollTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayrollTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayrollTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayrollTotals value)  $default,){
final _that = this;
switch (_that) {
case _PayrollTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayrollTotals value)?  $default,){
final _that = this;
switch (_that) {
case _PayrollTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int workedSeconds,  int shiftsCount,  int grossAmountMinor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayrollTotals() when $default != null:
return $default(_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int workedSeconds,  int shiftsCount,  int grossAmountMinor)  $default,) {final _that = this;
switch (_that) {
case _PayrollTotals():
return $default(_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int workedSeconds,  int shiftsCount,  int grossAmountMinor)?  $default,) {final _that = this;
switch (_that) {
case _PayrollTotals() when $default != null:
return $default(_that.workedSeconds,_that.shiftsCount,_that.grossAmountMinor);case _:
  return null;

}
}

}

/// @nodoc


class _PayrollTotals implements PayrollTotals {
  const _PayrollTotals({required this.workedSeconds, required this.shiftsCount, required this.grossAmountMinor});
  

@override final  int workedSeconds;
@override final  int shiftsCount;
@override final  int grossAmountMinor;

/// Create a copy of PayrollTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayrollTotalsCopyWith<_PayrollTotals> get copyWith => __$PayrollTotalsCopyWithImpl<_PayrollTotals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayrollTotals&&(identical(other.workedSeconds, workedSeconds) || other.workedSeconds == workedSeconds)&&(identical(other.shiftsCount, shiftsCount) || other.shiftsCount == shiftsCount)&&(identical(other.grossAmountMinor, grossAmountMinor) || other.grossAmountMinor == grossAmountMinor));
}


@override
int get hashCode => Object.hash(runtimeType,workedSeconds,shiftsCount,grossAmountMinor);

@override
String toString() {
  return 'PayrollTotals(workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor)';
}


}

/// @nodoc
abstract mixin class _$PayrollTotalsCopyWith<$Res> implements $PayrollTotalsCopyWith<$Res> {
  factory _$PayrollTotalsCopyWith(_PayrollTotals value, $Res Function(_PayrollTotals) _then) = __$PayrollTotalsCopyWithImpl;
@override @useResult
$Res call({
 int workedSeconds, int shiftsCount, int grossAmountMinor
});




}
/// @nodoc
class __$PayrollTotalsCopyWithImpl<$Res>
    implements _$PayrollTotalsCopyWith<$Res> {
  __$PayrollTotalsCopyWithImpl(this._self, this._then);

  final _PayrollTotals _self;
  final $Res Function(_PayrollTotals) _then;

/// Create a copy of PayrollTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workedSeconds = null,Object? shiftsCount = null,Object? grossAmountMinor = null,}) {
  return _then(_PayrollTotals(
workedSeconds: null == workedSeconds ? _self.workedSeconds : workedSeconds // ignore: cast_nullable_to_non_nullable
as int,shiftsCount: null == shiftsCount ? _self.shiftsCount : shiftsCount // ignore: cast_nullable_to_non_nullable
as int,grossAmountMinor: null == grossAmountMinor ? _self.grossAmountMinor : grossAmountMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Payroll {

 PayrollPeriod get period; String get currency; List<PayrollItem> get items; PayrollTotals get totals;
/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayrollCopyWith<Payroll> get copyWith => _$PayrollCopyWithImpl<Payroll>(this as Payroll, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payroll&&(identical(other.period, period) || other.period == period)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals));
}


@override
int get hashCode => Object.hash(runtimeType,period,currency,const DeepCollectionEquality().hash(items),totals);

@override
String toString() {
  return 'Payroll(period: $period, currency: $currency, items: $items, totals: $totals)';
}


}

/// @nodoc
abstract mixin class $PayrollCopyWith<$Res>  {
  factory $PayrollCopyWith(Payroll value, $Res Function(Payroll) _then) = _$PayrollCopyWithImpl;
@useResult
$Res call({
 PayrollPeriod period, String currency, List<PayrollItem> items, PayrollTotals totals
});


$PayrollPeriodCopyWith<$Res> get period;$PayrollTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class _$PayrollCopyWithImpl<$Res>
    implements $PayrollCopyWith<$Res> {
  _$PayrollCopyWithImpl(this._self, this._then);

  final Payroll _self;
  final $Res Function(Payroll) _then;

/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? currency = null,Object? items = null,Object? totals = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PayrollPeriod,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PayrollItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as PayrollTotals,
  ));
}
/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollPeriodCopyWith<$Res> get period {
  
  return $PayrollPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollTotalsCopyWith<$Res> get totals {
  
  return $PayrollTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [Payroll].
extension PayrollPatterns on Payroll {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payroll value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payroll() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payroll value)  $default,){
final _that = this;
switch (_that) {
case _Payroll():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payroll value)?  $default,){
final _that = this;
switch (_that) {
case _Payroll() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PayrollPeriod period,  String currency,  List<PayrollItem> items,  PayrollTotals totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payroll() when $default != null:
return $default(_that.period,_that.currency,_that.items,_that.totals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PayrollPeriod period,  String currency,  List<PayrollItem> items,  PayrollTotals totals)  $default,) {final _that = this;
switch (_that) {
case _Payroll():
return $default(_that.period,_that.currency,_that.items,_that.totals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PayrollPeriod period,  String currency,  List<PayrollItem> items,  PayrollTotals totals)?  $default,) {final _that = this;
switch (_that) {
case _Payroll() when $default != null:
return $default(_that.period,_that.currency,_that.items,_that.totals);case _:
  return null;

}
}

}

/// @nodoc


class _Payroll implements Payroll {
  const _Payroll({required this.period, required this.currency, required final  List<PayrollItem> items, required this.totals}): _items = items;
  

@override final  PayrollPeriod period;
@override final  String currency;
 final  List<PayrollItem> _items;
@override List<PayrollItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  PayrollTotals totals;

/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayrollCopyWith<_Payroll> get copyWith => __$PayrollCopyWithImpl<_Payroll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payroll&&(identical(other.period, period) || other.period == period)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals));
}


@override
int get hashCode => Object.hash(runtimeType,period,currency,const DeepCollectionEquality().hash(_items),totals);

@override
String toString() {
  return 'Payroll(period: $period, currency: $currency, items: $items, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$PayrollCopyWith<$Res> implements $PayrollCopyWith<$Res> {
  factory _$PayrollCopyWith(_Payroll value, $Res Function(_Payroll) _then) = __$PayrollCopyWithImpl;
@override @useResult
$Res call({
 PayrollPeriod period, String currency, List<PayrollItem> items, PayrollTotals totals
});


@override $PayrollPeriodCopyWith<$Res> get period;@override $PayrollTotalsCopyWith<$Res> get totals;

}
/// @nodoc
class __$PayrollCopyWithImpl<$Res>
    implements _$PayrollCopyWith<$Res> {
  __$PayrollCopyWithImpl(this._self, this._then);

  final _Payroll _self;
  final $Res Function(_Payroll) _then;

/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? currency = null,Object? items = null,Object? totals = null,}) {
  return _then(_Payroll(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PayrollPeriod,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PayrollItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as PayrollTotals,
  ));
}

/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollPeriodCopyWith<$Res> get period {
  
  return $PayrollPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of Payroll
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayrollTotalsCopyWith<$Res> get totals {
  
  return $PayrollTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}

// dart format on
