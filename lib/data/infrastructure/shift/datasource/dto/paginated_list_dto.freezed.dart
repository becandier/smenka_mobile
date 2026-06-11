// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedShiftsDto {

 List<ShiftDto> get items; int get total; int get limit; int get offset;
/// Create a copy of PaginatedShiftsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedShiftsDtoCopyWith<PaginatedShiftsDto> get copyWith => _$PaginatedShiftsDtoCopyWithImpl<PaginatedShiftsDto>(this as PaginatedShiftsDto, _$identity);

  /// Serializes this PaginatedShiftsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedShiftsDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,limit,offset);

@override
String toString() {
  return 'PaginatedShiftsDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $PaginatedShiftsDtoCopyWith<$Res>  {
  factory $PaginatedShiftsDtoCopyWith(PaginatedShiftsDto value, $Res Function(PaginatedShiftsDto) _then) = _$PaginatedShiftsDtoCopyWithImpl;
@useResult
$Res call({
 List<ShiftDto> items, int total, int limit, int offset
});




}
/// @nodoc
class _$PaginatedShiftsDtoCopyWithImpl<$Res>
    implements $PaginatedShiftsDtoCopyWith<$Res> {
  _$PaginatedShiftsDtoCopyWithImpl(this._self, this._then);

  final PaginatedShiftsDto _self;
  final $Res Function(PaginatedShiftsDto) _then;

/// Create a copy of PaginatedShiftsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ShiftDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedShiftsDto].
extension PaginatedShiftsDtoPatterns on PaginatedShiftsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedShiftsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedShiftsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedShiftsDto value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedShiftsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedShiftsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedShiftsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ShiftDto> items,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedShiftsDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ShiftDto> items,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _PaginatedShiftsDto():
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ShiftDto> items,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedShiftsDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedShiftsDto implements PaginatedShiftsDto {
  const _PaginatedShiftsDto({required final  List<ShiftDto> items, required this.total, required this.limit, required this.offset}): _items = items;
  factory _PaginatedShiftsDto.fromJson(Map<String, dynamic> json) => _$PaginatedShiftsDtoFromJson(json);

 final  List<ShiftDto> _items;
@override List<ShiftDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of PaginatedShiftsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedShiftsDtoCopyWith<_PaginatedShiftsDto> get copyWith => __$PaginatedShiftsDtoCopyWithImpl<_PaginatedShiftsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedShiftsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedShiftsDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,limit,offset);

@override
String toString() {
  return 'PaginatedShiftsDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$PaginatedShiftsDtoCopyWith<$Res> implements $PaginatedShiftsDtoCopyWith<$Res> {
  factory _$PaginatedShiftsDtoCopyWith(_PaginatedShiftsDto value, $Res Function(_PaginatedShiftsDto) _then) = __$PaginatedShiftsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ShiftDto> items, int total, int limit, int offset
});




}
/// @nodoc
class __$PaginatedShiftsDtoCopyWithImpl<$Res>
    implements _$PaginatedShiftsDtoCopyWith<$Res> {
  __$PaginatedShiftsDtoCopyWithImpl(this._self, this._then);

  final _PaginatedShiftsDto _self;
  final $Res Function(_PaginatedShiftsDto) _then;

/// Create a copy of PaginatedShiftsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_PaginatedShiftsDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ShiftDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
