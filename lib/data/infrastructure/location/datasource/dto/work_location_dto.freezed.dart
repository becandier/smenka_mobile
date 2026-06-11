// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkLocationDto {

 String get id; String get organizationId; String get name; double get latitude; double get longitude; int get radiusMeters; DateTime get createdAt;
/// Create a copy of WorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkLocationDtoCopyWith<WorkLocationDto> get copyWith => _$WorkLocationDtoCopyWithImpl<WorkLocationDto>(this as WorkLocationDto, _$identity);

  /// Serializes this WorkLocationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkLocationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organizationId,name,latitude,longitude,radiusMeters,createdAt);

@override
String toString() {
  return 'WorkLocationDto(id: $id, organizationId: $organizationId, name: $name, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WorkLocationDtoCopyWith<$Res>  {
  factory $WorkLocationDtoCopyWith(WorkLocationDto value, $Res Function(WorkLocationDto) _then) = _$WorkLocationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String organizationId, String name, double latitude, double longitude, int radiusMeters, DateTime createdAt
});




}
/// @nodoc
class _$WorkLocationDtoCopyWithImpl<$Res>
    implements $WorkLocationDtoCopyWith<$Res> {
  _$WorkLocationDtoCopyWithImpl(this._self, this._then);

  final WorkLocationDto _self;
  final $Res Function(WorkLocationDto) _then;

/// Create a copy of WorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? organizationId = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkLocationDto].
extension WorkLocationDtoPatterns on WorkLocationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkLocationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkLocationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkLocationDto value)  $default,){
final _that = this;
switch (_that) {
case _WorkLocationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkLocationDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorkLocationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String organizationId,  String name,  double latitude,  double longitude,  int radiusMeters,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkLocationDto() when $default != null:
return $default(_that.id,_that.organizationId,_that.name,_that.latitude,_that.longitude,_that.radiusMeters,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String organizationId,  String name,  double latitude,  double longitude,  int radiusMeters,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _WorkLocationDto():
return $default(_that.id,_that.organizationId,_that.name,_that.latitude,_that.longitude,_that.radiusMeters,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String organizationId,  String name,  double latitude,  double longitude,  int radiusMeters,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkLocationDto() when $default != null:
return $default(_that.id,_that.organizationId,_that.name,_that.latitude,_that.longitude,_that.radiusMeters,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _WorkLocationDto implements WorkLocationDto {
  const _WorkLocationDto({required this.id, required this.organizationId, required this.name, required this.latitude, required this.longitude, required this.radiusMeters, required this.createdAt});
  factory _WorkLocationDto.fromJson(Map<String, dynamic> json) => _$WorkLocationDtoFromJson(json);

@override final  String id;
@override final  String organizationId;
@override final  String name;
@override final  double latitude;
@override final  double longitude;
@override final  int radiusMeters;
@override final  DateTime createdAt;

/// Create a copy of WorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkLocationDtoCopyWith<_WorkLocationDto> get copyWith => __$WorkLocationDtoCopyWithImpl<_WorkLocationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkLocationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkLocationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,organizationId,name,latitude,longitude,radiusMeters,createdAt);

@override
String toString() {
  return 'WorkLocationDto(id: $id, organizationId: $organizationId, name: $name, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WorkLocationDtoCopyWith<$Res> implements $WorkLocationDtoCopyWith<$Res> {
  factory _$WorkLocationDtoCopyWith(_WorkLocationDto value, $Res Function(_WorkLocationDto) _then) = __$WorkLocationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String organizationId, String name, double latitude, double longitude, int radiusMeters, DateTime createdAt
});




}
/// @nodoc
class __$WorkLocationDtoCopyWithImpl<$Res>
    implements _$WorkLocationDtoCopyWith<$Res> {
  __$WorkLocationDtoCopyWithImpl(this._self, this._then);

  final _WorkLocationDto _self;
  final $Res Function(_WorkLocationDto) _then;

/// Create a copy of WorkLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? organizationId = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,Object? createdAt = null,}) {
  return _then(_WorkLocationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
