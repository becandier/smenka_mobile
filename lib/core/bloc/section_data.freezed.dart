// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SectionData<T> {

 T? get data; FeatureStatus get status; String? get error;/// Машинный код ошибки (`error.code`) — для маппинга в локализованный
/// текст на UI-слое. Логику строим по нему, а не по [error] (message).
 String? get errorCode;
/// Create a copy of SectionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionDataCopyWith<T, SectionData<T>> get copyWith => _$SectionDataCopyWithImpl<T, SectionData<T>>(this as SectionData<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionData<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),status,error,errorCode);

@override
String toString() {
  return 'SectionData<$T>(data: $data, status: $status, error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $SectionDataCopyWith<T,$Res>  {
  factory $SectionDataCopyWith(SectionData<T> value, $Res Function(SectionData<T>) _then) = _$SectionDataCopyWithImpl;
@useResult
$Res call({
 T? data, FeatureStatus status, String? error, String? errorCode
});




}
/// @nodoc
class _$SectionDataCopyWithImpl<T,$Res>
    implements $SectionDataCopyWith<T, $Res> {
  _$SectionDataCopyWithImpl(this._self, this._then);

  final SectionData<T> _self;
  final $Res Function(SectionData<T>) _then;

/// Create a copy of SectionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? status = null,Object? error = freezed,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionData].
extension SectionDataPatterns<T> on SectionData<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionData<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionData<T> value)  $default,){
final _that = this;
switch (_that) {
case _SectionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionData<T> value)?  $default,){
final _that = this;
switch (_that) {
case _SectionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T? data,  FeatureStatus status,  String? error,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionData() when $default != null:
return $default(_that.data,_that.status,_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T? data,  FeatureStatus status,  String? error,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _SectionData():
return $default(_that.data,_that.status,_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T? data,  FeatureStatus status,  String? error,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _SectionData() when $default != null:
return $default(_that.data,_that.status,_that.error,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _SectionData<T> extends SectionData<T> {
  const _SectionData({this.data, this.status = FeatureStatus.initial, this.error, this.errorCode}): super._();
  

@override final  T? data;
@override@JsonKey() final  FeatureStatus status;
@override final  String? error;
/// Машинный код ошибки (`error.code`) — для маппинга в локализованный
/// текст на UI-слое. Логику строим по нему, а не по [error] (message).
@override final  String? errorCode;

/// Create a copy of SectionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionDataCopyWith<T, _SectionData<T>> get copyWith => __$SectionDataCopyWithImpl<T, _SectionData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionData<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),status,error,errorCode);

@override
String toString() {
  return 'SectionData<$T>(data: $data, status: $status, error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$SectionDataCopyWith<T,$Res> implements $SectionDataCopyWith<T, $Res> {
  factory _$SectionDataCopyWith(_SectionData<T> value, $Res Function(_SectionData<T>) _then) = __$SectionDataCopyWithImpl;
@override @useResult
$Res call({
 T? data, FeatureStatus status, String? error, String? errorCode
});




}
/// @nodoc
class __$SectionDataCopyWithImpl<T,$Res>
    implements _$SectionDataCopyWith<T, $Res> {
  __$SectionDataCopyWithImpl(this._self, this._then);

  final _SectionData<T> _self;
  final $Res Function(_SectionData<T>) _then;

/// Create a copy of SectionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? status = null,Object? error = freezed,Object? errorCode = freezed,}) {
  return _then(_SectionData<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
