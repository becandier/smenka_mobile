// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_subscription_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationSubscriptionDto {

 String get status; int? get daysLeft; DateTime? get currentPeriodEnd; DateTime? get graceEndsAt;
/// Create a copy of OrganizationSubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationSubscriptionDtoCopyWith<OrganizationSubscriptionDto> get copyWith => _$OrganizationSubscriptionDtoCopyWithImpl<OrganizationSubscriptionDto>(this as OrganizationSubscriptionDto, _$identity);

  /// Serializes this OrganizationSubscriptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationSubscriptionDto&&(identical(other.status, status) || other.status == status)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.graceEndsAt, graceEndsAt) || other.graceEndsAt == graceEndsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,daysLeft,currentPeriodEnd,graceEndsAt);

@override
String toString() {
  return 'OrganizationSubscriptionDto(status: $status, daysLeft: $daysLeft, currentPeriodEnd: $currentPeriodEnd, graceEndsAt: $graceEndsAt)';
}


}

/// @nodoc
abstract mixin class $OrganizationSubscriptionDtoCopyWith<$Res>  {
  factory $OrganizationSubscriptionDtoCopyWith(OrganizationSubscriptionDto value, $Res Function(OrganizationSubscriptionDto) _then) = _$OrganizationSubscriptionDtoCopyWithImpl;
@useResult
$Res call({
 String status, int? daysLeft, DateTime? currentPeriodEnd, DateTime? graceEndsAt
});




}
/// @nodoc
class _$OrganizationSubscriptionDtoCopyWithImpl<$Res>
    implements $OrganizationSubscriptionDtoCopyWith<$Res> {
  _$OrganizationSubscriptionDtoCopyWithImpl(this._self, this._then);

  final OrganizationSubscriptionDto _self;
  final $Res Function(OrganizationSubscriptionDto) _then;

/// Create a copy of OrganizationSubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? daysLeft = freezed,Object? currentPeriodEnd = freezed,Object? graceEndsAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,graceEndsAt: freezed == graceEndsAt ? _self.graceEndsAt : graceEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationSubscriptionDto].
extension OrganizationSubscriptionDtoPatterns on OrganizationSubscriptionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationSubscriptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationSubscriptionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationSubscriptionDto value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationSubscriptionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationSubscriptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationSubscriptionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int? daysLeft,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationSubscriptionDto() when $default != null:
return $default(_that.status,_that.daysLeft,_that.currentPeriodEnd,_that.graceEndsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int? daysLeft,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)  $default,) {final _that = this;
switch (_that) {
case _OrganizationSubscriptionDto():
return $default(_that.status,_that.daysLeft,_that.currentPeriodEnd,_that.graceEndsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int? daysLeft,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationSubscriptionDto() when $default != null:
return $default(_that.status,_that.daysLeft,_that.currentPeriodEnd,_that.graceEndsAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _OrganizationSubscriptionDto implements OrganizationSubscriptionDto {
  const _OrganizationSubscriptionDto({required this.status, this.daysLeft, this.currentPeriodEnd, this.graceEndsAt});
  factory _OrganizationSubscriptionDto.fromJson(Map<String, dynamic> json) => _$OrganizationSubscriptionDtoFromJson(json);

@override final  String status;
@override final  int? daysLeft;
@override final  DateTime? currentPeriodEnd;
@override final  DateTime? graceEndsAt;

/// Create a copy of OrganizationSubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationSubscriptionDtoCopyWith<_OrganizationSubscriptionDto> get copyWith => __$OrganizationSubscriptionDtoCopyWithImpl<_OrganizationSubscriptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationSubscriptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationSubscriptionDto&&(identical(other.status, status) || other.status == status)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.graceEndsAt, graceEndsAt) || other.graceEndsAt == graceEndsAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,daysLeft,currentPeriodEnd,graceEndsAt);

@override
String toString() {
  return 'OrganizationSubscriptionDto(status: $status, daysLeft: $daysLeft, currentPeriodEnd: $currentPeriodEnd, graceEndsAt: $graceEndsAt)';
}


}

/// @nodoc
abstract mixin class _$OrganizationSubscriptionDtoCopyWith<$Res> implements $OrganizationSubscriptionDtoCopyWith<$Res> {
  factory _$OrganizationSubscriptionDtoCopyWith(_OrganizationSubscriptionDto value, $Res Function(_OrganizationSubscriptionDto) _then) = __$OrganizationSubscriptionDtoCopyWithImpl;
@override @useResult
$Res call({
 String status, int? daysLeft, DateTime? currentPeriodEnd, DateTime? graceEndsAt
});




}
/// @nodoc
class __$OrganizationSubscriptionDtoCopyWithImpl<$Res>
    implements _$OrganizationSubscriptionDtoCopyWith<$Res> {
  __$OrganizationSubscriptionDtoCopyWithImpl(this._self, this._then);

  final _OrganizationSubscriptionDto _self;
  final $Res Function(_OrganizationSubscriptionDto) _then;

/// Create a copy of OrganizationSubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? daysLeft = freezed,Object? currentPeriodEnd = freezed,Object? graceEndsAt = freezed,}) {
  return _then(_OrganizationSubscriptionDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,graceEndsAt: freezed == graceEndsAt ? _self.graceEndsAt : graceEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
