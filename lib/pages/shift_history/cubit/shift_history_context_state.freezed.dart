// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_history_context_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftHistoryContextState {

 SectionData<List<Organization>> get organizations;/// Резолв контекста ещё не завершён (нет сохранённого выбора — ждём
/// загрузку организаций для дефолта, см. mobile.md, «Загрузка»).
/// `ShiftHistoryCubit`/`ShiftStatsCubit` не должны запрашивать данные,
/// пока это `true`.
 bool get isLoading;/// `null` — контекст ничем не ограничивает выборку: либо доступных
/// организаций нет вовсе (селектор скрыт, `scope` на бэк не уходит),
/// либо резолв ещё не завершён ([isLoading]). Иначе — одно из значений
/// `all`/`personal`/`organization`, выбранное пользователем или
/// вычисленное по умолчанию.
 ShiftScope? get scope;/// Заполнено только при `scope == ShiftScope.organization`.
 String? get organizationId;
/// Create a copy of ShiftHistoryContextState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftHistoryContextStateCopyWith<ShiftHistoryContextState> get copyWith => _$ShiftHistoryContextStateCopyWithImpl<ShiftHistoryContextState>(this as ShiftHistoryContextState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftHistoryContextState&&(identical(other.organizations, organizations) || other.organizations == organizations)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId));
}


@override
int get hashCode => Object.hash(runtimeType,organizations,isLoading,scope,organizationId);

@override
String toString() {
  return 'ShiftHistoryContextState(organizations: $organizations, isLoading: $isLoading, scope: $scope, organizationId: $organizationId)';
}


}

/// @nodoc
abstract mixin class $ShiftHistoryContextStateCopyWith<$Res>  {
  factory $ShiftHistoryContextStateCopyWith(ShiftHistoryContextState value, $Res Function(ShiftHistoryContextState) _then) = _$ShiftHistoryContextStateCopyWithImpl;
@useResult
$Res call({
 SectionData<List<Organization>> organizations, bool isLoading, ShiftScope? scope, String? organizationId
});


$SectionDataCopyWith<List<Organization>, $Res> get organizations;

}
/// @nodoc
class _$ShiftHistoryContextStateCopyWithImpl<$Res>
    implements $ShiftHistoryContextStateCopyWith<$Res> {
  _$ShiftHistoryContextStateCopyWithImpl(this._self, this._then);

  final ShiftHistoryContextState _self;
  final $Res Function(ShiftHistoryContextState) _then;

/// Create a copy of ShiftHistoryContextState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? organizations = null,Object? isLoading = null,Object? scope = freezed,Object? organizationId = freezed,}) {
  return _then(_self.copyWith(
organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as SectionData<List<Organization>>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,scope: freezed == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShiftScope?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShiftHistoryContextState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Organization>, $Res> get organizations {
  
  return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations, (value) {
    return _then(_self.copyWith(organizations: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftHistoryContextState].
extension ShiftHistoryContextStatePatterns on ShiftHistoryContextState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftHistoryContextState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftHistoryContextState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftHistoryContextState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftHistoryContextState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftHistoryContextState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftHistoryContextState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<List<Organization>> organizations,  bool isLoading,  ShiftScope? scope,  String? organizationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftHistoryContextState() when $default != null:
return $default(_that.organizations,_that.isLoading,_that.scope,_that.organizationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<List<Organization>> organizations,  bool isLoading,  ShiftScope? scope,  String? organizationId)  $default,) {final _that = this;
switch (_that) {
case _ShiftHistoryContextState():
return $default(_that.organizations,_that.isLoading,_that.scope,_that.organizationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<List<Organization>> organizations,  bool isLoading,  ShiftScope? scope,  String? organizationId)?  $default,) {final _that = this;
switch (_that) {
case _ShiftHistoryContextState() when $default != null:
return $default(_that.organizations,_that.isLoading,_that.scope,_that.organizationId);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftHistoryContextState extends ShiftHistoryContextState {
  const _ShiftHistoryContextState({this.organizations = const SectionData<List<Organization>>(), this.isLoading = true, this.scope, this.organizationId}): super._();
  

@override@JsonKey() final  SectionData<List<Organization>> organizations;
/// Резолв контекста ещё не завершён (нет сохранённого выбора — ждём
/// загрузку организаций для дефолта, см. mobile.md, «Загрузка»).
/// `ShiftHistoryCubit`/`ShiftStatsCubit` не должны запрашивать данные,
/// пока это `true`.
@override@JsonKey() final  bool isLoading;
/// `null` — контекст ничем не ограничивает выборку: либо доступных
/// организаций нет вовсе (селектор скрыт, `scope` на бэк не уходит),
/// либо резолв ещё не завершён ([isLoading]). Иначе — одно из значений
/// `all`/`personal`/`organization`, выбранное пользователем или
/// вычисленное по умолчанию.
@override final  ShiftScope? scope;
/// Заполнено только при `scope == ShiftScope.organization`.
@override final  String? organizationId;

/// Create a copy of ShiftHistoryContextState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftHistoryContextStateCopyWith<_ShiftHistoryContextState> get copyWith => __$ShiftHistoryContextStateCopyWithImpl<_ShiftHistoryContextState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftHistoryContextState&&(identical(other.organizations, organizations) || other.organizations == organizations)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId));
}


@override
int get hashCode => Object.hash(runtimeType,organizations,isLoading,scope,organizationId);

@override
String toString() {
  return 'ShiftHistoryContextState(organizations: $organizations, isLoading: $isLoading, scope: $scope, organizationId: $organizationId)';
}


}

/// @nodoc
abstract mixin class _$ShiftHistoryContextStateCopyWith<$Res> implements $ShiftHistoryContextStateCopyWith<$Res> {
  factory _$ShiftHistoryContextStateCopyWith(_ShiftHistoryContextState value, $Res Function(_ShiftHistoryContextState) _then) = __$ShiftHistoryContextStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<List<Organization>> organizations, bool isLoading, ShiftScope? scope, String? organizationId
});


@override $SectionDataCopyWith<List<Organization>, $Res> get organizations;

}
/// @nodoc
class __$ShiftHistoryContextStateCopyWithImpl<$Res>
    implements _$ShiftHistoryContextStateCopyWith<$Res> {
  __$ShiftHistoryContextStateCopyWithImpl(this._self, this._then);

  final _ShiftHistoryContextState _self;
  final $Res Function(_ShiftHistoryContextState) _then;

/// Create a copy of ShiftHistoryContextState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? organizations = null,Object? isLoading = null,Object? scope = freezed,Object? organizationId = freezed,}) {
  return _then(_ShiftHistoryContextState(
organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as SectionData<List<Organization>>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,scope: freezed == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ShiftScope?,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShiftHistoryContextState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<List<Organization>, $Res> get organizations {
  
  return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations, (value) {
    return _then(_self.copyWith(organizations: value));
  });
}
}

// dart format on
