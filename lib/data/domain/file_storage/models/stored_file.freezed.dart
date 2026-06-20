// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stored_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoredFile {

 String get id; FileCategory get category; String get originalFilename; String get contentType; int get sizeBytes;/// Presigned GET URL с коротким TTL; открывается напрямую с устройства.
 String get url;/// Момент протухания [url] (UTC).
 DateTime get urlExpiresAt; DateTime get createdAt;
/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFileCopyWith<StoredFile> get copyWith => _$StoredFileCopyWithImpl<StoredFile>(this as StoredFile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFile&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.originalFilename, originalFilename) || other.originalFilename == originalFilename)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,originalFilename,contentType,sizeBytes,url,urlExpiresAt,createdAt);

@override
String toString() {
  return 'StoredFile(id: $id, category: $category, originalFilename: $originalFilename, contentType: $contentType, sizeBytes: $sizeBytes, url: $url, urlExpiresAt: $urlExpiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StoredFileCopyWith<$Res>  {
  factory $StoredFileCopyWith(StoredFile value, $Res Function(StoredFile) _then) = _$StoredFileCopyWithImpl;
@useResult
$Res call({
 String id, FileCategory category, String originalFilename, String contentType, int sizeBytes, String url, DateTime urlExpiresAt, DateTime createdAt
});




}
/// @nodoc
class _$StoredFileCopyWithImpl<$Res>
    implements $StoredFileCopyWith<$Res> {
  _$StoredFileCopyWithImpl(this._self, this._then);

  final StoredFile _self;
  final $Res Function(StoredFile) _then;

/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? originalFilename = null,Object? contentType = null,Object? sizeBytes = null,Object? url = null,Object? urlExpiresAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FileCategory,originalFilename: null == originalFilename ? _self.originalFilename : originalFilename // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlExpiresAt: null == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StoredFile].
extension StoredFilePatterns on StoredFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoredFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoredFile value)  $default,){
final _that = this;
switch (_that) {
case _StoredFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoredFile value)?  $default,){
final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  FileCategory category,  String originalFilename,  String contentType,  int sizeBytes,  String url,  DateTime urlExpiresAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
return $default(_that.id,_that.category,_that.originalFilename,_that.contentType,_that.sizeBytes,_that.url,_that.urlExpiresAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  FileCategory category,  String originalFilename,  String contentType,  int sizeBytes,  String url,  DateTime urlExpiresAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StoredFile():
return $default(_that.id,_that.category,_that.originalFilename,_that.contentType,_that.sizeBytes,_that.url,_that.urlExpiresAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  FileCategory category,  String originalFilename,  String contentType,  int sizeBytes,  String url,  DateTime urlExpiresAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StoredFile() when $default != null:
return $default(_that.id,_that.category,_that.originalFilename,_that.contentType,_that.sizeBytes,_that.url,_that.urlExpiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _StoredFile implements StoredFile {
  const _StoredFile({required this.id, required this.category, required this.originalFilename, required this.contentType, required this.sizeBytes, required this.url, required this.urlExpiresAt, required this.createdAt});
  

@override final  String id;
@override final  FileCategory category;
@override final  String originalFilename;
@override final  String contentType;
@override final  int sizeBytes;
/// Presigned GET URL с коротким TTL; открывается напрямую с устройства.
@override final  String url;
/// Момент протухания [url] (UTC).
@override final  DateTime urlExpiresAt;
@override final  DateTime createdAt;

/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFileCopyWith<_StoredFile> get copyWith => __$StoredFileCopyWithImpl<_StoredFile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFile&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.originalFilename, originalFilename) || other.originalFilename == originalFilename)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,category,originalFilename,contentType,sizeBytes,url,urlExpiresAt,createdAt);

@override
String toString() {
  return 'StoredFile(id: $id, category: $category, originalFilename: $originalFilename, contentType: $contentType, sizeBytes: $sizeBytes, url: $url, urlExpiresAt: $urlExpiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StoredFileCopyWith<$Res> implements $StoredFileCopyWith<$Res> {
  factory _$StoredFileCopyWith(_StoredFile value, $Res Function(_StoredFile) _then) = __$StoredFileCopyWithImpl;
@override @useResult
$Res call({
 String id, FileCategory category, String originalFilename, String contentType, int sizeBytes, String url, DateTime urlExpiresAt, DateTime createdAt
});




}
/// @nodoc
class __$StoredFileCopyWithImpl<$Res>
    implements _$StoredFileCopyWith<$Res> {
  __$StoredFileCopyWithImpl(this._self, this._then);

  final _StoredFile _self;
  final $Res Function(_StoredFile) _then;

/// Create a copy of StoredFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? originalFilename = null,Object? contentType = null,Object? sizeBytes = null,Object? url = null,Object? urlExpiresAt = null,Object? createdAt = null,}) {
  return _then(_StoredFile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as FileCategory,originalFilename: null == originalFilename ? _self.originalFilename : originalFilename // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlExpiresAt: null == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
