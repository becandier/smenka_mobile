// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChecklistItemPhoto {

 String get id; String get fileId; int get position; String? get url; DateTime? get urlExpiresAt; DateTime? get capturedAt; double? get latitude; double? get longitude;
/// Create a copy of ChecklistItemPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemPhotoCopyWith<ChecklistItemPhoto> get copyWith => _$ChecklistItemPhotoCopyWithImpl<ChecklistItemPhoto>(this as ChecklistItemPhoto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItemPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.position, position) || other.position == position)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileId,position,url,urlExpiresAt,capturedAt,latitude,longitude);

@override
String toString() {
  return 'ChecklistItemPhoto(id: $id, fileId: $fileId, position: $position, url: $url, urlExpiresAt: $urlExpiresAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemPhotoCopyWith<$Res>  {
  factory $ChecklistItemPhotoCopyWith(ChecklistItemPhoto value, $Res Function(ChecklistItemPhoto) _then) = _$ChecklistItemPhotoCopyWithImpl;
@useResult
$Res call({
 String id, String fileId, int position, String? url, DateTime? urlExpiresAt, DateTime? capturedAt, double? latitude, double? longitude
});




}
/// @nodoc
class _$ChecklistItemPhotoCopyWithImpl<$Res>
    implements $ChecklistItemPhotoCopyWith<$Res> {
  _$ChecklistItemPhotoCopyWithImpl(this._self, this._then);

  final ChecklistItemPhoto _self;
  final $Res Function(ChecklistItemPhoto) _then;

/// Create a copy of ChecklistItemPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileId = null,Object? position = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? capturedAt = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,capturedAt: freezed == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItemPhoto].
extension ChecklistItemPhotoPatterns on ChecklistItemPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItemPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItemPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItemPhoto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItemPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileId,  int position,  String? url,  DateTime? urlExpiresAt,  DateTime? capturedAt,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItemPhoto() when $default != null:
return $default(_that.id,_that.fileId,_that.position,_that.url,_that.urlExpiresAt,_that.capturedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileId,  int position,  String? url,  DateTime? urlExpiresAt,  DateTime? capturedAt,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemPhoto():
return $default(_that.id,_that.fileId,_that.position,_that.url,_that.urlExpiresAt,_that.capturedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileId,  int position,  String? url,  DateTime? urlExpiresAt,  DateTime? capturedAt,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemPhoto() when $default != null:
return $default(_that.id,_that.fileId,_that.position,_that.url,_that.urlExpiresAt,_that.capturedAt,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistItemPhoto implements ChecklistItemPhoto {
  const _ChecklistItemPhoto({required this.id, required this.fileId, required this.position, this.url, this.urlExpiresAt, this.capturedAt, this.latitude, this.longitude});
  

@override final  String id;
@override final  String fileId;
@override final  int position;
@override final  String? url;
@override final  DateTime? urlExpiresAt;
@override final  DateTime? capturedAt;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of ChecklistItemPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemPhotoCopyWith<_ChecklistItemPhoto> get copyWith => __$ChecklistItemPhotoCopyWithImpl<_ChecklistItemPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItemPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.position, position) || other.position == position)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,fileId,position,url,urlExpiresAt,capturedAt,latitude,longitude);

@override
String toString() {
  return 'ChecklistItemPhoto(id: $id, fileId: $fileId, position: $position, url: $url, urlExpiresAt: $urlExpiresAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemPhotoCopyWith<$Res> implements $ChecklistItemPhotoCopyWith<$Res> {
  factory _$ChecklistItemPhotoCopyWith(_ChecklistItemPhoto value, $Res Function(_ChecklistItemPhoto) _then) = __$ChecklistItemPhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileId, int position, String? url, DateTime? urlExpiresAt, DateTime? capturedAt, double? latitude, double? longitude
});




}
/// @nodoc
class __$ChecklistItemPhotoCopyWithImpl<$Res>
    implements _$ChecklistItemPhotoCopyWith<$Res> {
  __$ChecklistItemPhotoCopyWithImpl(this._self, this._then);

  final _ChecklistItemPhoto _self;
  final $Res Function(_ChecklistItemPhoto) _then;

/// Create a copy of ChecklistItemPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileId = null,Object? position = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? capturedAt = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_ChecklistItemPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,capturedAt: freezed == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
