// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_tree_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowledgeTreeState {

 SectionData<List<KnowledgeNode>> get tree; Set<String> get expandedIds;
/// Create a copy of KnowledgeTreeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeTreeStateCopyWith<KnowledgeTreeState> get copyWith => _$KnowledgeTreeStateCopyWithImpl<KnowledgeTreeState>(this as KnowledgeTreeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeTreeState&&(identical(other.tree, tree) || other.tree == tree)&&const DeepCollectionEquality().equals(other.expandedIds, expandedIds));
}


@override
int get hashCode => Object.hash(runtimeType,tree,const DeepCollectionEquality().hash(expandedIds));

@override
String toString() {
  return 'KnowledgeTreeState(tree: $tree, expandedIds: $expandedIds)';
}


}

/// @nodoc
abstract mixin class $KnowledgeTreeStateCopyWith<$Res>  {
  factory $KnowledgeTreeStateCopyWith(KnowledgeTreeState value, $Res Function(KnowledgeTreeState) _then) = _$KnowledgeTreeStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<KnowledgeNode>> tree, Set<String> expandedIds
});


$SectionDataCopyWith<List<KnowledgeNode>, $Res> get tree;

}
/// @nodoc
class _$KnowledgeTreeStateCopyWithImpl<$Res>
    implements $KnowledgeTreeStateCopyWith<$Res> {
  _$KnowledgeTreeStateCopyWithImpl(this._self, this._then);

  final KnowledgeTreeState _self;
  final $Res Function(KnowledgeTreeState) _then;

/// Create a copy of KnowledgeTreeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tree = null,Object? expandedIds = null,}) {
  return _then(_self.copyWith(
tree: null == tree ? _self.tree : tree // ignore: cast_nullable_to_non_nullable
as SectionData<List<KnowledgeNode>>,expandedIds: null == expandedIds ? _self.expandedIds : expandedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}
/// Create a copy of KnowledgeTreeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<KnowledgeNode>, $Res> get tree {
  
  return $SectionDataCopyWith<List<KnowledgeNode>, $Res>(_self.tree, (value) {
    return _then(_self.copyWith(tree: value));
  });
}
}


/// Adds pattern-matching-related methods to [KnowledgeTreeState].
extension KnowledgeTreeStatePatterns on KnowledgeTreeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeTreeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeTreeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeTreeState value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeTreeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeTreeState value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeTreeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<KnowledgeNode>> tree,  Set<String> expandedIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeTreeState() when $default != null:
return $default(_that.tree,_that.expandedIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<KnowledgeNode>> tree,  Set<String> expandedIds)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeTreeState():
return $default(_that.tree,_that.expandedIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<KnowledgeNode>> tree,  Set<String> expandedIds)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeTreeState() when $default != null:
return $default(_that.tree,_that.expandedIds);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgeTreeState implements KnowledgeTreeState {
  const _KnowledgeTreeState({this.tree = const SectionData<List<KnowledgeNode>>(), final  Set<String> expandedIds = const <String>{}}): _expandedIds = expandedIds;
  

@override@JsonKey() final  SectionData<List<KnowledgeNode>> tree;
 final  Set<String> _expandedIds;
@override@JsonKey() Set<String> get expandedIds {
  if (_expandedIds is EqualUnmodifiableSetView) return _expandedIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_expandedIds);
}


/// Create a copy of KnowledgeTreeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeTreeStateCopyWith<_KnowledgeTreeState> get copyWith => __$KnowledgeTreeStateCopyWithImpl<_KnowledgeTreeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeTreeState&&(identical(other.tree, tree) || other.tree == tree)&&const DeepCollectionEquality().equals(other._expandedIds, _expandedIds));
}


@override
int get hashCode => Object.hash(runtimeType,tree,const DeepCollectionEquality().hash(_expandedIds));

@override
String toString() {
  return 'KnowledgeTreeState(tree: $tree, expandedIds: $expandedIds)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeTreeStateCopyWith<$Res> implements $KnowledgeTreeStateCopyWith<$Res> {
  factory _$KnowledgeTreeStateCopyWith(_KnowledgeTreeState value, $Res Function(_KnowledgeTreeState) _then) = __$KnowledgeTreeStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<KnowledgeNode>> tree, Set<String> expandedIds
});


@override $SectionDataCopyWith<List<KnowledgeNode>, $Res> get tree;

}
/// @nodoc
class __$KnowledgeTreeStateCopyWithImpl<$Res>
    implements _$KnowledgeTreeStateCopyWith<$Res> {
  __$KnowledgeTreeStateCopyWithImpl(this._self, this._then);

  final _KnowledgeTreeState _self;
  final $Res Function(_KnowledgeTreeState) _then;

/// Create a copy of KnowledgeTreeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tree = null,Object? expandedIds = null,}) {
  return _then(_KnowledgeTreeState(
tree: null == tree ? _self.tree : tree // ignore: cast_nullable_to_non_nullable
as SectionData<List<KnowledgeNode>>,expandedIds: null == expandedIds ? _self._expandedIds : expandedIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of KnowledgeTreeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<KnowledgeNode>, $Res> get tree {
  
  return $SectionDataCopyWith<List<KnowledgeNode>, $Res>(_self.tree, (value) {
    return _then(_self.copyWith(tree: value));
  });
}
}

// dart format on
