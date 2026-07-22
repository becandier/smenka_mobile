// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_schedules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MySchedules {

 List<WorkSchedule> get items; int get total; bool get requireSchedule;
/// Create a copy of MySchedules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MySchedulesCopyWith<MySchedules> get copyWith => _$MySchedulesCopyWithImpl<MySchedules>(this as MySchedules, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MySchedules&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.requireSchedule, requireSchedule) || other.requireSchedule == requireSchedule));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,requireSchedule);

@override
String toString() {
  return 'MySchedules(items: $items, total: $total, requireSchedule: $requireSchedule)';
}


}

/// @nodoc
abstract mixin class $MySchedulesCopyWith<$Res>  {
  factory $MySchedulesCopyWith(MySchedules value, $Res Function(MySchedules) _then) = _$MySchedulesCopyWithImpl;
@useResult
$Res call({
 List<WorkSchedule> items, int total, bool requireSchedule
});




}
/// @nodoc
class _$MySchedulesCopyWithImpl<$Res>
    implements $MySchedulesCopyWith<$Res> {
  _$MySchedulesCopyWithImpl(this._self, this._then);

  final MySchedules _self;
  final $Res Function(MySchedules) _then;

/// Create a copy of MySchedules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? requireSchedule = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WorkSchedule>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,requireSchedule: null == requireSchedule ? _self.requireSchedule : requireSchedule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MySchedules].
extension MySchedulesPatterns on MySchedules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MySchedules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MySchedules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MySchedules value)  $default,){
final _that = this;
switch (_that) {
case _MySchedules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MySchedules value)?  $default,){
final _that = this;
switch (_that) {
case _MySchedules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkSchedule> items,  int total,  bool requireSchedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MySchedules() when $default != null:
return $default(_that.items,_that.total,_that.requireSchedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkSchedule> items,  int total,  bool requireSchedule)  $default,) {final _that = this;
switch (_that) {
case _MySchedules():
return $default(_that.items,_that.total,_that.requireSchedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkSchedule> items,  int total,  bool requireSchedule)?  $default,) {final _that = this;
switch (_that) {
case _MySchedules() when $default != null:
return $default(_that.items,_that.total,_that.requireSchedule);case _:
  return null;

}
}

}

/// @nodoc


class _MySchedules implements MySchedules {
  const _MySchedules({required final  List<WorkSchedule> items, required this.total, required this.requireSchedule}): _items = items;
  

 final  List<WorkSchedule> _items;
@override List<WorkSchedule> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  bool requireSchedule;

/// Create a copy of MySchedules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MySchedulesCopyWith<_MySchedules> get copyWith => __$MySchedulesCopyWithImpl<_MySchedules>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MySchedules&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.requireSchedule, requireSchedule) || other.requireSchedule == requireSchedule));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,requireSchedule);

@override
String toString() {
  return 'MySchedules(items: $items, total: $total, requireSchedule: $requireSchedule)';
}


}

/// @nodoc
abstract mixin class _$MySchedulesCopyWith<$Res> implements $MySchedulesCopyWith<$Res> {
  factory _$MySchedulesCopyWith(_MySchedules value, $Res Function(_MySchedules) _then) = __$MySchedulesCopyWithImpl;
@override @useResult
$Res call({
 List<WorkSchedule> items, int total, bool requireSchedule
});




}
/// @nodoc
class __$MySchedulesCopyWithImpl<$Res>
    implements _$MySchedulesCopyWith<$Res> {
  __$MySchedulesCopyWithImpl(this._self, this._then);

  final _MySchedules _self;
  final $Res Function(_MySchedules) _then;

/// Create a copy of MySchedules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? requireSchedule = null,}) {
  return _then(_MySchedules(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WorkSchedule>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,requireSchedule: null == requireSchedule ? _self.requireSchedule : requireSchedule // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
