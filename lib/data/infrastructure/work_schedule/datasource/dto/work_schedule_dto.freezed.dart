// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkScheduleDto {

 String get id; String get name; String get startTime; String get endTime; int get durationMinutes; bool get crossesMidnight; DateTime get nextStartAt; DateTime get nextEndAt; bool get isCurrent; int get startsInMinutes;
/// Create a copy of WorkScheduleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScheduleDtoCopyWith<WorkScheduleDto> get copyWith => _$WorkScheduleDtoCopyWithImpl<WorkScheduleDto>(this as WorkScheduleDto, _$identity);

  /// Serializes this WorkScheduleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScheduleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.crossesMidnight, crossesMidnight) || other.crossesMidnight == crossesMidnight)&&(identical(other.nextStartAt, nextStartAt) || other.nextStartAt == nextStartAt)&&(identical(other.nextEndAt, nextEndAt) || other.nextEndAt == nextEndAt)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.startsInMinutes, startsInMinutes) || other.startsInMinutes == startsInMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startTime,endTime,durationMinutes,crossesMidnight,nextStartAt,nextEndAt,isCurrent,startsInMinutes);

@override
String toString() {
  return 'WorkScheduleDto(id: $id, name: $name, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, crossesMidnight: $crossesMidnight, nextStartAt: $nextStartAt, nextEndAt: $nextEndAt, isCurrent: $isCurrent, startsInMinutes: $startsInMinutes)';
}


}

/// @nodoc
abstract mixin class $WorkScheduleDtoCopyWith<$Res>  {
  factory $WorkScheduleDtoCopyWith(WorkScheduleDto value, $Res Function(WorkScheduleDto) _then) = _$WorkScheduleDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String startTime, String endTime, int durationMinutes, bool crossesMidnight, DateTime nextStartAt, DateTime nextEndAt, bool isCurrent, int startsInMinutes
});




}
/// @nodoc
class _$WorkScheduleDtoCopyWithImpl<$Res>
    implements $WorkScheduleDtoCopyWith<$Res> {
  _$WorkScheduleDtoCopyWithImpl(this._self, this._then);

  final WorkScheduleDto _self;
  final $Res Function(WorkScheduleDto) _then;

/// Create a copy of WorkScheduleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? startTime = null,Object? endTime = null,Object? durationMinutes = null,Object? crossesMidnight = null,Object? nextStartAt = null,Object? nextEndAt = null,Object? isCurrent = null,Object? startsInMinutes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,crossesMidnight: null == crossesMidnight ? _self.crossesMidnight : crossesMidnight // ignore: cast_nullable_to_non_nullable
as bool,nextStartAt: null == nextStartAt ? _self.nextStartAt : nextStartAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextEndAt: null == nextEndAt ? _self.nextEndAt : nextEndAt // ignore: cast_nullable_to_non_nullable
as DateTime,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,startsInMinutes: null == startsInMinutes ? _self.startsInMinutes : startsInMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkScheduleDto].
extension WorkScheduleDtoPatterns on WorkScheduleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkScheduleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkScheduleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkScheduleDto value)  $default,){
final _that = this;
switch (_that) {
case _WorkScheduleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkScheduleDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorkScheduleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String startTime,  String endTime,  int durationMinutes,  bool crossesMidnight,  DateTime nextStartAt,  DateTime nextEndAt,  bool isCurrent,  int startsInMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkScheduleDto() when $default != null:
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.durationMinutes,_that.crossesMidnight,_that.nextStartAt,_that.nextEndAt,_that.isCurrent,_that.startsInMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String startTime,  String endTime,  int durationMinutes,  bool crossesMidnight,  DateTime nextStartAt,  DateTime nextEndAt,  bool isCurrent,  int startsInMinutes)  $default,) {final _that = this;
switch (_that) {
case _WorkScheduleDto():
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.durationMinutes,_that.crossesMidnight,_that.nextStartAt,_that.nextEndAt,_that.isCurrent,_that.startsInMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String startTime,  String endTime,  int durationMinutes,  bool crossesMidnight,  DateTime nextStartAt,  DateTime nextEndAt,  bool isCurrent,  int startsInMinutes)?  $default,) {final _that = this;
switch (_that) {
case _WorkScheduleDto() when $default != null:
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.durationMinutes,_that.crossesMidnight,_that.nextStartAt,_that.nextEndAt,_that.isCurrent,_that.startsInMinutes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _WorkScheduleDto implements WorkScheduleDto {
  const _WorkScheduleDto({required this.id, required this.name, required this.startTime, required this.endTime, required this.durationMinutes, required this.crossesMidnight, required this.nextStartAt, required this.nextEndAt, required this.isCurrent, required this.startsInMinutes});
  factory _WorkScheduleDto.fromJson(Map<String, dynamic> json) => _$WorkScheduleDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String startTime;
@override final  String endTime;
@override final  int durationMinutes;
@override final  bool crossesMidnight;
@override final  DateTime nextStartAt;
@override final  DateTime nextEndAt;
@override final  bool isCurrent;
@override final  int startsInMinutes;

/// Create a copy of WorkScheduleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScheduleDtoCopyWith<_WorkScheduleDto> get copyWith => __$WorkScheduleDtoCopyWithImpl<_WorkScheduleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkScheduleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkScheduleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.crossesMidnight, crossesMidnight) || other.crossesMidnight == crossesMidnight)&&(identical(other.nextStartAt, nextStartAt) || other.nextStartAt == nextStartAt)&&(identical(other.nextEndAt, nextEndAt) || other.nextEndAt == nextEndAt)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.startsInMinutes, startsInMinutes) || other.startsInMinutes == startsInMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startTime,endTime,durationMinutes,crossesMidnight,nextStartAt,nextEndAt,isCurrent,startsInMinutes);

@override
String toString() {
  return 'WorkScheduleDto(id: $id, name: $name, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, crossesMidnight: $crossesMidnight, nextStartAt: $nextStartAt, nextEndAt: $nextEndAt, isCurrent: $isCurrent, startsInMinutes: $startsInMinutes)';
}


}

/// @nodoc
abstract mixin class _$WorkScheduleDtoCopyWith<$Res> implements $WorkScheduleDtoCopyWith<$Res> {
  factory _$WorkScheduleDtoCopyWith(_WorkScheduleDto value, $Res Function(_WorkScheduleDto) _then) = __$WorkScheduleDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String startTime, String endTime, int durationMinutes, bool crossesMidnight, DateTime nextStartAt, DateTime nextEndAt, bool isCurrent, int startsInMinutes
});




}
/// @nodoc
class __$WorkScheduleDtoCopyWithImpl<$Res>
    implements _$WorkScheduleDtoCopyWith<$Res> {
  __$WorkScheduleDtoCopyWithImpl(this._self, this._then);

  final _WorkScheduleDto _self;
  final $Res Function(_WorkScheduleDto) _then;

/// Create a copy of WorkScheduleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? startTime = null,Object? endTime = null,Object? durationMinutes = null,Object? crossesMidnight = null,Object? nextStartAt = null,Object? nextEndAt = null,Object? isCurrent = null,Object? startsInMinutes = null,}) {
  return _then(_WorkScheduleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,crossesMidnight: null == crossesMidnight ? _self.crossesMidnight : crossesMidnight // ignore: cast_nullable_to_non_nullable
as bool,nextStartAt: null == nextStartAt ? _self.nextStartAt : nextStartAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextEndAt: null == nextEndAt ? _self.nextEndAt : nextEndAt // ignore: cast_nullable_to_non_nullable
as DateTime,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,startsInMinutes: null == startsInMinutes ? _self.startsInMinutes : startsInMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MySchedulesDto {

 List<WorkScheduleDto> get items; int get total; bool get requireSchedule;/// Отсутствует в ответе старого бэкенда, ещё не знающего
/// `schedule_window_enforcement`, — дефолт `0` не роняет парсинг
/// (обратная совместимость).
 int get earlyStartMinutes;
/// Create a copy of MySchedulesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MySchedulesDtoCopyWith<MySchedulesDto> get copyWith => _$MySchedulesDtoCopyWithImpl<MySchedulesDto>(this as MySchedulesDto, _$identity);

  /// Serializes this MySchedulesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MySchedulesDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.requireSchedule, requireSchedule) || other.requireSchedule == requireSchedule)&&(identical(other.earlyStartMinutes, earlyStartMinutes) || other.earlyStartMinutes == earlyStartMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,requireSchedule,earlyStartMinutes);

@override
String toString() {
  return 'MySchedulesDto(items: $items, total: $total, requireSchedule: $requireSchedule, earlyStartMinutes: $earlyStartMinutes)';
}


}

/// @nodoc
abstract mixin class $MySchedulesDtoCopyWith<$Res>  {
  factory $MySchedulesDtoCopyWith(MySchedulesDto value, $Res Function(MySchedulesDto) _then) = _$MySchedulesDtoCopyWithImpl;
@useResult
$Res call({
 List<WorkScheduleDto> items, int total, bool requireSchedule, int earlyStartMinutes
});




}
/// @nodoc
class _$MySchedulesDtoCopyWithImpl<$Res>
    implements $MySchedulesDtoCopyWith<$Res> {
  _$MySchedulesDtoCopyWithImpl(this._self, this._then);

  final MySchedulesDto _self;
  final $Res Function(MySchedulesDto) _then;

/// Create a copy of MySchedulesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? requireSchedule = null,Object? earlyStartMinutes = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WorkScheduleDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,requireSchedule: null == requireSchedule ? _self.requireSchedule : requireSchedule // ignore: cast_nullable_to_non_nullable
as bool,earlyStartMinutes: null == earlyStartMinutes ? _self.earlyStartMinutes : earlyStartMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MySchedulesDto].
extension MySchedulesDtoPatterns on MySchedulesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MySchedulesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MySchedulesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MySchedulesDto value)  $default,){
final _that = this;
switch (_that) {
case _MySchedulesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MySchedulesDto value)?  $default,){
final _that = this;
switch (_that) {
case _MySchedulesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkScheduleDto> items,  int total,  bool requireSchedule,  int earlyStartMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MySchedulesDto() when $default != null:
return $default(_that.items,_that.total,_that.requireSchedule,_that.earlyStartMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkScheduleDto> items,  int total,  bool requireSchedule,  int earlyStartMinutes)  $default,) {final _that = this;
switch (_that) {
case _MySchedulesDto():
return $default(_that.items,_that.total,_that.requireSchedule,_that.earlyStartMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkScheduleDto> items,  int total,  bool requireSchedule,  int earlyStartMinutes)?  $default,) {final _that = this;
switch (_that) {
case _MySchedulesDto() when $default != null:
return $default(_that.items,_that.total,_that.requireSchedule,_that.earlyStartMinutes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _MySchedulesDto implements MySchedulesDto {
  const _MySchedulesDto({required final  List<WorkScheduleDto> items, required this.total, required this.requireSchedule, this.earlyStartMinutes = 0}): _items = items;
  factory _MySchedulesDto.fromJson(Map<String, dynamic> json) => _$MySchedulesDtoFromJson(json);

 final  List<WorkScheduleDto> _items;
@override List<WorkScheduleDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  bool requireSchedule;
/// Отсутствует в ответе старого бэкенда, ещё не знающего
/// `schedule_window_enforcement`, — дефолт `0` не роняет парсинг
/// (обратная совместимость).
@override@JsonKey() final  int earlyStartMinutes;

/// Create a copy of MySchedulesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MySchedulesDtoCopyWith<_MySchedulesDto> get copyWith => __$MySchedulesDtoCopyWithImpl<_MySchedulesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MySchedulesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MySchedulesDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.requireSchedule, requireSchedule) || other.requireSchedule == requireSchedule)&&(identical(other.earlyStartMinutes, earlyStartMinutes) || other.earlyStartMinutes == earlyStartMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,requireSchedule,earlyStartMinutes);

@override
String toString() {
  return 'MySchedulesDto(items: $items, total: $total, requireSchedule: $requireSchedule, earlyStartMinutes: $earlyStartMinutes)';
}


}

/// @nodoc
abstract mixin class _$MySchedulesDtoCopyWith<$Res> implements $MySchedulesDtoCopyWith<$Res> {
  factory _$MySchedulesDtoCopyWith(_MySchedulesDto value, $Res Function(_MySchedulesDto) _then) = __$MySchedulesDtoCopyWithImpl;
@override @useResult
$Res call({
 List<WorkScheduleDto> items, int total, bool requireSchedule, int earlyStartMinutes
});




}
/// @nodoc
class __$MySchedulesDtoCopyWithImpl<$Res>
    implements _$MySchedulesDtoCopyWith<$Res> {
  __$MySchedulesDtoCopyWithImpl(this._self, this._then);

  final _MySchedulesDto _self;
  final $Res Function(_MySchedulesDto) _then;

/// Create a copy of MySchedulesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? requireSchedule = null,Object? earlyStartMinutes = null,}) {
  return _then(_MySchedulesDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WorkScheduleDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,requireSchedule: null == requireSchedule ? _self.requireSchedule : requireSchedule // ignore: cast_nullable_to_non_nullable
as bool,earlyStartMinutes: null == earlyStartMinutes ? _self.earlyStartMinutes : earlyStartMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
