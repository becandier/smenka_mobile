// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberDto {
  String get id;
  String get organizationId;
  String get userId;
  String get userName;
  String get userEmail;
  String get role;
  DateTime get joinedAt;
  OrganizationRoleDto? get customRole;

  /// Действующая ставка (additive, фича payroll); отсутствует
  /// в ответах старого бэка.
  CurrentRateDto? get currentRate;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberDtoCopyWith<MemberDto> get copyWith =>
      _$MemberDtoCopyWithImpl<MemberDto>(this as MemberDto, _$identity);

  /// Serializes this MemberDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.customRole, customRole) ||
                other.customRole == customRole) &&
            (identical(other.currentRate, currentRate) ||
                other.currentRate == currentRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, organizationId, userId,
      userName, userEmail, role, joinedAt, customRole, currentRate);

  @override
  String toString() {
    return 'MemberDto(id: $id, organizationId: $organizationId, userId: $userId, userName: $userName, userEmail: $userEmail, role: $role, joinedAt: $joinedAt, customRole: $customRole, currentRate: $currentRate)';
  }
}

/// @nodoc
abstract mixin class $MemberDtoCopyWith<$Res> {
  factory $MemberDtoCopyWith(MemberDto value, $Res Function(MemberDto) _then) =
      _$MemberDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String userId,
      String userName,
      String userEmail,
      String role,
      DateTime joinedAt,
      OrganizationRoleDto? customRole,
      CurrentRateDto? currentRate});

  $OrganizationRoleDtoCopyWith<$Res>? get customRole;
  $CurrentRateDtoCopyWith<$Res>? get currentRate;
}

/// @nodoc
class _$MemberDtoCopyWithImpl<$Res> implements $MemberDtoCopyWith<$Res> {
  _$MemberDtoCopyWithImpl(this._self, this._then);

  final MemberDto _self;
  final $Res Function(MemberDto) _then;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? customRole = freezed,
    Object? currentRate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customRole: freezed == customRole
          ? _self.customRole
          : customRole // ignore: cast_nullable_to_non_nullable
              as OrganizationRoleDto?,
      currentRate: freezed == currentRate
          ? _self.currentRate
          : currentRate // ignore: cast_nullable_to_non_nullable
              as CurrentRateDto?,
    ));
  }

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationRoleDtoCopyWith<$Res>? get customRole {
    if (_self.customRole == null) {
      return null;
    }

    return $OrganizationRoleDtoCopyWith<$Res>(_self.customRole!, (value) {
      return _then(_self.copyWith(customRole: value));
    });
  }

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentRateDtoCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
      return null;
    }

    return $CurrentRateDtoCopyWith<$Res>(_self.currentRate!, (value) {
      return _then(_self.copyWith(currentRate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MemberDto].
extension MemberDtoPatterns on MemberDto {
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
    TResult Function(_MemberDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberDto() when $default != null:
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
    TResult Function(_MemberDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDto():
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
    TResult? Function(_MemberDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDto() when $default != null:
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
            String id,
            String organizationId,
            String userId,
            String userName,
            String userEmail,
            String role,
            DateTime joinedAt,
            OrganizationRoleDto? customRole,
            CurrentRateDto? currentRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberDto() when $default != null:
        return $default(
            _that.id,
            _that.organizationId,
            _that.userId,
            _that.userName,
            _that.userEmail,
            _that.role,
            _that.joinedAt,
            _that.customRole,
            _that.currentRate);
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
            String id,
            String organizationId,
            String userId,
            String userName,
            String userEmail,
            String role,
            DateTime joinedAt,
            OrganizationRoleDto? customRole,
            CurrentRateDto? currentRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDto():
        return $default(
            _that.id,
            _that.organizationId,
            _that.userId,
            _that.userName,
            _that.userEmail,
            _that.role,
            _that.joinedAt,
            _that.customRole,
            _that.currentRate);
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
            String id,
            String organizationId,
            String userId,
            String userName,
            String userEmail,
            String role,
            DateTime joinedAt,
            OrganizationRoleDto? customRole,
            CurrentRateDto? currentRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDto() when $default != null:
        return $default(
            _that.id,
            _that.organizationId,
            _that.userId,
            _that.userName,
            _that.userEmail,
            _that.role,
            _that.joinedAt,
            _that.customRole,
            _that.currentRate);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _MemberDto implements MemberDto {
  const _MemberDto(
      {required this.id,
      required this.organizationId,
      required this.userId,
      required this.userName,
      required this.userEmail,
      required this.role,
      required this.joinedAt,
      this.customRole,
      this.currentRate});
  factory _MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final String role;
  @override
  final DateTime joinedAt;
  @override
  final OrganizationRoleDto? customRole;

  /// Действующая ставка (additive, фича payroll); отсутствует
  /// в ответах старого бэка.
  @override
  final CurrentRateDto? currentRate;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberDtoCopyWith<_MemberDto> get copyWith =>
      __$MemberDtoCopyWithImpl<_MemberDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemberDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.customRole, customRole) ||
                other.customRole == customRole) &&
            (identical(other.currentRate, currentRate) ||
                other.currentRate == currentRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, organizationId, userId,
      userName, userEmail, role, joinedAt, customRole, currentRate);

  @override
  String toString() {
    return 'MemberDto(id: $id, organizationId: $organizationId, userId: $userId, userName: $userName, userEmail: $userEmail, role: $role, joinedAt: $joinedAt, customRole: $customRole, currentRate: $currentRate)';
  }
}

/// @nodoc
abstract mixin class _$MemberDtoCopyWith<$Res>
    implements $MemberDtoCopyWith<$Res> {
  factory _$MemberDtoCopyWith(
          _MemberDto value, $Res Function(_MemberDto) _then) =
      __$MemberDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String userId,
      String userName,
      String userEmail,
      String role,
      DateTime joinedAt,
      OrganizationRoleDto? customRole,
      CurrentRateDto? currentRate});

  @override
  $OrganizationRoleDtoCopyWith<$Res>? get customRole;
  @override
  $CurrentRateDtoCopyWith<$Res>? get currentRate;
}

/// @nodoc
class __$MemberDtoCopyWithImpl<$Res> implements _$MemberDtoCopyWith<$Res> {
  __$MemberDtoCopyWithImpl(this._self, this._then);

  final _MemberDto _self;
  final $Res Function(_MemberDto) _then;

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? userId = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? customRole = freezed,
    Object? currentRate = freezed,
  }) {
    return _then(_MemberDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customRole: freezed == customRole
          ? _self.customRole
          : customRole // ignore: cast_nullable_to_non_nullable
              as OrganizationRoleDto?,
      currentRate: freezed == currentRate
          ? _self.currentRate
          : currentRate // ignore: cast_nullable_to_non_nullable
              as CurrentRateDto?,
    ));
  }

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationRoleDtoCopyWith<$Res>? get customRole {
    if (_self.customRole == null) {
      return null;
    }

    return $OrganizationRoleDtoCopyWith<$Res>(_self.customRole!, (value) {
      return _then(_self.copyWith(customRole: value));
    });
  }

  /// Create a copy of MemberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentRateDtoCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
      return null;
    }

    return $CurrentRateDtoCopyWith<$Res>(_self.currentRate!, (value) {
      return _then(_self.copyWith(currentRate: value));
    });
  }
}

// dart format on
