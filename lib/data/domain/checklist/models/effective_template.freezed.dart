// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'effective_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EffectiveChecklistTemplate {

 String get id; String get name; ChecklistType get type; bool get isRequired; ChecklistTemplateSource get source;
/// Create a copy of EffectiveChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EffectiveChecklistTemplateCopyWith<EffectiveChecklistTemplate> get copyWith => _$EffectiveChecklistTemplateCopyWithImpl<EffectiveChecklistTemplate>(this as EffectiveChecklistTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EffectiveChecklistTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,source);

@override
String toString() {
  return 'EffectiveChecklistTemplate(id: $id, name: $name, type: $type, isRequired: $isRequired, source: $source)';
}


}

/// @nodoc
abstract mixin class $EffectiveChecklistTemplateCopyWith<$Res>  {
  factory $EffectiveChecklistTemplateCopyWith(EffectiveChecklistTemplate value, $Res Function(EffectiveChecklistTemplate) _then) = _$EffectiveChecklistTemplateCopyWithImpl;
@useResult
$Res call({
 String id, String name, ChecklistType type, bool isRequired, ChecklistTemplateSource source
});




}
/// @nodoc
class _$EffectiveChecklistTemplateCopyWithImpl<$Res>
    implements $EffectiveChecklistTemplateCopyWith<$Res> {
  _$EffectiveChecklistTemplateCopyWithImpl(this._self, this._then);

  final EffectiveChecklistTemplate _self;
  final $Res Function(EffectiveChecklistTemplate) _then;

/// Create a copy of EffectiveChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? source = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChecklistType,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ChecklistTemplateSource,
  ));
}

}


/// Adds pattern-matching-related methods to [EffectiveChecklistTemplate].
extension EffectiveChecklistTemplatePatterns on EffectiveChecklistTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EffectiveChecklistTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EffectiveChecklistTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EffectiveChecklistTemplate value)  $default,){
final _that = this;
switch (_that) {
case _EffectiveChecklistTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EffectiveChecklistTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _EffectiveChecklistTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ChecklistType type,  bool isRequired,  ChecklistTemplateSource source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EffectiveChecklistTemplate() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ChecklistType type,  bool isRequired,  ChecklistTemplateSource source)  $default,) {final _that = this;
switch (_that) {
case _EffectiveChecklistTemplate():
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ChecklistType type,  bool isRequired,  ChecklistTemplateSource source)?  $default,) {final _that = this;
switch (_that) {
case _EffectiveChecklistTemplate() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.source);case _:
  return null;

}
}

}

/// @nodoc


class _EffectiveChecklistTemplate implements EffectiveChecklistTemplate {
  const _EffectiveChecklistTemplate({required this.id, required this.name, required this.type, required this.isRequired, required this.source});
  

@override final  String id;
@override final  String name;
@override final  ChecklistType type;
@override final  bool isRequired;
@override final  ChecklistTemplateSource source;

/// Create a copy of EffectiveChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EffectiveChecklistTemplateCopyWith<_EffectiveChecklistTemplate> get copyWith => __$EffectiveChecklistTemplateCopyWithImpl<_EffectiveChecklistTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectiveChecklistTemplate&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,source);

@override
String toString() {
  return 'EffectiveChecklistTemplate(id: $id, name: $name, type: $type, isRequired: $isRequired, source: $source)';
}


}

/// @nodoc
abstract mixin class _$EffectiveChecklistTemplateCopyWith<$Res> implements $EffectiveChecklistTemplateCopyWith<$Res> {
  factory _$EffectiveChecklistTemplateCopyWith(_EffectiveChecklistTemplate value, $Res Function(_EffectiveChecklistTemplate) _then) = __$EffectiveChecklistTemplateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ChecklistType type, bool isRequired, ChecklistTemplateSource source
});




}
/// @nodoc
class __$EffectiveChecklistTemplateCopyWithImpl<$Res>
    implements _$EffectiveChecklistTemplateCopyWith<$Res> {
  __$EffectiveChecklistTemplateCopyWithImpl(this._self, this._then);

  final _EffectiveChecklistTemplate _self;
  final $Res Function(_EffectiveChecklistTemplate) _then;

/// Create a copy of EffectiveChecklistTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? source = null,}) {
  return _then(_EffectiveChecklistTemplate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChecklistType,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ChecklistTemplateSource,
  ));
}


}

// dart format on
