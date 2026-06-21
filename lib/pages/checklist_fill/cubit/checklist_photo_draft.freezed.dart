// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_photo_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChecklistPhotoDraft {

 String get draftId; String get itemId; PhotoDraftStatus get status; double get progress; String? get errorCode;
/// Create a copy of ChecklistPhotoDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistPhotoDraftCopyWith<ChecklistPhotoDraft> get copyWith => _$ChecklistPhotoDraftCopyWithImpl<ChecklistPhotoDraft>(this as ChecklistPhotoDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistPhotoDraft&&(identical(other.draftId, draftId) || other.draftId == draftId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,draftId,itemId,status,progress,errorCode);

@override
String toString() {
  return 'ChecklistPhotoDraft(draftId: $draftId, itemId: $itemId, status: $status, progress: $progress, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $ChecklistPhotoDraftCopyWith<$Res>  {
  factory $ChecklistPhotoDraftCopyWith(ChecklistPhotoDraft value, $Res Function(ChecklistPhotoDraft) _then) = _$ChecklistPhotoDraftCopyWithImpl;
@useResult
$Res call({
 String draftId, String itemId, PhotoDraftStatus status, double progress, String? errorCode
});




}
/// @nodoc
class _$ChecklistPhotoDraftCopyWithImpl<$Res>
    implements $ChecklistPhotoDraftCopyWith<$Res> {
  _$ChecklistPhotoDraftCopyWithImpl(this._self, this._then);

  final ChecklistPhotoDraft _self;
  final $Res Function(ChecklistPhotoDraft) _then;

/// Create a copy of ChecklistPhotoDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draftId = null,Object? itemId = null,Object? status = null,Object? progress = null,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
draftId: null == draftId ? _self.draftId : draftId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotoDraftStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistPhotoDraft].
extension ChecklistPhotoDraftPatterns on ChecklistPhotoDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistPhotoDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistPhotoDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistPhotoDraft value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistPhotoDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistPhotoDraft value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistPhotoDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String draftId,  String itemId,  PhotoDraftStatus status,  double progress,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistPhotoDraft() when $default != null:
return $default(_that.draftId,_that.itemId,_that.status,_that.progress,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String draftId,  String itemId,  PhotoDraftStatus status,  double progress,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _ChecklistPhotoDraft():
return $default(_that.draftId,_that.itemId,_that.status,_that.progress,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String draftId,  String itemId,  PhotoDraftStatus status,  double progress,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistPhotoDraft() when $default != null:
return $default(_that.draftId,_that.itemId,_that.status,_that.progress,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistPhotoDraft implements ChecklistPhotoDraft {
  const _ChecklistPhotoDraft({required this.draftId, required this.itemId, required this.status, this.progress = 0.0, this.errorCode});
  

@override final  String draftId;
@override final  String itemId;
@override final  PhotoDraftStatus status;
@override@JsonKey() final  double progress;
@override final  String? errorCode;

/// Create a copy of ChecklistPhotoDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistPhotoDraftCopyWith<_ChecklistPhotoDraft> get copyWith => __$ChecklistPhotoDraftCopyWithImpl<_ChecklistPhotoDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistPhotoDraft&&(identical(other.draftId, draftId) || other.draftId == draftId)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,draftId,itemId,status,progress,errorCode);

@override
String toString() {
  return 'ChecklistPhotoDraft(draftId: $draftId, itemId: $itemId, status: $status, progress: $progress, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$ChecklistPhotoDraftCopyWith<$Res> implements $ChecklistPhotoDraftCopyWith<$Res> {
  factory _$ChecklistPhotoDraftCopyWith(_ChecklistPhotoDraft value, $Res Function(_ChecklistPhotoDraft) _then) = __$ChecklistPhotoDraftCopyWithImpl;
@override @useResult
$Res call({
 String draftId, String itemId, PhotoDraftStatus status, double progress, String? errorCode
});




}
/// @nodoc
class __$ChecklistPhotoDraftCopyWithImpl<$Res>
    implements _$ChecklistPhotoDraftCopyWith<$Res> {
  __$ChecklistPhotoDraftCopyWithImpl(this._self, this._then);

  final _ChecklistPhotoDraft _self;
  final $Res Function(_ChecklistPhotoDraft) _then;

/// Create a copy of ChecklistPhotoDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draftId = null,Object? itemId = null,Object? status = null,Object? progress = null,Object? errorCode = freezed,}) {
  return _then(_ChecklistPhotoDraft(
draftId: null == draftId ? _self.draftId : draftId // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotoDraftStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
