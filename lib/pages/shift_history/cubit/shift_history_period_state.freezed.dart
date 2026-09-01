// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_history_period_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftHistoryPeriodState {

/// Активный пресет; `null` — активен произвольный диапазон
/// ([dateFrom]/[dateTo]). Ровно один источник окна одновременно.
/// Только `week`/`month` приходят от UI этого экрана — `day` этому
/// пресет-селектору не показывается (mobile.md, «A»).
 PeriodPreset? get selectedPreset;/// Вычисленное клиентом окно (UTC), которое уходит одинаковым во все
/// три запроса экрана: `GET /shifts`, `GET /shifts/stats`,
/// `GET /organizations/{org_id}/my-earnings`.
 DateTime? get dateFrom; DateTime? get dateTo;
/// Create a copy of ShiftHistoryPeriodState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftHistoryPeriodStateCopyWith<ShiftHistoryPeriodState> get copyWith => _$ShiftHistoryPeriodStateCopyWithImpl<ShiftHistoryPeriodState>(this as ShiftHistoryPeriodState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftHistoryPeriodState&&(identical(other.selectedPreset, selectedPreset) || other.selectedPreset == selectedPreset)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,selectedPreset,dateFrom,dateTo);

@override
String toString() {
  return 'ShiftHistoryPeriodState(selectedPreset: $selectedPreset, dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class $ShiftHistoryPeriodStateCopyWith<$Res>  {
  factory $ShiftHistoryPeriodStateCopyWith(ShiftHistoryPeriodState value, $Res Function(ShiftHistoryPeriodState) _then) = _$ShiftHistoryPeriodStateCopyWithImpl;
@useResult
$Res call({
 PeriodPreset? selectedPreset, DateTime? dateFrom, DateTime? dateTo
});




}
/// @nodoc
class _$ShiftHistoryPeriodStateCopyWithImpl<$Res>
    implements $ShiftHistoryPeriodStateCopyWith<$Res> {
  _$ShiftHistoryPeriodStateCopyWithImpl(this._self, this._then);

  final ShiftHistoryPeriodState _self;
  final $Res Function(ShiftHistoryPeriodState) _then;

/// Create a copy of ShiftHistoryPeriodState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedPreset = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(_self.copyWith(
selectedPreset: freezed == selectedPreset ? _self.selectedPreset : selectedPreset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftHistoryPeriodState].
extension ShiftHistoryPeriodStatePatterns on ShiftHistoryPeriodState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftHistoryPeriodState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftHistoryPeriodState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftHistoryPeriodState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftHistoryPeriodState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftHistoryPeriodState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftHistoryPeriodState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PeriodPreset? selectedPreset,  DateTime? dateFrom,  DateTime? dateTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftHistoryPeriodState() when $default != null:
return $default(_that.selectedPreset,_that.dateFrom,_that.dateTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PeriodPreset? selectedPreset,  DateTime? dateFrom,  DateTime? dateTo)  $default,) {final _that = this;
switch (_that) {
case _ShiftHistoryPeriodState():
return $default(_that.selectedPreset,_that.dateFrom,_that.dateTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PeriodPreset? selectedPreset,  DateTime? dateFrom,  DateTime? dateTo)?  $default,) {final _that = this;
switch (_that) {
case _ShiftHistoryPeriodState() when $default != null:
return $default(_that.selectedPreset,_that.dateFrom,_that.dateTo);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftHistoryPeriodState extends ShiftHistoryPeriodState {
  const _ShiftHistoryPeriodState({this.selectedPreset = PeriodPreset.week, this.dateFrom, this.dateTo}): super._();
  

/// Активный пресет; `null` — активен произвольный диапазон
/// ([dateFrom]/[dateTo]). Ровно один источник окна одновременно.
/// Только `week`/`month` приходят от UI этого экрана — `day` этому
/// пресет-селектору не показывается (mobile.md, «A»).
@override@JsonKey() final  PeriodPreset? selectedPreset;
/// Вычисленное клиентом окно (UTC), которое уходит одинаковым во все
/// три запроса экрана: `GET /shifts`, `GET /shifts/stats`,
/// `GET /organizations/{org_id}/my-earnings`.
@override final  DateTime? dateFrom;
@override final  DateTime? dateTo;

/// Create a copy of ShiftHistoryPeriodState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftHistoryPeriodStateCopyWith<_ShiftHistoryPeriodState> get copyWith => __$ShiftHistoryPeriodStateCopyWithImpl<_ShiftHistoryPeriodState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftHistoryPeriodState&&(identical(other.selectedPreset, selectedPreset) || other.selectedPreset == selectedPreset)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo));
}


@override
int get hashCode => Object.hash(runtimeType,selectedPreset,dateFrom,dateTo);

@override
String toString() {
  return 'ShiftHistoryPeriodState(selectedPreset: $selectedPreset, dateFrom: $dateFrom, dateTo: $dateTo)';
}


}

/// @nodoc
abstract mixin class _$ShiftHistoryPeriodStateCopyWith<$Res> implements $ShiftHistoryPeriodStateCopyWith<$Res> {
  factory _$ShiftHistoryPeriodStateCopyWith(_ShiftHistoryPeriodState value, $Res Function(_ShiftHistoryPeriodState) _then) = __$ShiftHistoryPeriodStateCopyWithImpl;
@override @useResult
$Res call({
 PeriodPreset? selectedPreset, DateTime? dateFrom, DateTime? dateTo
});




}
/// @nodoc
class __$ShiftHistoryPeriodStateCopyWithImpl<$Res>
    implements _$ShiftHistoryPeriodStateCopyWith<$Res> {
  __$ShiftHistoryPeriodStateCopyWithImpl(this._self, this._then);

  final _ShiftHistoryPeriodState _self;
  final $Res Function(_ShiftHistoryPeriodState) _then;

/// Create a copy of ShiftHistoryPeriodState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedPreset = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,}) {
  return _then(_ShiftHistoryPeriodState(
selectedPreset: freezed == selectedPreset ? _self.selectedPreset : selectedPreset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
