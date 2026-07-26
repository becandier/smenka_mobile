// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {

 PaginatedSectionData<AppNotification> get feed;/// Счётчик непрочитанных для бейджа колокольчика. Обновляется при заходе
/// в шелл (конструктор), на pull-to-refresh ленты и после read/read-all.
/// Намеренно без отдельного `FeatureStatus` — сбой обновления счётчика
/// не критичен для UX, просто оставляем прежнее значение.
 int get unreadCount; bool get markingAllRead;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.markingAllRead, markingAllRead) || other.markingAllRead == markingAllRead));
}


@override
int get hashCode => Object.hash(runtimeType,feed,unreadCount,markingAllRead);

@override
String toString() {
  return 'NotificationsState(feed: $feed, unreadCount: $unreadCount, markingAllRead: $markingAllRead)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 PaginatedSectionData<AppNotification> feed, int unreadCount, bool markingAllRead
});


$PaginatedSectionDataCopyWith<AppNotification, $Res> get feed;

}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feed = null,Object? unreadCount = null,Object? markingAllRead = null,}) {
  return _then(_self.copyWith(
feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<AppNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,markingAllRead: null == markingAllRead ? _self.markingAllRead : markingAllRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<AppNotification, $Res> get feed {
  
  return $PaginatedSectionDataCopyWith<AppNotification, $Res>(_self.feed, (value) {
    return _then(_self.copyWith(feed: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaginatedSectionData<AppNotification> feed,  int unreadCount,  bool markingAllRead)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.feed,_that.unreadCount,_that.markingAllRead);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaginatedSectionData<AppNotification> feed,  int unreadCount,  bool markingAllRead)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.feed,_that.unreadCount,_that.markingAllRead);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaginatedSectionData<AppNotification> feed,  int unreadCount,  bool markingAllRead)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.feed,_that.unreadCount,_that.markingAllRead);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState implements NotificationsState {
  const _NotificationsState({this.feed = const PaginatedSectionData<AppNotification>(), this.unreadCount = 0, this.markingAllRead = false});
  

@override@JsonKey() final  PaginatedSectionData<AppNotification> feed;
/// Счётчик непрочитанных для бейджа колокольчика. Обновляется при заходе
/// в шелл (конструктор), на pull-to-refresh ленты и после read/read-all.
/// Намеренно без отдельного `FeatureStatus` — сбой обновления счётчика
/// не критичен для UX, просто оставляем прежнее значение.
@override@JsonKey() final  int unreadCount;
@override@JsonKey() final  bool markingAllRead;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&(identical(other.feed, feed) || other.feed == feed)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.markingAllRead, markingAllRead) || other.markingAllRead == markingAllRead));
}


@override
int get hashCode => Object.hash(runtimeType,feed,unreadCount,markingAllRead);

@override
String toString() {
  return 'NotificationsState(feed: $feed, unreadCount: $unreadCount, markingAllRead: $markingAllRead)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 PaginatedSectionData<AppNotification> feed, int unreadCount, bool markingAllRead
});


@override $PaginatedSectionDataCopyWith<AppNotification, $Res> get feed;

}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feed = null,Object? unreadCount = null,Object? markingAllRead = null,}) {
  return _then(_NotificationsState(
feed: null == feed ? _self.feed : feed // ignore: cast_nullable_to_non_nullable
as PaginatedSectionData<AppNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,markingAllRead: null == markingAllRead ? _self.markingAllRead : markingAllRead // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedSectionDataCopyWith<AppNotification, $Res> get feed {
  
  return $PaginatedSectionDataCopyWith<AppNotification, $Res>(_self.feed, (value) {
    return _then(_self.copyWith(feed: value));
  });
}
}

// dart format on
