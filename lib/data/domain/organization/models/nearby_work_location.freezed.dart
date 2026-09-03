// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_work_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyWorkLocation {

 String get id; String get name;/// Расстояние до точки, метры (округление вниз, отдаёт сервер).
 int get distanceMeters;/// `true` — ближайшая из подходящих; ровно у одного элемента списка (у
/// первого, сервер уже сортирует по [distanceMeters]).
 bool get isNearest; String? get address;
/// Create a copy of NearbyWorkLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyWorkLocationCopyWith<NearbyWorkLocation> get copyWith => _$NearbyWorkLocationCopyWithImpl<NearbyWorkLocation>(this as NearbyWorkLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyWorkLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.isNearest, isNearest) || other.isNearest == isNearest)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,distanceMeters,isNearest,address);

@override
String toString() {
  return 'NearbyWorkLocation(id: $id, name: $name, distanceMeters: $distanceMeters, isNearest: $isNearest, address: $address)';
}


}

/// @nodoc
abstract mixin class $NearbyWorkLocationCopyWith<$Res>  {
  factory $NearbyWorkLocationCopyWith(NearbyWorkLocation value, $Res Function(NearbyWorkLocation) _then) = _$NearbyWorkLocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, int distanceMeters, bool isNearest, String? address
});




}
/// @nodoc
class _$NearbyWorkLocationCopyWithImpl<$Res>
    implements $NearbyWorkLocationCopyWith<$Res> {
  _$NearbyWorkLocationCopyWithImpl(this._self, this._then);

  final NearbyWorkLocation _self;
  final $Res Function(NearbyWorkLocation) _then;

/// Create a copy of NearbyWorkLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? distanceMeters = null,Object? isNearest = null,Object? address = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,isNearest: null == isNearest ? _self.isNearest : isNearest // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyWorkLocation].
extension NearbyWorkLocationPatterns on NearbyWorkLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyWorkLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyWorkLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyWorkLocation value)  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyWorkLocation value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int distanceMeters,  bool isNearest,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyWorkLocation() when $default != null:
return $default(_that.id,_that.name,_that.distanceMeters,_that.isNearest,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int distanceMeters,  bool isNearest,  String? address)  $default,) {final _that = this;
switch (_that) {
case _NearbyWorkLocation():
return $default(_that.id,_that.name,_that.distanceMeters,_that.isNearest,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int distanceMeters,  bool isNearest,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _NearbyWorkLocation() when $default != null:
return $default(_that.id,_that.name,_that.distanceMeters,_that.isNearest,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyWorkLocation implements NearbyWorkLocation {
  const _NearbyWorkLocation({required this.id, required this.name, required this.distanceMeters, required this.isNearest, this.address});
  

@override final  String id;
@override final  String name;
/// Расстояние до точки, метры (округление вниз, отдаёт сервер).
@override final  int distanceMeters;
/// `true` — ближайшая из подходящих; ровно у одного элемента списка (у
/// первого, сервер уже сортирует по [distanceMeters]).
@override final  bool isNearest;
@override final  String? address;

/// Create a copy of NearbyWorkLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyWorkLocationCopyWith<_NearbyWorkLocation> get copyWith => __$NearbyWorkLocationCopyWithImpl<_NearbyWorkLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyWorkLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.isNearest, isNearest) || other.isNearest == isNearest)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,distanceMeters,isNearest,address);

@override
String toString() {
  return 'NearbyWorkLocation(id: $id, name: $name, distanceMeters: $distanceMeters, isNearest: $isNearest, address: $address)';
}


}

/// @nodoc
abstract mixin class _$NearbyWorkLocationCopyWith<$Res> implements $NearbyWorkLocationCopyWith<$Res> {
  factory _$NearbyWorkLocationCopyWith(_NearbyWorkLocation value, $Res Function(_NearbyWorkLocation) _then) = __$NearbyWorkLocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int distanceMeters, bool isNearest, String? address
});




}
/// @nodoc
class __$NearbyWorkLocationCopyWithImpl<$Res>
    implements _$NearbyWorkLocationCopyWith<$Res> {
  __$NearbyWorkLocationCopyWithImpl(this._self, this._then);

  final _NearbyWorkLocation _self;
  final $Res Function(_NearbyWorkLocation) _then;

/// Create a copy of NearbyWorkLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? distanceMeters = null,Object? isNearest = null,Object? address = freezed,}) {
  return _then(_NearbyWorkLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,isNearest: null == isNearest ? _self.isNearest : isNearest // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NearestOutsideWorkLocation {

 String get name; int get distanceMeters;
/// Create a copy of NearestOutsideWorkLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearestOutsideWorkLocationCopyWith<NearestOutsideWorkLocation> get copyWith => _$NearestOutsideWorkLocationCopyWithImpl<NearestOutsideWorkLocation>(this as NearestOutsideWorkLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearestOutsideWorkLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}


@override
int get hashCode => Object.hash(runtimeType,name,distanceMeters);

@override
String toString() {
  return 'NearestOutsideWorkLocation(name: $name, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class $NearestOutsideWorkLocationCopyWith<$Res>  {
  factory $NearestOutsideWorkLocationCopyWith(NearestOutsideWorkLocation value, $Res Function(NearestOutsideWorkLocation) _then) = _$NearestOutsideWorkLocationCopyWithImpl;
@useResult
$Res call({
 String name, int distanceMeters
});




}
/// @nodoc
class _$NearestOutsideWorkLocationCopyWithImpl<$Res>
    implements $NearestOutsideWorkLocationCopyWith<$Res> {
  _$NearestOutsideWorkLocationCopyWithImpl(this._self, this._then);

  final NearestOutsideWorkLocation _self;
  final $Res Function(NearestOutsideWorkLocation) _then;

/// Create a copy of NearestOutsideWorkLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? distanceMeters = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NearestOutsideWorkLocation].
extension NearestOutsideWorkLocationPatterns on NearestOutsideWorkLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearestOutsideWorkLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearestOutsideWorkLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearestOutsideWorkLocation value)  $default,){
final _that = this;
switch (_that) {
case _NearestOutsideWorkLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearestOutsideWorkLocation value)?  $default,){
final _that = this;
switch (_that) {
case _NearestOutsideWorkLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int distanceMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearestOutsideWorkLocation() when $default != null:
return $default(_that.name,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int distanceMeters)  $default,) {final _that = this;
switch (_that) {
case _NearestOutsideWorkLocation():
return $default(_that.name,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int distanceMeters)?  $default,) {final _that = this;
switch (_that) {
case _NearestOutsideWorkLocation() when $default != null:
return $default(_that.name,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc


class _NearestOutsideWorkLocation implements NearestOutsideWorkLocation {
  const _NearestOutsideWorkLocation({required this.name, required this.distanceMeters});
  

@override final  String name;
@override final  int distanceMeters;

/// Create a copy of NearestOutsideWorkLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearestOutsideWorkLocationCopyWith<_NearestOutsideWorkLocation> get copyWith => __$NearestOutsideWorkLocationCopyWithImpl<_NearestOutsideWorkLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearestOutsideWorkLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}


@override
int get hashCode => Object.hash(runtimeType,name,distanceMeters);

@override
String toString() {
  return 'NearestOutsideWorkLocation(name: $name, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$NearestOutsideWorkLocationCopyWith<$Res> implements $NearestOutsideWorkLocationCopyWith<$Res> {
  factory _$NearestOutsideWorkLocationCopyWith(_NearestOutsideWorkLocation value, $Res Function(_NearestOutsideWorkLocation) _then) = __$NearestOutsideWorkLocationCopyWithImpl;
@override @useResult
$Res call({
 String name, int distanceMeters
});




}
/// @nodoc
class __$NearestOutsideWorkLocationCopyWithImpl<$Res>
    implements _$NearestOutsideWorkLocationCopyWith<$Res> {
  __$NearestOutsideWorkLocationCopyWithImpl(this._self, this._then);

  final _NearestOutsideWorkLocation _self;
  final $Res Function(_NearestOutsideWorkLocation) _then;

/// Create a copy of NearestOutsideWorkLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? distanceMeters = null,}) {
  return _then(_NearestOutsideWorkLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NearbyWorkLocations {

/// Точки в радиусе, отсортированные по возрастанию расстояния — порядок
/// сервера, клиент не пересортировывает (mobile.md).
 List<NearbyWorkLocation> get items;/// `null` — у организации нет точек вне [items] (либо [items] не пуст).
 NearestOutsideWorkLocation? get nearestOutside;
/// Create a copy of NearbyWorkLocations
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyWorkLocationsCopyWith<NearbyWorkLocations> get copyWith => _$NearbyWorkLocationsCopyWithImpl<NearbyWorkLocations>(this as NearbyWorkLocations, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyWorkLocations&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nearestOutside, nearestOutside) || other.nearestOutside == nearestOutside));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nearestOutside);

@override
String toString() {
  return 'NearbyWorkLocations(items: $items, nearestOutside: $nearestOutside)';
}


}

/// @nodoc
abstract mixin class $NearbyWorkLocationsCopyWith<$Res>  {
  factory $NearbyWorkLocationsCopyWith(NearbyWorkLocations value, $Res Function(NearbyWorkLocations) _then) = _$NearbyWorkLocationsCopyWithImpl;
@useResult
$Res call({
 List<NearbyWorkLocation> items, NearestOutsideWorkLocation? nearestOutside
});


$NearestOutsideWorkLocationCopyWith<$Res>? get nearestOutside;

}
/// @nodoc
class _$NearbyWorkLocationsCopyWithImpl<$Res>
    implements $NearbyWorkLocationsCopyWith<$Res> {
  _$NearbyWorkLocationsCopyWithImpl(this._self, this._then);

  final NearbyWorkLocations _self;
  final $Res Function(NearbyWorkLocations) _then;

/// Create a copy of NearbyWorkLocations
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nearestOutside = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NearbyWorkLocation>,nearestOutside: freezed == nearestOutside ? _self.nearestOutside : nearestOutside // ignore: cast_nullable_to_non_nullable
as NearestOutsideWorkLocation?,
  ));
}
/// Create a copy of NearbyWorkLocations
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestOutsideWorkLocationCopyWith<$Res>? get nearestOutside {
    if (_self.nearestOutside == null) {
    return null;
  }

  return $NearestOutsideWorkLocationCopyWith<$Res>(_self.nearestOutside!, (value) {
    return _then(_self.copyWith(nearestOutside: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyWorkLocations].
extension NearbyWorkLocationsPatterns on NearbyWorkLocations {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyWorkLocations value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyWorkLocations() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyWorkLocations value)  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocations():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyWorkLocations value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocations() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NearbyWorkLocation> items,  NearestOutsideWorkLocation? nearestOutside)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyWorkLocations() when $default != null:
return $default(_that.items,_that.nearestOutside);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NearbyWorkLocation> items,  NearestOutsideWorkLocation? nearestOutside)  $default,) {final _that = this;
switch (_that) {
case _NearbyWorkLocations():
return $default(_that.items,_that.nearestOutside);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NearbyWorkLocation> items,  NearestOutsideWorkLocation? nearestOutside)?  $default,) {final _that = this;
switch (_that) {
case _NearbyWorkLocations() when $default != null:
return $default(_that.items,_that.nearestOutside);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyWorkLocations implements NearbyWorkLocations {
  const _NearbyWorkLocations({required final  List<NearbyWorkLocation> items, this.nearestOutside}): _items = items;
  

/// Точки в радиусе, отсортированные по возрастанию расстояния — порядок
/// сервера, клиент не пересортировывает (mobile.md).
 final  List<NearbyWorkLocation> _items;
/// Точки в радиусе, отсортированные по возрастанию расстояния — порядок
/// сервера, клиент не пересортировывает (mobile.md).
@override List<NearbyWorkLocation> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// `null` — у организации нет точек вне [items] (либо [items] не пуст).
@override final  NearestOutsideWorkLocation? nearestOutside;

/// Create a copy of NearbyWorkLocations
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyWorkLocationsCopyWith<_NearbyWorkLocations> get copyWith => __$NearbyWorkLocationsCopyWithImpl<_NearbyWorkLocations>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyWorkLocations&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nearestOutside, nearestOutside) || other.nearestOutside == nearestOutside));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nearestOutside);

@override
String toString() {
  return 'NearbyWorkLocations(items: $items, nearestOutside: $nearestOutside)';
}


}

/// @nodoc
abstract mixin class _$NearbyWorkLocationsCopyWith<$Res> implements $NearbyWorkLocationsCopyWith<$Res> {
  factory _$NearbyWorkLocationsCopyWith(_NearbyWorkLocations value, $Res Function(_NearbyWorkLocations) _then) = __$NearbyWorkLocationsCopyWithImpl;
@override @useResult
$Res call({
 List<NearbyWorkLocation> items, NearestOutsideWorkLocation? nearestOutside
});


@override $NearestOutsideWorkLocationCopyWith<$Res>? get nearestOutside;

}
/// @nodoc
class __$NearbyWorkLocationsCopyWithImpl<$Res>
    implements _$NearbyWorkLocationsCopyWith<$Res> {
  __$NearbyWorkLocationsCopyWithImpl(this._self, this._then);

  final _NearbyWorkLocations _self;
  final $Res Function(_NearbyWorkLocations) _then;

/// Create a copy of NearbyWorkLocations
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nearestOutside = freezed,}) {
  return _then(_NearbyWorkLocations(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NearbyWorkLocation>,nearestOutside: freezed == nearestOutside ? _self.nearestOutside : nearestOutside // ignore: cast_nullable_to_non_nullable
as NearestOutsideWorkLocation?,
  ));
}

/// Create a copy of NearbyWorkLocations
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestOutsideWorkLocationCopyWith<$Res>? get nearestOutside {
    if (_self.nearestOutside == null) {
    return null;
  }

  return $NearestOutsideWorkLocationCopyWith<$Res>(_self.nearestOutside!, (value) {
    return _then(_self.copyWith(nearestOutside: value));
  });
}
}

// dart format on
