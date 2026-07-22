// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftDetailState {

 Shift get shift;/// Организация смены — грузится лениво, только если у смены есть график
/// (нужна для таймзоны планового времени). Персональная смена и смена
/// без графика её не запрашивают.
 SectionData<Organization> get organization;/// Статус действия с заявкой на переработку (подача/отмена) — transient.
 FeatureStatus get actionStatus; String? get actionError; String? get actionErrorCode;
/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftDetailStateCopyWith<ShiftDetailState> get copyWith => _$ShiftDetailStateCopyWithImpl<ShiftDetailState>(this as ShiftDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftDetailState&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.actionErrorCode, actionErrorCode) || other.actionErrorCode == actionErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,shift,organization,actionStatus,actionError,actionErrorCode);

@override
String toString() {
  return 'ShiftDetailState(shift: $shift, organization: $organization, actionStatus: $actionStatus, actionError: $actionError, actionErrorCode: $actionErrorCode)';
}


}

/// @nodoc
abstract mixin class $ShiftDetailStateCopyWith<$Res>  {
  factory $ShiftDetailStateCopyWith(ShiftDetailState value, $Res Function(ShiftDetailState) _then) = _$ShiftDetailStateCopyWithImpl;
@useResult
$Res call({
 Shift shift, SectionData<Organization> organization, FeatureStatus actionStatus, String? actionError, String? actionErrorCode
});


$ShiftCopyWith<$Res> get shift;$SectionDataCopyWith<Organization, $Res> get organization;

}
/// @nodoc
class _$ShiftDetailStateCopyWithImpl<$Res>
    implements $ShiftDetailStateCopyWith<$Res> {
  _$ShiftDetailStateCopyWithImpl(this._self, this._then);

  final ShiftDetailState _self;
  final $Res Function(ShiftDetailState) _then;

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shift = null,Object? organization = null,Object? actionStatus = null,Object? actionError = freezed,Object? actionErrorCode = freezed,}) {
  return _then(_self.copyWith(
shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as SectionData<Organization>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,actionErrorCode: freezed == actionErrorCode ? _self.actionErrorCode : actionErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res> get shift {
  
  return $ShiftCopyWith<$Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Organization, $Res> get organization {
  
  return $SectionDataCopyWith<Organization, $Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftDetailState].
extension ShiftDetailStatePatterns on ShiftDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Shift shift,  SectionData<Organization> organization,  FeatureStatus actionStatus,  String? actionError,  String? actionErrorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
return $default(_that.shift,_that.organization,_that.actionStatus,_that.actionError,_that.actionErrorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Shift shift,  SectionData<Organization> organization,  FeatureStatus actionStatus,  String? actionError,  String? actionErrorCode)  $default,) {final _that = this;
switch (_that) {
case _ShiftDetailState():
return $default(_that.shift,_that.organization,_that.actionStatus,_that.actionError,_that.actionErrorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Shift shift,  SectionData<Organization> organization,  FeatureStatus actionStatus,  String? actionError,  String? actionErrorCode)?  $default,) {final _that = this;
switch (_that) {
case _ShiftDetailState() when $default != null:
return $default(_that.shift,_that.organization,_that.actionStatus,_that.actionError,_that.actionErrorCode);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftDetailState extends ShiftDetailState {
  const _ShiftDetailState({required this.shift, this.organization = const SectionData<Organization>(), this.actionStatus = FeatureStatus.initial, this.actionError, this.actionErrorCode}): super._();
  

@override final  Shift shift;
/// Организация смены — грузится лениво, только если у смены есть график
/// (нужна для таймзоны планового времени). Персональная смена и смена
/// без графика её не запрашивают.
@override@JsonKey() final  SectionData<Organization> organization;
/// Статус действия с заявкой на переработку (подача/отмена) — transient.
@override@JsonKey() final  FeatureStatus actionStatus;
@override final  String? actionError;
@override final  String? actionErrorCode;

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftDetailStateCopyWith<_ShiftDetailState> get copyWith => __$ShiftDetailStateCopyWithImpl<_ShiftDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftDetailState&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.actionStatus, actionStatus) || other.actionStatus == actionStatus)&&(identical(other.actionError, actionError) || other.actionError == actionError)&&(identical(other.actionErrorCode, actionErrorCode) || other.actionErrorCode == actionErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,shift,organization,actionStatus,actionError,actionErrorCode);

@override
String toString() {
  return 'ShiftDetailState(shift: $shift, organization: $organization, actionStatus: $actionStatus, actionError: $actionError, actionErrorCode: $actionErrorCode)';
}


}

/// @nodoc
abstract mixin class _$ShiftDetailStateCopyWith<$Res> implements $ShiftDetailStateCopyWith<$Res> {
  factory _$ShiftDetailStateCopyWith(_ShiftDetailState value, $Res Function(_ShiftDetailState) _then) = __$ShiftDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Shift shift, SectionData<Organization> organization, FeatureStatus actionStatus, String? actionError, String? actionErrorCode
});


@override $ShiftCopyWith<$Res> get shift;@override $SectionDataCopyWith<Organization, $Res> get organization;

}
/// @nodoc
class __$ShiftDetailStateCopyWithImpl<$Res>
    implements _$ShiftDetailStateCopyWith<$Res> {
  __$ShiftDetailStateCopyWithImpl(this._self, this._then);

  final _ShiftDetailState _self;
  final $Res Function(_ShiftDetailState) _then;

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shift = null,Object? organization = null,Object? actionStatus = null,Object? actionError = freezed,Object? actionErrorCode = freezed,}) {
  return _then(_ShiftDetailState(
shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as SectionData<Organization>,actionStatus: null == actionStatus ? _self.actionStatus : actionStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,actionError: freezed == actionError ? _self.actionError : actionError // ignore: cast_nullable_to_non_nullable
as String?,actionErrorCode: freezed == actionErrorCode ? _self.actionErrorCode : actionErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res> get shift {
  
  return $ShiftCopyWith<$Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}/// Create a copy of ShiftDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Organization, $Res> get organization {
  
  return $SectionDataCopyWith<Organization, $Res>(_self.organization, (value) {
    return _then(_self.copyWith(organization: value));
  });
}
}

// dart format on
