// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_section_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedSectionData<T> {

 List<T> get data; bool get hasMore; int? get total; int get currentPage; int get perPage; FeatureStatus get status; String? get error;/// Машинный код ошибки (`error.code`) — для маппинга в локализованный
/// текст на UI-слое.
 String? get errorCode;
/// Create a copy of PaginatedSectionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<T, PaginatedSectionData<T>> get copyWith => _$PaginatedSectionDataCopyWithImpl<T, PaginatedSectionData<T>>(this as PaginatedSectionData<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedSectionData<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.total, total) || other.total == total)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),hasMore,total,currentPage,perPage,status,error,errorCode);

@override
String toString() {
  return 'PaginatedSectionData<$T>(data: $data, hasMore: $hasMore, total: $total, currentPage: $currentPage, perPage: $perPage, status: $status, error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $PaginatedSectionDataCopyWith<T,$Res>  {
  factory $PaginatedSectionDataCopyWith(PaginatedSectionData<T> value, $Res Function(PaginatedSectionData<T>) _then) = _$PaginatedSectionDataCopyWithImpl;
@useResult
$Res call({
 List<T> data, bool hasMore, int? total, int currentPage, int perPage, FeatureStatus status, String? error, String? errorCode
});




}
/// @nodoc
class _$PaginatedSectionDataCopyWithImpl<T,$Res>
    implements $PaginatedSectionDataCopyWith<T, $Res> {
  _$PaginatedSectionDataCopyWithImpl(this._self, this._then);

  final PaginatedSectionData<T> _self;
  final $Res Function(PaginatedSectionData<T>) _then;

/// Create a copy of PaginatedSectionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? hasMore = null,Object? total = freezed,Object? currentPage = null,Object? perPage = null,Object? status = null,Object? error = freezed,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedSectionData].
extension PaginatedSectionDataPatterns<T> on PaginatedSectionData<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedSectionData<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedSectionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedSectionData<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedSectionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedSectionData<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedSectionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  bool hasMore,  int? total,  int currentPage,  int perPage,  FeatureStatus status,  String? error,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedSectionData() when $default != null:
return $default(_that.data,_that.hasMore,_that.total,_that.currentPage,_that.perPage,_that.status,_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  bool hasMore,  int? total,  int currentPage,  int perPage,  FeatureStatus status,  String? error,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _PaginatedSectionData():
return $default(_that.data,_that.hasMore,_that.total,_that.currentPage,_that.perPage,_that.status,_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  bool hasMore,  int? total,  int currentPage,  int perPage,  FeatureStatus status,  String? error,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedSectionData() when $default != null:
return $default(_that.data,_that.hasMore,_that.total,_that.currentPage,_that.perPage,_that.status,_that.error,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _PaginatedSectionData<T> extends PaginatedSectionData<T> {
  const _PaginatedSectionData({final  List<T> data = const [], this.hasMore = false, this.total, this.currentPage = 1, this.perPage = 20, this.status = FeatureStatus.initial, this.error, this.errorCode}): _data = data,super._();
  

 final  List<T> _data;
@override@JsonKey() List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  bool hasMore;
@override final  int? total;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int perPage;
@override@JsonKey() final  FeatureStatus status;
@override final  String? error;
/// Машинный код ошибки (`error.code`) — для маппинга в локализованный
/// текст на UI-слое.
@override final  String? errorCode;

/// Create a copy of PaginatedSectionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedSectionDataCopyWith<T, _PaginatedSectionData<T>> get copyWith => __$PaginatedSectionDataCopyWithImpl<T, _PaginatedSectionData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedSectionData<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.total, total) || other.total == total)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),hasMore,total,currentPage,perPage,status,error,errorCode);

@override
String toString() {
  return 'PaginatedSectionData<$T>(data: $data, hasMore: $hasMore, total: $total, currentPage: $currentPage, perPage: $perPage, status: $status, error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$PaginatedSectionDataCopyWith<T,$Res> implements $PaginatedSectionDataCopyWith<T, $Res> {
  factory _$PaginatedSectionDataCopyWith(_PaginatedSectionData<T> value, $Res Function(_PaginatedSectionData<T>) _then) = __$PaginatedSectionDataCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, bool hasMore, int? total, int currentPage, int perPage, FeatureStatus status, String? error, String? errorCode
});




}
/// @nodoc
class __$PaginatedSectionDataCopyWithImpl<T,$Res>
    implements _$PaginatedSectionDataCopyWith<T, $Res> {
  __$PaginatedSectionDataCopyWithImpl(this._self, this._then);

  final _PaginatedSectionData<T> _self;
  final $Res Function(_PaginatedSectionData<T>) _then;

/// Create a copy of PaginatedSectionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? hasMore = null,Object? total = freezed,Object? currentPage = null,Object? perPage = null,Object? status = null,Object? error = freezed,Object? errorCode = freezed,}) {
  return _then(_PaginatedSectionData<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
