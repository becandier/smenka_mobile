// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowledgePageState {

 SectionData<KnowledgeNodeDetail> get node;
/// Create a copy of KnowledgePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgePageStateCopyWith<KnowledgePageState> get copyWith => _$KnowledgePageStateCopyWithImpl<KnowledgePageState>(this as KnowledgePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgePageState&&(identical(other.node, node) || other.node == node));
}


@override
int get hashCode => Object.hash(runtimeType,node);

@override
String toString() {
  return 'KnowledgePageState(node: $node)';
}


}

/// @nodoc
abstract mixin class $KnowledgePageStateCopyWith<$Res>  {
  factory $KnowledgePageStateCopyWith(KnowledgePageState value, $Res Function(KnowledgePageState) _then) = _$KnowledgePageStateCopyWithImpl;
@useResult
$Res call({
 SectionData<KnowledgeNodeDetail> node
});


$SectionDataCopyWith<KnowledgeNodeDetail, $Res> get node;

}
/// @nodoc
class _$KnowledgePageStateCopyWithImpl<$Res>
    implements $KnowledgePageStateCopyWith<$Res> {
  _$KnowledgePageStateCopyWithImpl(this._self, this._then);

  final KnowledgePageState _self;
  final $Res Function(KnowledgePageState) _then;

/// Create a copy of KnowledgePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? node = null,}) {
  return _then(_self.copyWith(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as SectionData<KnowledgeNodeDetail>,
  ));
}
/// Create a copy of KnowledgePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<KnowledgeNodeDetail, $Res> get node {
  
  return $SectionDataCopyWith<KnowledgeNodeDetail, $Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}


/// Adds pattern-matching-related methods to [KnowledgePageState].
extension KnowledgePageStatePatterns on KnowledgePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgePageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgePageState value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgePageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgePageState value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgePageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<KnowledgeNodeDetail> node)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgePageState() when $default != null:
return $default(_that.node);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<KnowledgeNodeDetail> node)  $default,) {final _that = this;
switch (_that) {
case _KnowledgePageState():
return $default(_that.node);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<KnowledgeNodeDetail> node)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgePageState() when $default != null:
return $default(_that.node);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgePageState implements KnowledgePageState {
  const _KnowledgePageState({this.node = const SectionData<KnowledgeNodeDetail>()});
  

@override@JsonKey() final  SectionData<KnowledgeNodeDetail> node;

/// Create a copy of KnowledgePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgePageStateCopyWith<_KnowledgePageState> get copyWith => __$KnowledgePageStateCopyWithImpl<_KnowledgePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgePageState&&(identical(other.node, node) || other.node == node));
}


@override
int get hashCode => Object.hash(runtimeType,node);

@override
String toString() {
  return 'KnowledgePageState(node: $node)';
}


}

/// @nodoc
abstract mixin class _$KnowledgePageStateCopyWith<$Res> implements $KnowledgePageStateCopyWith<$Res> {
  factory _$KnowledgePageStateCopyWith(_KnowledgePageState value, $Res Function(_KnowledgePageState) _then) = __$KnowledgePageStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<KnowledgeNodeDetail> node
});


@override $SectionDataCopyWith<KnowledgeNodeDetail, $Res> get node;

}
/// @nodoc
class __$KnowledgePageStateCopyWithImpl<$Res>
    implements _$KnowledgePageStateCopyWith<$Res> {
  __$KnowledgePageStateCopyWithImpl(this._self, this._then);

  final _KnowledgePageState _self;
  final $Res Function(_KnowledgePageState) _then;

/// Create a copy of KnowledgePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? node = null,}) {
  return _then(_KnowledgePageState(
node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as SectionData<KnowledgeNodeDetail>,
  ));
}

/// Create a copy of KnowledgePageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<KnowledgeNodeDetail, $Res> get node {
  
  return $SectionDataCopyWith<KnowledgeNodeDetail, $Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}

// dart format on
