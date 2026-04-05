// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JoinResultDto {
  String get organizationId;
  String get organizationName;
  String get role;

  /// Create a copy of JoinResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JoinResultDtoCopyWith<JoinResultDto> get copyWith =>
      _$JoinResultDtoCopyWithImpl<JoinResultDto>(
          this as JoinResultDto, _$identity);

  /// Serializes this JoinResultDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JoinResultDto &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, organizationId, organizationName, role);

  @override
  String toString() {
    return 'JoinResultDto(organizationId: $organizationId, organizationName: $organizationName, role: $role)';
  }
}

/// @nodoc
abstract mixin class $JoinResultDtoCopyWith<$Res> {
  factory $JoinResultDtoCopyWith(
          JoinResultDto value, $Res Function(JoinResultDto) _then) =
      _$JoinResultDtoCopyWithImpl;
  @useResult
  $Res call({String organizationId, String organizationName, String role});
}

/// @nodoc
class _$JoinResultDtoCopyWithImpl<$Res>
    implements $JoinResultDtoCopyWith<$Res> {
  _$JoinResultDtoCopyWithImpl(this._self, this._then);

  final JoinResultDto _self;
  final $Res Function(JoinResultDto) _then;

  /// Create a copy of JoinResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? organizationName = null,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [JoinResultDto].
extension JoinResultDtoPatterns on JoinResultDto {
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
    TResult Function(_JoinResultDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _JoinResultDto() when $default != null:
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
    TResult Function(_JoinResultDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JoinResultDto():
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
    TResult? Function(_JoinResultDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JoinResultDto() when $default != null:
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
    TResult Function(
            String organizationId, String organizationName, String role)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _JoinResultDto() when $default != null:
        return $default(
            _that.organizationId, _that.organizationName, _that.role);
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
    TResult Function(
            String organizationId, String organizationName, String role)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JoinResultDto():
        return $default(
            _that.organizationId, _that.organizationName, _that.role);
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
    TResult? Function(
            String organizationId, String organizationName, String role)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _JoinResultDto() when $default != null:
        return $default(
            _that.organizationId, _that.organizationName, _that.role);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _JoinResultDto implements JoinResultDto {
  const _JoinResultDto(
      {required this.organizationId,
      required this.organizationName,
      required this.role});
  factory _JoinResultDto.fromJson(Map<String, dynamic> json) =>
      _$JoinResultDtoFromJson(json);

  @override
  final String organizationId;
  @override
  final String organizationName;
  @override
  final String role;

  /// Create a copy of JoinResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JoinResultDtoCopyWith<_JoinResultDto> get copyWith =>
      __$JoinResultDtoCopyWithImpl<_JoinResultDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$JoinResultDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JoinResultDto &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, organizationId, organizationName, role);

  @override
  String toString() {
    return 'JoinResultDto(organizationId: $organizationId, organizationName: $organizationName, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$JoinResultDtoCopyWith<$Res>
    implements $JoinResultDtoCopyWith<$Res> {
  factory _$JoinResultDtoCopyWith(
          _JoinResultDto value, $Res Function(_JoinResultDto) _then) =
      __$JoinResultDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String organizationId, String organizationName, String role});
}

/// @nodoc
class __$JoinResultDtoCopyWithImpl<$Res>
    implements _$JoinResultDtoCopyWith<$Res> {
  __$JoinResultDtoCopyWithImpl(this._self, this._then);

  final _JoinResultDto _self;
  final $Res Function(_JoinResultDto) _then;

  /// Create a copy of JoinResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organizationId = null,
    Object? organizationName = null,
    Object? role = null,
  }) {
    return _then(_JoinResultDto(
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      organizationName: null == organizationName
          ? _self.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
