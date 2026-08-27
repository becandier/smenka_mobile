// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_diagnostics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoDiagnosticsState implements DiagnosticableTreeMixin {

/// Платформа для блока инструкций — известна сразу, не грузится.
 GeoInstructionsTarget get target;/// Текущее состояние разрешений (`GeoService.diagnose`).
 SectionData<GeoDiagnostics> get status;/// Результат ручного теста «Проверить геолокацию». `success` здесь значит
/// «тест доведён до конца», а сам исход — внутри [GeoResult]: успех или
/// классифицированный [GeoFailure].
 SectionData<GeoResult> get test;
/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoDiagnosticsStateCopyWith<GeoDiagnosticsState> get copyWith => _$GeoDiagnosticsStateCopyWithImpl<GeoDiagnosticsState>(this as GeoDiagnosticsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GeoDiagnosticsState'))
    ..add(DiagnosticsProperty('target', target))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('test', test));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoDiagnosticsState&&(identical(other.target, target) || other.target == target)&&(identical(other.status, status) || other.status == status)&&(identical(other.test, test) || other.test == test));
}


@override
int get hashCode => Object.hash(runtimeType,target,status,test);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GeoDiagnosticsState(target: $target, status: $status, test: $test)';
}


}

/// @nodoc
abstract mixin class $GeoDiagnosticsStateCopyWith<$Res>  {
  factory $GeoDiagnosticsStateCopyWith(GeoDiagnosticsState value, $Res Function(GeoDiagnosticsState) _then) = _$GeoDiagnosticsStateCopyWithImpl;
@useResult
$Res call({
 GeoInstructionsTarget target, SectionData<GeoDiagnostics> status, SectionData<GeoResult> test
});


$SectionDataCopyWith<GeoDiagnostics, $Res> get status;$SectionDataCopyWith<GeoResult, $Res> get test;

}
/// @nodoc
class _$GeoDiagnosticsStateCopyWithImpl<$Res>
    implements $GeoDiagnosticsStateCopyWith<$Res> {
  _$GeoDiagnosticsStateCopyWithImpl(this._self, this._then);

  final GeoDiagnosticsState _self;
  final $Res Function(GeoDiagnosticsState) _then;

/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? target = null,Object? status = null,Object? test = null,}) {
  return _then(_self.copyWith(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as GeoInstructionsTarget,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SectionData<GeoDiagnostics>,test: null == test ? _self.test : test // ignore: cast_nullable_to_non_nullable
as SectionData<GeoResult>,
  ));
}
/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<GeoDiagnostics, $Res> get status {
  
  return $SectionDataCopyWith<GeoDiagnostics, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<GeoResult, $Res> get test {
  
  return $SectionDataCopyWith<GeoResult, $Res>(_self.test, (value) {
    return _then(_self.copyWith(test: value));
  });
}
}


/// Adds pattern-matching-related methods to [GeoDiagnosticsState].
extension GeoDiagnosticsStatePatterns on GeoDiagnosticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoDiagnosticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoDiagnosticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoDiagnosticsState value)  $default,){
final _that = this;
switch (_that) {
case _GeoDiagnosticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoDiagnosticsState value)?  $default,){
final _that = this;
switch (_that) {
case _GeoDiagnosticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GeoInstructionsTarget target,  SectionData<GeoDiagnostics> status,  SectionData<GeoResult> test)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoDiagnosticsState() when $default != null:
return $default(_that.target,_that.status,_that.test);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GeoInstructionsTarget target,  SectionData<GeoDiagnostics> status,  SectionData<GeoResult> test)  $default,) {final _that = this;
switch (_that) {
case _GeoDiagnosticsState():
return $default(_that.target,_that.status,_that.test);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GeoInstructionsTarget target,  SectionData<GeoDiagnostics> status,  SectionData<GeoResult> test)?  $default,) {final _that = this;
switch (_that) {
case _GeoDiagnosticsState() when $default != null:
return $default(_that.target,_that.status,_that.test);case _:
  return null;

}
}

}

/// @nodoc


class _GeoDiagnosticsState extends GeoDiagnosticsState with DiagnosticableTreeMixin {
  const _GeoDiagnosticsState({required this.target, this.status = const SectionData<GeoDiagnostics>(), this.test = const SectionData<GeoResult>()}): super._();
  

/// Платформа для блока инструкций — известна сразу, не грузится.
@override final  GeoInstructionsTarget target;
/// Текущее состояние разрешений (`GeoService.diagnose`).
@override@JsonKey() final  SectionData<GeoDiagnostics> status;
/// Результат ручного теста «Проверить геолокацию». `success` здесь значит
/// «тест доведён до конца», а сам исход — внутри [GeoResult]: успех или
/// классифицированный [GeoFailure].
@override@JsonKey() final  SectionData<GeoResult> test;

/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoDiagnosticsStateCopyWith<_GeoDiagnosticsState> get copyWith => __$GeoDiagnosticsStateCopyWithImpl<_GeoDiagnosticsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GeoDiagnosticsState'))
    ..add(DiagnosticsProperty('target', target))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('test', test));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoDiagnosticsState&&(identical(other.target, target) || other.target == target)&&(identical(other.status, status) || other.status == status)&&(identical(other.test, test) || other.test == test));
}


@override
int get hashCode => Object.hash(runtimeType,target,status,test);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GeoDiagnosticsState(target: $target, status: $status, test: $test)';
}


}

/// @nodoc
abstract mixin class _$GeoDiagnosticsStateCopyWith<$Res> implements $GeoDiagnosticsStateCopyWith<$Res> {
  factory _$GeoDiagnosticsStateCopyWith(_GeoDiagnosticsState value, $Res Function(_GeoDiagnosticsState) _then) = __$GeoDiagnosticsStateCopyWithImpl;
@override @useResult
$Res call({
 GeoInstructionsTarget target, SectionData<GeoDiagnostics> status, SectionData<GeoResult> test
});


@override $SectionDataCopyWith<GeoDiagnostics, $Res> get status;@override $SectionDataCopyWith<GeoResult, $Res> get test;

}
/// @nodoc
class __$GeoDiagnosticsStateCopyWithImpl<$Res>
    implements _$GeoDiagnosticsStateCopyWith<$Res> {
  __$GeoDiagnosticsStateCopyWithImpl(this._self, this._then);

  final _GeoDiagnosticsState _self;
  final $Res Function(_GeoDiagnosticsState) _then;

/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? target = null,Object? status = null,Object? test = null,}) {
  return _then(_GeoDiagnosticsState(
target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as GeoInstructionsTarget,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SectionData<GeoDiagnostics>,test: null == test ? _self.test : test // ignore: cast_nullable_to_non_nullable
as SectionData<GeoResult>,
  ));
}

/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<GeoDiagnostics, $Res> get status {
  
  return $SectionDataCopyWith<GeoDiagnostics, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of GeoDiagnosticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<GeoResult, $Res> get test {
  
  return $SectionDataCopyWith<GeoResult, $Res>(_self.test, (value) {
    return _then(_self.copyWith(test: value));
  });
}
}

// dart format on
