// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyState {

 String get email; String get code; FeatureStatus get status; int get cooldownSeconds; bool get isResending; String? get error;/// Машинный `error.code` последней ошибки (для маппинга 429)
 String? get errorCode;
/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyStateCopyWith<VerifyState> get copyWith => _$VerifyStateCopyWithImpl<VerifyState>(this as VerifyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyState&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,email,code,status,cooldownSeconds,isResending,error,errorCode);

@override
String toString() {
  return 'VerifyState(email: $email, code: $code, status: $status, cooldownSeconds: $cooldownSeconds, isResending: $isResending, error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $VerifyStateCopyWith<$Res>  {
  factory $VerifyStateCopyWith(VerifyState value, $Res Function(VerifyState) _then) = _$VerifyStateCopyWithImpl;
@useResult
$Res call({
 String email, String code, FeatureStatus status, int cooldownSeconds, bool isResending, String? error, String? errorCode
});




}
/// @nodoc
class _$VerifyStateCopyWithImpl<$Res>
    implements $VerifyStateCopyWith<$Res> {
  _$VerifyStateCopyWithImpl(this._self, this._then);

  final VerifyState _self;
  final $Res Function(VerifyState) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? code = null,Object? status = null,Object? cooldownSeconds = null,Object? isResending = null,Object? error = freezed,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyState].
extension VerifyStatePatterns on VerifyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String code,  FeatureStatus status,  int cooldownSeconds,  bool isResending,  String? error,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
return $default(_that.email,_that.code,_that.status,_that.cooldownSeconds,_that.isResending,_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String code,  FeatureStatus status,  int cooldownSeconds,  bool isResending,  String? error,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _VerifyState():
return $default(_that.email,_that.code,_that.status,_that.cooldownSeconds,_that.isResending,_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String code,  FeatureStatus status,  int cooldownSeconds,  bool isResending,  String? error,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _VerifyState() when $default != null:
return $default(_that.email,_that.code,_that.status,_that.cooldownSeconds,_that.isResending,_that.error,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyState extends VerifyState {
  const _VerifyState({required this.email, this.code = '', this.status = FeatureStatus.initial, this.cooldownSeconds = 0, this.isResending = false, this.error, this.errorCode}): super._();
  

@override final  String email;
@override@JsonKey() final  String code;
@override@JsonKey() final  FeatureStatus status;
@override@JsonKey() final  int cooldownSeconds;
@override@JsonKey() final  bool isResending;
@override final  String? error;
/// Машинный `error.code` последней ошибки (для маппинга 429)
@override final  String? errorCode;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyStateCopyWith<_VerifyState> get copyWith => __$VerifyStateCopyWithImpl<_VerifyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyState&&(identical(other.email, email) || other.email == email)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,email,code,status,cooldownSeconds,isResending,error,errorCode);

@override
String toString() {
  return 'VerifyState(email: $email, code: $code, status: $status, cooldownSeconds: $cooldownSeconds, isResending: $isResending, error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$VerifyStateCopyWith<$Res> implements $VerifyStateCopyWith<$Res> {
  factory _$VerifyStateCopyWith(_VerifyState value, $Res Function(_VerifyState) _then) = __$VerifyStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String code, FeatureStatus status, int cooldownSeconds, bool isResending, String? error, String? errorCode
});




}
/// @nodoc
class __$VerifyStateCopyWithImpl<$Res>
    implements _$VerifyStateCopyWith<$Res> {
  __$VerifyStateCopyWithImpl(this._self, this._then);

  final _VerifyState _self;
  final $Res Function(_VerifyState) _then;

/// Create a copy of VerifyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? code = null,Object? status = null,Object? cooldownSeconds = null,Object? isResending = null,Object? error = freezed,Object? errorCode = freezed,}) {
  return _then(_VerifyState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeatureStatus,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
