// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiException {

 String get message; String? get code; dynamic get data;
/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiExceptionCopyWith<ApiException> get copyWith => _$ApiExceptionCopyWithImpl<ApiException>(this as ApiException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiException(message: $message, code: $code, data: $data)';
}


}

/// @nodoc
abstract mixin class $ApiExceptionCopyWith<$Res>  {
  factory $ApiExceptionCopyWith(ApiException value, $Res Function(ApiException) _then) = _$ApiExceptionCopyWithImpl;
@useResult
$Res call({
 String message, String? code, dynamic data
});




}
/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._self, this._then);

  final ApiException _self;
  final $Res Function(ApiException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? code = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiException].
extension ApiExceptionPatterns on ApiException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerException value)?  server,TResult Function( NetworkException value)?  network,TResult Function( UnauthorizedException value)?  unauthorized,TResult Function( ValidationException value)?  validation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that);case NetworkException() when network != null:
return network(_that);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that);case ValidationException() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerException value)  server,required TResult Function( NetworkException value)  network,required TResult Function( UnauthorizedException value)  unauthorized,required TResult Function( ValidationException value)  validation,}){
final _that = this;
switch (_that) {
case ServerException():
return server(_that);case NetworkException():
return network(_that);case UnauthorizedException():
return unauthorized(_that);case ValidationException():
return validation(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerException value)?  server,TResult? Function( NetworkException value)?  network,TResult? Function( UnauthorizedException value)?  unauthorized,TResult? Function( ValidationException value)?  validation,}){
final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that);case NetworkException() when network != null:
return network(_that);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that);case ValidationException() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? code,  dynamic data)?  server,TResult Function( String message,  String? code,  dynamic data)?  network,TResult Function( String message,  String? code,  dynamic data)?  unauthorized,TResult Function( String message,  Map<String, String?> errors,  String? code,  dynamic data)?  validation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that.message,_that.code,_that.data);case NetworkException() when network != null:
return network(_that.message,_that.code,_that.data);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that.message,_that.code,_that.data);case ValidationException() when validation != null:
return validation(_that.message,_that.errors,_that.code,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? code,  dynamic data)  server,required TResult Function( String message,  String? code,  dynamic data)  network,required TResult Function( String message,  String? code,  dynamic data)  unauthorized,required TResult Function( String message,  Map<String, String?> errors,  String? code,  dynamic data)  validation,}) {final _that = this;
switch (_that) {
case ServerException():
return server(_that.message,_that.code,_that.data);case NetworkException():
return network(_that.message,_that.code,_that.data);case UnauthorizedException():
return unauthorized(_that.message,_that.code,_that.data);case ValidationException():
return validation(_that.message,_that.errors,_that.code,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? code,  dynamic data)?  server,TResult? Function( String message,  String? code,  dynamic data)?  network,TResult? Function( String message,  String? code,  dynamic data)?  unauthorized,TResult? Function( String message,  Map<String, String?> errors,  String? code,  dynamic data)?  validation,}) {final _that = this;
switch (_that) {
case ServerException() when server != null:
return server(_that.message,_that.code,_that.data);case NetworkException() when network != null:
return network(_that.message,_that.code,_that.data);case UnauthorizedException() when unauthorized != null:
return unauthorized(_that.message,_that.code,_that.data);case ValidationException() when validation != null:
return validation(_that.message,_that.errors,_that.code,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class ServerException implements ApiException {
  const ServerException({required this.message, this.code, this.data});
  

@override final  String message;
@override final  String? code;
@override final  dynamic data;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerExceptionCopyWith<ServerException> get copyWith => _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiException.server(message: $message, code: $code, data: $data)';
}


}

/// @nodoc
abstract mixin class $ServerExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory $ServerExceptionCopyWith(ServerException value, $Res Function(ServerException) _then) = _$ServerExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, String? code, dynamic data
});




}
/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(this._self, this._then);

  final ServerException _self;
  final $Res Function(ServerException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,Object? data = freezed,}) {
  return _then(ServerException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class NetworkException implements ApiException {
  const NetworkException({required this.message, this.code, this.data});
  

@override final  String message;
@override final  String? code;
@override final  dynamic data;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiException.network(message: $message, code: $code, data: $data)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, String? code, dynamic data
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,Object? data = freezed,}) {
  return _then(NetworkException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class UnauthorizedException implements ApiException {
  const UnauthorizedException({required this.message, this.code, this.data});
  

@override final  String message;
@override final  String? code;
@override final  dynamic data;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedExceptionCopyWith<UnauthorizedException> get copyWith => _$UnauthorizedExceptionCopyWithImpl<UnauthorizedException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedException&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,code,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiException.unauthorized(message: $message, code: $code, data: $data)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory $UnauthorizedExceptionCopyWith(UnauthorizedException value, $Res Function(UnauthorizedException) _then) = _$UnauthorizedExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, String? code, dynamic data
});




}
/// @nodoc
class _$UnauthorizedExceptionCopyWithImpl<$Res>
    implements $UnauthorizedExceptionCopyWith<$Res> {
  _$UnauthorizedExceptionCopyWithImpl(this._self, this._then);

  final UnauthorizedException _self;
  final $Res Function(UnauthorizedException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? code = freezed,Object? data = freezed,}) {
  return _then(UnauthorizedException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ValidationException implements ApiException {
  const ValidationException({required this.message, required final  Map<String, String?> errors, this.code, this.data}): _errors = errors;
  

@override final  String message;
 final  Map<String, String?> _errors;
 Map<String, String?> get errors {
  if (_errors is EqualUnmodifiableMapView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_errors);
}

@override final  String? code;
@override final  dynamic data;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationExceptionCopyWith<ValidationException> get copyWith => _$ValidationExceptionCopyWithImpl<ValidationException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationException&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._errors, _errors)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_errors),code,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiException.validation(message: $message, errors: $errors, code: $code, data: $data)';
}


}

/// @nodoc
abstract mixin class $ValidationExceptionCopyWith<$Res> implements $ApiExceptionCopyWith<$Res> {
  factory $ValidationExceptionCopyWith(ValidationException value, $Res Function(ValidationException) _then) = _$ValidationExceptionCopyWithImpl;
@override @useResult
$Res call({
 String message, Map<String, String?> errors, String? code, dynamic data
});




}
/// @nodoc
class _$ValidationExceptionCopyWithImpl<$Res>
    implements $ValidationExceptionCopyWith<$Res> {
  _$ValidationExceptionCopyWithImpl(this._self, this._then);

  final ValidationException _self;
  final $Res Function(ValidationException) _then;

/// Create a copy of ApiException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? errors = null,Object? code = freezed,Object? data = freezed,}) {
  return _then(ValidationException(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
