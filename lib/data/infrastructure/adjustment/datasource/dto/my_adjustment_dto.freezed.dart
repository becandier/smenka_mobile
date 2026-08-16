// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_adjustment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyAdjustmentDto {

 String get id; int get amountMinor; String get currency; String get reason; DateTime get occurredAt; DateTime get createdAt; String? get comment; String? get shiftId;
/// Create a copy of MyAdjustmentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAdjustmentDtoCopyWith<MyAdjustmentDto> get copyWith => _$MyAdjustmentDtoCopyWithImpl<MyAdjustmentDto>(this as MyAdjustmentDto, _$identity);

  /// Serializes this MyAdjustmentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAdjustmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amountMinor,currency,reason,occurredAt,createdAt,comment,shiftId);

@override
String toString() {
  return 'MyAdjustmentDto(id: $id, amountMinor: $amountMinor, currency: $currency, reason: $reason, occurredAt: $occurredAt, createdAt: $createdAt, comment: $comment, shiftId: $shiftId)';
}


}

/// @nodoc
abstract mixin class $MyAdjustmentDtoCopyWith<$Res>  {
  factory $MyAdjustmentDtoCopyWith(MyAdjustmentDto value, $Res Function(MyAdjustmentDto) _then) = _$MyAdjustmentDtoCopyWithImpl;
@useResult
$Res call({
 String id, int amountMinor, String currency, String reason, DateTime occurredAt, DateTime createdAt, String? comment, String? shiftId
});




}
/// @nodoc
class _$MyAdjustmentDtoCopyWithImpl<$Res>
    implements $MyAdjustmentDtoCopyWith<$Res> {
  _$MyAdjustmentDtoCopyWithImpl(this._self, this._then);

  final MyAdjustmentDto _self;
  final $Res Function(MyAdjustmentDto) _then;

/// Create a copy of MyAdjustmentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amountMinor = null,Object? currency = null,Object? reason = null,Object? occurredAt = null,Object? createdAt = null,Object? comment = freezed,Object? shiftId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyAdjustmentDto].
extension MyAdjustmentDtoPatterns on MyAdjustmentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyAdjustmentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyAdjustmentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyAdjustmentDto value)  $default,){
final _that = this;
switch (_that) {
case _MyAdjustmentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyAdjustmentDto value)?  $default,){
final _that = this;
switch (_that) {
case _MyAdjustmentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int amountMinor,  String currency,  String reason,  DateTime occurredAt,  DateTime createdAt,  String? comment,  String? shiftId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAdjustmentDto() when $default != null:
return $default(_that.id,_that.amountMinor,_that.currency,_that.reason,_that.occurredAt,_that.createdAt,_that.comment,_that.shiftId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int amountMinor,  String currency,  String reason,  DateTime occurredAt,  DateTime createdAt,  String? comment,  String? shiftId)  $default,) {final _that = this;
switch (_that) {
case _MyAdjustmentDto():
return $default(_that.id,_that.amountMinor,_that.currency,_that.reason,_that.occurredAt,_that.createdAt,_that.comment,_that.shiftId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int amountMinor,  String currency,  String reason,  DateTime occurredAt,  DateTime createdAt,  String? comment,  String? shiftId)?  $default,) {final _that = this;
switch (_that) {
case _MyAdjustmentDto() when $default != null:
return $default(_that.id,_that.amountMinor,_that.currency,_that.reason,_that.occurredAt,_that.createdAt,_that.comment,_that.shiftId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MyAdjustmentDto implements MyAdjustmentDto {
  const _MyAdjustmentDto({required this.id, required this.amountMinor, required this.currency, required this.reason, required this.occurredAt, required this.createdAt, this.comment, this.shiftId});
  factory _MyAdjustmentDto.fromJson(Map<String, dynamic> json) => _$MyAdjustmentDtoFromJson(json);

@override final  String id;
@override final  int amountMinor;
@override final  String currency;
@override final  String reason;
@override final  DateTime occurredAt;
@override final  DateTime createdAt;
@override final  String? comment;
@override final  String? shiftId;

/// Create a copy of MyAdjustmentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyAdjustmentDtoCopyWith<_MyAdjustmentDto> get copyWith => __$MyAdjustmentDtoCopyWithImpl<_MyAdjustmentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyAdjustmentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAdjustmentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.shiftId, shiftId) || other.shiftId == shiftId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amountMinor,currency,reason,occurredAt,createdAt,comment,shiftId);

@override
String toString() {
  return 'MyAdjustmentDto(id: $id, amountMinor: $amountMinor, currency: $currency, reason: $reason, occurredAt: $occurredAt, createdAt: $createdAt, comment: $comment, shiftId: $shiftId)';
}


}

/// @nodoc
abstract mixin class _$MyAdjustmentDtoCopyWith<$Res> implements $MyAdjustmentDtoCopyWith<$Res> {
  factory _$MyAdjustmentDtoCopyWith(_MyAdjustmentDto value, $Res Function(_MyAdjustmentDto) _then) = __$MyAdjustmentDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int amountMinor, String currency, String reason, DateTime occurredAt, DateTime createdAt, String? comment, String? shiftId
});




}
/// @nodoc
class __$MyAdjustmentDtoCopyWithImpl<$Res>
    implements _$MyAdjustmentDtoCopyWith<$Res> {
  __$MyAdjustmentDtoCopyWithImpl(this._self, this._then);

  final _MyAdjustmentDto _self;
  final $Res Function(_MyAdjustmentDto) _then;

/// Create a copy of MyAdjustmentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amountMinor = null,Object? currency = null,Object? reason = null,Object? occurredAt = null,Object? createdAt = null,Object? comment = freezed,Object? shiftId = freezed,}) {
  return _then(_MyAdjustmentDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,shiftId: freezed == shiftId ? _self.shiftId : shiftId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaginatedMyAdjustmentsDto {

 List<MyAdjustmentDto> get items; int get total; int get limit; int get offset;
/// Create a copy of PaginatedMyAdjustmentsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedMyAdjustmentsDtoCopyWith<PaginatedMyAdjustmentsDto> get copyWith => _$PaginatedMyAdjustmentsDtoCopyWithImpl<PaginatedMyAdjustmentsDto>(this as PaginatedMyAdjustmentsDto, _$identity);

  /// Serializes this PaginatedMyAdjustmentsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedMyAdjustmentsDto&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,limit,offset);

@override
String toString() {
  return 'PaginatedMyAdjustmentsDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class $PaginatedMyAdjustmentsDtoCopyWith<$Res>  {
  factory $PaginatedMyAdjustmentsDtoCopyWith(PaginatedMyAdjustmentsDto value, $Res Function(PaginatedMyAdjustmentsDto) _then) = _$PaginatedMyAdjustmentsDtoCopyWithImpl;
@useResult
$Res call({
 List<MyAdjustmentDto> items, int total, int limit, int offset
});




}
/// @nodoc
class _$PaginatedMyAdjustmentsDtoCopyWithImpl<$Res>
    implements $PaginatedMyAdjustmentsDtoCopyWith<$Res> {
  _$PaginatedMyAdjustmentsDtoCopyWithImpl(this._self, this._then);

  final PaginatedMyAdjustmentsDto _self;
  final $Res Function(PaginatedMyAdjustmentsDto) _then;

/// Create a copy of PaginatedMyAdjustmentsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MyAdjustmentDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedMyAdjustmentsDto].
extension PaginatedMyAdjustmentsDtoPatterns on PaginatedMyAdjustmentsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedMyAdjustmentsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedMyAdjustmentsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedMyAdjustmentsDto value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedMyAdjustmentsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedMyAdjustmentsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedMyAdjustmentsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MyAdjustmentDto> items,  int total,  int limit,  int offset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedMyAdjustmentsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MyAdjustmentDto> items,  int total,  int limit,  int offset)  $default,) {final _that = this;
switch (_that) {
case _PaginatedMyAdjustmentsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MyAdjustmentDto> items,  int total,  int limit,  int offset)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedMyAdjustmentsDto() when $default != null:
return $default(_that.items,_that.total,_that.limit,_that.offset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedMyAdjustmentsDto implements PaginatedMyAdjustmentsDto {
  const _PaginatedMyAdjustmentsDto({required final  List<MyAdjustmentDto> items, required this.total, required this.limit, required this.offset}): _items = items;
  factory _PaginatedMyAdjustmentsDto.fromJson(Map<String, dynamic> json) => _$PaginatedMyAdjustmentsDtoFromJson(json);

 final  List<MyAdjustmentDto> _items;
@override List<MyAdjustmentDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int limit;
@override final  int offset;

/// Create a copy of PaginatedMyAdjustmentsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedMyAdjustmentsDtoCopyWith<_PaginatedMyAdjustmentsDto> get copyWith => __$PaginatedMyAdjustmentsDtoCopyWithImpl<_PaginatedMyAdjustmentsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedMyAdjustmentsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedMyAdjustmentsDto&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,limit,offset);

@override
String toString() {
  return 'PaginatedMyAdjustmentsDto(items: $items, total: $total, limit: $limit, offset: $offset)';
}


}

/// @nodoc
abstract mixin class _$PaginatedMyAdjustmentsDtoCopyWith<$Res> implements $PaginatedMyAdjustmentsDtoCopyWith<$Res> {
  factory _$PaginatedMyAdjustmentsDtoCopyWith(_PaginatedMyAdjustmentsDto value, $Res Function(_PaginatedMyAdjustmentsDto) _then) = __$PaginatedMyAdjustmentsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MyAdjustmentDto> items, int total, int limit, int offset
});




}
/// @nodoc
class __$PaginatedMyAdjustmentsDtoCopyWithImpl<$Res>
    implements _$PaginatedMyAdjustmentsDtoCopyWith<$Res> {
  __$PaginatedMyAdjustmentsDtoCopyWithImpl(this._self, this._then);

  final _PaginatedMyAdjustmentsDto _self;
  final $Res Function(_PaginatedMyAdjustmentsDto) _then;

/// Create a copy of PaginatedMyAdjustmentsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? limit = null,Object? offset = null,}) {
  return _then(_PaginatedMyAdjustmentsDto(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MyAdjustmentDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
