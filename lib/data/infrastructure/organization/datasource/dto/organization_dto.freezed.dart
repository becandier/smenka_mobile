// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationDto {
  String get id;
  String get name;
  String get ownerId;
  String get inviteCode;
  bool get isDeleted;
  DateTime get createdAt;

  /// Create a copy of OrganizationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationDtoCopyWith<OrganizationDto> get copyWith =>
      _$OrganizationDtoCopyWithImpl<OrganizationDto>(
          this as OrganizationDto, _$identity);

  /// Serializes this OrganizationDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, ownerId, inviteCode, isDeleted, createdAt);

  @override
  String toString() {
    return 'OrganizationDto(id: $id, name: $name, ownerId: $ownerId, inviteCode: $inviteCode, isDeleted: $isDeleted, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $OrganizationDtoCopyWith<$Res> {
  factory $OrganizationDtoCopyWith(
          OrganizationDto value, $Res Function(OrganizationDto) _then) =
      _$OrganizationDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      String inviteCode,
      bool isDeleted,
      DateTime createdAt});
}

/// @nodoc
class _$OrganizationDtoCopyWithImpl<$Res>
    implements $OrganizationDtoCopyWith<$Res> {
  _$OrganizationDtoCopyWithImpl(this._self, this._then);

  final OrganizationDto _self;
  final $Res Function(OrganizationDto) _then;

  /// Create a copy of OrganizationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerId = null,
    Object? inviteCode = null,
    Object? isDeleted = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      inviteCode: null == inviteCode
          ? _self.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrganizationDto].
extension OrganizationDtoPatterns on OrganizationDto {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrganizationDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationDto() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrganizationDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDto():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrganizationDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDto() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String ownerId, String inviteCode,
            bool isDeleted, DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationDto() when $default != null:
        return $default(_that.id, _that.name, _that.ownerId, _that.inviteCode,
            _that.isDeleted, _that.createdAt);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String ownerId, String inviteCode,
            bool isDeleted, DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDto():
        return $default(_that.id, _that.name, _that.ownerId, _that.inviteCode,
            _that.isDeleted, _that.createdAt);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String ownerId, String inviteCode,
            bool isDeleted, DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDto() when $default != null:
        return $default(_that.id, _that.name, _that.ownerId, _that.inviteCode,
            _that.isDeleted, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _OrganizationDto implements OrganizationDto {
  const _OrganizationDto(
      {required this.id,
      required this.name,
      required this.ownerId,
      required this.inviteCode,
      required this.isDeleted,
      required this.createdAt});
  factory _OrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String ownerId;
  @override
  final String inviteCode;
  @override
  final bool isDeleted;
  @override
  final DateTime createdAt;

  /// Create a copy of OrganizationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationDtoCopyWith<_OrganizationDto> get copyWith =>
      __$OrganizationDtoCopyWithImpl<_OrganizationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrganizationDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, ownerId, inviteCode, isDeleted, createdAt);

  @override
  String toString() {
    return 'OrganizationDto(id: $id, name: $name, ownerId: $ownerId, inviteCode: $inviteCode, isDeleted: $isDeleted, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationDtoCopyWith<$Res>
    implements $OrganizationDtoCopyWith<$Res> {
  factory _$OrganizationDtoCopyWith(
          _OrganizationDto value, $Res Function(_OrganizationDto) _then) =
      __$OrganizationDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      String inviteCode,
      bool isDeleted,
      DateTime createdAt});
}

/// @nodoc
class __$OrganizationDtoCopyWithImpl<$Res>
    implements _$OrganizationDtoCopyWith<$Res> {
  __$OrganizationDtoCopyWithImpl(this._self, this._then);

  final _OrganizationDto _self;
  final $Res Function(_OrganizationDto) _then;

  /// Create a copy of OrganizationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerId = null,
    Object? inviteCode = null,
    Object? isDeleted = null,
    Object? createdAt = null,
  }) {
    return _then(_OrganizationDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      inviteCode: null == inviteCode
          ? _self.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _self.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
