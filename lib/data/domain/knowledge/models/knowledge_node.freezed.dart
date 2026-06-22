// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowledgeNode {

 String get id; KnowledgeNodeKind get kind; String get title; int get position; String? get icon; bool? get allMembers; List<KnowledgeNode> get children;
/// Create a copy of KnowledgeNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeNodeCopyWith<KnowledgeNode> get copyWith => _$KnowledgeNodeCopyWithImpl<KnowledgeNode>(this as KnowledgeNode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeNode&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&const DeepCollectionEquality().equals(other.children, children));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,icon,allMembers,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'KnowledgeNode(id: $id, kind: $kind, title: $title, position: $position, icon: $icon, allMembers: $allMembers, children: $children)';
}


}

/// @nodoc
abstract mixin class $KnowledgeNodeCopyWith<$Res>  {
  factory $KnowledgeNodeCopyWith(KnowledgeNode value, $Res Function(KnowledgeNode) _then) = _$KnowledgeNodeCopyWithImpl;
@useResult
$Res call({
 String id, KnowledgeNodeKind kind, String title, int position, String? icon, bool? allMembers, List<KnowledgeNode> children
});




}
/// @nodoc
class _$KnowledgeNodeCopyWithImpl<$Res>
    implements $KnowledgeNodeCopyWith<$Res> {
  _$KnowledgeNodeCopyWithImpl(this._self, this._then);

  final KnowledgeNode _self;
  final $Res Function(KnowledgeNode) _then;

/// Create a copy of KnowledgeNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? icon = freezed,Object? allMembers = freezed,Object? children = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as KnowledgeNodeKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,allMembers: freezed == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool?,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<KnowledgeNode>,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeNode].
extension KnowledgeNodePatterns on KnowledgeNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeNode value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeNode value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  KnowledgeNodeKind kind,  String title,  int position,  String? icon,  bool? allMembers,  List<KnowledgeNode> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeNode() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  KnowledgeNodeKind kind,  String title,  int position,  String? icon,  bool? allMembers,  List<KnowledgeNode> children)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNode():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  KnowledgeNodeKind kind,  String title,  int position,  String? icon,  bool? allMembers,  List<KnowledgeNode> children)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNode() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.position,_that.icon,_that.allMembers,_that.children);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgeNode extends KnowledgeNode {
  const _KnowledgeNode({required this.id, required this.kind, required this.title, required this.position, this.icon, this.allMembers, final  List<KnowledgeNode> children = const <KnowledgeNode>[]}): _children = children,super._();
  

@override final  String id;
@override final  KnowledgeNodeKind kind;
@override final  String title;
@override final  int position;
@override final  String? icon;
@override final  bool? allMembers;
 final  List<KnowledgeNode> _children;
@override@JsonKey() List<KnowledgeNode> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of KnowledgeNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeNodeCopyWith<_KnowledgeNode> get copyWith => __$KnowledgeNodeCopyWithImpl<_KnowledgeNode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeNode&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&const DeepCollectionEquality().equals(other._children, _children));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,icon,allMembers,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'KnowledgeNode(id: $id, kind: $kind, title: $title, position: $position, icon: $icon, allMembers: $allMembers, children: $children)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeNodeCopyWith<$Res> implements $KnowledgeNodeCopyWith<$Res> {
  factory _$KnowledgeNodeCopyWith(_KnowledgeNode value, $Res Function(_KnowledgeNode) _then) = __$KnowledgeNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, KnowledgeNodeKind kind, String title, int position, String? icon, bool? allMembers, List<KnowledgeNode> children
});




}
/// @nodoc
class __$KnowledgeNodeCopyWithImpl<$Res>
    implements _$KnowledgeNodeCopyWith<$Res> {
  __$KnowledgeNodeCopyWithImpl(this._self, this._then);

  final _KnowledgeNode _self;
  final $Res Function(_KnowledgeNode) _then;

/// Create a copy of KnowledgeNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? icon = freezed,Object? allMembers = freezed,Object? children = null,}) {
  return _then(_KnowledgeNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as KnowledgeNodeKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,allMembers: freezed == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool?,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<KnowledgeNode>,
  ));
}


}

/// @nodoc
mixin _$KnowledgeBreadcrumb {

 String get id; String get title;
/// Create a copy of KnowledgeBreadcrumb
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeBreadcrumbCopyWith<KnowledgeBreadcrumb> get copyWith => _$KnowledgeBreadcrumbCopyWithImpl<KnowledgeBreadcrumb>(this as KnowledgeBreadcrumb, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeBreadcrumb&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'KnowledgeBreadcrumb(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $KnowledgeBreadcrumbCopyWith<$Res>  {
  factory $KnowledgeBreadcrumbCopyWith(KnowledgeBreadcrumb value, $Res Function(KnowledgeBreadcrumb) _then) = _$KnowledgeBreadcrumbCopyWithImpl;
@useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class _$KnowledgeBreadcrumbCopyWithImpl<$Res>
    implements $KnowledgeBreadcrumbCopyWith<$Res> {
  _$KnowledgeBreadcrumbCopyWithImpl(this._self, this._then);

  final KnowledgeBreadcrumb _self;
  final $Res Function(KnowledgeBreadcrumb) _then;

/// Create a copy of KnowledgeBreadcrumb
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeBreadcrumb].
extension KnowledgeBreadcrumbPatterns on KnowledgeBreadcrumb {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeBreadcrumb value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeBreadcrumb() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeBreadcrumb value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeBreadcrumb():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeBreadcrumb value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeBreadcrumb() when $default != null:
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
case _KnowledgeBreadcrumb() when $default != null:
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
case _KnowledgeBreadcrumb():
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
case _KnowledgeBreadcrumb() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgeBreadcrumb implements KnowledgeBreadcrumb {
  const _KnowledgeBreadcrumb({required this.id, required this.title});
  

@override final  String id;
@override final  String title;

/// Create a copy of KnowledgeBreadcrumb
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeBreadcrumbCopyWith<_KnowledgeBreadcrumb> get copyWith => __$KnowledgeBreadcrumbCopyWithImpl<_KnowledgeBreadcrumb>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeBreadcrumb&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'KnowledgeBreadcrumb(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeBreadcrumbCopyWith<$Res> implements $KnowledgeBreadcrumbCopyWith<$Res> {
  factory _$KnowledgeBreadcrumbCopyWith(_KnowledgeBreadcrumb value, $Res Function(_KnowledgeBreadcrumb) _then) = __$KnowledgeBreadcrumbCopyWithImpl;
@override @useResult
$Res call({
 String id, String title
});




}
/// @nodoc
class __$KnowledgeBreadcrumbCopyWithImpl<$Res>
    implements _$KnowledgeBreadcrumbCopyWith<$Res> {
  __$KnowledgeBreadcrumbCopyWithImpl(this._self, this._then);

  final _KnowledgeBreadcrumb _self;
  final $Res Function(_KnowledgeBreadcrumb) _then;

/// Create a copy of KnowledgeBreadcrumb
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_KnowledgeBreadcrumb(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$KnowledgeNodeDetail {

 String get id; KnowledgeNodeKind get kind; String get title; int get position; bool get allMembers; DateTime get createdAt; DateTime get updatedAt; String? get parentId; String? get icon; List<KnowledgeBlock>? get content; List<KnowledgeBreadcrumb> get breadcrumbs;
/// Create a copy of KnowledgeNodeDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeNodeDetailCopyWith<KnowledgeNodeDetail> get copyWith => _$KnowledgeNodeDetailCopyWithImpl<KnowledgeNodeDetail>(this as KnowledgeNodeDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeNodeDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.breadcrumbs, breadcrumbs));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,allMembers,createdAt,updatedAt,parentId,icon,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(breadcrumbs));

@override
String toString() {
  return 'KnowledgeNodeDetail(id: $id, kind: $kind, title: $title, position: $position, allMembers: $allMembers, createdAt: $createdAt, updatedAt: $updatedAt, parentId: $parentId, icon: $icon, content: $content, breadcrumbs: $breadcrumbs)';
}


}

/// @nodoc
abstract mixin class $KnowledgeNodeDetailCopyWith<$Res>  {
  factory $KnowledgeNodeDetailCopyWith(KnowledgeNodeDetail value, $Res Function(KnowledgeNodeDetail) _then) = _$KnowledgeNodeDetailCopyWithImpl;
@useResult
$Res call({
 String id, KnowledgeNodeKind kind, String title, int position, bool allMembers, DateTime createdAt, DateTime updatedAt, String? parentId, String? icon, List<KnowledgeBlock>? content, List<KnowledgeBreadcrumb> breadcrumbs
});




}
/// @nodoc
class _$KnowledgeNodeDetailCopyWithImpl<$Res>
    implements $KnowledgeNodeDetailCopyWith<$Res> {
  _$KnowledgeNodeDetailCopyWithImpl(this._self, this._then);

  final KnowledgeNodeDetail _self;
  final $Res Function(KnowledgeNodeDetail) _then;

/// Create a copy of KnowledgeNodeDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? allMembers = null,Object? createdAt = null,Object? updatedAt = null,Object? parentId = freezed,Object? icon = freezed,Object? content = freezed,Object? breadcrumbs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as KnowledgeNodeKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,allMembers: null == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBlock>?,breadcrumbs: null == breadcrumbs ? _self.breadcrumbs : breadcrumbs // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBreadcrumb>,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeNodeDetail].
extension KnowledgeNodeDetailPatterns on KnowledgeNodeDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeNodeDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeNodeDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeNodeDetail value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNodeDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeNodeDetail value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeNodeDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  KnowledgeNodeKind kind,  String title,  int position,  bool allMembers,  DateTime createdAt,  DateTime updatedAt,  String? parentId,  String? icon,  List<KnowledgeBlock>? content,  List<KnowledgeBreadcrumb> breadcrumbs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeNodeDetail() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  KnowledgeNodeKind kind,  String title,  int position,  bool allMembers,  DateTime createdAt,  DateTime updatedAt,  String? parentId,  String? icon,  List<KnowledgeBlock>? content,  List<KnowledgeBreadcrumb> breadcrumbs)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNodeDetail():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  KnowledgeNodeKind kind,  String title,  int position,  bool allMembers,  DateTime createdAt,  DateTime updatedAt,  String? parentId,  String? icon,  List<KnowledgeBlock>? content,  List<KnowledgeBreadcrumb> breadcrumbs)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeNodeDetail() when $default != null:
return $default(_that.id,_that.kind,_that.title,_that.position,_that.allMembers,_that.createdAt,_that.updatedAt,_that.parentId,_that.icon,_that.content,_that.breadcrumbs);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgeNodeDetail implements KnowledgeNodeDetail {
  const _KnowledgeNodeDetail({required this.id, required this.kind, required this.title, required this.position, required this.allMembers, required this.createdAt, required this.updatedAt, this.parentId, this.icon, final  List<KnowledgeBlock>? content, final  List<KnowledgeBreadcrumb> breadcrumbs = const <KnowledgeBreadcrumb>[]}): _content = content,_breadcrumbs = breadcrumbs;
  

@override final  String id;
@override final  KnowledgeNodeKind kind;
@override final  String title;
@override final  int position;
@override final  bool allMembers;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? parentId;
@override final  String? icon;
 final  List<KnowledgeBlock>? _content;
@override List<KnowledgeBlock>? get content {
  final value = _content;
  if (value == null) return null;
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<KnowledgeBreadcrumb> _breadcrumbs;
@override@JsonKey() List<KnowledgeBreadcrumb> get breadcrumbs {
  if (_breadcrumbs is EqualUnmodifiableListView) return _breadcrumbs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breadcrumbs);
}


/// Create a copy of KnowledgeNodeDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeNodeDetailCopyWith<_KnowledgeNodeDetail> get copyWith => __$KnowledgeNodeDetailCopyWithImpl<_KnowledgeNodeDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeNodeDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.position, position) || other.position == position)&&(identical(other.allMembers, allMembers) || other.allMembers == allMembers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.icon, icon) || other.icon == icon)&&const DeepCollectionEquality().equals(other._content, _content)&&const DeepCollectionEquality().equals(other._breadcrumbs, _breadcrumbs));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,title,position,allMembers,createdAt,updatedAt,parentId,icon,const DeepCollectionEquality().hash(_content),const DeepCollectionEquality().hash(_breadcrumbs));

@override
String toString() {
  return 'KnowledgeNodeDetail(id: $id, kind: $kind, title: $title, position: $position, allMembers: $allMembers, createdAt: $createdAt, updatedAt: $updatedAt, parentId: $parentId, icon: $icon, content: $content, breadcrumbs: $breadcrumbs)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeNodeDetailCopyWith<$Res> implements $KnowledgeNodeDetailCopyWith<$Res> {
  factory _$KnowledgeNodeDetailCopyWith(_KnowledgeNodeDetail value, $Res Function(_KnowledgeNodeDetail) _then) = __$KnowledgeNodeDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, KnowledgeNodeKind kind, String title, int position, bool allMembers, DateTime createdAt, DateTime updatedAt, String? parentId, String? icon, List<KnowledgeBlock>? content, List<KnowledgeBreadcrumb> breadcrumbs
});




}
/// @nodoc
class __$KnowledgeNodeDetailCopyWithImpl<$Res>
    implements _$KnowledgeNodeDetailCopyWith<$Res> {
  __$KnowledgeNodeDetailCopyWithImpl(this._self, this._then);

  final _KnowledgeNodeDetail _self;
  final $Res Function(_KnowledgeNodeDetail) _then;

/// Create a copy of KnowledgeNodeDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? title = null,Object? position = null,Object? allMembers = null,Object? createdAt = null,Object? updatedAt = null,Object? parentId = freezed,Object? icon = freezed,Object? content = freezed,Object? breadcrumbs = null,}) {
  return _then(_KnowledgeNodeDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as KnowledgeNodeKind,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,allMembers: null == allMembers ? _self.allMembers : allMembers // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBlock>?,breadcrumbs: null == breadcrumbs ? _self._breadcrumbs : breadcrumbs // ignore: cast_nullable_to_non_nullable
as List<KnowledgeBreadcrumb>,
  ));
}


}

// dart format on
