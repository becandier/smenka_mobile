// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'penalty_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PenaltyFormState {

/// Активные шаблоны для выбора (загружаются при открытии формы).
 SectionData<List<PenaltyTemplate>> get templates;/// Статус отправки формы (назначение/исправление).
 FeatureStatus get submitStatus; String? get submitErrorCode; String? get submitError;
/// Create a copy of PenaltyFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PenaltyFormStateCopyWith<PenaltyFormState> get copyWith => _$PenaltyFormStateCopyWithImpl<PenaltyFormState>(this as PenaltyFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PenaltyFormState&&(identical(other.templates, templates) || other.templates == templates)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode)&&(identical(other.submitError, submitError) || other.submitError == submitError));
}


@override
int get hashCode => Object.hash(runtimeType,templates,submitStatus,submitErrorCode,submitError);

@override
String toString() {
  return 'PenaltyFormState(templates: $templates, submitStatus: $submitStatus, submitErrorCode: $submitErrorCode, submitError: $submitError)';
}


}

/// @nodoc
abstract mixin class $PenaltyFormStateCopyWith<$Res>  {
  factory $PenaltyFormStateCopyWith(PenaltyFormState value, $Res Function(PenaltyFormState) _then) = _$PenaltyFormStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<PenaltyTemplate>> templates, FeatureStatus submitStatus, String? submitErrorCode, String? submitError
});


$SectionDataCopyWith<List<PenaltyTemplate>, $Res> get templates;

}
/// @nodoc
class _$PenaltyFormStateCopyWithImpl<$Res>
    implements $PenaltyFormStateCopyWith<$Res> {
  _$PenaltyFormStateCopyWithImpl(this._self, this._then);

  final PenaltyFormState _self;
  final $Res Function(PenaltyFormState) _then;

/// Create a copy of PenaltyFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? templates = null,Object? submitStatus = null,Object? submitErrorCode = freezed,Object? submitError = freezed,}) {
  return _then(_self.copyWith(
templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as SectionData<List<PenaltyTemplate>>,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PenaltyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<PenaltyTemplate>, $Res> get templates {
  
  return $SectionDataCopyWith<List<PenaltyTemplate>, $Res>(_self.templates, (value) {
    return _then(_self.copyWith(templates: value));
  });
}
}


/// Adds pattern-matching-related methods to [PenaltyFormState].
extension PenaltyFormStatePatterns on PenaltyFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PenaltyFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PenaltyFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PenaltyFormState value)  $default,){
final _that = this;
switch (_that) {
case _PenaltyFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PenaltyFormState value)?  $default,){
final _that = this;
switch (_that) {
case _PenaltyFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<PenaltyTemplate>> templates,  FeatureStatus submitStatus,  String? submitErrorCode,  String? submitError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PenaltyFormState() when $default != null:
return $default(_that.templates,_that.submitStatus,_that.submitErrorCode,_that.submitError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<PenaltyTemplate>> templates,  FeatureStatus submitStatus,  String? submitErrorCode,  String? submitError)  $default,) {final _that = this;
switch (_that) {
case _PenaltyFormState():
return $default(_that.templates,_that.submitStatus,_that.submitErrorCode,_that.submitError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<PenaltyTemplate>> templates,  FeatureStatus submitStatus,  String? submitErrorCode,  String? submitError)?  $default,) {final _that = this;
switch (_that) {
case _PenaltyFormState() when $default != null:
return $default(_that.templates,_that.submitStatus,_that.submitErrorCode,_that.submitError);case _:
  return null;

}
}

}

/// @nodoc


class _PenaltyFormState extends PenaltyFormState {
  const _PenaltyFormState({this.templates = const SectionData<List<PenaltyTemplate>>(), this.submitStatus = FeatureStatus.initial, this.submitErrorCode, this.submitError}): super._();
  

/// Активные шаблоны для выбора (загружаются при открытии формы).
@override@JsonKey() final  SectionData<List<PenaltyTemplate>> templates;
/// Статус отправки формы (назначение/исправление).
@override@JsonKey() final  FeatureStatus submitStatus;
@override final  String? submitErrorCode;
@override final  String? submitError;

/// Create a copy of PenaltyFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PenaltyFormStateCopyWith<_PenaltyFormState> get copyWith => __$PenaltyFormStateCopyWithImpl<_PenaltyFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PenaltyFormState&&(identical(other.templates, templates) || other.templates == templates)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.submitErrorCode, submitErrorCode) || other.submitErrorCode == submitErrorCode)&&(identical(other.submitError, submitError) || other.submitError == submitError));
}


@override
int get hashCode => Object.hash(runtimeType,templates,submitStatus,submitErrorCode,submitError);

@override
String toString() {
  return 'PenaltyFormState(templates: $templates, submitStatus: $submitStatus, submitErrorCode: $submitErrorCode, submitError: $submitError)';
}


}

/// @nodoc
abstract mixin class _$PenaltyFormStateCopyWith<$Res> implements $PenaltyFormStateCopyWith<$Res> {
  factory _$PenaltyFormStateCopyWith(_PenaltyFormState value, $Res Function(_PenaltyFormState) _then) = __$PenaltyFormStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<PenaltyTemplate>> templates, FeatureStatus submitStatus, String? submitErrorCode, String? submitError
});


@override $SectionDataCopyWith<List<PenaltyTemplate>, $Res> get templates;

}
/// @nodoc
class __$PenaltyFormStateCopyWithImpl<$Res>
    implements _$PenaltyFormStateCopyWith<$Res> {
  __$PenaltyFormStateCopyWithImpl(this._self, this._then);

  final _PenaltyFormState _self;
  final $Res Function(_PenaltyFormState) _then;

/// Create a copy of PenaltyFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? templates = null,Object? submitStatus = null,Object? submitErrorCode = freezed,Object? submitError = freezed,}) {
  return _then(_PenaltyFormState(
templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as SectionData<List<PenaltyTemplate>>,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as FeatureStatus,submitErrorCode: freezed == submitErrorCode ? _self.submitErrorCode : submitErrorCode // ignore: cast_nullable_to_non_nullable
as String?,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PenaltyFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<PenaltyTemplate>, $Res> get templates {
  
  return $SectionDataCopyWith<List<PenaltyTemplate>, $Res>(_self.templates, (value) {
    return _then(_self.copyWith(templates: value));
  });
}
}

// dart format on
