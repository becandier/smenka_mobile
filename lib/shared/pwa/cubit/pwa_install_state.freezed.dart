// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pwa_install_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PwaInstallState {

/// Приложение открыто в браузере. На native остаётся `false` — вся фича
/// выключена.
 bool get isWeb;/// Запущено как установленное PWA (`display-mode: standalone`).
 bool get isStandalone;/// Установку поймали в этой сессии (событие `appinstalled`).
 bool get isInstalled;/// Пойман `beforeinstallprompt` — доступен нативный диалог установки.
 bool get canPromptNatively;/// iOS/iPadOS — только ручная установка через «Поделиться».
 bool get isIos;/// Разовое промо уже показывали на этом устройстве.
 bool get promoShown;/// Разовое промо пора открыть — шелл слушает флаг и пушит модалку.
 bool get promoRequested;
/// Create a copy of PwaInstallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PwaInstallStateCopyWith<PwaInstallState> get copyWith => _$PwaInstallStateCopyWithImpl<PwaInstallState>(this as PwaInstallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PwaInstallState&&(identical(other.isWeb, isWeb) || other.isWeb == isWeb)&&(identical(other.isStandalone, isStandalone) || other.isStandalone == isStandalone)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.canPromptNatively, canPromptNatively) || other.canPromptNatively == canPromptNatively)&&(identical(other.isIos, isIos) || other.isIos == isIos)&&(identical(other.promoShown, promoShown) || other.promoShown == promoShown)&&(identical(other.promoRequested, promoRequested) || other.promoRequested == promoRequested));
}


@override
int get hashCode => Object.hash(runtimeType,isWeb,isStandalone,isInstalled,canPromptNatively,isIos,promoShown,promoRequested);

@override
String toString() {
  return 'PwaInstallState(isWeb: $isWeb, isStandalone: $isStandalone, isInstalled: $isInstalled, canPromptNatively: $canPromptNatively, isIos: $isIos, promoShown: $promoShown, promoRequested: $promoRequested)';
}


}

/// @nodoc
abstract mixin class $PwaInstallStateCopyWith<$Res>  {
  factory $PwaInstallStateCopyWith(PwaInstallState value, $Res Function(PwaInstallState) _then) = _$PwaInstallStateCopyWithImpl;
@useResult
$Res call({
 bool isWeb, bool isStandalone, bool isInstalled, bool canPromptNatively, bool isIos, bool promoShown, bool promoRequested
});




}
/// @nodoc
class _$PwaInstallStateCopyWithImpl<$Res>
    implements $PwaInstallStateCopyWith<$Res> {
  _$PwaInstallStateCopyWithImpl(this._self, this._then);

  final PwaInstallState _self;
  final $Res Function(PwaInstallState) _then;

/// Create a copy of PwaInstallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isWeb = null,Object? isStandalone = null,Object? isInstalled = null,Object? canPromptNatively = null,Object? isIos = null,Object? promoShown = null,Object? promoRequested = null,}) {
  return _then(_self.copyWith(
isWeb: null == isWeb ? _self.isWeb : isWeb // ignore: cast_nullable_to_non_nullable
as bool,isStandalone: null == isStandalone ? _self.isStandalone : isStandalone // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,canPromptNatively: null == canPromptNatively ? _self.canPromptNatively : canPromptNatively // ignore: cast_nullable_to_non_nullable
as bool,isIos: null == isIos ? _self.isIos : isIos // ignore: cast_nullable_to_non_nullable
as bool,promoShown: null == promoShown ? _self.promoShown : promoShown // ignore: cast_nullable_to_non_nullable
as bool,promoRequested: null == promoRequested ? _self.promoRequested : promoRequested // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PwaInstallState].
extension PwaInstallStatePatterns on PwaInstallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PwaInstallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PwaInstallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PwaInstallState value)  $default,){
final _that = this;
switch (_that) {
case _PwaInstallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PwaInstallState value)?  $default,){
final _that = this;
switch (_that) {
case _PwaInstallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isWeb,  bool isStandalone,  bool isInstalled,  bool canPromptNatively,  bool isIos,  bool promoShown,  bool promoRequested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PwaInstallState() when $default != null:
return $default(_that.isWeb,_that.isStandalone,_that.isInstalled,_that.canPromptNatively,_that.isIos,_that.promoShown,_that.promoRequested);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isWeb,  bool isStandalone,  bool isInstalled,  bool canPromptNatively,  bool isIos,  bool promoShown,  bool promoRequested)  $default,) {final _that = this;
switch (_that) {
case _PwaInstallState():
return $default(_that.isWeb,_that.isStandalone,_that.isInstalled,_that.canPromptNatively,_that.isIos,_that.promoShown,_that.promoRequested);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isWeb,  bool isStandalone,  bool isInstalled,  bool canPromptNatively,  bool isIos,  bool promoShown,  bool promoRequested)?  $default,) {final _that = this;
switch (_that) {
case _PwaInstallState() when $default != null:
return $default(_that.isWeb,_that.isStandalone,_that.isInstalled,_that.canPromptNatively,_that.isIos,_that.promoShown,_that.promoRequested);case _:
  return null;

}
}

}

/// @nodoc


class _PwaInstallState extends PwaInstallState {
  const _PwaInstallState({this.isWeb = false, this.isStandalone = false, this.isInstalled = false, this.canPromptNatively = false, this.isIos = false, this.promoShown = false, this.promoRequested = false}): super._();
  

/// Приложение открыто в браузере. На native остаётся `false` — вся фича
/// выключена.
@override@JsonKey() final  bool isWeb;
/// Запущено как установленное PWA (`display-mode: standalone`).
@override@JsonKey() final  bool isStandalone;
/// Установку поймали в этой сессии (событие `appinstalled`).
@override@JsonKey() final  bool isInstalled;
/// Пойман `beforeinstallprompt` — доступен нативный диалог установки.
@override@JsonKey() final  bool canPromptNatively;
/// iOS/iPadOS — только ручная установка через «Поделиться».
@override@JsonKey() final  bool isIos;
/// Разовое промо уже показывали на этом устройстве.
@override@JsonKey() final  bool promoShown;
/// Разовое промо пора открыть — шелл слушает флаг и пушит модалку.
@override@JsonKey() final  bool promoRequested;

/// Create a copy of PwaInstallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PwaInstallStateCopyWith<_PwaInstallState> get copyWith => __$PwaInstallStateCopyWithImpl<_PwaInstallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PwaInstallState&&(identical(other.isWeb, isWeb) || other.isWeb == isWeb)&&(identical(other.isStandalone, isStandalone) || other.isStandalone == isStandalone)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.canPromptNatively, canPromptNatively) || other.canPromptNatively == canPromptNatively)&&(identical(other.isIos, isIos) || other.isIos == isIos)&&(identical(other.promoShown, promoShown) || other.promoShown == promoShown)&&(identical(other.promoRequested, promoRequested) || other.promoRequested == promoRequested));
}


@override
int get hashCode => Object.hash(runtimeType,isWeb,isStandalone,isInstalled,canPromptNatively,isIos,promoShown,promoRequested);

@override
String toString() {
  return 'PwaInstallState(isWeb: $isWeb, isStandalone: $isStandalone, isInstalled: $isInstalled, canPromptNatively: $canPromptNatively, isIos: $isIos, promoShown: $promoShown, promoRequested: $promoRequested)';
}


}

/// @nodoc
abstract mixin class _$PwaInstallStateCopyWith<$Res> implements $PwaInstallStateCopyWith<$Res> {
  factory _$PwaInstallStateCopyWith(_PwaInstallState value, $Res Function(_PwaInstallState) _then) = __$PwaInstallStateCopyWithImpl;
@override @useResult
$Res call({
 bool isWeb, bool isStandalone, bool isInstalled, bool canPromptNatively, bool isIos, bool promoShown, bool promoRequested
});




}
/// @nodoc
class __$PwaInstallStateCopyWithImpl<$Res>
    implements _$PwaInstallStateCopyWith<$Res> {
  __$PwaInstallStateCopyWithImpl(this._self, this._then);

  final _PwaInstallState _self;
  final $Res Function(_PwaInstallState) _then;

/// Create a copy of PwaInstallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isWeb = null,Object? isStandalone = null,Object? isInstalled = null,Object? canPromptNatively = null,Object? isIos = null,Object? promoShown = null,Object? promoRequested = null,}) {
  return _then(_PwaInstallState(
isWeb: null == isWeb ? _self.isWeb : isWeb // ignore: cast_nullable_to_non_nullable
as bool,isStandalone: null == isStandalone ? _self.isStandalone : isStandalone // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,canPromptNatively: null == canPromptNatively ? _self.canPromptNatively : canPromptNatively // ignore: cast_nullable_to_non_nullable
as bool,isIos: null == isIos ? _self.isIos : isIos // ignore: cast_nullable_to_non_nullable
as bool,promoShown: null == promoShown ? _self.promoShown : promoShown // ignore: cast_nullable_to_non_nullable
as bool,promoRequested: null == promoRequested ? _self.promoRequested : promoRequested // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
