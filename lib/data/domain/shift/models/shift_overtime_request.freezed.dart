// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_overtime_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftOvertimeRequest {

 String get id; int get minutes; OvertimeStatus get status; String get comment; String? get reviewComment; DateTime? get reviewedAt; DateTime get createdAt;
/// Create a copy of ShiftOvertimeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftOvertimeRequestCopyWith<ShiftOvertimeRequest> get copyWith => _$ShiftOvertimeRequestCopyWithImpl<ShiftOvertimeRequest>(this as ShiftOvertimeRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftOvertimeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.reviewComment, reviewComment) || other.reviewComment == reviewComment)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,minutes,status,comment,reviewComment,reviewedAt,createdAt);

@override
String toString() {
  return 'ShiftOvertimeRequest(id: $id, minutes: $minutes, status: $status, comment: $comment, reviewComment: $reviewComment, reviewedAt: $reviewedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShiftOvertimeRequestCopyWith<$Res>  {
  factory $ShiftOvertimeRequestCopyWith(ShiftOvertimeRequest value, $Res Function(ShiftOvertimeRequest) _then) = _$ShiftOvertimeRequestCopyWithImpl;
@useResult
$Res call({
 String id, int minutes, OvertimeStatus status, String comment, String? reviewComment, DateTime? reviewedAt, DateTime createdAt
});




}
/// @nodoc
class _$ShiftOvertimeRequestCopyWithImpl<$Res>
    implements $ShiftOvertimeRequestCopyWith<$Res> {
  _$ShiftOvertimeRequestCopyWithImpl(this._self, this._then);

  final ShiftOvertimeRequest _self;
  final $Res Function(ShiftOvertimeRequest) _then;

/// Create a copy of ShiftOvertimeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? minutes = null,Object? status = null,Object? comment = null,Object? reviewComment = freezed,Object? reviewedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OvertimeStatus,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,reviewComment: freezed == reviewComment ? _self.reviewComment : reviewComment // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftOvertimeRequest].
extension ShiftOvertimeRequestPatterns on ShiftOvertimeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftOvertimeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftOvertimeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftOvertimeRequest value)  $default,){
final _that = this;
switch (_that) {
case _ShiftOvertimeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftOvertimeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftOvertimeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int minutes,  OvertimeStatus status,  String comment,  String? reviewComment,  DateTime? reviewedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftOvertimeRequest() when $default != null:
return $default(_that.id,_that.minutes,_that.status,_that.comment,_that.reviewComment,_that.reviewedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int minutes,  OvertimeStatus status,  String comment,  String? reviewComment,  DateTime? reviewedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ShiftOvertimeRequest():
return $default(_that.id,_that.minutes,_that.status,_that.comment,_that.reviewComment,_that.reviewedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int minutes,  OvertimeStatus status,  String comment,  String? reviewComment,  DateTime? reviewedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ShiftOvertimeRequest() when $default != null:
return $default(_that.id,_that.minutes,_that.status,_that.comment,_that.reviewComment,_that.reviewedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftOvertimeRequest implements ShiftOvertimeRequest {
  const _ShiftOvertimeRequest({required this.id, required this.minutes, required this.status, required this.comment, this.reviewComment, this.reviewedAt, required this.createdAt});
  

@override final  String id;
@override final  int minutes;
@override final  OvertimeStatus status;
@override final  String comment;
@override final  String? reviewComment;
@override final  DateTime? reviewedAt;
@override final  DateTime createdAt;

/// Create a copy of ShiftOvertimeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftOvertimeRequestCopyWith<_ShiftOvertimeRequest> get copyWith => __$ShiftOvertimeRequestCopyWithImpl<_ShiftOvertimeRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftOvertimeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.reviewComment, reviewComment) || other.reviewComment == reviewComment)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,minutes,status,comment,reviewComment,reviewedAt,createdAt);

@override
String toString() {
  return 'ShiftOvertimeRequest(id: $id, minutes: $minutes, status: $status, comment: $comment, reviewComment: $reviewComment, reviewedAt: $reviewedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShiftOvertimeRequestCopyWith<$Res> implements $ShiftOvertimeRequestCopyWith<$Res> {
  factory _$ShiftOvertimeRequestCopyWith(_ShiftOvertimeRequest value, $Res Function(_ShiftOvertimeRequest) _then) = __$ShiftOvertimeRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, int minutes, OvertimeStatus status, String comment, String? reviewComment, DateTime? reviewedAt, DateTime createdAt
});




}
/// @nodoc
class __$ShiftOvertimeRequestCopyWithImpl<$Res>
    implements _$ShiftOvertimeRequestCopyWith<$Res> {
  __$ShiftOvertimeRequestCopyWithImpl(this._self, this._then);

  final _ShiftOvertimeRequest _self;
  final $Res Function(_ShiftOvertimeRequest) _then;

/// Create a copy of ShiftOvertimeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? minutes = null,Object? status = null,Object? comment = null,Object? reviewComment = freezed,Object? reviewedAt = freezed,Object? createdAt = null,}) {
  return _then(_ShiftOvertimeRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OvertimeStatus,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,reviewComment: freezed == reviewComment ? _self.reviewComment : reviewComment // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
