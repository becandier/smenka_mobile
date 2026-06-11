// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResultDto {

 String get userId; String get message;
/// Create a copy of RegisterResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResultDtoCopyWith<RegisterResultDto> get copyWith => _$RegisterResultDtoCopyWithImpl<RegisterResultDto>(this as RegisterResultDto, _$identity);

  /// Serializes this RegisterResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResultDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,message);

@override
String toString() {
  return 'RegisterResultDto(userId: $userId, message: $message)';
}


}

/// @nodoc
abstract mixin class $RegisterResultDtoCopyWith<$Res>  {
  factory $RegisterResultDtoCopyWith(RegisterResultDto value, $Res Function(RegisterResultDto) _then) = _$RegisterResultDtoCopyWithImpl;
@useResult
$Res call({
 String userId, String message
});




}
/// @nodoc
class _$RegisterResultDtoCopyWithImpl<$Res>
    implements $RegisterResultDtoCopyWith<$Res> {
  _$RegisterResultDtoCopyWithImpl(this._self, this._then);

  final RegisterResultDto _self;
  final $Res Function(RegisterResultDto) _then;

/// Create a copy of RegisterResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? message = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterResultDto].
extension RegisterResultDtoPatterns on RegisterResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResultDto value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResultDto() when $default != null:
return $default(_that.userId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String message)  $default,) {final _that = this;
switch (_that) {
case _RegisterResultDto():
return $default(_that.userId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String message)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResultDto() when $default != null:
return $default(_that.userId,_that.message);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RegisterResultDto implements RegisterResultDto {
  const _RegisterResultDto({required this.userId, required this.message});
  factory _RegisterResultDto.fromJson(Map<String, dynamic> json) => _$RegisterResultDtoFromJson(json);

@override final  String userId;
@override final  String message;

/// Create a copy of RegisterResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResultDtoCopyWith<_RegisterResultDto> get copyWith => __$RegisterResultDtoCopyWithImpl<_RegisterResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResultDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,message);

@override
String toString() {
  return 'RegisterResultDto(userId: $userId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RegisterResultDtoCopyWith<$Res> implements $RegisterResultDtoCopyWith<$Res> {
  factory _$RegisterResultDtoCopyWith(_RegisterResultDto value, $Res Function(_RegisterResultDto) _then) = __$RegisterResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, String message
});




}
/// @nodoc
class __$RegisterResultDtoCopyWithImpl<$Res>
    implements _$RegisterResultDtoCopyWith<$Res> {
  __$RegisterResultDtoCopyWithImpl(this._self, this._then);

  final _RegisterResultDto _self;
  final $Res Function(_RegisterResultDto) _then;

/// Create a copy of RegisterResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? message = null,}) {
  return _then(_RegisterResultDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
