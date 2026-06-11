// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_paginator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DefaultPaginator<T> {

 bool get hasMore; List<T>? get data; int? get total;
/// Create a copy of DefaultPaginator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultPaginatorCopyWith<T, DefaultPaginator<T>> get copyWith => _$DefaultPaginatorCopyWithImpl<T, DefaultPaginator<T>>(this as DefaultPaginator<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultPaginator<T>&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,hasMore,const DeepCollectionEquality().hash(data),total);

@override
String toString() {
  return 'DefaultPaginator<$T>(hasMore: $hasMore, data: $data, total: $total)';
}


}

/// @nodoc
abstract mixin class $DefaultPaginatorCopyWith<T,$Res>  {
  factory $DefaultPaginatorCopyWith(DefaultPaginator<T> value, $Res Function(DefaultPaginator<T>) _then) = _$DefaultPaginatorCopyWithImpl;
@useResult
$Res call({
 bool hasMore, List<T>? data, int? total
});




}
/// @nodoc
class _$DefaultPaginatorCopyWithImpl<T,$Res>
    implements $DefaultPaginatorCopyWith<T, $Res> {
  _$DefaultPaginatorCopyWithImpl(this._self, this._then);

  final DefaultPaginator<T> _self;
  final $Res Function(DefaultPaginator<T>) _then;

/// Create a copy of DefaultPaginator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasMore = null,Object? data = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DefaultPaginator].
extension DefaultPaginatorPatterns<T> on DefaultPaginator<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefaultPaginator<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefaultPaginator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefaultPaginator<T> value)  $default,){
final _that = this;
switch (_that) {
case _DefaultPaginator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefaultPaginator<T> value)?  $default,){
final _that = this;
switch (_that) {
case _DefaultPaginator() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasMore,  List<T>? data,  int? total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefaultPaginator() when $default != null:
return $default(_that.hasMore,_that.data,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasMore,  List<T>? data,  int? total)  $default,) {final _that = this;
switch (_that) {
case _DefaultPaginator():
return $default(_that.hasMore,_that.data,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasMore,  List<T>? data,  int? total)?  $default,) {final _that = this;
switch (_that) {
case _DefaultPaginator() when $default != null:
return $default(_that.hasMore,_that.data,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _DefaultPaginator<T> implements DefaultPaginator<T> {
   _DefaultPaginator({required this.hasMore, required final  List<T>? data, this.total}): _data = data;
  

@override final  bool hasMore;
 final  List<T>? _data;
@override List<T>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? total;

/// Create a copy of DefaultPaginator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultPaginatorCopyWith<T, _DefaultPaginator<T>> get copyWith => __$DefaultPaginatorCopyWithImpl<T, _DefaultPaginator<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultPaginator<T>&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,hasMore,const DeepCollectionEquality().hash(_data),total);

@override
String toString() {
  return 'DefaultPaginator<$T>(hasMore: $hasMore, data: $data, total: $total)';
}


}

/// @nodoc
abstract mixin class _$DefaultPaginatorCopyWith<T,$Res> implements $DefaultPaginatorCopyWith<T, $Res> {
  factory _$DefaultPaginatorCopyWith(_DefaultPaginator<T> value, $Res Function(_DefaultPaginator<T>) _then) = __$DefaultPaginatorCopyWithImpl;
@override @useResult
$Res call({
 bool hasMore, List<T>? data, int? total
});




}
/// @nodoc
class __$DefaultPaginatorCopyWithImpl<T,$Res>
    implements _$DefaultPaginatorCopyWith<T, $Res> {
  __$DefaultPaginatorCopyWithImpl(this._self, this._then);

  final _DefaultPaginator<T> _self;
  final $Res Function(_DefaultPaginator<T>) _then;

/// Create a copy of DefaultPaginator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasMore = null,Object? data = freezed,Object? total = freezed,}) {
  return _then(_DefaultPaginator<T>(
hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
