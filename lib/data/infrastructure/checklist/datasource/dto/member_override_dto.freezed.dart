// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_override_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberOverrideItemDto {

 String get templateId; String get templateName; String get templateType; String get type;
/// Create a copy of MemberOverrideItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberOverrideItemDtoCopyWith<MemberOverrideItemDto> get copyWith => _$MemberOverrideItemDtoCopyWithImpl<MemberOverrideItemDto>(this as MemberOverrideItemDto, _$identity);

  /// Serializes this MemberOverrideItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberOverrideItemDto&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&(identical(other.templateType, templateType) || other.templateType == templateType)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,templateId,templateName,templateType,type);

@override
String toString() {
  return 'MemberOverrideItemDto(templateId: $templateId, templateName: $templateName, templateType: $templateType, type: $type)';
}


}

/// @nodoc
abstract mixin class $MemberOverrideItemDtoCopyWith<$Res>  {
  factory $MemberOverrideItemDtoCopyWith(MemberOverrideItemDto value, $Res Function(MemberOverrideItemDto) _then) = _$MemberOverrideItemDtoCopyWithImpl;
@useResult
$Res call({
 String templateId, String templateName, String templateType, String type
});




}
/// @nodoc
class _$MemberOverrideItemDtoCopyWithImpl<$Res>
    implements $MemberOverrideItemDtoCopyWith<$Res> {
  _$MemberOverrideItemDtoCopyWithImpl(this._self, this._then);

  final MemberOverrideItemDto _self;
  final $Res Function(MemberOverrideItemDto) _then;

/// Create a copy of MemberOverrideItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templateId = null,Object? templateName = null,Object? templateType = null,Object? type = null,}) {
  return _then(_self.copyWith(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,templateName: null == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String,templateType: null == templateType ? _self.templateType : templateType // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberOverrideItemDto].
extension MemberOverrideItemDtoPatterns on MemberOverrideItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberOverrideItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberOverrideItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberOverrideItemDto value)  $default,){
final _that = this;
switch (_that) {
case _MemberOverrideItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberOverrideItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _MemberOverrideItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String templateId,  String templateName,  String templateType,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberOverrideItemDto() when $default != null:
return $default(_that.templateId,_that.templateName,_that.templateType,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String templateId,  String templateName,  String templateType,  String type)  $default,) {final _that = this;
switch (_that) {
case _MemberOverrideItemDto():
return $default(_that.templateId,_that.templateName,_that.templateType,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String templateId,  String templateName,  String templateType,  String type)?  $default,) {final _that = this;
switch (_that) {
case _MemberOverrideItemDto() when $default != null:
return $default(_that.templateId,_that.templateName,_that.templateType,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MemberOverrideItemDto implements MemberOverrideItemDto {
  const _MemberOverrideItemDto({required this.templateId, required this.templateName, required this.templateType, required this.type});
  factory _MemberOverrideItemDto.fromJson(Map<String, dynamic> json) => _$MemberOverrideItemDtoFromJson(json);

@override final  String templateId;
@override final  String templateName;
@override final  String templateType;
@override final  String type;

/// Create a copy of MemberOverrideItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberOverrideItemDtoCopyWith<_MemberOverrideItemDto> get copyWith => __$MemberOverrideItemDtoCopyWithImpl<_MemberOverrideItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberOverrideItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberOverrideItemDto&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.templateName, templateName) || other.templateName == templateName)&&(identical(other.templateType, templateType) || other.templateType == templateType)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,templateId,templateName,templateType,type);

@override
String toString() {
  return 'MemberOverrideItemDto(templateId: $templateId, templateName: $templateName, templateType: $templateType, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MemberOverrideItemDtoCopyWith<$Res> implements $MemberOverrideItemDtoCopyWith<$Res> {
  factory _$MemberOverrideItemDtoCopyWith(_MemberOverrideItemDto value, $Res Function(_MemberOverrideItemDto) _then) = __$MemberOverrideItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String templateId, String templateName, String templateType, String type
});




}
/// @nodoc
class __$MemberOverrideItemDtoCopyWithImpl<$Res>
    implements _$MemberOverrideItemDtoCopyWith<$Res> {
  __$MemberOverrideItemDtoCopyWithImpl(this._self, this._then);

  final _MemberOverrideItemDto _self;
  final $Res Function(_MemberOverrideItemDto) _then;

/// Create a copy of MemberOverrideItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templateId = null,Object? templateName = null,Object? templateType = null,Object? type = null,}) {
  return _then(_MemberOverrideItemDto(
templateId: null == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String,templateName: null == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String,templateType: null == templateType ? _self.templateType : templateType // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
