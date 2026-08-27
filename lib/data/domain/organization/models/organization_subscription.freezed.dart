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

 SubscriptionStatus? get status; int? get daysLeft; DateTime? get trialEndsAt; DateTime? get currentPeriodEnd; DateTime? get graceEndsAt;
/// Create a copy of OrganizationSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationSubscriptionCopyWith<OrganizationSubscription> get copyWith => _$OrganizationSubscriptionCopyWithImpl<OrganizationSubscription>(this as OrganizationSubscription, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationSubscription&&(identical(other.status, status) || other.status == status)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.trialEndsAt, trialEndsAt) || other.trialEndsAt == trialEndsAt)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.graceEndsAt, graceEndsAt) || other.graceEndsAt == graceEndsAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,daysLeft,trialEndsAt,currentPeriodEnd,graceEndsAt);

@override
String toString() {
  return 'OrganizationSubscription(status: $status, daysLeft: $daysLeft, trialEndsAt: $trialEndsAt, currentPeriodEnd: $currentPeriodEnd, graceEndsAt: $graceEndsAt)';
}


}

/// @nodoc
abstract mixin class $OrganizationSubscriptionCopyWith<$Res>  {
  factory $OrganizationSubscriptionCopyWith(OrganizationSubscription value, $Res Function(OrganizationSubscription) _then) = _$OrganizationSubscriptionCopyWithImpl;
@useResult
$Res call({
 SubscriptionStatus? status, int? daysLeft, DateTime? trialEndsAt, DateTime? currentPeriodEnd, DateTime? graceEndsAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? daysLeft = freezed,Object? trialEndsAt = freezed,Object? currentPeriodEnd = freezed,Object? graceEndsAt = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriptionStatus? status,  int? daysLeft,  DateTime? trialEndsAt,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationSubscription() when $default != null:
return $default(_that.status,_that.daysLeft,_that.trialEndsAt,_that.currentPeriodEnd,_that.graceEndsAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriptionStatus? status,  int? daysLeft,  DateTime? trialEndsAt,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)  $default,) {final _that = this;
switch (_that) {
case _OrganizationSubscription():
return $default(_that.status,_that.daysLeft,_that.trialEndsAt,_that.currentPeriodEnd,_that.graceEndsAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriptionStatus? status,  int? daysLeft,  DateTime? trialEndsAt,  DateTime? currentPeriodEnd,  DateTime? graceEndsAt)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationSubscription() when $default != null:
return $default(_that.status,_that.daysLeft,_that.trialEndsAt,_that.currentPeriodEnd,_that.graceEndsAt);case _:
  return null;

}
}

}

/// @nodoc


class _OrganizationSubscription extends OrganizationSubscription {
  const _OrganizationSubscription({this.status, this.daysLeft, this.trialEndsAt, this.currentPeriodEnd, this.graceEndsAt}): super._();
  

@override final  SubscriptionStatus? status;
@override final  int? daysLeft;
@override final  DateTime? trialEndsAt;
@override final  DateTime? currentPeriodEnd;
@override final  DateTime? graceEndsAt;

/// Create a copy of OrganizationSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationSubscriptionCopyWith<_OrganizationSubscription> get copyWith => __$OrganizationSubscriptionCopyWithImpl<_OrganizationSubscription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationSubscription&&(identical(other.status, status) || other.status == status)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft)&&(identical(other.trialEndsAt, trialEndsAt) || other.trialEndsAt == trialEndsAt)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd)&&(identical(other.graceEndsAt, graceEndsAt) || other.graceEndsAt == graceEndsAt));
}


@override
int get hashCode => Object.hash(runtimeType,status,daysLeft,trialEndsAt,currentPeriodEnd,graceEndsAt);

@override
String toString() {
  return 'OrganizationSubscription(status: $status, daysLeft: $daysLeft, trialEndsAt: $trialEndsAt, currentPeriodEnd: $currentPeriodEnd, graceEndsAt: $graceEndsAt)';
}


}

/// @nodoc
abstract mixin class _$OrganizationSubscriptionCopyWith<$Res> implements $OrganizationSubscriptionCopyWith<$Res> {
  factory _$OrganizationSubscriptionCopyWith(_OrganizationSubscription value, $Res Function(_OrganizationSubscription) _then) = __$OrganizationSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 SubscriptionStatus? status, int? daysLeft, DateTime? trialEndsAt, DateTime? currentPeriodEnd, DateTime? graceEndsAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? daysLeft = freezed,Object? trialEndsAt = freezed,Object? currentPeriodEnd = freezed,Object? graceEndsAt = freezed,}) {
  return _then(_OrganizationSubscription(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,graceEndsAt: freezed == graceEndsAt ? _self.graceEndsAt : graceEndsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$SubscriptionBanner {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionBanner);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionBanner()';
}


}

/// @nodoc
class $SubscriptionBannerCopyWith<$Res>  {
$SubscriptionBannerCopyWith(SubscriptionBanner _, $Res Function(SubscriptionBanner) __);
}


/// Adds pattern-matching-related methods to [SubscriptionBanner].
extension SubscriptionBannerPatterns on SubscriptionBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubscriptionBannerTrialEnding value)?  trialEnding,TResult Function( SubscriptionBannerPastDue value)?  pastDue,TResult Function( SubscriptionBannerReadOnly value)?  readOnly,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubscriptionBannerTrialEnding() when trialEnding != null:
return trialEnding(_that);case SubscriptionBannerPastDue() when pastDue != null:
return pastDue(_that);case SubscriptionBannerReadOnly() when readOnly != null:
return readOnly(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubscriptionBannerTrialEnding value)  trialEnding,required TResult Function( SubscriptionBannerPastDue value)  pastDue,required TResult Function( SubscriptionBannerReadOnly value)  readOnly,}){
final _that = this;
switch (_that) {
case SubscriptionBannerTrialEnding():
return trialEnding(_that);case SubscriptionBannerPastDue():
return pastDue(_that);case SubscriptionBannerReadOnly():
return readOnly(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubscriptionBannerTrialEnding value)?  trialEnding,TResult? Function( SubscriptionBannerPastDue value)?  pastDue,TResult? Function( SubscriptionBannerReadOnly value)?  readOnly,}){
final _that = this;
switch (_that) {
case SubscriptionBannerTrialEnding() when trialEnding != null:
return trialEnding(_that);case SubscriptionBannerPastDue() when pastDue != null:
return pastDue(_that);case SubscriptionBannerReadOnly() when readOnly != null:
return readOnly(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int daysLeft)?  trialEnding,TResult Function( DateTime? paidUntil,  DateTime? accessUntil)?  pastDue,TResult Function()?  readOnly,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubscriptionBannerTrialEnding() when trialEnding != null:
return trialEnding(_that.daysLeft);case SubscriptionBannerPastDue() when pastDue != null:
return pastDue(_that.paidUntil,_that.accessUntil);case SubscriptionBannerReadOnly() when readOnly != null:
return readOnly();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int daysLeft)  trialEnding,required TResult Function( DateTime? paidUntil,  DateTime? accessUntil)  pastDue,required TResult Function()  readOnly,}) {final _that = this;
switch (_that) {
case SubscriptionBannerTrialEnding():
return trialEnding(_that.daysLeft);case SubscriptionBannerPastDue():
return pastDue(_that.paidUntil,_that.accessUntil);case SubscriptionBannerReadOnly():
return readOnly();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int daysLeft)?  trialEnding,TResult? Function( DateTime? paidUntil,  DateTime? accessUntil)?  pastDue,TResult? Function()?  readOnly,}) {final _that = this;
switch (_that) {
case SubscriptionBannerTrialEnding() when trialEnding != null:
return trialEnding(_that.daysLeft);case SubscriptionBannerPastDue() when pastDue != null:
return pastDue(_that.paidUntil,_that.accessUntil);case SubscriptionBannerReadOnly() when readOnly != null:
return readOnly();case _:
  return null;

}
}

}

/// @nodoc


class SubscriptionBannerTrialEnding implements SubscriptionBanner {
  const SubscriptionBannerTrialEnding(this.daysLeft);
  

 final  int daysLeft;

/// Create a copy of SubscriptionBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionBannerTrialEndingCopyWith<SubscriptionBannerTrialEnding> get copyWith => _$SubscriptionBannerTrialEndingCopyWithImpl<SubscriptionBannerTrialEnding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionBannerTrialEnding&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft));
}


@override
int get hashCode => Object.hash(runtimeType,daysLeft);

@override
String toString() {
  return 'SubscriptionBanner.trialEnding(daysLeft: $daysLeft)';
}


}

/// @nodoc
abstract mixin class $SubscriptionBannerTrialEndingCopyWith<$Res> implements $SubscriptionBannerCopyWith<$Res> {
  factory $SubscriptionBannerTrialEndingCopyWith(SubscriptionBannerTrialEnding value, $Res Function(SubscriptionBannerTrialEnding) _then) = _$SubscriptionBannerTrialEndingCopyWithImpl;
@useResult
$Res call({
 int daysLeft
});




}
/// @nodoc
class _$SubscriptionBannerTrialEndingCopyWithImpl<$Res>
    implements $SubscriptionBannerTrialEndingCopyWith<$Res> {
  _$SubscriptionBannerTrialEndingCopyWithImpl(this._self, this._then);

  final SubscriptionBannerTrialEnding _self;
  final $Res Function(SubscriptionBannerTrialEnding) _then;

/// Create a copy of SubscriptionBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? daysLeft = null,}) {
  return _then(SubscriptionBannerTrialEnding(
null == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SubscriptionBannerPastDue implements SubscriptionBanner {
  const SubscriptionBannerPastDue({this.paidUntil, this.accessUntil});
  

 final  DateTime? paidUntil;
 final  DateTime? accessUntil;

/// Create a copy of SubscriptionBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionBannerPastDueCopyWith<SubscriptionBannerPastDue> get copyWith => _$SubscriptionBannerPastDueCopyWithImpl<SubscriptionBannerPastDue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionBannerPastDue&&(identical(other.paidUntil, paidUntil) || other.paidUntil == paidUntil)&&(identical(other.accessUntil, accessUntil) || other.accessUntil == accessUntil));
}


@override
int get hashCode => Object.hash(runtimeType,paidUntil,accessUntil);

@override
String toString() {
  return 'SubscriptionBanner.pastDue(paidUntil: $paidUntil, accessUntil: $accessUntil)';
}


}

/// @nodoc
abstract mixin class $SubscriptionBannerPastDueCopyWith<$Res> implements $SubscriptionBannerCopyWith<$Res> {
  factory $SubscriptionBannerPastDueCopyWith(SubscriptionBannerPastDue value, $Res Function(SubscriptionBannerPastDue) _then) = _$SubscriptionBannerPastDueCopyWithImpl;
@useResult
$Res call({
 DateTime? paidUntil, DateTime? accessUntil
});




}
/// @nodoc
class _$SubscriptionBannerPastDueCopyWithImpl<$Res>
    implements $SubscriptionBannerPastDueCopyWith<$Res> {
  _$SubscriptionBannerPastDueCopyWithImpl(this._self, this._then);

  final SubscriptionBannerPastDue _self;
  final $Res Function(SubscriptionBannerPastDue) _then;

/// Create a copy of SubscriptionBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paidUntil = freezed,Object? accessUntil = freezed,}) {
  return _then(SubscriptionBannerPastDue(
paidUntil: freezed == paidUntil ? _self.paidUntil : paidUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,accessUntil: freezed == accessUntil ? _self.accessUntil : accessUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class SubscriptionBannerReadOnly implements SubscriptionBanner {
  const SubscriptionBannerReadOnly();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionBannerReadOnly);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscriptionBanner.readOnly()';
}


}




// dart format on
