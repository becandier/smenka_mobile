// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrganizationSubscription {

 SubscriptionStatus? get status; int? get daysLeft; DateTime? get currentPeriodEnd; DateTime? get graceEndsAt;
/// Create a copy of OrganizationSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationSubscriptionCopyWith<OrganizationSubscription> get copyWith => _$OrganizationSubscriptionCopyWithImpl<OrganizationSubscription>(this as OrganizationSubscription, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationSubscription&&(identical(other.status, status) || other.status == status)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.graceEndsAt, graceEndsAt) || other.graceEndsAt == graceEndsAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,daysLeft,currentPeriodEnd,graceEndsAt);

@override
String toString() {
  return 'OrganizationSubscription(status: $status, daysLeft: $daysLeft, currentPeriodEnd: $currentPeriodEnd, graceEndsAt: $graceEndsAt)';
}


}

/// @nodoc
abstract mixin class $OrganizationSubscriptionCopyWith<$Res>  {
  factory $OrganizationSubscriptionCopyWith(OrganizationSubscription value, $Res Function(OrganizationSubscription) _then) = _$OrganizationSubscriptionCopyWithImpl;
@useResult
$Res call({
 SubscriptionStatus? status, int? daysLeft, DateTime? currentPeriodEnd, DateTime? graceEndsAt
});




}
/// @nodoc
class _$OrganizationSubscriptionCopyWithImpl<$Res>
    implements $OrganizationSubscriptionCopyWith<$Res> {
  _$OrganizationSubscriptionCopyWithImpl(this._self, this._then);

  final OrganizationSubscription _self;
  final $Res Function(OrganizationSubscription) _then;

/// Create a copy of OrganizationSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? daysLeft = freezed,Object? currentPeriodEnd = freezed,Object? graceEndsAt = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,graceEndsAt: freezed == graceEndsAt ? _self.graceEndsAt : graceEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationSubscription].
extension OrganizationSubscriptionPatterns on OrganizationSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationSubscription value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriptionStatus? status,  int? daysLeft,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationSubscription() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriptionStatus? status,  int? daysLeft,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)  $default,) {final _that = this;
switch (_that) {
case _OrganizationSubscription():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriptionStatus? status,  int? daysLeft,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationSubscription() when $default != null:
return $default(_that.status,_that.daysLeft,_that.currentPeriodEnd,_that.graceEndsAt);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationSubscription extends OrganizationSubscription {
  const _OrganizationSubscription({this.status, this.daysLeft, this.currentPeriodEnd, this.graceEndsAt}): super._();
  

@override final  SubscriptionStatus? status;
@override final  int? daysLeft;
@override final  DateTime? currentPeriodEnd;
@override final  DateTime? graceEndsAt;

/// Create a copy of OrganizationSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationSubscriptionCopyWith<_OrganizationSubscription> get copyWith => __$OrganizationSubscriptionCopyWithImpl<_OrganizationSubscription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationSubscription&&(identical(other.status, status) || other.status == status)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.graceEndsAt, graceEndsAt) || other.graceEndsAt == graceEndsAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,daysLeft,currentPeriodEnd,graceEndsAt);

@override
String toString() {
  return 'OrganizationSubscription(status: $status, daysLeft: $daysLeft, currentPeriodEnd: $currentPeriodEnd, graceEndsAt: $graceEndsAt)';
}


}

/// @nodoc
abstract mixin class _$OrganizationSubscriptionCopyWith<$Res> implements $OrganizationSubscriptionCopyWith<$Res> {
  factory _$OrganizationSubscriptionCopyWith(_OrganizationSubscription value, $Res Function(_OrganizationSubscription) _then) = __$OrganizationSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 SubscriptionStatus? status, int? daysLeft, DateTime? currentPeriodEnd, DateTime? graceEndsAt
});




}
/// @nodoc
class __$OrganizationSubscriptionCopyWithImpl<$Res>
    implements _$OrganizationSubscriptionCopyWith<$Res> {
  __$OrganizationSubscriptionCopyWithImpl(this._self, this._then);

  final _OrganizationSubscription _self;
  final $Res Function(_OrganizationSubscription) _then;

/// Create a copy of OrganizationSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? daysLeft = freezed,Object? currentPeriodEnd = freezed,Object? graceEndsAt = freezed,}) {
  return _then(_OrganizationSubscription(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,graceEndsAt: freezed == graceEndsAt ? _self.graceEndsAt : graceEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
