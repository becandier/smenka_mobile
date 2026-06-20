// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_fill_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChecklistFillState {

 SectionData<ChecklistInstanceDetail> get instance; Map<String, FeatureStatus> get itemStatuses; String? get saveError;/// Только чтение — редактирование пунктов и фото недоступно (просмотр
/// чужой/завершённой смены). Чекбоксы, комментарии и кнопки фото неактивны.
 bool get readOnly;/// Черновики загрузки фото (uploading/error) по `item.id`. Серверные фото
/// лежат в `instance.data.items[].photos` и тут не дублируются.
 Map<String, List<ChecklistPhotoDraft>> get photoDrafts;/// Одноразовый нотис (info/warning) — view показывает тостом и сбрасывает.
 PhotoNotice? get notice;/// Одноразовый `error.code` действия с фото (напр. удаление/лимит) — view
/// показывает локализованным тостом и сбрасывает.
 String? get actionErrorCode;
/// Create a copy of ChecklistFillState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistFillStateCopyWith<ChecklistFillState> get copyWith => _$ChecklistFillStateCopyWithImpl<ChecklistFillState>(this as ChecklistFillState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistFillState&&(identical(other.instance, instance) || other.instance == instance)&&const DeepCollectionEquality().equals(other.itemStatuses, itemStatuses)&&(identical(other.saveError, saveError) || other.saveError == saveError)&&(identical(other.readOnly, readOnly) || other.readOnly == readOnly)&&const DeepCollectionEquality().equals(other.photoDrafts, photoDrafts)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.actionErrorCode, actionErrorCode) || other.actionErrorCode == actionErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,instance,const DeepCollectionEquality().hash(itemStatuses),saveError,readOnly,const DeepCollectionEquality().hash(photoDrafts),notice,actionErrorCode);

@override
String toString() {
  return 'ChecklistFillState(instance: $instance, itemStatuses: $itemStatuses, saveError: $saveError, readOnly: $readOnly, photoDrafts: $photoDrafts, notice: $notice, actionErrorCode: $actionErrorCode)';
}


}

/// @nodoc
abstract mixin class $ChecklistFillStateCopyWith<$Res>  {
  factory $ChecklistFillStateCopyWith(ChecklistFillState value, $Res Function(ChecklistFillState) _then) = _$ChecklistFillStateCopyWithImpl;
@useResult
$Res call({
 SectionData<ChecklistInstanceDetail> instance, Map<String, FeatureStatus> itemStatuses, String? saveError, bool readOnly, Map<String, List<ChecklistPhotoDraft>> photoDrafts, PhotoNotice? notice, String? actionErrorCode
});


$SectionDataCopyWith<ChecklistInstanceDetail, $Res> get instance;

}
/// @nodoc
class _$ChecklistFillStateCopyWithImpl<$Res>
    implements $ChecklistFillStateCopyWith<$Res> {
  _$ChecklistFillStateCopyWithImpl(this._self, this._then);

  final ChecklistFillState _self;
  final $Res Function(ChecklistFillState) _then;

/// Create a copy of ChecklistFillState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? instance = null,Object? itemStatuses = null,Object? saveError = freezed,Object? readOnly = null,Object? photoDrafts = null,Object? notice = freezed,Object? actionErrorCode = freezed,}) {
  return _then(_self.copyWith(
instance: null == instance ? _self.instance : instance // ignore: cast_nullable_to_non_nullable
as SectionData<ChecklistInstanceDetail>,itemStatuses: null == itemStatuses ? _self.itemStatuses : itemStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, FeatureStatus>,saveError: freezed == saveError ? _self.saveError : saveError // ignore: cast_nullable_to_non_nullable
as String?,readOnly: null == readOnly ? _self.readOnly : readOnly // ignore: cast_nullable_to_non_nullable
as bool,photoDrafts: null == photoDrafts ? _self.photoDrafts : photoDrafts // ignore: cast_nullable_to_non_nullable
as Map<String, List<ChecklistPhotoDraft>>,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as PhotoNotice?,actionErrorCode: freezed == actionErrorCode ? _self.actionErrorCode : actionErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ChecklistFillState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<ChecklistInstanceDetail, $Res> get instance {
  
  return $SectionDataCopyWith<ChecklistInstanceDetail, $Res>(_self.instance, (value) {
    return _then(_self.copyWith(instance: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChecklistFillState].
extension ChecklistFillStatePatterns on ChecklistFillState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistFillState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistFillState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistFillState value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistFillState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistFillState value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistFillState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<ChecklistInstanceDetail> instance,  Map<String, FeatureStatus> itemStatuses,  String? saveError,  bool readOnly,  Map<String, List<ChecklistPhotoDraft>> photoDrafts,  PhotoNotice? notice,  String? actionErrorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistFillState() when $default != null:
return $default(_that.instance,_that.itemStatuses,_that.saveError,_that.readOnly,_that.photoDrafts,_that.notice,_that.actionErrorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<ChecklistInstanceDetail> instance,  Map<String, FeatureStatus> itemStatuses,  String? saveError,  bool readOnly,  Map<String, List<ChecklistPhotoDraft>> photoDrafts,  PhotoNotice? notice,  String? actionErrorCode)  $default,) {final _that = this;
switch (_that) {
case _ChecklistFillState():
return $default(_that.instance,_that.itemStatuses,_that.saveError,_that.readOnly,_that.photoDrafts,_that.notice,_that.actionErrorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<ChecklistInstanceDetail> instance,  Map<String, FeatureStatus> itemStatuses,  String? saveError,  bool readOnly,  Map<String, List<ChecklistPhotoDraft>> photoDrafts,  PhotoNotice? notice,  String? actionErrorCode)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistFillState() when $default != null:
return $default(_that.instance,_that.itemStatuses,_that.saveError,_that.readOnly,_that.photoDrafts,_that.notice,_that.actionErrorCode);case _:
  return null;

}
}

}

/// @nodoc


class _ChecklistFillState implements ChecklistFillState {
  const _ChecklistFillState({this.instance = const SectionData<ChecklistInstanceDetail>(), final  Map<String, FeatureStatus> itemStatuses = const <String, FeatureStatus>{}, this.saveError, this.readOnly = false, final  Map<String, List<ChecklistPhotoDraft>> photoDrafts = const <String, List<ChecklistPhotoDraft>>{}, this.notice, this.actionErrorCode}): _itemStatuses = itemStatuses,_photoDrafts = photoDrafts;
  

@override@JsonKey() final  SectionData<ChecklistInstanceDetail> instance;
 final  Map<String, FeatureStatus> _itemStatuses;
@override@JsonKey() Map<String, FeatureStatus> get itemStatuses {
  if (_itemStatuses is EqualUnmodifiableMapView) return _itemStatuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_itemStatuses);
}

@override final  String? saveError;
/// Только чтение — редактирование пунктов и фото недоступно (просмотр
/// чужой/завершённой смены). Чекбоксы, комментарии и кнопки фото неактивны.
@override@JsonKey() final  bool readOnly;
/// Черновики загрузки фото (uploading/error) по `item.id`. Серверные фото
/// лежат в `instance.data.items[].photos` и тут не дублируются.
 final  Map<String, List<ChecklistPhotoDraft>> _photoDrafts;
/// Черновики загрузки фото (uploading/error) по `item.id`. Серверные фото
/// лежат в `instance.data.items[].photos` и тут не дублируются.
@override@JsonKey() Map<String, List<ChecklistPhotoDraft>> get photoDrafts {
  if (_photoDrafts is EqualUnmodifiableMapView) return _photoDrafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_photoDrafts);
}

/// Одноразовый нотис (info/warning) — view показывает тостом и сбрасывает.
@override final  PhotoNotice? notice;
/// Одноразовый `error.code` действия с фото (напр. удаление/лимит) — view
/// показывает локализованным тостом и сбрасывает.
@override final  String? actionErrorCode;

/// Create a copy of ChecklistFillState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistFillStateCopyWith<_ChecklistFillState> get copyWith => __$ChecklistFillStateCopyWithImpl<_ChecklistFillState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistFillState&&(identical(other.instance, instance) || other.instance == instance)&&const DeepCollectionEquality().equals(other._itemStatuses, _itemStatuses)&&(identical(other.saveError, saveError) || other.saveError == saveError)&&(identical(other.readOnly, readOnly) || other.readOnly == readOnly)&&const DeepCollectionEquality().equals(other._photoDrafts, _photoDrafts)&&(identical(other.notice, notice) || other.notice == notice)&&(identical(other.actionErrorCode, actionErrorCode) || other.actionErrorCode == actionErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,instance,const DeepCollectionEquality().hash(_itemStatuses),saveError,readOnly,const DeepCollectionEquality().hash(_photoDrafts),notice,actionErrorCode);

@override
String toString() {
  return 'ChecklistFillState(instance: $instance, itemStatuses: $itemStatuses, saveError: $saveError, readOnly: $readOnly, photoDrafts: $photoDrafts, notice: $notice, actionErrorCode: $actionErrorCode)';
}


}

/// @nodoc
abstract mixin class _$ChecklistFillStateCopyWith<$Res> implements $ChecklistFillStateCopyWith<$Res> {
  factory _$ChecklistFillStateCopyWith(_ChecklistFillState value, $Res Function(_ChecklistFillState) _then) = __$ChecklistFillStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<ChecklistInstanceDetail> instance, Map<String, FeatureStatus> itemStatuses, String? saveError, bool readOnly, Map<String, List<ChecklistPhotoDraft>> photoDrafts, PhotoNotice? notice, String? actionErrorCode
});


@override $SectionDataCopyWith<ChecklistInstanceDetail, $Res> get instance;

}
/// @nodoc
class __$ChecklistFillStateCopyWithImpl<$Res>
    implements _$ChecklistFillStateCopyWith<$Res> {
  __$ChecklistFillStateCopyWithImpl(this._self, this._then);

  final _ChecklistFillState _self;
  final $Res Function(_ChecklistFillState) _then;

/// Create a copy of ChecklistFillState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instance = null,Object? itemStatuses = null,Object? saveError = freezed,Object? readOnly = null,Object? photoDrafts = null,Object? notice = freezed,Object? actionErrorCode = freezed,}) {
  return _then(_ChecklistFillState(
instance: null == instance ? _self.instance : instance // ignore: cast_nullable_to_non_nullable
as SectionData<ChecklistInstanceDetail>,itemStatuses: null == itemStatuses ? _self._itemStatuses : itemStatuses // ignore: cast_nullable_to_non_nullable
as Map<String, FeatureStatus>,saveError: freezed == saveError ? _self.saveError : saveError // ignore: cast_nullable_to_non_nullable
as String?,readOnly: null == readOnly ? _self.readOnly : readOnly // ignore: cast_nullable_to_non_nullable
as bool,photoDrafts: null == photoDrafts ? _self._photoDrafts : photoDrafts // ignore: cast_nullable_to_non_nullable
as Map<String, List<ChecklistPhotoDraft>>,notice: freezed == notice ? _self.notice : notice // ignore: cast_nullable_to_non_nullable
as PhotoNotice?,actionErrorCode: freezed == actionErrorCode ? _self.actionErrorCode : actionErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChecklistFillState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<ChecklistInstanceDetail, $Res> get instance {
  
  return $SectionDataCopyWith<ChecklistInstanceDetail, $Res>(_self.instance, (value) {
    return _then(_self.copyWith(instance: value));
  });
}
}

// dart format on
