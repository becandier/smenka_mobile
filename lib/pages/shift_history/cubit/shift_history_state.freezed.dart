// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftHistoryState {

 PaginatedSectionData<Shift> get shifts;/// Фильтр по статусу (null = все). Единственный «фильтр» в узком
/// смысле, что остался на экране — дата больше не фильтр поверх
/// периода, а сам период (mobile.md, «A. Единый выбор периода»).
 ShiftStatus? get filterStatus;/// Окно (`shift_history_earnings/mobile.md`), приходит извне от
/// `ShiftHistoryPeriodCubit` через `setPeriod` — те же границы, что
/// уходят в `GET /shifts/stats` и `GET /organizations/{org_id}/
/// my-earnings`. Больше не редактируется отдельным чипом в строке
/// фильтров списка (убран вместе с ним).
 DateTime? get dateFrom; DateTime? get dateTo;/// Контекст (`shift_history_scope`), приходит извне от
/// `ShiftHistoryContextCubit` через `setContext` — `null` = без
/// ограничения (не передаётся на бэк). Ортогонален [filterStatus]/
/// [dateFrom]/[dateTo]: сбрасывается только сменой контекста, не
/// затрагивается `resetFilters`.
 ShiftScope? get scope; String? get organizationId;
/// Create a copy of ShiftHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftHistoryStateCopyWith<ShiftHistoryState> get copyWith => _$ShiftHistoryStateCopyWithImpl<ShiftHistoryState>(this as ShiftHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftHistoryState&&(identical(other.shifts, shifts) || other.shifts == shifts)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId));
}


@override
int get hashCode => Object.hash(runtimeType,shifts,filterStatus,dateFrom,dateTo,scope,organizationId);

@override
String toString() {
  return 'ShiftHistoryState(shifts: $shifts, filterStatus: $filterStatus, dateFrom: $dateFrom, dateTo: $dateTo, scope: $scope, organizationId: $organizationId)';
}


}

/// @nodoc
abstract mixin class $ShiftHistoryStateCopyWith<$Res>  {
  factory $ShiftHistoryStateCopyWith(ShiftHistoryState value, $Res Function(ShiftHistoryState) _then) = _$ShiftHistoryStateCopyWithImpl;
@useResult
$Res call({
 PaginatedSectionData<Shift> shifts, ShiftStatus? filterStatus, DateTime? dateFrom, DateTime? dateTo, ShiftScope? scope, String? organizationId
});


$PaginatedSectionDataCopyWith<Shift, $Res> get shifts;

}
/// @nodoc
class _$ShiftHistoryStateCopyWithImpl<$Res>
    implements $ShiftHistoryStateCopyWith<$Res> {
  _$ShiftHistoryStateCopyWithImpl(this._self, this._then);

  final ShiftHistoryState _self;
  final $Res Function(ShiftHistoryState) _then;

/// Create a copy of ShiftHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shifts = null,Object? filterStatus = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,Object? scope = freezed,Object? organizationId = freezed,}) {
  return _then(_self.copyWith(
shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<Shift>,filterStatus: freezed == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as ShiftStatus?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,scope: freezed == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShiftScope?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShiftHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<Shift, $Res> get shifts {
  
  return $PaginatedSectionDataCopyWith<Shift, $Res>(_self.shifts, (value) {
    return _then(_self.copyWith(shifts: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftHistoryState].
extension ShiftHistoryStatePatterns on ShiftHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedSectionData<Shift> shifts,  ShiftStatus? filterStatus,  DateTime? dateFrom,  DateTime? dateTo,  ShiftScope? scope,  String? organizationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftHistoryState() when $default != null:
return $default(_that.shifts,_that.filterStatus,_that.dateFrom,_that.dateTo,_that.scope,_that.organizationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedSectionData<Shift> shifts,  ShiftStatus? filterStatus,  DateTime? dateFrom,  DateTime? dateTo,  ShiftScope? scope,  String? organizationId)  $default,) {final _that = this;
switch (_that) {
case _ShiftHistoryState():
return $default(_that.shifts,_that.filterStatus,_that.dateFrom,_that.dateTo,_that.scope,_that.organizationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedSectionData<Shift> shifts,  ShiftStatus? filterStatus,  DateTime? dateFrom,  DateTime? dateTo,  ShiftScope? scope,  String? organizationId)?  $default,) {final _that = this;
switch (_that) {
case _ShiftHistoryState() when $default != null:
return $default(_that.shifts,_that.filterStatus,_that.dateFrom,_that.dateTo,_that.scope,_that.organizationId);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftHistoryState extends ShiftHistoryState {
  const _ShiftHistoryState({this.shifts = const PaginatedSectionData<Shift>(), this.filterStatus, this.dateFrom, this.dateTo, this.scope, this.organizationId}): super._();
  

@override@JsonKey() final  PaginatedSectionData<Shift> shifts;
/// Фильтр по статусу (null = все). Единственный «фильтр» в узком
/// смысле, что остался на экране — дата больше не фильтр поверх
/// периода, а сам период (mobile.md, «A. Единый выбор периода»).
@override final  ShiftStatus? filterStatus;
/// Окно (`shift_history_earnings/mobile.md`), приходит извне от
/// `ShiftHistoryPeriodCubit` через `setPeriod` — те же границы, что
/// уходят в `GET /shifts/stats` и `GET /organizations/{org_id}/
/// my-earnings`. Больше не редактируется отдельным чипом в строке
/// фильтров списка (убран вместе с ним).
@override final  DateTime? dateFrom;
@override final  DateTime? dateTo;
/// Контекст (`shift_history_scope`), приходит извне от
/// `ShiftHistoryContextCubit` через `setContext` — `null` = без
/// ограничения (не передаётся на бэк). Ортогонален [filterStatus]/
/// [dateFrom]/[dateTo]: сбрасывается только сменой контекста, не
/// затрагивается `resetFilters`.
@override final  ShiftScope? scope;
@override final  String? organizationId;

/// Create a copy of ShiftHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftHistoryStateCopyWith<_ShiftHistoryState> get copyWith => __$ShiftHistoryStateCopyWithImpl<_ShiftHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftHistoryState&&(identical(other.shifts, shifts) || other.shifts == shifts)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId));
}


@override
int get hashCode => Object.hash(runtimeType,shifts,filterStatus,dateFrom,dateTo,scope,organizationId);

@override
String toString() {
  return 'ShiftHistoryState(shifts: $shifts, filterStatus: $filterStatus, dateFrom: $dateFrom, dateTo: $dateTo, scope: $scope, organizationId: $organizationId)';
}


}

/// @nodoc
abstract mixin class _$ShiftHistoryStateCopyWith<$Res> implements $ShiftHistoryStateCopyWith<$Res> {
  factory _$ShiftHistoryStateCopyWith(_ShiftHistoryState value, $Res Function(_ShiftHistoryState) _then) = __$ShiftHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedSectionData<Shift> shifts, ShiftStatus? filterStatus, DateTime? dateFrom, DateTime? dateTo, ShiftScope? scope, String? organizationId
});


@override $PaginatedSectionDataCopyWith<Shift, $Res> get shifts;

}
/// @nodoc
class __$ShiftHistoryStateCopyWithImpl<$Res>
    implements _$ShiftHistoryStateCopyWith<$Res> {
  __$ShiftHistoryStateCopyWithImpl(this._self, this._then);

  final _ShiftHistoryState _self;
  final $Res Function(_ShiftHistoryState) _then;

/// Create a copy of ShiftHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shifts = null,Object? filterStatus = freezed,Object? dateFrom = freezed,Object? dateTo = freezed,Object? scope = freezed,Object? organizationId = freezed,}) {
  return _then(_ShiftHistoryState(
shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<Shift>,filterStatus: freezed == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as ShiftStatus?,dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,scope: freezed == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShiftScope?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShiftHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<Shift, $Res> get shifts {
  
  return $PaginatedSectionDataCopyWith<Shift, $Res>(_self.shifts, (value) {
    return _then(_self.copyWith(shifts: value));
  });
}
}

// dart format on
