// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_tracker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftTrackerState {

/// Активная смена (SectionData — loading/error на init, success при наличии)
 SectionData<Shift> get activeShift;/// Организации пользователя
 SectionData<List<Organization>> get organizations;/// Выбранная организация (null = персональная)
 String? get selectedOrganizationId;/// Таймер — обновляется каждую секунду
 int get elapsedSeconds;/// Статус действия (start/pause/resume/finish) — transient
 FeatureStatus get actionStatus; String? get actionError;/// Машинный `error.code` последнего действия (для маппинга сетевых ошибок)
 String? get actionErrorCode;/// Нет сетевого подключения (по данным connectivity_plus)
 bool get isOffline;/// Предупреждение о низкой точности GPS
 bool get showLowAccuracyWarning;/// Отказ геолокации на последней попытке старта — сам объект таксономии
/// `GeoService`, а не только ветка `StartShiftResult`. Нужен UI-слою,
/// чтобы построить диалог по типу отказа и (в `shift_geo_photo_fallback`)
/// передать на бэк фактический `GeoFailure.code`, а не выведенную из
/// enum-ветки строку. `null` — гео-отказа на последней попытке не было.
 GeoFailure? get lastGeoFailure;/// Уровень блокировки для [lastGeoFailure] — результат пост-диагностики
/// (`geo_troubleshooting`). Осмыслен только для
/// `GeoPermissionDeniedForever` на web; в остальных случаях
/// [GeoBlockLevel.unknown].
 GeoBlockLevel get geoBlockLevel;/// Одноразовый нотис: смену авто-завершил бэкенд (поллинг обнаружил, что
/// активной/приостановленной смены больше нет). UI показывает тост и
/// сбрасывает флаг.
 bool get shiftAutoFinished;/// Выбранная сотрудником рабочая точка для старта смены (когда гео
/// выключена). `null` — не выбрана; при смене организации сбрасывается.
 WorkLocation? get selectedWorkLocation;/// Эффективный набор графиков сотрудника для выбранной организации+точки
/// (`work_schedules`). Только для орг-смены — для персональной остаётся
/// в начальном состоянии.
 SectionData<MySchedules> get schedules;/// Выбранный график старта. `null` — не выбран (0 графиков, либо >1 и
/// выбор ещё не сделан).
 String? get selectedWorkScheduleId;/// «Сейчас» на idle-экране — обновляется `ShiftTrackerCubit` раз в
/// секунду, пока показывается организационная смена и графики загружены
/// (тот же принцип, что и тикающий [elapsedSeconds] для активной смены,
/// только для пересчёта стартуемости окна графика, см.
/// `schedule_window_enforcement/mobile.md`). `null`, пока тик не
/// запущен (сеть ещё грузится / смена активна / кубит закрыт).
 DateTime? get idleNow;
/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftTrackerStateCopyWith<ShiftTrackerState> get copyWith => _$ShiftTrackerStateCopyWithImpl<ShiftTrackerState>(this as ShiftTrackerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftTrackerState&&(identical(other.activeShift, activeShift) || other.activeShift == activeShift)&&(identical(other.organizations, organizations) || other.organizations == organizations)&&(identical(other.selectedOrganizationId, selectedOrganizationId) || other.selectedOrganizationId == selectedOrganizationId)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.actionErrorCode, actionErrorCode) || other.actionErrorCode == actionErrorCode)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline)&&(identical(other.showLowAccuracyWarning, showLowAccuracyWarning) || other.showLowAccuracyWarning == showLowAccuracyWarning)&&(identical(other.lastGeoFailure, lastGeoFailure) || other.lastGeoFailure == lastGeoFailure)&&(identical(other.geoBlockLevel, geoBlockLevel) || other.geoBlockLevel == geoBlockLevel)&&(identical(other.shiftAutoFinished, shiftAutoFinished) || other.shiftAutoFinished == shiftAutoFinished)&&(identical(other.selectedWorkLocation, selectedWorkLocation) || other.selectedWorkLocation == selectedWorkLocation)&&(identical(other.schedules, schedules) || other.schedules == schedules)&&(identical(other.selectedWorkScheduleId, selectedWorkScheduleId) || other.selectedWorkScheduleId == selectedWorkScheduleId)&&(identical(other.idleNow, idleNow) || other.idleNow == idleNow));
}


@override
int get hashCode => Object.hash(runtimeType,activeShift,organizations,selectedOrganizationId,elapsedSeconds,actionStatus,actionError,actionErrorCode,isOffline,showLowAccuracyWarning,lastGeoFailure,geoBlockLevel,shiftAutoFinished,selectedWorkLocation,schedules,selectedWorkScheduleId,idleNow);

@override
String toString() {
  return 'ShiftTrackerState(activeShift: $activeShift, organizations: $organizations, selectedOrganizationId: $selectedOrganizationId, elapsedSeconds: $elapsedSeconds, actionStatus: $actionStatus, actionError: $actionError, actionErrorCode: $actionErrorCode, isOffline: $isOffline, showLowAccuracyWarning: $showLowAccuracyWarning, lastGeoFailure: $lastGeoFailure, geoBlockLevel: $geoBlockLevel, shiftAutoFinished: $shiftAutoFinished, selectedWorkLocation: $selectedWorkLocation, schedules: $schedules, selectedWorkScheduleId: $selectedWorkScheduleId, idleNow: $idleNow)';
}


}

/// @nodoc
abstract mixin class $ShiftTrackerStateCopyWith<$Res>  {
  factory $ShiftTrackerStateCopyWith(ShiftTrackerState value, $Res Function(ShiftTrackerState) _then) = _$ShiftTrackerStateCopyWithImpl;
@useResult
$Res call({
 SectionData<Shift> activeShift, SectionData<List<Organization>> organizations, String? selectedOrganizationId, int elapsedSeconds, FeatureStatus actionStatus, String? actionError, String? actionErrorCode, bool isOffline, bool showLowAccuracyWarning, GeoFailure? lastGeoFailure, GeoBlockLevel geoBlockLevel, bool shiftAutoFinished, WorkLocation? selectedWorkLocation, SectionData<MySchedules> schedules, String? selectedWorkScheduleId, DateTime? idleNow
});


$SectionDataCopyWith<Shift, $Res> get activeShift;$SectionDataCopyWith<List<Organization>, $Res> get organizations;$WorkLocationCopyWith<$Res>? get selectedWorkLocation;$SectionDataCopyWith<MySchedules, $Res> get schedules;

}
/// @nodoc
class _$ShiftTrackerStateCopyWithImpl<$Res>
    implements $ShiftTrackerStateCopyWith<$Res> {
  _$ShiftTrackerStateCopyWithImpl(this._self, this._then);

  final ShiftTrackerState _self;
  final $Res Function(ShiftTrackerState) _then;

/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeShift = null,Object? organizations = null,Object? selectedOrganizationId = freezed,Object? elapsedSeconds = null,Object? actionStatus = null,Object? actionError = freezed,Object? actionErrorCode = freezed,Object? isOffline = null,Object? showLowAccuracyWarning = null,Object? lastGeoFailure = freezed,Object? geoBlockLevel = null,Object? shiftAutoFinished = null,Object? selectedWorkLocation = freezed,Object? schedules = null,Object? selectedWorkScheduleId = freezed,Object? idleNow = freezed,}) {
  return _then(_self.copyWith(
activeShift: null == activeShift ? _self.activeShift : activeShift // ignore: cast_nullable_to_non_nullable
as SectionData<Shift>,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as SectionData<List<Organization>>,selectedOrganizationId: freezed == selectedOrganizationId ? _self.selectedOrganizationId : selectedOrganizationId // ignore: cast_nullable_to_non_nullable
as String?,elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,actionErrorCode: freezed == actionErrorCode ? _self.actionErrorCode : actionErrorCode // ignore: cast_nullable_to_non_nullable
as String?,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,showLowAccuracyWarning: null == showLowAccuracyWarning ? _self.showLowAccuracyWarning : showLowAccuracyWarning // ignore: cast_nullable_to_non_nullable
as bool,lastGeoFailure: freezed == lastGeoFailure ? _self.lastGeoFailure : lastGeoFailure // ignore: cast_nullable_to_non_nullable
as GeoFailure?,geoBlockLevel: null == geoBlockLevel ? _self.geoBlockLevel : geoBlockLevel // ignore: cast_nullable_to_non_nullable
as GeoBlockLevel,shiftAutoFinished: null == shiftAutoFinished ? _self.shiftAutoFinished : shiftAutoFinished // ignore: cast_nullable_to_non_nullable
as bool,selectedWorkLocation: freezed == selectedWorkLocation ? _self.selectedWorkLocation : selectedWorkLocation // ignore: cast_nullable_to_non_nullable
as WorkLocation?,schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as SectionData<MySchedules>,selectedWorkScheduleId: freezed == selectedWorkScheduleId ? _self.selectedWorkScheduleId : selectedWorkScheduleId // ignore: cast_nullable_to_non_nullable
as String?,idleNow: freezed == idleNow ? _self.idleNow : idleNow // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Shift, $Res> get activeShift {
  
  return $SectionDataCopyWith<Shift, $Res>(_self.activeShift, (value) {
    return _then(_self.copyWith(activeShift: value));
  });
}/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Organization>, $Res> get organizations {
  
  return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations, (value) {
    return _then(_self.copyWith(organizations: value));
  });
}/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<$Res>? get selectedWorkLocation {
    if (_self.selectedWorkLocation == null) {
    return null;
  }

  return $WorkLocationCopyWith<$Res>(_self.selectedWorkLocation!, (value) {
    return _then(_self.copyWith(selectedWorkLocation: value));
  });
}/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<MySchedules, $Res> get schedules {
  
  return $SectionDataCopyWith<MySchedules, $Res>(_self.schedules, (value) {
    return _then(_self.copyWith(schedules: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftTrackerState].
extension ShiftTrackerStatePatterns on ShiftTrackerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftTrackerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftTrackerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftTrackerState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftTrackerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftTrackerState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftTrackerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<Shift> activeShift,  SectionData<List<Organization>> organizations,  String? selectedOrganizationId,  int elapsedSeconds,  FeatureStatus actionStatus,  String? actionError,  String? actionErrorCode,  bool isOffline,  bool showLowAccuracyWarning,  GeoFailure? lastGeoFailure,  GeoBlockLevel geoBlockLevel,  bool shiftAutoFinished,  WorkLocation? selectedWorkLocation,  SectionData<MySchedules> schedules,  String? selectedWorkScheduleId,  DateTime? idleNow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftTrackerState() when $default != null:
return $default(_that.activeShift,_that.organizations,_that.selectedOrganizationId,_that.elapsedSeconds,_that.actionStatus,_that.actionError,_that.actionErrorCode,_that.isOffline,_that.showLowAccuracyWarning,_that.lastGeoFailure,_that.geoBlockLevel,_that.shiftAutoFinished,_that.selectedWorkLocation,_that.schedules,_that.selectedWorkScheduleId,_that.idleNow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<Shift> activeShift,  SectionData<List<Organization>> organizations,  String? selectedOrganizationId,  int elapsedSeconds,  FeatureStatus actionStatus,  String? actionError,  String? actionErrorCode,  bool isOffline,  bool showLowAccuracyWarning,  GeoFailure? lastGeoFailure,  GeoBlockLevel geoBlockLevel,  bool shiftAutoFinished,  WorkLocation? selectedWorkLocation,  SectionData<MySchedules> schedules,  String? selectedWorkScheduleId,  DateTime? idleNow)  $default,) {final _that = this;
switch (_that) {
case _ShiftTrackerState():
return $default(_that.activeShift,_that.organizations,_that.selectedOrganizationId,_that.elapsedSeconds,_that.actionStatus,_that.actionError,_that.actionErrorCode,_that.isOffline,_that.showLowAccuracyWarning,_that.lastGeoFailure,_that.geoBlockLevel,_that.shiftAutoFinished,_that.selectedWorkLocation,_that.schedules,_that.selectedWorkScheduleId,_that.idleNow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<Shift> activeShift,  SectionData<List<Organization>> organizations,  String? selectedOrganizationId,  int elapsedSeconds,  FeatureStatus actionStatus,  String? actionError,  String? actionErrorCode,  bool isOffline,  bool showLowAccuracyWarning,  GeoFailure? lastGeoFailure,  GeoBlockLevel geoBlockLevel,  bool shiftAutoFinished,  WorkLocation? selectedWorkLocation,  SectionData<MySchedules> schedules,  String? selectedWorkScheduleId,  DateTime? idleNow)?  $default,) {final _that = this;
switch (_that) {
case _ShiftTrackerState() when $default != null:
return $default(_that.activeShift,_that.organizations,_that.selectedOrganizationId,_that.elapsedSeconds,_that.actionStatus,_that.actionError,_that.actionErrorCode,_that.isOffline,_that.showLowAccuracyWarning,_that.lastGeoFailure,_that.geoBlockLevel,_that.shiftAutoFinished,_that.selectedWorkLocation,_that.schedules,_that.selectedWorkScheduleId,_that.idleNow);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftTrackerState extends ShiftTrackerState {
  const _ShiftTrackerState({this.activeShift = const SectionData<Shift>(), this.organizations = const SectionData<List<Organization>>(), this.selectedOrganizationId, this.elapsedSeconds = 0, this.actionStatus = FeatureStatus.initial, this.actionError, this.actionErrorCode, this.isOffline = false, this.showLowAccuracyWarning = false, this.lastGeoFailure, this.geoBlockLevel = GeoBlockLevel.unknown, this.shiftAutoFinished = false, this.selectedWorkLocation, this.schedules = const SectionData<MySchedules>(), this.selectedWorkScheduleId, this.idleNow}): super._();
  

/// Активная смена (SectionData — loading/error на init, success при наличии)
@override@JsonKey() final  SectionData<Shift> activeShift;
/// Организации пользователя
@override@JsonKey() final  SectionData<List<Organization>> organizations;
/// Выбранная организация (null = персональная)
@override final  String? selectedOrganizationId;
/// Таймер — обновляется каждую секунду
@override@JsonKey() final  int elapsedSeconds;
/// Статус действия (start/pause/resume/finish) — transient
@override@JsonKey() final  FeatureStatus actionStatus;
@override final  String? actionError;
/// Машинный `error.code` последнего действия (для маппинга сетевых ошибок)
@override final  String? actionErrorCode;
/// Нет сетевого подключения (по данным connectivity_plus)
@override@JsonKey() final  bool isOffline;
/// Предупреждение о низкой точности GPS
@override@JsonKey() final  bool showLowAccuracyWarning;
/// Отказ геолокации на последней попытке старта — сам объект таксономии
/// `GeoService`, а не только ветка `StartShiftResult`. Нужен UI-слою,
/// чтобы построить диалог по типу отказа и (в `shift_geo_photo_fallback`)
/// передать на бэк фактический `GeoFailure.code`, а не выведенную из
/// enum-ветки строку. `null` — гео-отказа на последней попытке не было.
@override final  GeoFailure? lastGeoFailure;
/// Уровень блокировки для [lastGeoFailure] — результат пост-диагностики
/// (`geo_troubleshooting`). Осмыслен только для
/// `GeoPermissionDeniedForever` на web; в остальных случаях
/// [GeoBlockLevel.unknown].
@override@JsonKey() final  GeoBlockLevel geoBlockLevel;
/// Одноразовый нотис: смену авто-завершил бэкенд (поллинг обнаружил, что
/// активной/приостановленной смены больше нет). UI показывает тост и
/// сбрасывает флаг.
@override@JsonKey() final  bool shiftAutoFinished;
/// Выбранная сотрудником рабочая точка для старта смены (когда гео
/// выключена). `null` — не выбрана; при смене организации сбрасывается.
@override final  WorkLocation? selectedWorkLocation;
/// Эффективный набор графиков сотрудника для выбранной организации+точки
/// (`work_schedules`). Только для орг-смены — для персональной остаётся
/// в начальном состоянии.
@override@JsonKey() final  SectionData<MySchedules> schedules;
/// Выбранный график старта. `null` — не выбран (0 графиков, либо >1 и
/// выбор ещё не сделан).
@override final  String? selectedWorkScheduleId;
/// «Сейчас» на idle-экране — обновляется `ShiftTrackerCubit` раз в
/// секунду, пока показывается организационная смена и графики загружены
/// (тот же принцип, что и тикающий [elapsedSeconds] для активной смены,
/// только для пересчёта стартуемости окна графика, см.
/// `schedule_window_enforcement/mobile.md`). `null`, пока тик не
/// запущен (сеть ещё грузится / смена активна / кубит закрыт).
@override final  DateTime? idleNow;

/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftTrackerStateCopyWith<_ShiftTrackerState> get copyWith => __$ShiftTrackerStateCopyWithImpl<_ShiftTrackerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftTrackerState&&(identical(other.activeShift, activeShift) || other.activeShift == activeShift)&&(identical(other.organizations, organizations) || other.organizations == organizations)&&(identical(other.selectedOrganizationId, selectedOrganizationId) || other.selectedOrganizationId == selectedOrganizationId)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.actionErrorCode, actionErrorCode) || other.actionErrorCode == actionErrorCode)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline)&&(identical(other.showLowAccuracyWarning, showLowAccuracyWarning) || other.showLowAccuracyWarning == showLowAccuracyWarning)&&(identical(other.lastGeoFailure, lastGeoFailure) || other.lastGeoFailure == lastGeoFailure)&&(identical(other.geoBlockLevel, geoBlockLevel) || other.geoBlockLevel == geoBlockLevel)&&(identical(other.shiftAutoFinished, shiftAutoFinished) || other.shiftAutoFinished == shiftAutoFinished)&&(identical(other.selectedWorkLocation, selectedWorkLocation) || other.selectedWorkLocation == selectedWorkLocation)&&(identical(other.schedules, schedules) || other.schedules == schedules)&&(identical(other.selectedWorkScheduleId, selectedWorkScheduleId) || other.selectedWorkScheduleId == selectedWorkScheduleId)&&(identical(other.idleNow, idleNow) || other.idleNow == idleNow));
}


@override
int get hashCode => Object.hash(runtimeType,activeShift,organizations,selectedOrganizationId,elapsedSeconds,actionStatus,actionError,actionErrorCode,isOffline,showLowAccuracyWarning,lastGeoFailure,geoBlockLevel,shiftAutoFinished,selectedWorkLocation,schedules,selectedWorkScheduleId,idleNow);

@override
String toString() {
  return 'ShiftTrackerState(activeShift: $activeShift, organizations: $organizations, selectedOrganizationId: $selectedOrganizationId, elapsedSeconds: $elapsedSeconds, actionStatus: $actionStatus, actionError: $actionError, actionErrorCode: $actionErrorCode, isOffline: $isOffline, showLowAccuracyWarning: $showLowAccuracyWarning, lastGeoFailure: $lastGeoFailure, geoBlockLevel: $geoBlockLevel, shiftAutoFinished: $shiftAutoFinished, selectedWorkLocation: $selectedWorkLocation, schedules: $schedules, selectedWorkScheduleId: $selectedWorkScheduleId, idleNow: $idleNow)';
}


}

/// @nodoc
abstract mixin class _$ShiftTrackerStateCopyWith<$Res> implements $ShiftTrackerStateCopyWith<$Res> {
  factory _$ShiftTrackerStateCopyWith(_ShiftTrackerState value, $Res Function(_ShiftTrackerState) _then) = __$ShiftTrackerStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<Shift> activeShift, SectionData<List<Organization>> organizations, String? selectedOrganizationId, int elapsedSeconds, FeatureStatus actionStatus, String? actionError, String? actionErrorCode, bool isOffline, bool showLowAccuracyWarning, GeoFailure? lastGeoFailure, GeoBlockLevel geoBlockLevel, bool shiftAutoFinished, WorkLocation? selectedWorkLocation, SectionData<MySchedules> schedules, String? selectedWorkScheduleId, DateTime? idleNow
});


@override $SectionDataCopyWith<Shift, $Res> get activeShift;@override $SectionDataCopyWith<List<Organization>, $Res> get organizations;@override $WorkLocationCopyWith<$Res>? get selectedWorkLocation;@override $SectionDataCopyWith<MySchedules, $Res> get schedules;

}
/// @nodoc
class __$ShiftTrackerStateCopyWithImpl<$Res>
    implements _$ShiftTrackerStateCopyWith<$Res> {
  __$ShiftTrackerStateCopyWithImpl(this._self, this._then);

  final _ShiftTrackerState _self;
  final $Res Function(_ShiftTrackerState) _then;

/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeShift = null,Object? organizations = null,Object? selectedOrganizationId = freezed,Object? elapsedSeconds = null,Object? actionStatus = null,Object? actionError = freezed,Object? actionErrorCode = freezed,Object? isOffline = null,Object? showLowAccuracyWarning = null,Object? lastGeoFailure = freezed,Object? geoBlockLevel = null,Object? shiftAutoFinished = null,Object? selectedWorkLocation = freezed,Object? schedules = null,Object? selectedWorkScheduleId = freezed,Object? idleNow = freezed,}) {
  return _then(_ShiftTrackerState(
activeShift: null == activeShift ? _self.activeShift : activeShift // ignore: cast_nullable_to_non_nullable
as SectionData<Shift>,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as SectionData<List<Organization>>,selectedOrganizationId: freezed == selectedOrganizationId ? _self.selectedOrganizationId : selectedOrganizationId // ignore: cast_nullable_to_non_nullable
as String?,elapsedSeconds: null == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,actionErrorCode: freezed == actionErrorCode ? _self.actionErrorCode : actionErrorCode // ignore: cast_nullable_to_non_nullable
as String?,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,showLowAccuracyWarning: null == showLowAccuracyWarning ? _self.showLowAccuracyWarning : showLowAccuracyWarning // ignore: cast_nullable_to_non_nullable
as bool,lastGeoFailure: freezed == lastGeoFailure ? _self.lastGeoFailure : lastGeoFailure // ignore: cast_nullable_to_non_nullable
as GeoFailure?,geoBlockLevel: null == geoBlockLevel ? _self.geoBlockLevel : geoBlockLevel // ignore: cast_nullable_to_non_nullable
as GeoBlockLevel,shiftAutoFinished: null == shiftAutoFinished ? _self.shiftAutoFinished : shiftAutoFinished // ignore: cast_nullable_to_non_nullable
as bool,selectedWorkLocation: freezed == selectedWorkLocation ? _self.selectedWorkLocation : selectedWorkLocation // ignore: cast_nullable_to_non_nullable
as WorkLocation?,schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as SectionData<MySchedules>,selectedWorkScheduleId: freezed == selectedWorkScheduleId ? _self.selectedWorkScheduleId : selectedWorkScheduleId // ignore: cast_nullable_to_non_nullable
as String?,idleNow: freezed == idleNow ? _self.idleNow : idleNow // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Shift, $Res> get activeShift {
  
  return $SectionDataCopyWith<Shift, $Res>(_self.activeShift, (value) {
    return _then(_self.copyWith(activeShift: value));
  });
}/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Organization>, $Res> get organizations {
  
  return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations, (value) {
    return _then(_self.copyWith(organizations: value));
  });
}/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<$Res>? get selectedWorkLocation {
    if (_self.selectedWorkLocation == null) {
    return null;
  }

  return $WorkLocationCopyWith<$Res>(_self.selectedWorkLocation!, (value) {
    return _then(_self.copyWith(selectedWorkLocation: value));
  });
}/// Create a copy of ShiftTrackerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<MySchedules, $Res> get schedules {
  
  return $SectionDataCopyWith<MySchedules, $Res>(_self.schedules, (value) {
    return _then(_self.copyWith(schedules: value));
  });
}
}

// dart format on
