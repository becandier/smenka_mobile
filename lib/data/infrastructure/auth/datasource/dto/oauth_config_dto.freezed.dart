// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OAuthConfigDto {

 OAuthProviderConfigDto? get google; OAuthProviderConfigDto? get apple;
/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuthConfigDtoCopyWith<OAuthConfigDto> get copyWith => _$OAuthConfigDtoCopyWithImpl<OAuthConfigDto>(this as OAuthConfigDto, _$identity);

  /// Serializes this OAuthConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuthConfigDto&&(identical(other.google, google) || other.google == google)&&(identical(other.apple, apple) || other.apple == apple));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,google,apple);

@override
String toString() {
  return 'OAuthConfigDto(google: $google, apple: $apple)';
}


}

/// @nodoc
abstract mixin class $OAuthConfigDtoCopyWith<$Res>  {
  factory $OAuthConfigDtoCopyWith(OAuthConfigDto value, $Res Function(OAuthConfigDto) _then) = _$OAuthConfigDtoCopyWithImpl;
@useResult
$Res call({
 OAuthProviderConfigDto? google, OAuthProviderConfigDto? apple
});


$OAuthProviderConfigDtoCopyWith<$Res>? get google;$OAuthProviderConfigDtoCopyWith<$Res>? get apple;

}
/// @nodoc
class _$OAuthConfigDtoCopyWithImpl<$Res>
    implements $OAuthConfigDtoCopyWith<$Res> {
  _$OAuthConfigDtoCopyWithImpl(this._self, this._then);

  final OAuthConfigDto _self;
  final $Res Function(OAuthConfigDto) _then;

/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? google = freezed,Object? apple = freezed,}) {
  return _then(_self.copyWith(
google: freezed == google ? _self.google : google // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfigDto?,apple: freezed == apple ? _self.apple : apple // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfigDto?,
  ));
}
/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigDtoCopyWith<$Res>? get google {
    if (_self.google == null) {
    return null;
  }

  return $OAuthProviderConfigDtoCopyWith<$Res>(_self.google!, (value) {
    return _then(_self.copyWith(google: value));
  });
}/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigDtoCopyWith<$Res>? get apple {
    if (_self.apple == null) {
    return null;
  }

  return $OAuthProviderConfigDtoCopyWith<$Res>(_self.apple!, (value) {
    return _then(_self.copyWith(apple: value));
  });
}
}


/// Adds pattern-matching-related methods to [OAuthConfigDto].
extension OAuthConfigDtoPatterns on OAuthConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OAuthConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OAuthConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OAuthConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _OAuthConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OAuthConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _OAuthConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OAuthProviderConfigDto? google,  OAuthProviderConfigDto? apple)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OAuthConfigDto() when $default != null:
return $default(_that.google,_that.apple);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OAuthProviderConfigDto? google,  OAuthProviderConfigDto? apple)  $default,) {final _that = this;
switch (_that) {
case _OAuthConfigDto():
return $default(_that.google,_that.apple);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OAuthProviderConfigDto? google,  OAuthProviderConfigDto? apple)?  $default,) {final _that = this;
switch (_that) {
case _OAuthConfigDto() when $default != null:
return $default(_that.google,_that.apple);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _OAuthConfigDto implements OAuthConfigDto {
  const _OAuthConfigDto({this.google, this.apple});
  factory _OAuthConfigDto.fromJson(Map<String, dynamic> json) => _$OAuthConfigDtoFromJson(json);

@override final  OAuthProviderConfigDto? google;
@override final  OAuthProviderConfigDto? apple;

/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OAuthConfigDtoCopyWith<_OAuthConfigDto> get copyWith => __$OAuthConfigDtoCopyWithImpl<_OAuthConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OAuthConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OAuthConfigDto&&(identical(other.google, google) || other.google == google)&&(identical(other.apple, apple) || other.apple == apple));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,google,apple);

@override
String toString() {
  return 'OAuthConfigDto(google: $google, apple: $apple)';
}


}

/// @nodoc
abstract mixin class _$OAuthConfigDtoCopyWith<$Res> implements $OAuthConfigDtoCopyWith<$Res> {
  factory _$OAuthConfigDtoCopyWith(_OAuthConfigDto value, $Res Function(_OAuthConfigDto) _then) = __$OAuthConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 OAuthProviderConfigDto? google, OAuthProviderConfigDto? apple
});


@override $OAuthProviderConfigDtoCopyWith<$Res>? get google;@override $OAuthProviderConfigDtoCopyWith<$Res>? get apple;

}
/// @nodoc
class __$OAuthConfigDtoCopyWithImpl<$Res>
    implements _$OAuthConfigDtoCopyWith<$Res> {
  __$OAuthConfigDtoCopyWithImpl(this._self, this._then);

  final _OAuthConfigDto _self;
  final $Res Function(_OAuthConfigDto) _then;

/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? google = freezed,Object? apple = freezed,}) {
  return _then(_OAuthConfigDto(
google: freezed == google ? _self.google : google // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfigDto?,apple: freezed == apple ? _self.apple : apple // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfigDto?,
  ));
}

/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigDtoCopyWith<$Res>? get google {
    if (_self.google == null) {
    return null;
  }

  return $OAuthProviderConfigDtoCopyWith<$Res>(_self.google!, (value) {
    return _then(_self.copyWith(google: value));
  });
}/// Create a copy of OAuthConfigDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigDtoCopyWith<$Res>? get apple {
    if (_self.apple == null) {
    return null;
  }

  return $OAuthProviderConfigDtoCopyWith<$Res>(_self.apple!, (value) {
    return _then(_self.copyWith(apple: value));
  });
}
}


/// @nodoc
mixin _$OAuthProviderConfigDto {

 String get clientId; bool get enabled;
/// Create a copy of OAuthProviderConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuthProviderConfigDtoCopyWith<OAuthProviderConfigDto> get copyWith => _$OAuthProviderConfigDtoCopyWithImpl<OAuthProviderConfigDto>(this as OAuthProviderConfigDto, _$identity);

  /// Serializes this OAuthProviderConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuthProviderConfigDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,enabled);

@override
String toString() {
  return 'OAuthProviderConfigDto(clientId: $clientId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $OAuthProviderConfigDtoCopyWith<$Res>  {
  factory $OAuthProviderConfigDtoCopyWith(OAuthProviderConfigDto value, $Res Function(OAuthProviderConfigDto) _then) = _$OAuthProviderConfigDtoCopyWithImpl;
@useResult
$Res call({
 String clientId, bool enabled
});




}
/// @nodoc
class _$OAuthProviderConfigDtoCopyWithImpl<$Res>
    implements $OAuthProviderConfigDtoCopyWith<$Res> {
  _$OAuthProviderConfigDtoCopyWithImpl(this._self, this._then);

  final OAuthProviderConfigDto _self;
  final $Res Function(OAuthProviderConfigDto) _then;

/// Create a copy of OAuthProviderConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OAuthProviderConfigDto].
extension OAuthProviderConfigDtoPatterns on OAuthProviderConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OAuthProviderConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OAuthProviderConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OAuthProviderConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _OAuthProviderConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OAuthProviderConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _OAuthProviderConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OAuthProviderConfigDto() when $default != null:
return $default(_that.clientId,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _OAuthProviderConfigDto():
return $default(_that.clientId,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _OAuthProviderConfigDto() when $default != null:
return $default(_that.clientId,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _OAuthProviderConfigDto implements OAuthProviderConfigDto {
  const _OAuthProviderConfigDto({required this.clientId, required this.enabled});
  factory _OAuthProviderConfigDto.fromJson(Map<String, dynamic> json) => _$OAuthProviderConfigDtoFromJson(json);

@override final  String clientId;
@override final  bool enabled;

/// Create a copy of OAuthProviderConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OAuthProviderConfigDtoCopyWith<_OAuthProviderConfigDto> get copyWith => __$OAuthProviderConfigDtoCopyWithImpl<_OAuthProviderConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OAuthProviderConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OAuthProviderConfigDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,enabled);

@override
String toString() {
  return 'OAuthProviderConfigDto(clientId: $clientId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$OAuthProviderConfigDtoCopyWith<$Res> implements $OAuthProviderConfigDtoCopyWith<$Res> {
  factory _$OAuthProviderConfigDtoCopyWith(_OAuthProviderConfigDto value, $Res Function(_OAuthProviderConfigDto) _then) = __$OAuthProviderConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 String clientId, bool enabled
});




}
/// @nodoc
class __$OAuthProviderConfigDtoCopyWithImpl<$Res>
    implements _$OAuthProviderConfigDtoCopyWith<$Res> {
  __$OAuthProviderConfigDtoCopyWithImpl(this._self, this._then);

  final _OAuthProviderConfigDto _self;
  final $Res Function(_OAuthProviderConfigDto) _then;

/// Create a copy of OAuthProviderConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? enabled = null,}) {
  return _then(_OAuthProviderConfigDto(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
