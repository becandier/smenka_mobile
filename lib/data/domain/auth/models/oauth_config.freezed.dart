// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OAuthConfig {

 OAuthProviderConfig? get google; OAuthProviderConfig? get apple;
/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuthConfigCopyWith<OAuthConfig> get copyWith => _$OAuthConfigCopyWithImpl<OAuthConfig>(this as OAuthConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuthConfig&&(identical(other.google, google) || other.google == google)&&(identical(other.apple, apple) || other.apple == apple));
}


@override
int get hashCode => Object.hash(runtimeType,google,apple);

@override
String toString() {
  return 'OAuthConfig(google: $google, apple: $apple)';
}


}

/// @nodoc
abstract mixin class $OAuthConfigCopyWith<$Res>  {
  factory $OAuthConfigCopyWith(OAuthConfig value, $Res Function(OAuthConfig) _then) = _$OAuthConfigCopyWithImpl;
@useResult
$Res call({
 OAuthProviderConfig? google, OAuthProviderConfig? apple
});


$OAuthProviderConfigCopyWith<$Res>? get google;$OAuthProviderConfigCopyWith<$Res>? get apple;

}
/// @nodoc
class _$OAuthConfigCopyWithImpl<$Res>
    implements $OAuthConfigCopyWith<$Res> {
  _$OAuthConfigCopyWithImpl(this._self, this._then);

  final OAuthConfig _self;
  final $Res Function(OAuthConfig) _then;

/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? google = freezed,Object? apple = freezed,}) {
  return _then(_self.copyWith(
google: freezed == google ? _self.google : google // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfig?,apple: freezed == apple ? _self.apple : apple // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfig?,
  ));
}
/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigCopyWith<$Res>? get google {
    if (_self.google == null) {
    return null;
  }

  return $OAuthProviderConfigCopyWith<$Res>(_self.google!, (value) {
    return _then(_self.copyWith(google: value));
  });
}/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigCopyWith<$Res>? get apple {
    if (_self.apple == null) {
    return null;
  }

  return $OAuthProviderConfigCopyWith<$Res>(_self.apple!, (value) {
    return _then(_self.copyWith(apple: value));
  });
}
}


/// Adds pattern-matching-related methods to [OAuthConfig].
extension OAuthConfigPatterns on OAuthConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OAuthConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OAuthConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OAuthConfig value)  $default,){
final _that = this;
switch (_that) {
case _OAuthConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OAuthConfig value)?  $default,){
final _that = this;
switch (_that) {
case _OAuthConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OAuthProviderConfig? google,  OAuthProviderConfig? apple)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OAuthConfig() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OAuthProviderConfig? google,  OAuthProviderConfig? apple)  $default,) {final _that = this;
switch (_that) {
case _OAuthConfig():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OAuthProviderConfig? google,  OAuthProviderConfig? apple)?  $default,) {final _that = this;
switch (_that) {
case _OAuthConfig() when $default != null:
return $default(_that.google,_that.apple);case _:
  return null;

}
}

}

/// @nodoc


class _OAuthConfig implements OAuthConfig {
  const _OAuthConfig({this.google, this.apple});
  

@override final  OAuthProviderConfig? google;
@override final  OAuthProviderConfig? apple;

/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OAuthConfigCopyWith<_OAuthConfig> get copyWith => __$OAuthConfigCopyWithImpl<_OAuthConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OAuthConfig&&(identical(other.google, google) || other.google == google)&&(identical(other.apple, apple) || other.apple == apple));
}


@override
int get hashCode => Object.hash(runtimeType,google,apple);

@override
String toString() {
  return 'OAuthConfig(google: $google, apple: $apple)';
}


}

/// @nodoc
abstract mixin class _$OAuthConfigCopyWith<$Res> implements $OAuthConfigCopyWith<$Res> {
  factory _$OAuthConfigCopyWith(_OAuthConfig value, $Res Function(_OAuthConfig) _then) = __$OAuthConfigCopyWithImpl;
@override @useResult
$Res call({
 OAuthProviderConfig? google, OAuthProviderConfig? apple
});


@override $OAuthProviderConfigCopyWith<$Res>? get google;@override $OAuthProviderConfigCopyWith<$Res>? get apple;

}
/// @nodoc
class __$OAuthConfigCopyWithImpl<$Res>
    implements _$OAuthConfigCopyWith<$Res> {
  __$OAuthConfigCopyWithImpl(this._self, this._then);

  final _OAuthConfig _self;
  final $Res Function(_OAuthConfig) _then;

/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? google = freezed,Object? apple = freezed,}) {
  return _then(_OAuthConfig(
google: freezed == google ? _self.google : google // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfig?,apple: freezed == apple ? _self.apple : apple // ignore: cast_nullable_to_non_nullable
as OAuthProviderConfig?,
  ));
}

/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigCopyWith<$Res>? get google {
    if (_self.google == null) {
    return null;
  }

  return $OAuthProviderConfigCopyWith<$Res>(_self.google!, (value) {
    return _then(_self.copyWith(google: value));
  });
}/// Create a copy of OAuthConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OAuthProviderConfigCopyWith<$Res>? get apple {
    if (_self.apple == null) {
    return null;
  }

  return $OAuthProviderConfigCopyWith<$Res>(_self.apple!, (value) {
    return _then(_self.copyWith(apple: value));
  });
}
}

/// @nodoc
mixin _$OAuthProviderConfig {

 String get clientId; bool get enabled;
/// Create a copy of OAuthProviderConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuthProviderConfigCopyWith<OAuthProviderConfig> get copyWith => _$OAuthProviderConfigCopyWithImpl<OAuthProviderConfig>(this as OAuthProviderConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuthProviderConfig&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,enabled);

@override
String toString() {
  return 'OAuthProviderConfig(clientId: $clientId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $OAuthProviderConfigCopyWith<$Res>  {
  factory $OAuthProviderConfigCopyWith(OAuthProviderConfig value, $Res Function(OAuthProviderConfig) _then) = _$OAuthProviderConfigCopyWithImpl;
@useResult
$Res call({
 String clientId, bool enabled
});




}
/// @nodoc
class _$OAuthProviderConfigCopyWithImpl<$Res>
    implements $OAuthProviderConfigCopyWith<$Res> {
  _$OAuthProviderConfigCopyWithImpl(this._self, this._then);

  final OAuthProviderConfig _self;
  final $Res Function(OAuthProviderConfig) _then;

/// Create a copy of OAuthProviderConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OAuthProviderConfig].
extension OAuthProviderConfigPatterns on OAuthProviderConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OAuthProviderConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OAuthProviderConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OAuthProviderConfig value)  $default,){
final _that = this;
switch (_that) {
case _OAuthProviderConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OAuthProviderConfig value)?  $default,){
final _that = this;
switch (_that) {
case _OAuthProviderConfig() when $default != null:
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
case _OAuthProviderConfig() when $default != null:
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
case _OAuthProviderConfig():
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
case _OAuthProviderConfig() when $default != null:
return $default(_that.clientId,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _OAuthProviderConfig implements OAuthProviderConfig {
  const _OAuthProviderConfig({required this.clientId, required this.enabled});
  

@override final  String clientId;
@override final  bool enabled;

/// Create a copy of OAuthProviderConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OAuthProviderConfigCopyWith<_OAuthProviderConfig> get copyWith => __$OAuthProviderConfigCopyWithImpl<_OAuthProviderConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OAuthProviderConfig&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,enabled);

@override
String toString() {
  return 'OAuthProviderConfig(clientId: $clientId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$OAuthProviderConfigCopyWith<$Res> implements $OAuthProviderConfigCopyWith<$Res> {
  factory _$OAuthProviderConfigCopyWith(_OAuthProviderConfig value, $Res Function(_OAuthProviderConfig) _then) = __$OAuthProviderConfigCopyWithImpl;
@override @useResult
$Res call({
 String clientId, bool enabled
});




}
/// @nodoc
class __$OAuthProviderConfigCopyWithImpl<$Res>
    implements _$OAuthProviderConfigCopyWith<$Res> {
  __$OAuthProviderConfigCopyWithImpl(this._self, this._then);

  final _OAuthProviderConfig _self;
  final $Res Function(_OAuthProviderConfig) _then;

/// Create a copy of OAuthProviderConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? enabled = null,}) {
  return _then(_OAuthProviderConfig(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
