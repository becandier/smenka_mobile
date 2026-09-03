// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_work_location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyWorkLocationDto {

 String get id; String get name; int get distanceMeters; bool get isNearest; String? get address;
/// Create a copy of NearbyWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyWorkLocationDtoCopyWith<NearbyWorkLocationDto> get copyWith => _$NearbyWorkLocationDtoCopyWithImpl<NearbyWorkLocationDto>(this as NearbyWorkLocationDto, _$identity);

  /// Serializes this NearbyWorkLocationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyWorkLocationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.isNearest, isNearest) || other.isNearest == isNearest)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,distanceMeters,isNearest,address);

@override
String toString() {
  return 'NearbyWorkLocationDto(id: $id, name: $name, distanceMeters: $distanceMeters, isNearest: $isNearest, address: $address)';
}


}

/// @nodoc
abstract mixin class $NearbyWorkLocationDtoCopyWith<$Res>  {
  factory $NearbyWorkLocationDtoCopyWith(NearbyWorkLocationDto value, $Res Function(NearbyWorkLocationDto) _then) = _$NearbyWorkLocationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, int distanceMeters, bool isNearest, String? address
});




}
/// @nodoc
class _$NearbyWorkLocationDtoCopyWithImpl<$Res>
    implements $NearbyWorkLocationDtoCopyWith<$Res> {
  _$NearbyWorkLocationDtoCopyWithImpl(this._self, this._then);

  final NearbyWorkLocationDto _self;
  final $Res Function(NearbyWorkLocationDto) _then;

/// Create a copy of NearbyWorkLocationDto
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


/// Adds pattern-matching-related methods to [NearbyWorkLocationDto].
extension NearbyWorkLocationDtoPatterns on NearbyWorkLocationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyWorkLocationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyWorkLocationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyWorkLocationDto value)  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyWorkLocationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocationDto() when $default != null:
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
case _NearbyWorkLocationDto() when $default != null:
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
case _NearbyWorkLocationDto():
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
case _NearbyWorkLocationDto() when $default != null:
return $default(_that.id,_that.name,_that.distanceMeters,_that.isNearest,_that.address);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NearbyWorkLocationDto implements NearbyWorkLocationDto {
  const _NearbyWorkLocationDto({required this.id, required this.name, required this.distanceMeters, required this.isNearest, this.address});
  factory _NearbyWorkLocationDto.fromJson(Map<String, dynamic> json) => _$NearbyWorkLocationDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  int distanceMeters;
@override final  bool isNearest;
@override final  String? address;

/// Create a copy of NearbyWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyWorkLocationDtoCopyWith<_NearbyWorkLocationDto> get copyWith => __$NearbyWorkLocationDtoCopyWithImpl<_NearbyWorkLocationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyWorkLocationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyWorkLocationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.isNearest, isNearest) || other.isNearest == isNearest)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,distanceMeters,isNearest,address);

@override
String toString() {
  return 'NearbyWorkLocationDto(id: $id, name: $name, distanceMeters: $distanceMeters, isNearest: $isNearest, address: $address)';
}


}

/// @nodoc
abstract mixin class _$NearbyWorkLocationDtoCopyWith<$Res> implements $NearbyWorkLocationDtoCopyWith<$Res> {
  factory _$NearbyWorkLocationDtoCopyWith(_NearbyWorkLocationDto value, $Res Function(_NearbyWorkLocationDto) _then) = __$NearbyWorkLocationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int distanceMeters, bool isNearest, String? address
});




}
/// @nodoc
class __$NearbyWorkLocationDtoCopyWithImpl<$Res>
    implements _$NearbyWorkLocationDtoCopyWith<$Res> {
  __$NearbyWorkLocationDtoCopyWithImpl(this._self, this._then);

  final _NearbyWorkLocationDto _self;
  final $Res Function(_NearbyWorkLocationDto) _then;

/// Create a copy of NearbyWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? distanceMeters = null,Object? isNearest = null,Object? address = freezed,}) {
  return _then(_NearbyWorkLocationDto(
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
mixin _$NearestOutsideWorkLocationDto {

 String get name; int get distanceMeters;
/// Create a copy of NearestOutsideWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearestOutsideWorkLocationDtoCopyWith<NearestOutsideWorkLocationDto> get copyWith => _$NearestOutsideWorkLocationDtoCopyWithImpl<NearestOutsideWorkLocationDto>(this as NearestOutsideWorkLocationDto, _$identity);

  /// Serializes this NearestOutsideWorkLocationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearestOutsideWorkLocationDto&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,distanceMeters);

@override
String toString() {
  return 'NearestOutsideWorkLocationDto(name: $name, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class $NearestOutsideWorkLocationDtoCopyWith<$Res>  {
  factory $NearestOutsideWorkLocationDtoCopyWith(NearestOutsideWorkLocationDto value, $Res Function(NearestOutsideWorkLocationDto) _then) = _$NearestOutsideWorkLocationDtoCopyWithImpl;
@useResult
$Res call({
 String name, int distanceMeters
});




}
/// @nodoc
class _$NearestOutsideWorkLocationDtoCopyWithImpl<$Res>
    implements $NearestOutsideWorkLocationDtoCopyWith<$Res> {
  _$NearestOutsideWorkLocationDtoCopyWithImpl(this._self, this._then);

  final NearestOutsideWorkLocationDto _self;
  final $Res Function(NearestOutsideWorkLocationDto) _then;

/// Create a copy of NearestOutsideWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? distanceMeters = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NearestOutsideWorkLocationDto].
extension NearestOutsideWorkLocationDtoPatterns on NearestOutsideWorkLocationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearestOutsideWorkLocationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearestOutsideWorkLocationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearestOutsideWorkLocationDto value)  $default,){
final _that = this;
switch (_that) {
case _NearestOutsideWorkLocationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearestOutsideWorkLocationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NearestOutsideWorkLocationDto() when $default != null:
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
case _NearestOutsideWorkLocationDto() when $default != null:
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
case _NearestOutsideWorkLocationDto():
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
case _NearestOutsideWorkLocationDto() when $default != null:
return $default(_that.name,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NearestOutsideWorkLocationDto implements NearestOutsideWorkLocationDto {
  const _NearestOutsideWorkLocationDto({required this.name, required this.distanceMeters});
  factory _NearestOutsideWorkLocationDto.fromJson(Map<String, dynamic> json) => _$NearestOutsideWorkLocationDtoFromJson(json);

@override final  String name;
@override final  int distanceMeters;

/// Create a copy of NearestOutsideWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearestOutsideWorkLocationDtoCopyWith<_NearestOutsideWorkLocationDto> get copyWith => __$NearestOutsideWorkLocationDtoCopyWithImpl<_NearestOutsideWorkLocationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearestOutsideWorkLocationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearestOutsideWorkLocationDto&&(identical(other.name, name) || other.name == name)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,distanceMeters);

@override
String toString() {
  return 'NearestOutsideWorkLocationDto(name: $name, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$NearestOutsideWorkLocationDtoCopyWith<$Res> implements $NearestOutsideWorkLocationDtoCopyWith<$Res> {
  factory _$NearestOutsideWorkLocationDtoCopyWith(_NearestOutsideWorkLocationDto value, $Res Function(_NearestOutsideWorkLocationDto) _then) = __$NearestOutsideWorkLocationDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, int distanceMeters
});




}
/// @nodoc
class __$NearestOutsideWorkLocationDtoCopyWithImpl<$Res>
    implements _$NearestOutsideWorkLocationDtoCopyWith<$Res> {
  __$NearestOutsideWorkLocationDtoCopyWithImpl(this._self, this._then);

  final _NearestOutsideWorkLocationDto _self;
  final $Res Function(_NearestOutsideWorkLocationDto) _then;

/// Create a copy of NearestOutsideWorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? distanceMeters = null,}) {
  return _then(_NearestOutsideWorkLocationDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NearbyWorkLocationsDto {

 List<NearbyWorkLocationDto> get items; NearestOutsideWorkLocationDto? get nearestOutside;
/// Create a copy of NearbyWorkLocationsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyWorkLocationsDtoCopyWith<NearbyWorkLocationsDto> get copyWith => _$NearbyWorkLocationsDtoCopyWithImpl<NearbyWorkLocationsDto>(this as NearbyWorkLocationsDto, _$identity);

  /// Serializes this NearbyWorkLocationsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyWorkLocationsDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nearestOutside, nearestOutside) || other.nearestOutside == nearestOutside));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nearestOutside);

@override
String toString() {
  return 'NearbyWorkLocationsDto(items: $items, nearestOutside: $nearestOutside)';
}


}

/// @nodoc
abstract mixin class $NearbyWorkLocationsDtoCopyWith<$Res>  {
  factory $NearbyWorkLocationsDtoCopyWith(NearbyWorkLocationsDto value, $Res Function(NearbyWorkLocationsDto) _then) = _$NearbyWorkLocationsDtoCopyWithImpl;
@useResult
$Res call({
 List<NearbyWorkLocationDto> items, NearestOutsideWorkLocationDto? nearestOutside
});


$NearestOutsideWorkLocationDtoCopyWith<$Res>? get nearestOutside;

}
/// @nodoc
class _$NearbyWorkLocationsDtoCopyWithImpl<$Res>
    implements $NearbyWorkLocationsDtoCopyWith<$Res> {
  _$NearbyWorkLocationsDtoCopyWithImpl(this._self, this._then);

  final NearbyWorkLocationsDto _self;
  final $Res Function(NearbyWorkLocationsDto) _then;

/// Create a copy of NearbyWorkLocationsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nearestOutside = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NearbyWorkLocationDto>,nearestOutside: freezed == nearestOutside ? _self.nearestOutside : nearestOutside // ignore: cast_nullable_to_non_nullable
as NearestOutsideWorkLocationDto?,
  ));
}
/// Create a copy of NearbyWorkLocationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestOutsideWorkLocationDtoCopyWith<$Res>? get nearestOutside {
    if (_self.nearestOutside == null) {
    return null;
  }

  return $NearestOutsideWorkLocationDtoCopyWith<$Res>(_self.nearestOutside!, (value) {
    return _then(_self.copyWith(nearestOutside: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyWorkLocationsDto].
extension NearbyWorkLocationsDtoPatterns on NearbyWorkLocationsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyWorkLocationsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyWorkLocationsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyWorkLocationsDto value)  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocationsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyWorkLocationsDto value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyWorkLocationsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NearbyWorkLocationDto> items,  NearestOutsideWorkLocationDto? nearestOutside)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyWorkLocationsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NearbyWorkLocationDto> items,  NearestOutsideWorkLocationDto? nearestOutside)  $default,) {final _that = this;
switch (_that) {
case _NearbyWorkLocationsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NearbyWorkLocationDto> items,  NearestOutsideWorkLocationDto? nearestOutside)?  $default,) {final _that = this;
switch (_that) {
case _NearbyWorkLocationsDto() when $default != null:
return $default(_that.items,_that.nearestOutside);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _NearbyWorkLocationsDto implements NearbyWorkLocationsDto {
  const _NearbyWorkLocationsDto({final  List<NearbyWorkLocationDto> items = const <NearbyWorkLocationDto>[], this.nearestOutside}): _items = items;
  factory _NearbyWorkLocationsDto.fromJson(Map<String, dynamic> json) => _$NearbyWorkLocationsDtoFromJson(json);

 final  List<NearbyWorkLocationDto> _items;
@override@JsonKey() List<NearbyWorkLocationDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  NearestOutsideWorkLocationDto? nearestOutside;

/// Create a copy of NearbyWorkLocationsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyWorkLocationsDtoCopyWith<_NearbyWorkLocationsDto> get copyWith => __$NearbyWorkLocationsDtoCopyWithImpl<_NearbyWorkLocationsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyWorkLocationsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyWorkLocationsDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nearestOutside, nearestOutside) || other.nearestOutside == nearestOutside));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nearestOutside);

@override
String toString() {
  return 'NearbyWorkLocationsDto(items: $items, nearestOutside: $nearestOutside)';
}


}

/// @nodoc
abstract mixin class _$NearbyWorkLocationsDtoCopyWith<$Res> implements $NearbyWorkLocationsDtoCopyWith<$Res> {
  factory _$NearbyWorkLocationsDtoCopyWith(_NearbyWorkLocationsDto value, $Res Function(_NearbyWorkLocationsDto) _then) = __$NearbyWorkLocationsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<NearbyWorkLocationDto> items, NearestOutsideWorkLocationDto? nearestOutside
});


@override $NearestOutsideWorkLocationDtoCopyWith<$Res>? get nearestOutside;

}
/// @nodoc
class __$NearbyWorkLocationsDtoCopyWithImpl<$Res>
    implements _$NearbyWorkLocationsDtoCopyWith<$Res> {
  __$NearbyWorkLocationsDtoCopyWithImpl(this._self, this._then);

  final _NearbyWorkLocationsDto _self;
  final $Res Function(_NearbyWorkLocationsDto) _then;

/// Create a copy of NearbyWorkLocationsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nearestOutside = freezed,}) {
  return _then(_NearbyWorkLocationsDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NearbyWorkLocationDto>,nearestOutside: freezed == nearestOutside ? _self.nearestOutside : nearestOutside // ignore: cast_nullable_to_non_nullable
as NearestOutsideWorkLocationDto?,
  ));
}

/// Create a copy of NearbyWorkLocationsDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearestOutsideWorkLocationDtoCopyWith<$Res>? get nearestOutside {
    if (_self.nearestOutside == null) {
    return null;
  }

  return $NearestOutsideWorkLocationDtoCopyWith<$Res>(_self.nearestOutside!, (value) {
    return _then(_self.copyWith(nearestOutside: value));
  });
}
}

// dart format on
