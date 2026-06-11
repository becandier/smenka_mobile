// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistTemplateDto {

 String get id; String get name; String get type; bool get isRequired; int get itemsCount; bool get isArchived; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTemplateDtoCopyWith<ChecklistTemplateDto> get copyWith => _$ChecklistTemplateDtoCopyWithImpl<ChecklistTemplateDto>(this as ChecklistTemplateDto, _$identity);

  /// Serializes this ChecklistTemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,itemsCount,isArchived,createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplateDto(id: $id, name: $name, type: $type, isRequired: $isRequired, itemsCount: $itemsCount, isArchived: $isArchived, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChecklistTemplateDtoCopyWith<$Res>  {
  factory $ChecklistTemplateDtoCopyWith(ChecklistTemplateDto value, $Res Function(ChecklistTemplateDto) _then) = _$ChecklistTemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, bool isRequired, int itemsCount, bool isArchived, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ChecklistTemplateDtoCopyWithImpl<$Res>
    implements $ChecklistTemplateDtoCopyWith<$Res> {
  _$ChecklistTemplateDtoCopyWithImpl(this._self, this._then);

  final ChecklistTemplateDto _self;
  final $Res Function(ChecklistTemplateDto) _then;

/// Create a copy of ChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? itemsCount = null,Object? isArchived = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistTemplateDto].
extension ChecklistTemplateDtoPatterns on ChecklistTemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  int itemsCount,  bool isArchived,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.itemsCount,_that.isArchived,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  int itemsCount,  bool isArchived,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateDto():
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.itemsCount,_that.isArchived,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  bool isRequired,  int itemsCount,  bool isArchived,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.itemsCount,_that.isArchived,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistTemplateDto implements ChecklistTemplateDto {
  const _ChecklistTemplateDto({required this.id, required this.name, required this.type, required this.isRequired, required this.itemsCount, required this.isArchived, required this.createdAt, required this.updatedAt});
  factory _ChecklistTemplateDto.fromJson(Map<String, dynamic> json) => _$ChecklistTemplateDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  bool isRequired;
@override final  int itemsCount;
@override final  bool isArchived;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTemplateDtoCopyWith<_ChecklistTemplateDto> get copyWith => __$ChecklistTemplateDtoCopyWithImpl<_ChecklistTemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistTemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,itemsCount,isArchived,createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplateDto(id: $id, name: $name, type: $type, isRequired: $isRequired, itemsCount: $itemsCount, isArchived: $isArchived, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTemplateDtoCopyWith<$Res> implements $ChecklistTemplateDtoCopyWith<$Res> {
  factory _$ChecklistTemplateDtoCopyWith(_ChecklistTemplateDto value, $Res Function(_ChecklistTemplateDto) _then) = __$ChecklistTemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, bool isRequired, int itemsCount, bool isArchived, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ChecklistTemplateDtoCopyWithImpl<$Res>
    implements _$ChecklistTemplateDtoCopyWith<$Res> {
  __$ChecklistTemplateDtoCopyWithImpl(this._self, this._then);

  final _ChecklistTemplateDto _self;
  final $Res Function(_ChecklistTemplateDto) _then;

/// Create a copy of ChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? itemsCount = null,Object? isArchived = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ChecklistTemplateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ChecklistTemplateDetailDto {

 String get id; String get name; String get type; bool get isRequired; bool get isArchived; List<ChecklistTemplateItemDto> get items; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ChecklistTemplateDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTemplateDetailDtoCopyWith<ChecklistTemplateDetailDto> get copyWith => _$ChecklistTemplateDetailDtoCopyWithImpl<ChecklistTemplateDetailDto>(this as ChecklistTemplateDetailDto, _$identity);

  /// Serializes this ChecklistTemplateDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTemplateDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,isArchived,const DeepCollectionEquality().hash(items),createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplateDetailDto(id: $id, name: $name, type: $type, isRequired: $isRequired, isArchived: $isArchived, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChecklistTemplateDetailDtoCopyWith<$Res>  {
  factory $ChecklistTemplateDetailDtoCopyWith(ChecklistTemplateDetailDto value, $Res Function(ChecklistTemplateDetailDto) _then) = _$ChecklistTemplateDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, bool isRequired, bool isArchived, List<ChecklistTemplateItemDto> items, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ChecklistTemplateDetailDtoCopyWithImpl<$Res>
    implements $ChecklistTemplateDetailDtoCopyWith<$Res> {
  _$ChecklistTemplateDetailDtoCopyWithImpl(this._self, this._then);

  final ChecklistTemplateDetailDto _self;
  final $Res Function(ChecklistTemplateDetailDto) _then;

/// Create a copy of ChecklistTemplateDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? isArchived = null,Object? items = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistTemplateItemDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistTemplateDetailDto].
extension ChecklistTemplateDetailDtoPatterns on ChecklistTemplateDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTemplateDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTemplateDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTemplateDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTemplateDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  bool isArchived,  List<ChecklistTemplateItemDto> items,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistTemplateDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.isArchived,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  bool isArchived,  List<ChecklistTemplateItemDto> items,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateDetailDto():
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.isArchived,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  bool isRequired,  bool isArchived,  List<ChecklistTemplateItemDto> items,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.isArchived,_that.items,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistTemplateDetailDto implements ChecklistTemplateDetailDto {
  const _ChecklistTemplateDetailDto({required this.id, required this.name, required this.type, required this.isRequired, required this.isArchived, required final  List<ChecklistTemplateItemDto> items, required this.createdAt, required this.updatedAt}): _items = items;
  factory _ChecklistTemplateDetailDto.fromJson(Map<String, dynamic> json) => _$ChecklistTemplateDetailDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  bool isRequired;
@override final  bool isArchived;
 final  List<ChecklistTemplateItemDto> _items;
@override List<ChecklistTemplateItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ChecklistTemplateDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTemplateDetailDtoCopyWith<_ChecklistTemplateDetailDto> get copyWith => __$ChecklistTemplateDetailDtoCopyWithImpl<_ChecklistTemplateDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistTemplateDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTemplateDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,isArchived,const DeepCollectionEquality().hash(_items),createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplateDetailDto(id: $id, name: $name, type: $type, isRequired: $isRequired, isArchived: $isArchived, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTemplateDetailDtoCopyWith<$Res> implements $ChecklistTemplateDetailDtoCopyWith<$Res> {
  factory _$ChecklistTemplateDetailDtoCopyWith(_ChecklistTemplateDetailDto value, $Res Function(_ChecklistTemplateDetailDto) _then) = __$ChecklistTemplateDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, bool isRequired, bool isArchived, List<ChecklistTemplateItemDto> items, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ChecklistTemplateDetailDtoCopyWithImpl<$Res>
    implements _$ChecklistTemplateDetailDtoCopyWith<$Res> {
  __$ChecklistTemplateDetailDtoCopyWithImpl(this._self, this._then);

  final _ChecklistTemplateDetailDto _self;
  final $Res Function(_ChecklistTemplateDetailDto) _then;

/// Create a copy of ChecklistTemplateDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? isArchived = null,Object? items = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ChecklistTemplateDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistTemplateItemDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ChecklistTemplateItemDto {

 String get id; String get text; bool get isRequired; int get position;
/// Create a copy of ChecklistTemplateItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTemplateItemDtoCopyWith<ChecklistTemplateItemDto> get copyWith => _$ChecklistTemplateItemDtoCopyWithImpl<ChecklistTemplateItemDto>(this as ChecklistTemplateItemDto, _$identity);

  /// Serializes this ChecklistTemplateItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTemplateItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,isRequired,position);

@override
String toString() {
  return 'ChecklistTemplateItemDto(id: $id, text: $text, isRequired: $isRequired, position: $position)';
}


}

/// @nodoc
abstract mixin class $ChecklistTemplateItemDtoCopyWith<$Res>  {
  factory $ChecklistTemplateItemDtoCopyWith(ChecklistTemplateItemDto value, $Res Function(ChecklistTemplateItemDto) _then) = _$ChecklistTemplateItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String text, bool isRequired, int position
});




}
/// @nodoc
class _$ChecklistTemplateItemDtoCopyWithImpl<$Res>
    implements $ChecklistTemplateItemDtoCopyWith<$Res> {
  _$ChecklistTemplateItemDtoCopyWithImpl(this._self, this._then);

  final ChecklistTemplateItemDto _self;
  final $Res Function(ChecklistTemplateItemDto) _then;

/// Create a copy of ChecklistTemplateItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? isRequired = null,Object? position = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistTemplateItemDto].
extension ChecklistTemplateItemDtoPatterns on ChecklistTemplateItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTemplateItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTemplateItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTemplateItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTemplateItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  bool isRequired,  int position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistTemplateItemDto() when $default != null:
return $default(_that.id,_that.text,_that.isRequired,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  bool isRequired,  int position)  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateItemDto():
return $default(_that.id,_that.text,_that.isRequired,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  bool isRequired,  int position)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateItemDto() when $default != null:
return $default(_that.id,_that.text,_that.isRequired,_that.position);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistTemplateItemDto implements ChecklistTemplateItemDto {
  const _ChecklistTemplateItemDto({required this.id, required this.text, required this.isRequired, required this.position});
  factory _ChecklistTemplateItemDto.fromJson(Map<String, dynamic> json) => _$ChecklistTemplateItemDtoFromJson(json);

@override final  String id;
@override final  String text;
@override final  bool isRequired;
@override final  int position;

/// Create a copy of ChecklistTemplateItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTemplateItemDtoCopyWith<_ChecklistTemplateItemDto> get copyWith => __$ChecklistTemplateItemDtoCopyWithImpl<_ChecklistTemplateItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistTemplateItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTemplateItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,isRequired,position);

@override
String toString() {
  return 'ChecklistTemplateItemDto(id: $id, text: $text, isRequired: $isRequired, position: $position)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTemplateItemDtoCopyWith<$Res> implements $ChecklistTemplateItemDtoCopyWith<$Res> {
  factory _$ChecklistTemplateItemDtoCopyWith(_ChecklistTemplateItemDto value, $Res Function(_ChecklistTemplateItemDto) _then) = __$ChecklistTemplateItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, bool isRequired, int position
});




}
/// @nodoc
class __$ChecklistTemplateItemDtoCopyWithImpl<$Res>
    implements _$ChecklistTemplateItemDtoCopyWith<$Res> {
  __$ChecklistTemplateItemDtoCopyWithImpl(this._self, this._then);

  final _ChecklistTemplateItemDto _self;
  final $Res Function(_ChecklistTemplateItemDto) _then;

/// Create a copy of ChecklistTemplateItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? isRequired = null,Object? position = null,}) {
  return _then(_ChecklistTemplateItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
