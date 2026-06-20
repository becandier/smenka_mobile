// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistItemsSummaryDto {

 int get total; int get completed;// nullable (не @Default): старый бэк поля не пришлёт — в маппере падаем на
// completed, чтобы прогресс не обнулялся (а не на 0).
 int? get satisfiedCount; int get photosRequiredMissing;
/// Create a copy of ChecklistItemsSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemsSummaryDtoCopyWith<ChecklistItemsSummaryDto> get copyWith => _$ChecklistItemsSummaryDtoCopyWithImpl<ChecklistItemsSummaryDto>(this as ChecklistItemsSummaryDto, _$identity);

  /// Serializes this ChecklistItemsSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItemsSummaryDto&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.satisfiedCount, satisfiedCount) || other.satisfiedCount == satisfiedCount)&&(identical(other.photosRequiredMissing, photosRequiredMissing) || other.photosRequiredMissing == photosRequiredMissing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,completed,satisfiedCount,photosRequiredMissing);

@override
String toString() {
  return 'ChecklistItemsSummaryDto(total: $total, completed: $completed, satisfiedCount: $satisfiedCount, photosRequiredMissing: $photosRequiredMissing)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemsSummaryDtoCopyWith<$Res>  {
  factory $ChecklistItemsSummaryDtoCopyWith(ChecklistItemsSummaryDto value, $Res Function(ChecklistItemsSummaryDto) _then) = _$ChecklistItemsSummaryDtoCopyWithImpl;
@useResult
$Res call({
 int total, int completed, int? satisfiedCount, int photosRequiredMissing
});




}
/// @nodoc
class _$ChecklistItemsSummaryDtoCopyWithImpl<$Res>
    implements $ChecklistItemsSummaryDtoCopyWith<$Res> {
  _$ChecklistItemsSummaryDtoCopyWithImpl(this._self, this._then);

  final ChecklistItemsSummaryDto _self;
  final $Res Function(ChecklistItemsSummaryDto) _then;

/// Create a copy of ChecklistItemsSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? completed = null,Object? satisfiedCount = freezed,Object? photosRequiredMissing = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,satisfiedCount: freezed == satisfiedCount ? _self.satisfiedCount : satisfiedCount // ignore: cast_nullable_to_non_nullable
as int?,photosRequiredMissing: null == photosRequiredMissing ? _self.photosRequiredMissing : photosRequiredMissing // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItemsSummaryDto].
extension ChecklistItemsSummaryDtoPatterns on ChecklistItemsSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItemsSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItemsSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItemsSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemsSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItemsSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemsSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int completed,  int? satisfiedCount,  int photosRequiredMissing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItemsSummaryDto() when $default != null:
return $default(_that.total,_that.completed,_that.satisfiedCount,_that.photosRequiredMissing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int completed,  int? satisfiedCount,  int photosRequiredMissing)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemsSummaryDto():
return $default(_that.total,_that.completed,_that.satisfiedCount,_that.photosRequiredMissing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int completed,  int? satisfiedCount,  int photosRequiredMissing)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemsSummaryDto() when $default != null:
return $default(_that.total,_that.completed,_that.satisfiedCount,_that.photosRequiredMissing);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistItemsSummaryDto implements ChecklistItemsSummaryDto {
  const _ChecklistItemsSummaryDto({required this.total, required this.completed, this.satisfiedCount, this.photosRequiredMissing = 0});
  factory _ChecklistItemsSummaryDto.fromJson(Map<String, dynamic> json) => _$ChecklistItemsSummaryDtoFromJson(json);

@override final  int total;
@override final  int completed;
// nullable (не @Default): старый бэк поля не пришлёт — в маппере падаем на
// completed, чтобы прогресс не обнулялся (а не на 0).
@override final  int? satisfiedCount;
@override@JsonKey() final  int photosRequiredMissing;

/// Create a copy of ChecklistItemsSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemsSummaryDtoCopyWith<_ChecklistItemsSummaryDto> get copyWith => __$ChecklistItemsSummaryDtoCopyWithImpl<_ChecklistItemsSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistItemsSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItemsSummaryDto&&(identical(other.total, total) || other.total == total)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.satisfiedCount, satisfiedCount) || other.satisfiedCount == satisfiedCount)&&(identical(other.photosRequiredMissing, photosRequiredMissing) || other.photosRequiredMissing == photosRequiredMissing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,completed,satisfiedCount,photosRequiredMissing);

@override
String toString() {
  return 'ChecklistItemsSummaryDto(total: $total, completed: $completed, satisfiedCount: $satisfiedCount, photosRequiredMissing: $photosRequiredMissing)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemsSummaryDtoCopyWith<$Res> implements $ChecklistItemsSummaryDtoCopyWith<$Res> {
  factory _$ChecklistItemsSummaryDtoCopyWith(_ChecklistItemsSummaryDto value, $Res Function(_ChecklistItemsSummaryDto) _then) = __$ChecklistItemsSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int total, int completed, int? satisfiedCount, int photosRequiredMissing
});




}
/// @nodoc
class __$ChecklistItemsSummaryDtoCopyWithImpl<$Res>
    implements _$ChecklistItemsSummaryDtoCopyWith<$Res> {
  __$ChecklistItemsSummaryDtoCopyWithImpl(this._self, this._then);

  final _ChecklistItemsSummaryDto _self;
  final $Res Function(_ChecklistItemsSummaryDto) _then;

/// Create a copy of ChecklistItemsSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? completed = null,Object? satisfiedCount = freezed,Object? photosRequiredMissing = null,}) {
  return _then(_ChecklistItemsSummaryDto(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,satisfiedCount: freezed == satisfiedCount ? _self.satisfiedCount : satisfiedCount // ignore: cast_nullable_to_non_nullable
as int?,photosRequiredMissing: null == photosRequiredMissing ? _self.photosRequiredMissing : photosRequiredMissing // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChecklistInstanceDto {

 String get id; String get name; String get type; bool get isRequired; String get status; ChecklistItemsSummaryDto get itemsSummary; DateTime get createdAt; DateTime? get completedAt;
/// Create a copy of ChecklistInstanceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistInstanceDtoCopyWith<ChecklistInstanceDto> get copyWith => _$ChecklistInstanceDtoCopyWithImpl<ChecklistInstanceDto>(this as ChecklistInstanceDto, _$identity);

  /// Serializes this ChecklistInstanceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistInstanceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemsSummary, itemsSummary) || other.itemsSummary == itemsSummary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,status,itemsSummary,createdAt,completedAt);

@override
String toString() {
  return 'ChecklistInstanceDto(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, itemsSummary: $itemsSummary, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $ChecklistInstanceDtoCopyWith<$Res>  {
  factory $ChecklistInstanceDtoCopyWith(ChecklistInstanceDto value, $Res Function(ChecklistInstanceDto) _then) = _$ChecklistInstanceDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, bool isRequired, String status, ChecklistItemsSummaryDto itemsSummary, DateTime createdAt, DateTime? completedAt
});


$ChecklistItemsSummaryDtoCopyWith<$Res> get itemsSummary;

}
/// @nodoc
class _$ChecklistInstanceDtoCopyWithImpl<$Res>
    implements $ChecklistInstanceDtoCopyWith<$Res> {
  _$ChecklistInstanceDtoCopyWithImpl(this._self, this._then);

  final ChecklistInstanceDto _self;
  final $Res Function(ChecklistInstanceDto) _then;

/// Create a copy of ChecklistInstanceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? status = null,Object? itemsSummary = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,itemsSummary: null == itemsSummary ? _self.itemsSummary : itemsSummary // ignore: cast_nullable_to_non_nullable
as ChecklistItemsSummaryDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ChecklistInstanceDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChecklistItemsSummaryDtoCopyWith<$Res> get itemsSummary {
  
  return $ChecklistItemsSummaryDtoCopyWith<$Res>(_self.itemsSummary, (value) {
    return _then(_self.copyWith(itemsSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChecklistInstanceDto].
extension ChecklistInstanceDtoPatterns on ChecklistInstanceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistInstanceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistInstanceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistInstanceDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistInstanceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistInstanceDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistInstanceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  String status,  ChecklistItemsSummaryDto itemsSummary,  DateTime createdAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistInstanceDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.status,_that.itemsSummary,_that.createdAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  String status,  ChecklistItemsSummaryDto itemsSummary,  DateTime createdAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistInstanceDto():
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.status,_that.itemsSummary,_that.createdAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  bool isRequired,  String status,  ChecklistItemsSummaryDto itemsSummary,  DateTime createdAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistInstanceDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.status,_that.itemsSummary,_that.createdAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistInstanceDto implements ChecklistInstanceDto {
  const _ChecklistInstanceDto({required this.id, required this.name, required this.type, required this.isRequired, required this.status, required this.itemsSummary, required this.createdAt, this.completedAt});
  factory _ChecklistInstanceDto.fromJson(Map<String, dynamic> json) => _$ChecklistInstanceDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  bool isRequired;
@override final  String status;
@override final  ChecklistItemsSummaryDto itemsSummary;
@override final  DateTime createdAt;
@override final  DateTime? completedAt;

/// Create a copy of ChecklistInstanceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistInstanceDtoCopyWith<_ChecklistInstanceDto> get copyWith => __$ChecklistInstanceDtoCopyWithImpl<_ChecklistInstanceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistInstanceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistInstanceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemsSummary, itemsSummary) || other.itemsSummary == itemsSummary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,status,itemsSummary,createdAt,completedAt);

@override
String toString() {
  return 'ChecklistInstanceDto(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, itemsSummary: $itemsSummary, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistInstanceDtoCopyWith<$Res> implements $ChecklistInstanceDtoCopyWith<$Res> {
  factory _$ChecklistInstanceDtoCopyWith(_ChecklistInstanceDto value, $Res Function(_ChecklistInstanceDto) _then) = __$ChecklistInstanceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, bool isRequired, String status, ChecklistItemsSummaryDto itemsSummary, DateTime createdAt, DateTime? completedAt
});


@override $ChecklistItemsSummaryDtoCopyWith<$Res> get itemsSummary;

}
/// @nodoc
class __$ChecklistInstanceDtoCopyWithImpl<$Res>
    implements _$ChecklistInstanceDtoCopyWith<$Res> {
  __$ChecklistInstanceDtoCopyWithImpl(this._self, this._then);

  final _ChecklistInstanceDto _self;
  final $Res Function(_ChecklistInstanceDto) _then;

/// Create a copy of ChecklistInstanceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? status = null,Object? itemsSummary = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_ChecklistInstanceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,itemsSummary: null == itemsSummary ? _self.itemsSummary : itemsSummary // ignore: cast_nullable_to_non_nullable
as ChecklistItemsSummaryDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ChecklistInstanceDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChecklistItemsSummaryDtoCopyWith<$Res> get itemsSummary {
  
  return $ChecklistItemsSummaryDtoCopyWith<$Res>(_self.itemsSummary, (value) {
    return _then(_self.copyWith(itemsSummary: value));
  });
}
}


/// @nodoc
mixin _$ChecklistInstanceDetailDto {

 String get id; String get name; String get type; bool get isRequired; String get status; DateTime get createdAt; List<ChecklistInstanceItemDto> get items; DateTime? get completedAt; int? get maxPhotosPerItem;
/// Create a copy of ChecklistInstanceDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistInstanceDetailDtoCopyWith<ChecklistInstanceDetailDto> get copyWith => _$ChecklistInstanceDetailDtoCopyWithImpl<ChecklistInstanceDetailDto>(this as ChecklistInstanceDetailDto, _$identity);

  /// Serializes this ChecklistInstanceDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistInstanceDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.maxPhotosPerItem, maxPhotosPerItem) || other.maxPhotosPerItem == maxPhotosPerItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,status,createdAt,const DeepCollectionEquality().hash(items),completedAt,maxPhotosPerItem);

@override
String toString() {
  return 'ChecklistInstanceDetailDto(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, createdAt: $createdAt, items: $items, completedAt: $completedAt, maxPhotosPerItem: $maxPhotosPerItem)';
}


}

/// @nodoc
abstract mixin class $ChecklistInstanceDetailDtoCopyWith<$Res>  {
  factory $ChecklistInstanceDetailDtoCopyWith(ChecklistInstanceDetailDto value, $Res Function(ChecklistInstanceDetailDto) _then) = _$ChecklistInstanceDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, bool isRequired, String status, DateTime createdAt, List<ChecklistInstanceItemDto> items, DateTime? completedAt, int? maxPhotosPerItem
});




}
/// @nodoc
class _$ChecklistInstanceDetailDtoCopyWithImpl<$Res>
    implements $ChecklistInstanceDetailDtoCopyWith<$Res> {
  _$ChecklistInstanceDetailDtoCopyWithImpl(this._self, this._then);

  final ChecklistInstanceDetailDto _self;
  final $Res Function(ChecklistInstanceDetailDto) _then;

/// Create a copy of ChecklistInstanceDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? status = null,Object? createdAt = null,Object? items = null,Object? completedAt = freezed,Object? maxPhotosPerItem = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistInstanceItemDto>,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maxPhotosPerItem: freezed == maxPhotosPerItem ? _self.maxPhotosPerItem : maxPhotosPerItem // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistInstanceDetailDto].
extension ChecklistInstanceDetailDtoPatterns on ChecklistInstanceDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistInstanceDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistInstanceDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistInstanceDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistInstanceDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistInstanceDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistInstanceDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  String status,  DateTime createdAt,  List<ChecklistInstanceItemDto> items,  DateTime? completedAt,  int? maxPhotosPerItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistInstanceDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.status,_that.createdAt,_that.items,_that.completedAt,_that.maxPhotosPerItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  bool isRequired,  String status,  DateTime createdAt,  List<ChecklistInstanceItemDto> items,  DateTime? completedAt,  int? maxPhotosPerItem)  $default,) {final _that = this;
switch (_that) {
case _ChecklistInstanceDetailDto():
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.status,_that.createdAt,_that.items,_that.completedAt,_that.maxPhotosPerItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  bool isRequired,  String status,  DateTime createdAt,  List<ChecklistInstanceItemDto> items,  DateTime? completedAt,  int? maxPhotosPerItem)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistInstanceDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.isRequired,_that.status,_that.createdAt,_that.items,_that.completedAt,_that.maxPhotosPerItem);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistInstanceDetailDto implements ChecklistInstanceDetailDto {
  const _ChecklistInstanceDetailDto({required this.id, required this.name, required this.type, required this.isRequired, required this.status, required this.createdAt, required final  List<ChecklistInstanceItemDto> items, this.completedAt, this.maxPhotosPerItem}): _items = items;
  factory _ChecklistInstanceDetailDto.fromJson(Map<String, dynamic> json) => _$ChecklistInstanceDetailDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
@override final  bool isRequired;
@override final  String status;
@override final  DateTime createdAt;
 final  List<ChecklistInstanceItemDto> _items;
@override List<ChecklistInstanceItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime? completedAt;
@override final  int? maxPhotosPerItem;

/// Create a copy of ChecklistInstanceDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistInstanceDetailDtoCopyWith<_ChecklistInstanceDetailDto> get copyWith => __$ChecklistInstanceDetailDtoCopyWithImpl<_ChecklistInstanceDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistInstanceDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistInstanceDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.maxPhotosPerItem, maxPhotosPerItem) || other.maxPhotosPerItem == maxPhotosPerItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,isRequired,status,createdAt,const DeepCollectionEquality().hash(_items),completedAt,maxPhotosPerItem);

@override
String toString() {
  return 'ChecklistInstanceDetailDto(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, createdAt: $createdAt, items: $items, completedAt: $completedAt, maxPhotosPerItem: $maxPhotosPerItem)';
}


}

/// @nodoc
abstract mixin class _$ChecklistInstanceDetailDtoCopyWith<$Res> implements $ChecklistInstanceDetailDtoCopyWith<$Res> {
  factory _$ChecklistInstanceDetailDtoCopyWith(_ChecklistInstanceDetailDto value, $Res Function(_ChecklistInstanceDetailDto) _then) = __$ChecklistInstanceDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, bool isRequired, String status, DateTime createdAt, List<ChecklistInstanceItemDto> items, DateTime? completedAt, int? maxPhotosPerItem
});




}
/// @nodoc
class __$ChecklistInstanceDetailDtoCopyWithImpl<$Res>
    implements _$ChecklistInstanceDetailDtoCopyWith<$Res> {
  __$ChecklistInstanceDetailDtoCopyWithImpl(this._self, this._then);

  final _ChecklistInstanceDetailDto _self;
  final $Res Function(_ChecklistInstanceDetailDto) _then;

/// Create a copy of ChecklistInstanceDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? isRequired = null,Object? status = null,Object? createdAt = null,Object? items = null,Object? completedAt = freezed,Object? maxPhotosPerItem = freezed,}) {
  return _then(_ChecklistInstanceDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistInstanceItemDto>,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,maxPhotosPerItem: freezed == maxPhotosPerItem ? _self.maxPhotosPerItem : maxPhotosPerItem // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ChecklistInstanceItemDto {

 String get id; String get text; bool get isRequired; int get position; bool get isCompleted; int get changeCount; String? get comment; DateTime? get completedAt;// Снимок шаблона по фото; строки парсятся в enum в маппере (как status).
// `@Default` — поэтапный деплой: старый бэк новых полей не пришлёт.
 String get photoRequirement; String get photoSource; int get photosCount; List<ChecklistItemPhotoDto> get photos;
/// Create a copy of ChecklistInstanceItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistInstanceItemDtoCopyWith<ChecklistInstanceItemDto> get copyWith => _$ChecklistInstanceItemDtoCopyWithImpl<ChecklistInstanceItemDto>(this as ChecklistInstanceItemDto, _$identity);

  /// Serializes this ChecklistInstanceItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistInstanceItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.position, position) || other.position == position)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.changeCount, changeCount) || other.changeCount == changeCount)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.photoRequirement, photoRequirement) || other.photoRequirement == photoRequirement)&&(identical(other.photoSource, photoSource) || other.photoSource == photoSource)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&const DeepCollectionEquality().equals(other.photos, photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,isRequired,position,isCompleted,changeCount,comment,completedAt,photoRequirement,photoSource,photosCount,const DeepCollectionEquality().hash(photos));

@override
String toString() {
  return 'ChecklistInstanceItemDto(id: $id, text: $text, isRequired: $isRequired, position: $position, isCompleted: $isCompleted, changeCount: $changeCount, comment: $comment, completedAt: $completedAt, photoRequirement: $photoRequirement, photoSource: $photoSource, photosCount: $photosCount, photos: $photos)';
}


}

/// @nodoc
abstract mixin class $ChecklistInstanceItemDtoCopyWith<$Res>  {
  factory $ChecklistInstanceItemDtoCopyWith(ChecklistInstanceItemDto value, $Res Function(ChecklistInstanceItemDto) _then) = _$ChecklistInstanceItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String text, bool isRequired, int position, bool isCompleted, int changeCount, String? comment, DateTime? completedAt, String photoRequirement, String photoSource, int photosCount, List<ChecklistItemPhotoDto> photos
});




}
/// @nodoc
class _$ChecklistInstanceItemDtoCopyWithImpl<$Res>
    implements $ChecklistInstanceItemDtoCopyWith<$Res> {
  _$ChecklistInstanceItemDtoCopyWithImpl(this._self, this._then);

  final ChecklistInstanceItemDto _self;
  final $Res Function(ChecklistInstanceItemDto) _then;

/// Create a copy of ChecklistInstanceItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? isRequired = null,Object? position = null,Object? isCompleted = null,Object? changeCount = null,Object? comment = freezed,Object? completedAt = freezed,Object? photoRequirement = null,Object? photoSource = null,Object? photosCount = null,Object? photos = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,changeCount: null == changeCount ? _self.changeCount : changeCount // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,photoRequirement: null == photoRequirement ? _self.photoRequirement : photoRequirement // ignore: cast_nullable_to_non_nullable
as String,photoSource: null == photoSource ? _self.photoSource : photoSource // ignore: cast_nullable_to_non_nullable
as String,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<ChecklistItemPhotoDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistInstanceItemDto].
extension ChecklistInstanceItemDtoPatterns on ChecklistInstanceItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistInstanceItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistInstanceItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistInstanceItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistInstanceItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistInstanceItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistInstanceItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  bool isRequired,  int position,  bool isCompleted,  int changeCount,  String? comment,  DateTime? completedAt,  String photoRequirement,  String photoSource,  int photosCount,  List<ChecklistItemPhotoDto> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistInstanceItemDto() when $default != null:
return $default(_that.id,_that.text,_that.isRequired,_that.position,_that.isCompleted,_that.changeCount,_that.comment,_that.completedAt,_that.photoRequirement,_that.photoSource,_that.photosCount,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  bool isRequired,  int position,  bool isCompleted,  int changeCount,  String? comment,  DateTime? completedAt,  String photoRequirement,  String photoSource,  int photosCount,  List<ChecklistItemPhotoDto> photos)  $default,) {final _that = this;
switch (_that) {
case _ChecklistInstanceItemDto():
return $default(_that.id,_that.text,_that.isRequired,_that.position,_that.isCompleted,_that.changeCount,_that.comment,_that.completedAt,_that.photoRequirement,_that.photoSource,_that.photosCount,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  bool isRequired,  int position,  bool isCompleted,  int changeCount,  String? comment,  DateTime? completedAt,  String photoRequirement,  String photoSource,  int photosCount,  List<ChecklistItemPhotoDto> photos)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistInstanceItemDto() when $default != null:
return $default(_that.id,_that.text,_that.isRequired,_that.position,_that.isCompleted,_that.changeCount,_that.comment,_that.completedAt,_that.photoRequirement,_that.photoSource,_that.photosCount,_that.photos);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistInstanceItemDto implements ChecklistInstanceItemDto {
  const _ChecklistInstanceItemDto({required this.id, required this.text, required this.isRequired, required this.position, required this.isCompleted, required this.changeCount, this.comment, this.completedAt, this.photoRequirement = 'none', this.photoSource = 'camera', this.photosCount = 0, final  List<ChecklistItemPhotoDto> photos = const <ChecklistItemPhotoDto>[]}): _photos = photos;
  factory _ChecklistInstanceItemDto.fromJson(Map<String, dynamic> json) => _$ChecklistInstanceItemDtoFromJson(json);

@override final  String id;
@override final  String text;
@override final  bool isRequired;
@override final  int position;
@override final  bool isCompleted;
@override final  int changeCount;
@override final  String? comment;
@override final  DateTime? completedAt;
// Снимок шаблона по фото; строки парсятся в enum в маппере (как status).
// `@Default` — поэтапный деплой: старый бэк новых полей не пришлёт.
@override@JsonKey() final  String photoRequirement;
@override@JsonKey() final  String photoSource;
@override@JsonKey() final  int photosCount;
 final  List<ChecklistItemPhotoDto> _photos;
@override@JsonKey() List<ChecklistItemPhotoDto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of ChecklistInstanceItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistInstanceItemDtoCopyWith<_ChecklistInstanceItemDto> get copyWith => __$ChecklistInstanceItemDtoCopyWithImpl<_ChecklistInstanceItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistInstanceItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistInstanceItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.position, position) || other.position == position)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.changeCount, changeCount) || other.changeCount == changeCount)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.photoRequirement, photoRequirement) || other.photoRequirement == photoRequirement)&&(identical(other.photoSource, photoSource) || other.photoSource == photoSource)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&const DeepCollectionEquality().equals(other._photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,isRequired,position,isCompleted,changeCount,comment,completedAt,photoRequirement,photoSource,photosCount,const DeepCollectionEquality().hash(_photos));

@override
String toString() {
  return 'ChecklistInstanceItemDto(id: $id, text: $text, isRequired: $isRequired, position: $position, isCompleted: $isCompleted, changeCount: $changeCount, comment: $comment, completedAt: $completedAt, photoRequirement: $photoRequirement, photoSource: $photoSource, photosCount: $photosCount, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$ChecklistInstanceItemDtoCopyWith<$Res> implements $ChecklistInstanceItemDtoCopyWith<$Res> {
  factory _$ChecklistInstanceItemDtoCopyWith(_ChecklistInstanceItemDto value, $Res Function(_ChecklistInstanceItemDto) _then) = __$ChecklistInstanceItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, bool isRequired, int position, bool isCompleted, int changeCount, String? comment, DateTime? completedAt, String photoRequirement, String photoSource, int photosCount, List<ChecklistItemPhotoDto> photos
});




}
/// @nodoc
class __$ChecklistInstanceItemDtoCopyWithImpl<$Res>
    implements _$ChecklistInstanceItemDtoCopyWith<$Res> {
  __$ChecklistInstanceItemDtoCopyWithImpl(this._self, this._then);

  final _ChecklistInstanceItemDto _self;
  final $Res Function(_ChecklistInstanceItemDto) _then;

/// Create a copy of ChecklistInstanceItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? isRequired = null,Object? position = null,Object? isCompleted = null,Object? changeCount = null,Object? comment = freezed,Object? completedAt = freezed,Object? photoRequirement = null,Object? photoSource = null,Object? photosCount = null,Object? photos = null,}) {
  return _then(_ChecklistInstanceItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,changeCount: null == changeCount ? _self.changeCount : changeCount // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,photoRequirement: null == photoRequirement ? _self.photoRequirement : photoRequirement // ignore: cast_nullable_to_non_nullable
as String,photoSource: null == photoSource ? _self.photoSource : photoSource // ignore: cast_nullable_to_non_nullable
as String,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<ChecklistItemPhotoDto>,
  ));
}


}


/// @nodoc
mixin _$ChecklistItemPhotoDto {

 String get id; String get fileId; int get position; String? get url; DateTime? get urlExpiresAt; DateTime? get capturedAt; double? get latitude; double? get longitude;
/// Create a copy of ChecklistItemPhotoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemPhotoDtoCopyWith<ChecklistItemPhotoDto> get copyWith => _$ChecklistItemPhotoDtoCopyWithImpl<ChecklistItemPhotoDto>(this as ChecklistItemPhotoDto, _$identity);

  /// Serializes this ChecklistItemPhotoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItemPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.position, position) || other.position == position)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileId,position,url,urlExpiresAt,capturedAt,latitude,longitude);

@override
String toString() {
  return 'ChecklistItemPhotoDto(id: $id, fileId: $fileId, position: $position, url: $url, urlExpiresAt: $urlExpiresAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemPhotoDtoCopyWith<$Res>  {
  factory $ChecklistItemPhotoDtoCopyWith(ChecklistItemPhotoDto value, $Res Function(ChecklistItemPhotoDto) _then) = _$ChecklistItemPhotoDtoCopyWithImpl;
@useResult
$Res call({
 String id, String fileId, int position, String? url, DateTime? urlExpiresAt, DateTime? capturedAt, double? latitude, double? longitude
});




}
/// @nodoc
class _$ChecklistItemPhotoDtoCopyWithImpl<$Res>
    implements $ChecklistItemPhotoDtoCopyWith<$Res> {
  _$ChecklistItemPhotoDtoCopyWithImpl(this._self, this._then);

  final ChecklistItemPhotoDto _self;
  final $Res Function(ChecklistItemPhotoDto) _then;

/// Create a copy of ChecklistItemPhotoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileId = null,Object? position = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? capturedAt = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,capturedAt: freezed == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItemPhotoDto].
extension ChecklistItemPhotoDtoPatterns on ChecklistItemPhotoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItemPhotoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItemPhotoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItemPhotoDto value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemPhotoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItemPhotoDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemPhotoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileId,  int position,  String? url,  DateTime? urlExpiresAt,  DateTime? capturedAt,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItemPhotoDto() when $default != null:
return $default(_that.id,_that.fileId,_that.position,_that.url,_that.urlExpiresAt,_that.capturedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileId,  int position,  String? url,  DateTime? urlExpiresAt,  DateTime? capturedAt,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemPhotoDto():
return $default(_that.id,_that.fileId,_that.position,_that.url,_that.urlExpiresAt,_that.capturedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileId,  int position,  String? url,  DateTime? urlExpiresAt,  DateTime? capturedAt,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemPhotoDto() when $default != null:
return $default(_that.id,_that.fileId,_that.position,_that.url,_that.urlExpiresAt,_that.capturedAt,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChecklistItemPhotoDto implements ChecklistItemPhotoDto {
  const _ChecklistItemPhotoDto({required this.id, required this.fileId, required this.position, this.url, this.urlExpiresAt, this.capturedAt, this.latitude, this.longitude});
  factory _ChecklistItemPhotoDto.fromJson(Map<String, dynamic> json) => _$ChecklistItemPhotoDtoFromJson(json);

@override final  String id;
@override final  String fileId;
@override final  int position;
@override final  String? url;
@override final  DateTime? urlExpiresAt;
@override final  DateTime? capturedAt;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of ChecklistItemPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemPhotoDtoCopyWith<_ChecklistItemPhotoDto> get copyWith => __$ChecklistItemPhotoDtoCopyWithImpl<_ChecklistItemPhotoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistItemPhotoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItemPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.position, position) || other.position == position)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileId,position,url,urlExpiresAt,capturedAt,latitude,longitude);

@override
String toString() {
  return 'ChecklistItemPhotoDto(id: $id, fileId: $fileId, position: $position, url: $url, urlExpiresAt: $urlExpiresAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemPhotoDtoCopyWith<$Res> implements $ChecklistItemPhotoDtoCopyWith<$Res> {
  factory _$ChecklistItemPhotoDtoCopyWith(_ChecklistItemPhotoDto value, $Res Function(_ChecklistItemPhotoDto) _then) = __$ChecklistItemPhotoDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileId, int position, String? url, DateTime? urlExpiresAt, DateTime? capturedAt, double? latitude, double? longitude
});




}
/// @nodoc
class __$ChecklistItemPhotoDtoCopyWithImpl<$Res>
    implements _$ChecklistItemPhotoDtoCopyWith<$Res> {
  __$ChecklistItemPhotoDtoCopyWithImpl(this._self, this._then);

  final _ChecklistItemPhotoDto _self;
  final $Res Function(_ChecklistItemPhotoDto) _then;

/// Create a copy of ChecklistItemPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileId = null,Object? position = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? capturedAt = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_ChecklistItemPhotoDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,capturedAt: freezed == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
