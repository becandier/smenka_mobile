// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_fallback_start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoFallbackStartState {

/// Организация смены (у неё включена геопроверка — иначе фолбэк не нужен).
 String get organizationId;/// Машинный код гео-ошибки, приведшей в фолбэк (`GeoFailure.code`).
/// Уходит на бэк как есть — строки по месту не конструируем.
 String get geoFallbackReason;/// Выбранная сотрудником рабочая точка. Обязательна: сервер её не
/// резолвит (координат нет), без неё бэк вернёт `WORK_LOCATION_REQUIRED`.
 WorkLocation? get workLocation;/// Эффективный набор графиков по выбранной точке.
 SectionData<MySchedules> get schedules;/// Текущее время для пересчёта стартуемости графиков. Обновляется cubit
/// раз в секунду после успешной загрузки, чтобы UI не держал закрывшееся
/// окно открытым.
 DateTime? get scheduleNow; String? get workScheduleId;/// Источник кадра — решается пробой камеры, не пользователем.
 GeoFallbackPhotoMode get photoMode;/// Подготовленный кадр (JPEG) — превью и аплоад. `null` — фото ещё нет.
 Uint8List? get photoBytes;/// Идёт подготовка кадра (чтение + ресайз после съёмки/выбора файла).
 bool get photoProcessing;/// Машинный код ошибки шага фото (`PhotoPickFailure.code` либо серверный
/// `GEO_FALLBACK_PHOTO_INVALID`). `null` — ошибки нет.
 String? get photoErrorCode;/// Отправка (аплоад файла + `POST /shifts/start`).
 FeatureStatus get submitStatus; String? get submitError; String? get submitErrorCode;
/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoFallbackStartStateCopyWith<GeoFallbackStartState> get copyWith => _$GeoFallbackStartStateCopyWithImpl<GeoFallbackStartState>(this as GeoFallbackStartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoFallbackStartState&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.geoFallbackReason, geoFallbackReason) || other.geoFallbackReason == geoFallbackReason)&&(identical(other.workLocation, workLocation) || other.workLocation == workLocation)&&(identical(other.schedules, schedules) || other.schedules == schedules)&&(identical(other.scheduleNow, scheduleNow) || other.scheduleNow == scheduleNow)&&(identical(other.workScheduleId, workScheduleId) || other.workScheduleId == workScheduleId)&&(identical(other.photoMode, photoMode) || other.photoMode == photoMode)&&const DeepCollectionEquality().equals(other.photoBytes, photoBytes)&&(identical(other.photoProcessing, photoProcessing) || other.photoProcessing == photoProcessing)&&(identical(other.photoErrorCode, photoErrorCode) || other.photoErrorCode == photoErrorCode)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,organizationId,geoFallbackReason,workLocation,schedules,scheduleNow,workScheduleId,photoMode,const DeepCollectionEquality().hash(photoBytes),photoProcessing,photoErrorCode,submitStatus,submitError,submitErrorCode);

@override
String toString() {
  return 'GeoFallbackStartState(organizationId: $organizationId, geoFallbackReason: $geoFallbackReason, workLocation: $workLocation, schedules: $schedules, scheduleNow: $scheduleNow, workScheduleId: $workScheduleId, photoMode: $photoMode, photoBytes: $photoBytes, photoProcessing: $photoProcessing, photoErrorCode: $photoErrorCode, submitStatus: $submitStatus, submitError: $submitError, submitErrorCode: $submitErrorCode)';
}


}

/// @nodoc
abstract mixin class $GeoFallbackStartStateCopyWith<$Res>  {
  factory $GeoFallbackStartStateCopyWith(GeoFallbackStartState value, $Res Function(GeoFallbackStartState) _then) = _$GeoFallbackStartStateCopyWithImpl;
@useResult
$Res call({
 String organizationId, String geoFallbackReason, WorkLocation? workLocation, SectionData<MySchedules> schedules, DateTime? scheduleNow, String? workScheduleId, GeoFallbackPhotoMode photoMode, Uint8List? photoBytes, bool photoProcessing, String? photoErrorCode, FeatureStatus submitStatus, String? submitError, String? submitErrorCode
});


$WorkLocationCopyWith<$Res>? get workLocation;$SectionDataCopyWith<MySchedules, $Res> get schedules;

}
/// @nodoc
class _$GeoFallbackStartStateCopyWithImpl<$Res>
    implements $GeoFallbackStartStateCopyWith<$Res> {
  _$GeoFallbackStartStateCopyWithImpl(this._self, this._then);

  final GeoFallbackStartState _self;
  final $Res Function(GeoFallbackStartState) _then;

/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? organizationId = null,Object? geoFallbackReason = null,Object? workLocation = freezed,Object? schedules = null,Object? scheduleNow = freezed,Object? workScheduleId = freezed,Object? photoMode = null,Object? photoBytes = freezed,Object? photoProcessing = null,Object? photoErrorCode = freezed,Object? submitStatus = null,Object? submitError = freezed,Object? submitErrorCode = freezed,}) {
  return _then(_self.copyWith(
organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,geoFallbackReason: null == geoFallbackReason ? _self.geoFallbackReason : geoFallbackReason // ignore: cast_nullable_to_non_nullable
as String,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as WorkLocation?,schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as SectionData<MySchedules>,scheduleNow: freezed == scheduleNow ? _self.scheduleNow : scheduleNow // ignore: cast_nullable_to_non_nullable
as DateTime?,workScheduleId: freezed == workScheduleId ? _self.workScheduleId : workScheduleId // ignore: cast_nullable_to_non_nullable
as String?,photoMode: null == photoMode ? _self.photoMode : photoMode // ignore: cast_nullable_to_non_nullable
as GeoFallbackPhotoMode,photoBytes: freezed == photoBytes ? _self.photoBytes : photoBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,photoProcessing: null == photoProcessing ? _self.photoProcessing : photoProcessing // ignore: cast_nullable_to_non_nullable
as bool,photoErrorCode: freezed == photoErrorCode ? _self.photoErrorCode : photoErrorCode // ignore: cast_nullable_to_non_nullable
as String?,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<$Res>? get workLocation {
    if (_self.workLocation == null) {
    return null;
  }

  return $WorkLocationCopyWith<$Res>(_self.workLocation!, (value) {
    return _then(_self.copyWith(workLocation: value));
  });
}/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<MySchedules, $Res> get schedules {
  
  return $SectionDataCopyWith<MySchedules, $Res>(_self.schedules, (value) {
    return _then(_self.copyWith(schedules: value));
  });
}
}


/// Adds pattern-matching-related methods to [GeoFallbackStartState].
extension GeoFallbackStartStatePatterns on GeoFallbackStartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoFallbackStartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoFallbackStartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoFallbackStartState value)  $default,){
final _that = this;
switch (_that) {
case _GeoFallbackStartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoFallbackStartState value)?  $default,){
final _that = this;
switch (_that) {
case _GeoFallbackStartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String organizationId,  String geoFallbackReason,  WorkLocation? workLocation,  SectionData<MySchedules> schedules,  DateTime? scheduleNow,  String? workScheduleId,  GeoFallbackPhotoMode photoMode,  Uint8List? photoBytes,  bool photoProcessing,  String? photoErrorCode,  FeatureStatus submitStatus,  String? submitError,  String? submitErrorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoFallbackStartState() when $default != null:
return $default(_that.organizationId,_that.geoFallbackReason,_that.workLocation,_that.schedules,_that.scheduleNow,_that.workScheduleId,_that.photoMode,_that.photoBytes,_that.photoProcessing,_that.photoErrorCode,_that.submitStatus,_that.submitError,_that.submitErrorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String organizationId,  String geoFallbackReason,  WorkLocation? workLocation,  SectionData<MySchedules> schedules,  DateTime? scheduleNow,  String? workScheduleId,  GeoFallbackPhotoMode photoMode,  Uint8List? photoBytes,  bool photoProcessing,  String? photoErrorCode,  FeatureStatus submitStatus,  String? submitError,  String? submitErrorCode)  $default,) {final _that = this;
switch (_that) {
case _GeoFallbackStartState():
return $default(_that.organizationId,_that.geoFallbackReason,_that.workLocation,_that.schedules,_that.scheduleNow,_that.workScheduleId,_that.photoMode,_that.photoBytes,_that.photoProcessing,_that.photoErrorCode,_that.submitStatus,_that.submitError,_that.submitErrorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String organizationId,  String geoFallbackReason,  WorkLocation? workLocation,  SectionData<MySchedules> schedules,  DateTime? scheduleNow,  String? workScheduleId,  GeoFallbackPhotoMode photoMode,  Uint8List? photoBytes,  bool photoProcessing,  String? photoErrorCode,  FeatureStatus submitStatus,  String? submitError,  String? submitErrorCode)?  $default,) {final _that = this;
switch (_that) {
case _GeoFallbackStartState() when $default != null:
return $default(_that.organizationId,_that.geoFallbackReason,_that.workLocation,_that.schedules,_that.scheduleNow,_that.workScheduleId,_that.photoMode,_that.photoBytes,_that.photoProcessing,_that.photoErrorCode,_that.submitStatus,_that.submitError,_that.submitErrorCode);case _:
  return null;

}
}

}

/// @nodoc


class _GeoFallbackStartState extends GeoFallbackStartState {
  const _GeoFallbackStartState({required this.organizationId, required this.geoFallbackReason, this.workLocation, this.schedules = const SectionData<MySchedules>(), this.scheduleNow, this.workScheduleId, this.photoMode = GeoFallbackPhotoMode.unknown, this.photoBytes, this.photoProcessing = false, this.photoErrorCode, this.submitStatus = FeatureStatus.initial, this.submitError, this.submitErrorCode}): super._();
  

/// Организация смены (у неё включена геопроверка — иначе фолбэк не нужен).
@override final  String organizationId;
/// Машинный код гео-ошибки, приведшей в фолбэк (`GeoFailure.code`).
/// Уходит на бэк как есть — строки по месту не конструируем.
@override final  String geoFallbackReason;
/// Выбранная сотрудником рабочая точка. Обязательна: сервер её не
/// резолвит (координат нет), без неё бэк вернёт `WORK_LOCATION_REQUIRED`.
@override final  WorkLocation? workLocation;
/// Эффективный набор графиков по выбранной точке.
@override@JsonKey() final  SectionData<MySchedules> schedules;
/// Текущее время для пересчёта стартуемости графиков. Обновляется cubit
/// раз в секунду после успешной загрузки, чтобы UI не держал закрывшееся
/// окно открытым.
@override final  DateTime? scheduleNow;
@override final  String? workScheduleId;
/// Источник кадра — решается пробой камеры, не пользователем.
@override@JsonKey() final  GeoFallbackPhotoMode photoMode;
/// Подготовленный кадр (JPEG) — превью и аплоад. `null` — фото ещё нет.
@override final  Uint8List? photoBytes;
/// Идёт подготовка кадра (чтение + ресайз после съёмки/выбора файла).
@override@JsonKey() final  bool photoProcessing;
/// Машинный код ошибки шага фото (`PhotoPickFailure.code` либо серверный
/// `GEO_FALLBACK_PHOTO_INVALID`). `null` — ошибки нет.
@override final  String? photoErrorCode;
/// Отправка (аплоад файла + `POST /shifts/start`).
@override@JsonKey() final  FeatureStatus submitStatus;
@override final  String? submitError;
@override final  String? submitErrorCode;

/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoFallbackStartStateCopyWith<_GeoFallbackStartState> get copyWith => __$GeoFallbackStartStateCopyWithImpl<_GeoFallbackStartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoFallbackStartState&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.geoFallbackReason, geoFallbackReason) || other.geoFallbackReason == geoFallbackReason)&&(identical(other.workLocation, workLocation) || other.workLocation == workLocation)&&(identical(other.schedules, schedules) || other.schedules == schedules)&&(identical(other.scheduleNow, scheduleNow) || other.scheduleNow == scheduleNow)&&(identical(other.workScheduleId, workScheduleId) || other.workScheduleId == workScheduleId)&&(identical(other.photoMode, photoMode) || other.photoMode == photoMode)&&const DeepCollectionEquality().equals(other.photoBytes, photoBytes)&&(identical(other.photoProcessing, photoProcessing) || other.photoProcessing == photoProcessing)&&(identical(other.photoErrorCode, photoErrorCode) || other.photoErrorCode == photoErrorCode)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,organizationId,geoFallbackReason,workLocation,schedules,scheduleNow,workScheduleId,photoMode,const DeepCollectionEquality().hash(photoBytes),photoProcessing,photoErrorCode,submitStatus,submitError,submitErrorCode);

@override
String toString() {
  return 'GeoFallbackStartState(organizationId: $organizationId, geoFallbackReason: $geoFallbackReason, workLocation: $workLocation, schedules: $schedules, scheduleNow: $scheduleNow, workScheduleId: $workScheduleId, photoMode: $photoMode, photoBytes: $photoBytes, photoProcessing: $photoProcessing, photoErrorCode: $photoErrorCode, submitStatus: $submitStatus, submitError: $submitError, submitErrorCode: $submitErrorCode)';
}


}

/// @nodoc
abstract mixin class _$GeoFallbackStartStateCopyWith<$Res> implements $GeoFallbackStartStateCopyWith<$Res> {
  factory _$GeoFallbackStartStateCopyWith(_GeoFallbackStartState value, $Res Function(_GeoFallbackStartState) _then) = __$GeoFallbackStartStateCopyWithImpl;
@override @useResult
$Res call({
 String organizationId, String geoFallbackReason, WorkLocation? workLocation, SectionData<MySchedules> schedules, DateTime? scheduleNow, String? workScheduleId, GeoFallbackPhotoMode photoMode, Uint8List? photoBytes, bool photoProcessing, String? photoErrorCode, FeatureStatus submitStatus, String? submitError, String? submitErrorCode
});


@override $WorkLocationCopyWith<$Res>? get workLocation;@override $SectionDataCopyWith<MySchedules, $Res> get schedules;

}
/// @nodoc
class __$GeoFallbackStartStateCopyWithImpl<$Res>
    implements _$GeoFallbackStartStateCopyWith<$Res> {
  __$GeoFallbackStartStateCopyWithImpl(this._self, this._then);

  final _GeoFallbackStartState _self;
  final $Res Function(_GeoFallbackStartState) _then;

/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? organizationId = null,Object? geoFallbackReason = null,Object? workLocation = freezed,Object? schedules = null,Object? scheduleNow = freezed,Object? workScheduleId = freezed,Object? photoMode = null,Object? photoBytes = freezed,Object? photoProcessing = null,Object? photoErrorCode = freezed,Object? submitStatus = null,Object? submitError = freezed,Object? submitErrorCode = freezed,}) {
  return _then(_GeoFallbackStartState(
organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,geoFallbackReason: null == geoFallbackReason ? _self.geoFallbackReason : geoFallbackReason // ignore: cast_nullable_to_non_nullable
as String,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as WorkLocation?,schedules: null == schedules ? _self.schedules : schedules // ignore: cast_nullable_to_non_nullable
as SectionData<MySchedules>,scheduleNow: freezed == scheduleNow ? _self.scheduleNow : scheduleNow // ignore: cast_nullable_to_non_nullable
as DateTime?,workScheduleId: freezed == workScheduleId ? _self.workScheduleId : workScheduleId // ignore: cast_nullable_to_non_nullable
as String?,photoMode: null == photoMode ? _self.photoMode : photoMode // ignore: cast_nullable_to_non_nullable
as GeoFallbackPhotoMode,photoBytes: freezed == photoBytes ? _self.photoBytes : photoBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,photoProcessing: null == photoProcessing ? _self.photoProcessing : photoProcessing // ignore: cast_nullable_to_non_nullable
as bool,photoErrorCode: freezed == photoErrorCode ? _self.photoErrorCode : photoErrorCode // ignore: cast_nullable_to_non_nullable
as String?,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GeoFallbackStartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkLocationCopyWith<$Res>? get workLocation {
    if (_self.workLocation == null) {
    return null;
  }

  return $WorkLocationCopyWith<$Res>(_self.workLocation!, (value) {
    return _then(_self.copyWith(workLocation: value));
  });
}/// Create a copy of GeoFallbackStartState
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
