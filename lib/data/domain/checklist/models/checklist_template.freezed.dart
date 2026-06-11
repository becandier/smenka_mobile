// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChecklistTemplate {

 String get id; String get name; ChecklistType get type; bool get isRequired; int get itemsCount; bool get isArchived; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTemplateCopyWith<ChecklistTemplate> get copyWith => _$ChecklistTemplateCopyWithImpl<ChecklistTemplate>(this as ChecklistTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,itemsCount,isArchived,createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplate(id: $id, name: $name, type: $type, isRequired: $isRequired, itemsCount: $itemsCount, isArchived: $isArchived, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChecklistTemplateCopyWith<$Res>  {
  factory $ChecklistTemplateCopyWith(ChecklistTemplate value, $Res Function(ChecklistTemplate) _then) = _$ChecklistTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String name, ChecklistType type, bool isRequired, int itemsCount, bool isArchived, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ChecklistTemplateCopyWithImpl<$Res>
    implements $ChecklistTemplateCopyWith<$Res> {
  _$ChecklistTemplateCopyWithImpl(this._self, this._then);

  final ChecklistTemplate _self;
  final $Res Function(ChecklistTemplate) _then;

/// Create a copy of ChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? itemsCount = null,Object? isArchived = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChecklistType,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistTemplate].
extension ChecklistTemplatePatterns on ChecklistTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTemplate value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ChecklistType type,  bool isRequired,  int itemsCount,  bool isArchived,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistTemplate() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ChecklistType type,  bool isRequired,  int itemsCount,  bool isArchived,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplate():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ChecklistType type,  bool isRequired,  int itemsCount,  bool isArchived,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplate() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.itemsCount,_that.isArchived,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistTemplate implements ChecklistTemplate {
  const _ChecklistTemplate({required this.id, required this.name, required this.type, required this.isRequired, required this.itemsCount, required this.isArchived, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String name;
@override final  ChecklistType type;
@override final  bool isRequired;
@override final  int itemsCount;
@override final  bool isArchived;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTemplateCopyWith<_ChecklistTemplate> get copyWith => __$ChecklistTemplateCopyWithImpl<_ChecklistTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,itemsCount,isArchived,createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplate(id: $id, name: $name, type: $type, isRequired: $isRequired, itemsCount: $itemsCount, isArchived: $isArchived, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTemplateCopyWith<$Res> implements $ChecklistTemplateCopyWith<$Res> {
  factory _$ChecklistTemplateCopyWith(_ChecklistTemplate value, $Res Function(_ChecklistTemplate) _then) = __$ChecklistTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ChecklistType type, bool isRequired, int itemsCount, bool isArchived, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ChecklistTemplateCopyWithImpl<$Res>
    implements _$ChecklistTemplateCopyWith<$Res> {
  __$ChecklistTemplateCopyWithImpl(this._self, this._then);

  final _ChecklistTemplate _self;
  final $Res Function(_ChecklistTemplate) _then;

/// Create a copy of ChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? itemsCount = null,Object? isArchived = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ChecklistTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChecklistType,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ChecklistTemplateDetail {

 String get id; String get name; ChecklistType get type; bool get isRequired; bool get isArchived; List<ChecklistTemplateItem> get items; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ChecklistTemplateDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTemplateDetailCopyWith<ChecklistTemplateDetail> get copyWith => _$ChecklistTemplateDetailCopyWithImpl<ChecklistTemplateDetail>(this as ChecklistTemplateDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTemplateDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,isArchived,const DeepCollectionEquality().hash(items),createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplateDetail(id: $id, name: $name, type: $type, isRequired: $isRequired, isArchived: $isArchived, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChecklistTemplateDetailCopyWith<$Res>  {
  factory $ChecklistTemplateDetailCopyWith(ChecklistTemplateDetail value, $Res Function(ChecklistTemplateDetail) _then) = _$ChecklistTemplateDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, ChecklistType type, bool isRequired, bool isArchived, List<ChecklistTemplateItem> items, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ChecklistTemplateDetailCopyWithImpl<$Res>
    implements $ChecklistTemplateDetailCopyWith<$Res> {
  _$ChecklistTemplateDetailCopyWithImpl(this._self, this._then);

  final ChecklistTemplateDetail _self;
  final $Res Function(ChecklistTemplateDetail) _then;

/// Create a copy of ChecklistTemplateDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? isArchived = null,Object? items = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChecklistType,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistTemplateItem>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistTemplateDetail].
extension ChecklistTemplateDetailPatterns on ChecklistTemplateDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTemplateDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTemplateDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTemplateDetail value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTemplateDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ChecklistType type,  bool isRequired,  bool isArchived,  List<ChecklistTemplateItem> items,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistTemplateDetail() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ChecklistType type,  bool isRequired,  bool isArchived,  List<ChecklistTemplateItem> items,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateDetail():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ChecklistType type,  bool isRequired,  bool isArchived,  List<ChecklistTemplateItem> items,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistTemplateDetail() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.isArchived,_that.items,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistTemplateDetail implements ChecklistTemplateDetail {
  const _ChecklistTemplateDetail({required this.id, required this.name, required this.type, required this.isRequired, required this.isArchived, required final  List<ChecklistTemplateItem> items, required this.createdAt, required this.updatedAt}): _items = items;
  

@override final  String id;
@override final  String name;
@override final  ChecklistType type;
@override final  bool isRequired;
@override final  bool isArchived;
 final  List<ChecklistTemplateItem> _items;
@override List<ChecklistTemplateItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ChecklistTemplateDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTemplateDetailCopyWith<_ChecklistTemplateDetail> get copyWith => __$ChecklistTemplateDetailCopyWithImpl<_ChecklistTemplateDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTemplateDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,isArchived,const DeepCollectionEquality().hash(_items),createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistTemplateDetail(id: $id, name: $name, type: $type, isRequired: $isRequired, isArchived: $isArchived, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTemplateDetailCopyWith<$Res> implements $ChecklistTemplateDetailCopyWith<$Res> {
  factory _$ChecklistTemplateDetailCopyWith(_ChecklistTemplateDetail value, $Res Function(_ChecklistTemplateDetail) _then) = __$ChecklistTemplateDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ChecklistType type, bool isRequired, bool isArchived, List<ChecklistTemplateItem> items, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ChecklistTemplateDetailCopyWithImpl<$Res>
    implements _$ChecklistTemplateDetailCopyWith<$Res> {
  __$ChecklistTemplateDetailCopyWithImpl(this._self, this._then);

  final _ChecklistTemplateDetail _self;
  final $Res Function(_ChecklistTemplateDetail) _then;

/// Create a copy of ChecklistTemplateDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? isArchived = null,Object? items = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ChecklistTemplateDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChecklistType,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistTemplateItem>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ChecklistTemplateItem {

 String get id; String get text; bool get isRequired; int get position;
/// Create a copy of ChecklistTemplateItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTemplateItemCopyWith<ChecklistTemplateItem> get copyWith => _$ChecklistTemplateItemCopyWithImpl<ChecklistTemplateItem>(this as ChecklistTemplateItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTemplateItem&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,isRequired,position);

@override
String toString() {
  return 'ChecklistTemplateItem(id: $id, text: $text, isRequired: $isRequired, position: $position)';
}


}

/// @nodoc
abstract mixin class $ChecklistTemplateItemCopyWith<$Res>  {
  factory $ChecklistTemplateItemCopyWith(ChecklistTemplateItem value, $Res Function(ChecklistTemplateItem) _then) = _$ChecklistTemplateItemCopyWithImpl;
@useResult
$Res call({
 String id, String text, bool isRequired, int position
});




}
/// @nodoc
class _$ChecklistTemplateItemCopyWithImpl<$Res>
    implements $ChecklistTemplateItemCopyWith<$Res> {
  _$ChecklistTemplateItemCopyWithImpl(this._self, this._then);

  final ChecklistTemplateItem _self;
  final $Res Function(ChecklistTemplateItem) _then;

/// Create a copy of ChecklistTemplateItem
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


/// Adds pattern-matching-related methods to [ChecklistTemplateItem].
extension ChecklistTemplateItemPatterns on ChecklistTemplateItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTemplateItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTemplateItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTemplateItem value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTemplateItem value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTemplateItem() when $default != null:
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
case _ChecklistTemplateItem() when $default != null:
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
case _ChecklistTemplateItem():
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
case _ChecklistTemplateItem() when $default != null:
return $default(_that.id,_that.text,_that.isRequired,_that.position);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistTemplateItem implements ChecklistTemplateItem {
  const _ChecklistTemplateItem({required this.id, required this.text, required this.isRequired, required this.position});
  

@override final  String id;
@override final  String text;
@override final  bool isRequired;
@override final  int position;

/// Create a copy of ChecklistTemplateItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTemplateItemCopyWith<_ChecklistTemplateItem> get copyWith => __$ChecklistTemplateItemCopyWithImpl<_ChecklistTemplateItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTemplateItem&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,id,text,isRequired,position);

@override
String toString() {
  return 'ChecklistTemplateItem(id: $id, text: $text, isRequired: $isRequired, position: $position)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTemplateItemCopyWith<$Res> implements $ChecklistTemplateItemCopyWith<$Res> {
  factory _$ChecklistTemplateItemCopyWith(_ChecklistTemplateItem value, $Res Function(_ChecklistTemplateItem) _then) = __$ChecklistTemplateItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, bool isRequired, int position
});




}
/// @nodoc
class __$ChecklistTemplateItemCopyWithImpl<$Res>
    implements _$ChecklistTemplateItemCopyWith<$Res> {
  __$ChecklistTemplateItemCopyWithImpl(this._self, this._then);

  final _ChecklistTemplateItem _self;
  final $Res Function(_ChecklistTemplateItem) _then;

/// Create a copy of ChecklistTemplateItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? isRequired = null,Object? position = null,}) {
  return _then(_ChecklistTemplateItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
