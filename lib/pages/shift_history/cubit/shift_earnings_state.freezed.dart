// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_earnings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftEarningsState {

 SectionData<MyEarnings> get earnings;/// Контекст (`shift_history_scope`), приходит извне от
/// `ShiftHistoryContextCubit` через `setContext`. Запрос уходит, только
/// когда `scope == ShiftScope.organization` (ADR-005 п.8 — заработок
/// вне организации не существует в принципе).
 ShiftScope? get scope; String? get organizationId;/// Окно (`shift_history_earnings/mobile.md`), приходит извне от
/// `ShiftHistoryPeriodCubit` через `setPeriod` — те же границы, что
/// уходят в `GET /shifts` и `GET /shifts/stats`.
 DateTime? get dateFrom; DateTime? get dateTo;
/// Create a copy of ShiftEarningsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftEarningsStateCopyWith<ShiftEarningsState> get copyWith => _$ShiftEarningsStateCopyWithImpl<ShiftEarningsState>(this as ShiftEarningsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftEarningsState&&(identical(other.earnings, earnings) || other.earnings == earnings)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,earnings,scope,organizationId,dateFrom,dateTo);

@override
String toString() {
  return 'ShiftEarningsState(earnings: $earnings, scope: $scope, organizationId: $organizationId, dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class $ShiftEarningsStateCopyWith<$Res>  {
  factory $ShiftEarningsStateCopyWith(ShiftEarningsState value, $Res Function(ShiftEarningsState) _then) = _$ShiftEarningsStateCopyWithImpl;
@useResult
$Res call({
 SectionData<MyEarnings> earnings, ShiftScope? scope, String? organizationId, DateTime? dateFrom, DateTime? dateTo
});


$SectionDataCopyWith<MyEarnings, $Res> get earnings;

}
/// @nodoc
class _$ShiftEarningsStateCopyWithImpl<$Res>
    implements $ShiftEarningsStateCopyWith<$Res> {
  _$ShiftEarningsStateCopyWithImpl(this._self, this._then);

  final ShiftEarningsState _self;
  final $Res Function(ShiftEarningsState) _then;

/// Create a copy of ShiftEarningsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? earnings = null,Object? scope = freezed,Object? organizationId = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(_self.copyWith(
earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as SectionData<MyEarnings>,scope: freezed == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShiftScope?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ShiftEarningsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<MyEarnings, $Res> get earnings {
  
  return $SectionDataCopyWith<MyEarnings, $Res>(_self.earnings, (value) {
    return _then(_self.copyWith(earnings: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftEarningsState].
extension ShiftEarningsStatePatterns on ShiftEarningsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftEarningsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftEarningsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftEarningsState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftEarningsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftEarningsState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftEarningsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<MyEarnings> earnings,  ShiftScope? scope,  String? organizationId,  DateTime? dateFrom,  DateTime? dateTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftEarningsState() when $default != null:
return $default(_that.earnings,_that.scope,_that.organizationId,_that.dateFrom,_that.dateTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<MyEarnings> earnings,  ShiftScope? scope,  String? organizationId,  DateTime? dateFrom,  DateTime? dateTo)  $default,) {final _that = this;
switch (_that) {
case _ShiftEarningsState():
return $default(_that.earnings,_that.scope,_that.organizationId,_that.dateFrom,_that.dateTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<MyEarnings> earnings,  ShiftScope? scope,  String? organizationId,  DateTime? dateFrom,  DateTime? dateTo)?  $default,) {final _that = this;
switch (_that) {
case _ShiftEarningsState() when $default != null:
return $default(_that.earnings,_that.scope,_that.organizationId,_that.dateFrom,_that.dateTo);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftEarningsState implements ShiftEarningsState {
  const _ShiftEarningsState({this.earnings = const SectionData<MyEarnings>(), this.scope, this.organizationId, this.dateFrom, this.dateTo});
  

@override@JsonKey() final  SectionData<MyEarnings> earnings;
/// Контекст (`shift_history_scope`), приходит извне от
/// `ShiftHistoryContextCubit` через `setContext`. Запрос уходит, только
/// когда `scope == ShiftScope.organization` (ADR-005 п.8 — заработок
/// вне организации не существует в принципе).
@override final  ShiftScope? scope;
@override final  String? organizationId;
/// Окно (`shift_history_earnings/mobile.md`), приходит извне от
/// `ShiftHistoryPeriodCubit` через `setPeriod` — те же границы, что
/// уходят в `GET /shifts` и `GET /shifts/stats`.
@override final  DateTime? dateFrom;
@override final  DateTime? dateTo;

/// Create a copy of ShiftEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftEarningsStateCopyWith<_ShiftEarningsState> get copyWith => __$ShiftEarningsStateCopyWithImpl<_ShiftEarningsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftEarningsState&&(identical(other.earnings, earnings) || other.earnings == earnings)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,earnings,scope,organizationId,dateFrom,dateTo);

@override
String toString() {
  return 'ShiftEarningsState(earnings: $earnings, scope: $scope, organizationId: $organizationId, dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class _$ShiftEarningsStateCopyWith<$Res> implements $ShiftEarningsStateCopyWith<$Res> {
  factory _$ShiftEarningsStateCopyWith(_ShiftEarningsState value, $Res Function(_ShiftEarningsState) _then) = __$ShiftEarningsStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<MyEarnings> earnings, ShiftScope? scope, String? organizationId, DateTime? dateFrom, DateTime? dateTo
});


@override $SectionDataCopyWith<MyEarnings, $Res> get earnings;

}
/// @nodoc
class __$ShiftEarningsStateCopyWithImpl<$Res>
    implements _$ShiftEarningsStateCopyWith<$Res> {
  __$ShiftEarningsStateCopyWithImpl(this._self, this._then);

  final _ShiftEarningsState _self;
  final $Res Function(_ShiftEarningsState) _then;

/// Create a copy of ShiftEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? earnings = null,Object? scope = freezed,Object? organizationId = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(_ShiftEarningsState(
earnings: null == earnings ? _self.earnings : earnings // ignore: cast_nullable_to_non_nullable
as SectionData<MyEarnings>,scope: freezed == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShiftScope?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ShiftEarningsState
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
