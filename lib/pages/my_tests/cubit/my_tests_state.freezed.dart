// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_tests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyTestsState {

 PaginatedSectionData<TestAssignment> get assignments;/// Мои организации — для чипов фильтра. Список может быть пуст, пока
/// не подгрузился (первый экран без организаций скрывает фильтр-ряд).
 List<Organization> get organizations;/// `null` — «Все организации».
 String? get filterOrganizationId;
/// Create a copy of MyTestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTestsStateCopyWith<MyTestsState> get copyWith => _$MyTestsStateCopyWithImpl<MyTestsState>(this as MyTestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTestsState&&(identical(other.assignments, assignments) || other.assignments == assignments)&&const DeepCollectionEquality().equals(other.organizations, organizations)&&(identical(other.filterOrganizationId, filterOrganizationId) || other.filterOrganizationId == filterOrganizationId));
}


@override
int get hashCode => Object.hash(runtimeType,assignments,const DeepCollectionEquality().hash(organizations),filterOrganizationId);

@override
String toString() {
  return 'MyTestsState(assignments: $assignments, organizations: $organizations, filterOrganizationId: $filterOrganizationId)';
}


}

/// @nodoc
abstract mixin class $MyTestsStateCopyWith<$Res>  {
  factory $MyTestsStateCopyWith(MyTestsState value, $Res Function(MyTestsState) _then) = _$MyTestsStateCopyWithImpl;
@useResult
$Res call({
 PaginatedSectionData<TestAssignment> assignments, List<Organization> organizations, String? filterOrganizationId
});


$PaginatedSectionDataCopyWith<TestAssignment, $Res> get assignments;

}
/// @nodoc
class _$MyTestsStateCopyWithImpl<$Res>
    implements $MyTestsStateCopyWith<$Res> {
  _$MyTestsStateCopyWithImpl(this._self, this._then);

  final MyTestsState _self;
  final $Res Function(MyTestsState) _then;

/// Create a copy of MyTestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignments = null,Object? organizations = null,Object? filterOrganizationId = freezed,}) {
  return _then(_self.copyWith(
assignments: null == assignments ? _self.assignments : assignments // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<TestAssignment>,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>,filterOrganizationId: freezed == filterOrganizationId ? _self.filterOrganizationId : filterOrganizationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MyTestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<TestAssignment, $Res> get assignments {
  
  return $PaginatedSectionDataCopyWith<TestAssignment, $Res>(_self.assignments, (value) {
    return _then(_self.copyWith(assignments: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyTestsState].
extension MyTestsStatePatterns on MyTestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyTestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyTestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyTestsState value)  $default,){
final _that = this;
switch (_that) {
case _MyTestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyTestsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyTestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedSectionData<TestAssignment> assignments,  List<Organization> organizations,  String? filterOrganizationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyTestsState() when $default != null:
return $default(_that.assignments,_that.organizations,_that.filterOrganizationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedSectionData<TestAssignment> assignments,  List<Organization> organizations,  String? filterOrganizationId)  $default,) {final _that = this;
switch (_that) {
case _MyTestsState():
return $default(_that.assignments,_that.organizations,_that.filterOrganizationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedSectionData<TestAssignment> assignments,  List<Organization> organizations,  String? filterOrganizationId)?  $default,) {final _that = this;
switch (_that) {
case _MyTestsState() when $default != null:
return $default(_that.assignments,_that.organizations,_that.filterOrganizationId);case _:
  return null;

}
}

}

/// @nodoc


class _MyTestsState implements MyTestsState {
  const _MyTestsState({this.assignments = const PaginatedSectionData<TestAssignment>(), final  List<Organization> organizations = const <Organization>[], this.filterOrganizationId}): _organizations = organizations;
  

@override@JsonKey() final  PaginatedSectionData<TestAssignment> assignments;
/// Мои организации — для чипов фильтра. Список может быть пуст, пока
/// не подгрузился (первый экран без организаций скрывает фильтр-ряд).
 final  List<Organization> _organizations;
/// Мои организации — для чипов фильтра. Список может быть пуст, пока
/// не подгрузился (первый экран без организаций скрывает фильтр-ряд).
@override@JsonKey() List<Organization> get organizations {
  if (_organizations is EqualUnmodifiableListView) return _organizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organizations);
}

/// `null` — «Все организации».
@override final  String? filterOrganizationId;

/// Create a copy of MyTestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTestsStateCopyWith<_MyTestsState> get copyWith => __$MyTestsStateCopyWithImpl<_MyTestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTestsState&&(identical(other.assignments, assignments) || other.assignments == assignments)&&const DeepCollectionEquality().equals(other._organizations, _organizations)&&(identical(other.filterOrganizationId, filterOrganizationId) || other.filterOrganizationId == filterOrganizationId));
}


@override
int get hashCode => Object.hash(runtimeType,assignments,const DeepCollectionEquality().hash(_organizations),filterOrganizationId);

@override
String toString() {
  return 'MyTestsState(assignments: $assignments, organizations: $organizations, filterOrganizationId: $filterOrganizationId)';
}


}

/// @nodoc
abstract mixin class _$MyTestsStateCopyWith<$Res> implements $MyTestsStateCopyWith<$Res> {
  factory _$MyTestsStateCopyWith(_MyTestsState value, $Res Function(_MyTestsState) _then) = __$MyTestsStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedSectionData<TestAssignment> assignments, List<Organization> organizations, String? filterOrganizationId
});


@override $PaginatedSectionDataCopyWith<TestAssignment, $Res> get assignments;

}
/// @nodoc
class __$MyTestsStateCopyWithImpl<$Res>
    implements _$MyTestsStateCopyWith<$Res> {
  __$MyTestsStateCopyWithImpl(this._self, this._then);

  final _MyTestsState _self;
  final $Res Function(_MyTestsState) _then;

/// Create a copy of MyTestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignments = null,Object? organizations = null,Object? filterOrganizationId = freezed,}) {
  return _then(_MyTestsState(
assignments: null == assignments ? _self.assignments : assignments // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<TestAssignment>,organizations: null == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<Organization>,filterOrganizationId: freezed == filterOrganizationId ? _self.filterOrganizationId : filterOrganizationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MyTestsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<TestAssignment, $Res> get assignments {
  
  return $PaginatedSectionDataCopyWith<TestAssignment, $Res>(_self.assignments, (value) {
    return _then(_self.copyWith(assignments: value));
  });
}
}

// dart format on
