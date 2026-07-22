// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overtime_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OvertimeRequestState {

 FeatureStatus get submitStatus; String? get submitError; String? get submitErrorCode;
/// Create a copy of OvertimeRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OvertimeRequestStateCopyWith<OvertimeRequestState> get copyWith => _$OvertimeRequestStateCopyWithImpl<OvertimeRequestState>(this as OvertimeRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OvertimeRequestState&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,submitStatus,submitError,submitErrorCode);

@override
String toString() {
  return 'OvertimeRequestState(submitStatus: $submitStatus, submitError: $submitError, submitErrorCode: $submitErrorCode)';
}


}

/// @nodoc
abstract mixin class $OvertimeRequestStateCopyWith<$Res>  {
  factory $OvertimeRequestStateCopyWith(OvertimeRequestState value, $Res Function(OvertimeRequestState) _then) = _$OvertimeRequestStateCopyWithImpl;
@useResult
$Res call({
 FeatureStatus submitStatus, String? submitError, String? submitErrorCode
});




}
/// @nodoc
class _$OvertimeRequestStateCopyWithImpl<$Res>
    implements $OvertimeRequestStateCopyWith<$Res> {
  _$OvertimeRequestStateCopyWithImpl(this._self, this._then);

  final OvertimeRequestState _self;
  final $Res Function(OvertimeRequestState) _then;

/// Create a copy of OvertimeRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submitStatus = null,Object? submitError = freezed,Object? submitErrorCode = freezed,}) {
  return _then(_self.copyWith(
submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OvertimeRequestState].
extension OvertimeRequestStatePatterns on OvertimeRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OvertimeRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OvertimeRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OvertimeRequestState value)  $default,){
final _that = this;
switch (_that) {
case _OvertimeRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OvertimeRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _OvertimeRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FeatureStatus submitStatus,  String? submitError,  String? submitErrorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OvertimeRequestState() when $default != null:
return $default(_that.submitStatus,_that.submitError,_that.submitErrorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FeatureStatus submitStatus,  String? submitError,  String? submitErrorCode)  $default,) {final _that = this;
switch (_that) {
case _OvertimeRequestState():
return $default(_that.submitStatus,_that.submitError,_that.submitErrorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FeatureStatus submitStatus,  String? submitError,  String? submitErrorCode)?  $default,) {final _that = this;
switch (_that) {
case _OvertimeRequestState() when $default != null:
return $default(_that.submitStatus,_that.submitError,_that.submitErrorCode);case _:
  return null;

}
}

}

/// @nodoc


class _OvertimeRequestState extends OvertimeRequestState {
  const _OvertimeRequestState({this.submitStatus = FeatureStatus.initial, this.submitError, this.submitErrorCode}): super._();
  

@override@JsonKey() final  FeatureStatus submitStatus;
@override final  String? submitError;
@override final  String? submitErrorCode;

/// Create a copy of OvertimeRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OvertimeRequestStateCopyWith<_OvertimeRequestState> get copyWith => __$OvertimeRequestStateCopyWithImpl<_OvertimeRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OvertimeRequestState&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,submitStatus,submitError,submitErrorCode);

@override
String toString() {
  return 'OvertimeRequestState(submitStatus: $submitStatus, submitError: $submitError, submitErrorCode: $submitErrorCode)';
}


}

/// @nodoc
abstract mixin class _$OvertimeRequestStateCopyWith<$Res> implements $OvertimeRequestStateCopyWith<$Res> {
  factory _$OvertimeRequestStateCopyWith(_OvertimeRequestState value, $Res Function(_OvertimeRequestState) _then) = __$OvertimeRequestStateCopyWithImpl;
@override @useResult
$Res call({
 FeatureStatus submitStatus, String? submitError, String? submitErrorCode
});




}
/// @nodoc
class __$OvertimeRequestStateCopyWithImpl<$Res>
    implements _$OvertimeRequestStateCopyWith<$Res> {
  __$OvertimeRequestStateCopyWithImpl(this._self, this._then);

  final _OvertimeRequestState _self;
  final $Res Function(_OvertimeRequestState) _then;

/// Create a copy of OvertimeRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submitStatus = null,Object? submitError = freezed,Object? submitErrorCode = freezed,}) {
  return _then(_OvertimeRequestState(
submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
