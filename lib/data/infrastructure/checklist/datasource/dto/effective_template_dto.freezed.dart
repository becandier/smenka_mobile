// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'effective_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EffectiveChecklistTemplateDto {

 String get id; String get name; String get type; bool get isRequired; String get source;
/// Create a copy of EffectiveChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EffectiveChecklistTemplateDtoCopyWith<EffectiveChecklistTemplateDto> get copyWith => _$EffectiveChecklistTemplateDtoCopyWithImpl<EffectiveChecklistTemplateDto>(this as EffectiveChecklistTemplateDto, _$identity);

  /// Serializes this EffectiveChecklistTemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EffectiveChecklistTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,source);

@override
String toString() {
  return 'EffectiveChecklistTemplateDto(id: $id, name: $name, type: $type, isRequired: $isRequired, source: $source)';
}


}

/// @nodoc
abstract mixin class $EffectiveChecklistTemplateDtoCopyWith<$Res>  {
  factory $EffectiveChecklistTemplateDtoCopyWith(EffectiveChecklistTemplateDto value, $Res Function(EffectiveChecklistTemplateDto) _then) = _$EffectiveChecklistTemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, bool isRequired, String source
});




}
/// @nodoc
class _$EffectiveChecklistTemplateDtoCopyWithImpl<$Res>
    implements $EffectiveChecklistTemplateDtoCopyWith<$Res> {
  _$EffectiveChecklistTemplateDtoCopyWithImpl(this._self, this._then);

  final EffectiveChecklistTemplateDto _self;
  final $Res Function(EffectiveChecklistTemplateDto) _then;

/// Create a copy of EffectiveChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? source = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EffectiveChecklistTemplateDto].
extension EffectiveChecklistTemplateDtoPatterns on EffectiveChecklistTemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EffectiveChecklistTemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EffectiveChecklistTemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EffectiveChecklistTemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _EffectiveChecklistTemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EffectiveChecklistTemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _EffectiveChecklistTemplateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EffectiveChecklistTemplateDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  String source)  $default,) {final _that = this;
switch (_that) {
case _EffectiveChecklistTemplateDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  bool isRequired,  String source)?  $default,) {final _that = this;
switch (_that) {
case _EffectiveChecklistTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.source);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _EffectiveChecklistTemplateDto implements EffectiveChecklistTemplateDto {
  const _EffectiveChecklistTemplateDto({required this.id, required this.name, required this.type, required this.isRequired, required this.source});
  factory _EffectiveChecklistTemplateDto.fromJson(Map<String, dynamic> json) => _$EffectiveChecklistTemplateDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  bool isRequired;
@override final  String source;

/// Create a copy of EffectiveChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EffectiveChecklistTemplateDtoCopyWith<_EffectiveChecklistTemplateDto> get copyWith => __$EffectiveChecklistTemplateDtoCopyWithImpl<_EffectiveChecklistTemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EffectiveChecklistTemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectiveChecklistTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,source);

@override
String toString() {
  return 'EffectiveChecklistTemplateDto(id: $id, name: $name, type: $type, isRequired: $isRequired, source: $source)';
}


}

/// @nodoc
abstract mixin class _$EffectiveChecklistTemplateDtoCopyWith<$Res> implements $EffectiveChecklistTemplateDtoCopyWith<$Res> {
  factory _$EffectiveChecklistTemplateDtoCopyWith(_EffectiveChecklistTemplateDto value, $Res Function(_EffectiveChecklistTemplateDto) _then) = __$EffectiveChecklistTemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, bool isRequired, String source
});




}
/// @nodoc
class __$EffectiveChecklistTemplateDtoCopyWithImpl<$Res>
    implements _$EffectiveChecklistTemplateDtoCopyWith<$Res> {
  __$EffectiveChecklistTemplateDtoCopyWithImpl(this._self, this._then);

  final _EffectiveChecklistTemplateDto _self;
  final $Res Function(_EffectiveChecklistTemplateDto) _then;

/// Create a copy of EffectiveChecklistTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? source = null,}) {
  return _then(_EffectiveChecklistTemplateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
