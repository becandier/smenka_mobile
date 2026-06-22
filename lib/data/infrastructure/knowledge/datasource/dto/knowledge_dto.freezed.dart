// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KnowledgeNodeDto {

 String get id; String get kind; String get title; int get position; String? get icon; bool? get allMembers; List<KnowledgeNodeDto> get children;
/// Create a copy of KnowledgeNodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeNodeDtoCopyWith<KnowledgeNodeDto> get copyWith => _$KnowledgeNodeDtoCopyWithImpl<KnowledgeNodeDto>(this as KnowledgeNodeDto, _$identity);

  /// Serializes this KnowledgeNodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeNodeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,icon,allMembers,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'KnowledgeNodeDto(id: $id, kind: $kind, title: $title, position: $position, icon: $icon, allMembers: $allMembers, children: $children)';
}


}

/// @nodoc
abstract mixin class $KnowledgeNodeDtoCopyWith<$Res>  {
  factory $KnowledgeNodeDtoCopyWith(KnowledgeNodeDto value, $Res Function(KnowledgeNodeDto) _then) = _$KnowledgeNodeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String title, int position, String? icon, bool? allMembers, List<KnowledgeNodeDto> children
});




}
/// @nodoc
class _$KnowledgeNodeDtoCopyWithImpl<$Res>
    implements $KnowledgeNodeDtoCopyWith<$Res> {
  _$KnowledgeNodeDtoCopyWithImpl(this._self, this._then);

  final KnowledgeNodeDto _self;
  final $Res Function(KnowledgeNodeDto) _then;

/// Create a copy of KnowledgeNodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? icon = freezed,Object? allMembers = freezed,Object? children = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,allMembers: freezed == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool?,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<KnowledgeNodeDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeNodeDto].
extension KnowledgeNodeDtoPatterns on KnowledgeNodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeNodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeNodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeNodeDto value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeNodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  int position,  String? icon,  bool? allMembers,  List<KnowledgeNodeDto> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeNodeDto() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.position,_that.icon,_that.allMembers,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  int position,  String? icon,  bool? allMembers,  List<KnowledgeNodeDto> children)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNodeDto():
return $default(_that.id,_that.kind,_that.title,_that.position,_that.icon,_that.allMembers,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String title,  int position,  String? icon,  bool? allMembers,  List<KnowledgeNodeDto> children)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNodeDto() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.position,_that.icon,_that.allMembers,_that.children);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _KnowledgeNodeDto implements KnowledgeNodeDto {
  const _KnowledgeNodeDto({required this.id, required this.kind, required this.title, required this.position, this.icon, this.allMembers, final  List<KnowledgeNodeDto> children = const <KnowledgeNodeDto>[]}): _children = children;
  factory _KnowledgeNodeDto.fromJson(Map<String, dynamic> json) => _$KnowledgeNodeDtoFromJson(json);

@override final  String id;
@override final  String kind;
@override final  String title;
@override final  int position;
@override final  String? icon;
@override final  bool? allMembers;
 final  List<KnowledgeNodeDto> _children;
@override@JsonKey() List<KnowledgeNodeDto> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of KnowledgeNodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeNodeDtoCopyWith<_KnowledgeNodeDto> get copyWith => __$KnowledgeNodeDtoCopyWithImpl<_KnowledgeNodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnowledgeNodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeNodeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,icon,allMembers,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'KnowledgeNodeDto(id: $id, kind: $kind, title: $title, position: $position, icon: $icon, allMembers: $allMembers, children: $children)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeNodeDtoCopyWith<$Res> implements $KnowledgeNodeDtoCopyWith<$Res> {
  factory _$KnowledgeNodeDtoCopyWith(_KnowledgeNodeDto value, $Res Function(_KnowledgeNodeDto) _then) = __$KnowledgeNodeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String title, int position, String? icon, bool? allMembers, List<KnowledgeNodeDto> children
});




}
/// @nodoc
class __$KnowledgeNodeDtoCopyWithImpl<$Res>
    implements _$KnowledgeNodeDtoCopyWith<$Res> {
  __$KnowledgeNodeDtoCopyWithImpl(this._self, this._then);

  final _KnowledgeNodeDto _self;
  final $Res Function(_KnowledgeNodeDto) _then;

/// Create a copy of KnowledgeNodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? icon = freezed,Object? allMembers = freezed,Object? children = null,}) {
  return _then(_KnowledgeNodeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,allMembers: freezed == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool?,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<KnowledgeNodeDto>,
  ));
}


}


/// @nodoc
mixin _$KnowledgeBreadcrumbDto {

 String get id; String get title;
/// Create a copy of KnowledgeBreadcrumbDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeBreadcrumbDtoCopyWith<KnowledgeBreadcrumbDto> get copyWith => _$KnowledgeBreadcrumbDtoCopyWithImpl<KnowledgeBreadcrumbDto>(this as KnowledgeBreadcrumbDto, _$identity);

  /// Serializes this KnowledgeBreadcrumbDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeBreadcrumbDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'KnowledgeBreadcrumbDto(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $KnowledgeBreadcrumbDtoCopyWith<$Res>  {
  factory $KnowledgeBreadcrumbDtoCopyWith(KnowledgeBreadcrumbDto value, $Res Function(KnowledgeBreadcrumbDto) _then) = _$KnowledgeBreadcrumbDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class _$KnowledgeBreadcrumbDtoCopyWithImpl<$Res>
    implements $KnowledgeBreadcrumbDtoCopyWith<$Res> {
  _$KnowledgeBreadcrumbDtoCopyWithImpl(this._self, this._then);

  final KnowledgeBreadcrumbDto _self;
  final $Res Function(KnowledgeBreadcrumbDto) _then;

/// Create a copy of KnowledgeBreadcrumbDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeBreadcrumbDto].
extension KnowledgeBreadcrumbDtoPatterns on KnowledgeBreadcrumbDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeBreadcrumbDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeBreadcrumbDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeBreadcrumbDto value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeBreadcrumbDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeBreadcrumbDto value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeBreadcrumbDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeBreadcrumbDto() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeBreadcrumbDto():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeBreadcrumbDto() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KnowledgeBreadcrumbDto implements KnowledgeBreadcrumbDto {
  const _KnowledgeBreadcrumbDto({required this.id, required this.title});
  factory _KnowledgeBreadcrumbDto.fromJson(Map<String, dynamic> json) => _$KnowledgeBreadcrumbDtoFromJson(json);

@override final  String id;
@override final  String title;

/// Create a copy of KnowledgeBreadcrumbDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeBreadcrumbDtoCopyWith<_KnowledgeBreadcrumbDto> get copyWith => __$KnowledgeBreadcrumbDtoCopyWithImpl<_KnowledgeBreadcrumbDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnowledgeBreadcrumbDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeBreadcrumbDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'KnowledgeBreadcrumbDto(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeBreadcrumbDtoCopyWith<$Res> implements $KnowledgeBreadcrumbDtoCopyWith<$Res> {
  factory _$KnowledgeBreadcrumbDtoCopyWith(_KnowledgeBreadcrumbDto value, $Res Function(_KnowledgeBreadcrumbDto) _then) = __$KnowledgeBreadcrumbDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class __$KnowledgeBreadcrumbDtoCopyWithImpl<$Res>
    implements _$KnowledgeBreadcrumbDtoCopyWith<$Res> {
  __$KnowledgeBreadcrumbDtoCopyWithImpl(this._self, this._then);

  final _KnowledgeBreadcrumbDto _self;
  final $Res Function(_KnowledgeBreadcrumbDto) _then;

/// Create a copy of KnowledgeBreadcrumbDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_KnowledgeBreadcrumbDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$KnowledgeNodeDetailDto {

 String get id; String get kind; String get title; int get position; bool get allMembers; DateTime get createdAt; DateTime get updatedAt; String? get parentId; String? get icon;// Сырой JSON блоков; типобезопасная фильтрация и диспетчер — в маппере
// (forward-compat: не-объектный элемент массива не должен ронять парсинг).
 List<dynamic>? get content; List<KnowledgeBreadcrumbDto> get breadcrumbs;
/// Create a copy of KnowledgeNodeDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeNodeDetailDtoCopyWith<KnowledgeNodeDetailDto> get copyWith => _$KnowledgeNodeDetailDtoCopyWithImpl<KnowledgeNodeDetailDto>(this as KnowledgeNodeDetailDto, _$identity);

  /// Serializes this KnowledgeNodeDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeNodeDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.breadcrumbs, breadcrumbs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,allMembers,createdAt,updatedAt,parentId,icon,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(breadcrumbs));

@override
String toString() {
  return 'KnowledgeNodeDetailDto(id: $id, kind: $kind, title: $title, position: $position, allMembers: $allMembers, createdAt: $createdAt, updatedAt: $updatedAt, parentId: $parentId, icon: $icon, content: $content, breadcrumbs: $breadcrumbs)';
}


}

/// @nodoc
abstract mixin class $KnowledgeNodeDetailDtoCopyWith<$Res>  {
  factory $KnowledgeNodeDetailDtoCopyWith(KnowledgeNodeDetailDto value, $Res Function(KnowledgeNodeDetailDto) _then) = _$KnowledgeNodeDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String kind, String title, int position, bool allMembers, DateTime createdAt, DateTime updatedAt, String? parentId, String? icon, List<dynamic>? content, List<KnowledgeBreadcrumbDto> breadcrumbs
});




}
/// @nodoc
class _$KnowledgeNodeDetailDtoCopyWithImpl<$Res>
    implements $KnowledgeNodeDetailDtoCopyWith<$Res> {
  _$KnowledgeNodeDetailDtoCopyWithImpl(this._self, this._then);

  final KnowledgeNodeDetailDto _self;
  final $Res Function(KnowledgeNodeDetailDto) _then;

/// Create a copy of KnowledgeNodeDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? allMembers = null,Object? createdAt = null,Object? updatedAt = null,Object? parentId = freezed,Object? icon = freezed,Object? content = freezed,Object? breadcrumbs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,allMembers: null == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,breadcrumbs: null == breadcrumbs ? _self.breadcrumbs : breadcrumbs // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBreadcrumbDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeNodeDetailDto].
extension KnowledgeNodeDetailDtoPatterns on KnowledgeNodeDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeNodeDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeNodeDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeNodeDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNodeDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeNodeDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNodeDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  int position,  bool allMembers,  DateTime createdAt,  DateTime updatedAt,  String? parentId,  String? icon,  List<dynamic>? content,  List<KnowledgeBreadcrumbDto> breadcrumbs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeNodeDetailDto() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.position,_that.allMembers,_that.createdAt,_that.updatedAt,_that.parentId,_that.icon,_that.content,_that.breadcrumbs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  String title,  int position,  bool allMembers,  DateTime createdAt,  DateTime updatedAt,  String? parentId,  String? icon,  List<dynamic>? content,  List<KnowledgeBreadcrumbDto> breadcrumbs)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNodeDetailDto():
return $default(_that.id,_that.kind,_that.title,_that.position,_that.allMembers,_that.createdAt,_that.updatedAt,_that.parentId,_that.icon,_that.content,_that.breadcrumbs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  String title,  int position,  bool allMembers,  DateTime createdAt,  DateTime updatedAt,  String? parentId,  String? icon,  List<dynamic>? content,  List<KnowledgeBreadcrumbDto> breadcrumbs)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNodeDetailDto() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.position,_that.allMembers,_that.createdAt,_that.updatedAt,_that.parentId,_that.icon,_that.content,_that.breadcrumbs);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _KnowledgeNodeDetailDto implements KnowledgeNodeDetailDto {
  const _KnowledgeNodeDetailDto({required this.id, required this.kind, required this.title, required this.position, required this.allMembers, required this.createdAt, required this.updatedAt, this.parentId, this.icon, final  List<dynamic>? content, final  List<KnowledgeBreadcrumbDto> breadcrumbs = const <KnowledgeBreadcrumbDto>[]}): _content = content,_breadcrumbs = breadcrumbs;
  factory _KnowledgeNodeDetailDto.fromJson(Map<String, dynamic> json) => _$KnowledgeNodeDetailDtoFromJson(json);

@override final  String id;
@override final  String kind;
@override final  String title;
@override final  int position;
@override final  bool allMembers;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? parentId;
@override final  String? icon;
// Сырой JSON блоков; типобезопасная фильтрация и диспетчер — в маппере
// (forward-compat: не-объектный элемент массива не должен ронять парсинг).
 final  List<dynamic>? _content;
// Сырой JSON блоков; типобезопасная фильтрация и диспетчер — в маппере
// (forward-compat: не-объектный элемент массива не должен ронять парсинг).
@override List<dynamic>? get content {
  final value = _content;
  if (value == null) return null;
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<KnowledgeBreadcrumbDto> _breadcrumbs;
@override@JsonKey() List<KnowledgeBreadcrumbDto> get breadcrumbs {
  if (_breadcrumbs is EqualUnmodifiableListView) return _breadcrumbs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breadcrumbs);
}


/// Create a copy of KnowledgeNodeDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeNodeDetailDtoCopyWith<_KnowledgeNodeDetailDto> get copyWith => __$KnowledgeNodeDetailDtoCopyWithImpl<_KnowledgeNodeDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnowledgeNodeDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeNodeDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other._content, _content)&&const DeepCollectionEquality().equals(other._breadcrumbs, _breadcrumbs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,allMembers,createdAt,updatedAt,parentId,icon,const DeepCollectionEquality().hash(_content),const DeepCollectionEquality().hash(_breadcrumbs));

@override
String toString() {
  return 'KnowledgeNodeDetailDto(id: $id, kind: $kind, title: $title, position: $position, allMembers: $allMembers, createdAt: $createdAt, updatedAt: $updatedAt, parentId: $parentId, icon: $icon, content: $content, breadcrumbs: $breadcrumbs)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeNodeDetailDtoCopyWith<$Res> implements $KnowledgeNodeDetailDtoCopyWith<$Res> {
  factory _$KnowledgeNodeDetailDtoCopyWith(_KnowledgeNodeDetailDto value, $Res Function(_KnowledgeNodeDetailDto) _then) = __$KnowledgeNodeDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, String title, int position, bool allMembers, DateTime createdAt, DateTime updatedAt, String? parentId, String? icon, List<dynamic>? content, List<KnowledgeBreadcrumbDto> breadcrumbs
});




}
/// @nodoc
class __$KnowledgeNodeDetailDtoCopyWithImpl<$Res>
    implements _$KnowledgeNodeDetailDtoCopyWith<$Res> {
  __$KnowledgeNodeDetailDtoCopyWithImpl(this._self, this._then);

  final _KnowledgeNodeDetailDto _self;
  final $Res Function(_KnowledgeNodeDetailDto) _then;

/// Create a copy of KnowledgeNodeDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? allMembers = null,Object? createdAt = null,Object? updatedAt = null,Object? parentId = freezed,Object? icon = freezed,Object? content = freezed,Object? breadcrumbs = null,}) {
  return _then(_KnowledgeNodeDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,allMembers: null == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,breadcrumbs: null == breadcrumbs ? _self._breadcrumbs : breadcrumbs // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBreadcrumbDto>,
  ));
}


}

// dart format on
