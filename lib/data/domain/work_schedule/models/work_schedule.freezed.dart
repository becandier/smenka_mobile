// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkSchedule {

 String get id; String get name; String get startTime; String get endTime; int get durationMinutes; bool get crossesMidnight; DateTime get nextStartAt; DateTime get nextEndAt; bool get isCurrent;/// Минуты до планового начала. Отрицательное значение — график уже идёт
/// (столько минут назад он начался), используется для «опоздал на N мин».
 int get startsInMinutes;
/// Create a copy of WorkSchedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScheduleCopyWith<WorkSchedule> get copyWith => _$WorkScheduleCopyWithImpl<WorkSchedule>(this as WorkSchedule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.crossesMidnight, crossesMidnight) || other.crossesMidnight == crossesMidnight)&&(identical(other.nextStartAt, nextStartAt) || other.nextStartAt == nextStartAt)&&(identical(other.nextEndAt, nextEndAt) || other.nextEndAt == nextEndAt)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.startsInMinutes, startsInMinutes) || other.startsInMinutes == startsInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,startTime,endTime,durationMinutes,crossesMidnight,nextStartAt,nextEndAt,isCurrent,startsInMinutes);

@override
String toString() {
  return 'WorkSchedule(id: $id, name: $name, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, crossesMidnight: $crossesMidnight, nextStartAt: $nextStartAt, nextEndAt: $nextEndAt, isCurrent: $isCurrent, startsInMinutes: $startsInMinutes)';
}


}

/// @nodoc
abstract mixin class $WorkScheduleCopyWith<$Res>  {
  factory $WorkScheduleCopyWith(WorkSchedule value, $Res Function(WorkSchedule) _then) = _$WorkScheduleCopyWithImpl;
@useResult
$Res call({
 String id, String name, String startTime, String endTime, int durationMinutes, bool crossesMidnight, DateTime nextStartAt, DateTime nextEndAt, bool isCurrent, int startsInMinutes
});




}
/// @nodoc
class _$WorkScheduleCopyWithImpl<$Res>
    implements $WorkScheduleCopyWith<$Res> {
  _$WorkScheduleCopyWithImpl(this._self, this._then);

  final WorkSchedule _self;
  final $Res Function(WorkSchedule) _then;

/// Create a copy of WorkSchedule
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


/// Adds pattern-matching-related methods to [WorkSchedule].
extension WorkSchedulePatterns on WorkSchedule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkSchedule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkSchedule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkSchedule value)  $default,){
final _that = this;
switch (_that) {
case _WorkSchedule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkSchedule value)?  $default,){
final _that = this;
switch (_that) {
case _WorkSchedule() when $default != null:
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
case _WorkSchedule() when $default != null:
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
case _WorkSchedule():
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
case _WorkSchedule() when $default != null:
return $default(_that.id,_that.name,_that.startTime,_that.endTime,_that.durationMinutes,_that.crossesMidnight,_that.nextStartAt,_that.nextEndAt,_that.isCurrent,_that.startsInMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _WorkSchedule extends WorkSchedule {
  const _WorkSchedule({required this.id, required this.name, required this.startTime, required this.endTime, required this.durationMinutes, required this.crossesMidnight, required this.nextStartAt, required this.nextEndAt, required this.isCurrent, required this.startsInMinutes}): super._();
  

@override final  String id;
@override final  String name;
@override final  String startTime;
@override final  String endTime;
@override final  int durationMinutes;
@override final  bool crossesMidnight;
@override final  DateTime nextStartAt;
@override final  DateTime nextEndAt;
@override final  bool isCurrent;
/// Минуты до планового начала. Отрицательное значение — график уже идёт
/// (столько минут назад он начался), используется для «опоздал на N мин».
@override final  int startsInMinutes;

/// Create a copy of WorkSchedule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScheduleCopyWith<_WorkSchedule> get copyWith => __$WorkScheduleCopyWithImpl<_WorkSchedule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkSchedule&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.crossesMidnight, crossesMidnight) || other.crossesMidnight == crossesMidnight)&&(identical(other.nextStartAt, nextStartAt) || other.nextStartAt == nextStartAt)&&(identical(other.nextEndAt, nextEndAt) || other.nextEndAt == nextEndAt)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.startsInMinutes, startsInMinutes) || other.startsInMinutes == startsInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,startTime,endTime,durationMinutes,crossesMidnight,nextStartAt,nextEndAt,isCurrent,startsInMinutes);

@override
String toString() {
  return 'WorkSchedule(id: $id, name: $name, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, crossesMidnight: $crossesMidnight, nextStartAt: $nextStartAt, nextEndAt: $nextEndAt, isCurrent: $isCurrent, startsInMinutes: $startsInMinutes)';
}


}

/// @nodoc
abstract mixin class _$WorkScheduleCopyWith<$Res> implements $WorkScheduleCopyWith<$Res> {
  factory _$WorkScheduleCopyWith(_WorkSchedule value, $Res Function(_WorkSchedule) _then) = __$WorkScheduleCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String startTime, String endTime, int durationMinutes, bool crossesMidnight, DateTime nextStartAt, DateTime nextEndAt, bool isCurrent, int startsInMinutes
});




}
/// @nodoc
class __$WorkScheduleCopyWithImpl<$Res>
    implements _$WorkScheduleCopyWith<$Res> {
  __$WorkScheduleCopyWithImpl(this._self, this._then);

  final _WorkSchedule _self;
  final $Res Function(_WorkSchedule) _then;

/// Create a copy of WorkSchedule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? startTime = null,Object? endTime = null,Object? durationMinutes = null,Object? crossesMidnight = null,Object? nextStartAt = null,Object? nextEndAt = null,Object? isCurrent = null,Object? startsInMinutes = null,}) {
  return _then(_WorkSchedule(
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

// dart format on
