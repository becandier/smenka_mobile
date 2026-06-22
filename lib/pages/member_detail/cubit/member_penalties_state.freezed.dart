// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_penalties_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberPenaltiesState {

 PaginatedSectionData<Penalty> get penalties;
/// Create a copy of MemberPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberPenaltiesStateCopyWith<MemberPenaltiesState> get copyWith => _$MemberPenaltiesStateCopyWithImpl<MemberPenaltiesState>(this as MemberPenaltiesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberPenaltiesState&&(identical(other.penalties, penalties) || other.penalties == penalties));
}


@override
int get hashCode => Object.hash(runtimeType,penalties);

@override
String toString() {
  return 'MemberPenaltiesState(penalties: $penalties)';
}


}

/// @nodoc
abstract mixin class $MemberPenaltiesStateCopyWith<$Res>  {
  factory $MemberPenaltiesStateCopyWith(MemberPenaltiesState value, $Res Function(MemberPenaltiesState) _then) = _$MemberPenaltiesStateCopyWithImpl;
@useResult
$Res call({
 PaginatedSectionData<Penalty> penalties
});


$PaginatedSectionDataCopyWith<Penalty, $Res> get penalties;

}
/// @nodoc
class _$MemberPenaltiesStateCopyWithImpl<$Res>
    implements $MemberPenaltiesStateCopyWith<$Res> {
  _$MemberPenaltiesStateCopyWithImpl(this._self, this._then);

  final MemberPenaltiesState _self;
  final $Res Function(MemberPenaltiesState) _then;

/// Create a copy of MemberPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? penalties = null,}) {
  return _then(_self.copyWith(
penalties: null == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<Penalty>,
  ));
}
/// Create a copy of MemberPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<Penalty, $Res> get penalties {
  
  return $PaginatedSectionDataCopyWith<Penalty, $Res>(_self.penalties, (value) {
    return _then(_self.copyWith(penalties: value));
  });
}
}


/// Adds pattern-matching-related methods to [MemberPenaltiesState].
extension MemberPenaltiesStatePatterns on MemberPenaltiesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberPenaltiesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberPenaltiesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberPenaltiesState value)  $default,){
final _that = this;
switch (_that) {
case _MemberPenaltiesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberPenaltiesState value)?  $default,){
final _that = this;
switch (_that) {
case _MemberPenaltiesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedSectionData<Penalty> penalties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberPenaltiesState() when $default != null:
return $default(_that.penalties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedSectionData<Penalty> penalties)  $default,) {final _that = this;
switch (_that) {
case _MemberPenaltiesState():
return $default(_that.penalties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedSectionData<Penalty> penalties)?  $default,) {final _that = this;
switch (_that) {
case _MemberPenaltiesState() when $default != null:
return $default(_that.penalties);case _:
  return null;

}
}

}

/// @nodoc


class _MemberPenaltiesState implements MemberPenaltiesState {
  const _MemberPenaltiesState({this.penalties = const PaginatedSectionData<Penalty>()});
  

@override@JsonKey() final  PaginatedSectionData<Penalty> penalties;

/// Create a copy of MemberPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberPenaltiesStateCopyWith<_MemberPenaltiesState> get copyWith => __$MemberPenaltiesStateCopyWithImpl<_MemberPenaltiesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberPenaltiesState&&(identical(other.penalties, penalties) || other.penalties == penalties));
}


@override
int get hashCode => Object.hash(runtimeType,penalties);

@override
String toString() {
  return 'MemberPenaltiesState(penalties: $penalties)';
}


}

/// @nodoc
abstract mixin class _$MemberPenaltiesStateCopyWith<$Res> implements $MemberPenaltiesStateCopyWith<$Res> {
  factory _$MemberPenaltiesStateCopyWith(_MemberPenaltiesState value, $Res Function(_MemberPenaltiesState) _then) = __$MemberPenaltiesStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedSectionData<Penalty> penalties
});


@override $PaginatedSectionDataCopyWith<Penalty, $Res> get penalties;

}
/// @nodoc
class __$MemberPenaltiesStateCopyWithImpl<$Res>
    implements _$MemberPenaltiesStateCopyWith<$Res> {
  __$MemberPenaltiesStateCopyWithImpl(this._self, this._then);

  final _MemberPenaltiesState _self;
  final $Res Function(_MemberPenaltiesState) _then;

/// Create a copy of MemberPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? penalties = null,}) {
  return _then(_MemberPenaltiesState(
penalties: null == penalties ? _self.penalties : penalties // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<Penalty>,
  ));
}

/// Create a copy of MemberPenaltiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<Penalty, $Res> get penalties {
  
  return $PaginatedSectionDataCopyWith<Penalty, $Res>(_self.penalties, (value) {
    return _then(_self.copyWith(penalties: value));
  });
}
}

// dart format on
