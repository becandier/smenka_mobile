// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Member {
  String get id;
  String get organizationId;
  String get userId;
  String get userName;
  String get userEmail;
  MemberRole get role;
  DateTime get joinedAt;
  OrganizationRole? get customRole;

  /// Действующая ставка (фича payroll); null — не задана
  /// либо ответ старого бэка без поля.
  CurrentRate? get currentRate;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberCopyWith<Member> get copyWith =>
      _$MemberCopyWithImpl<Member>(this as Member, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Member &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, organizationId, userId,
      userName, userEmail, role, joinedAt, customRole, currentRate);

  @override
  String toString() {
    return 'Member(id: $id, organizationId: $organizationId, userId: $userId, userName: $userName, userEmail: $userEmail, role: $role, joinedAt: $joinedAt, customRole: $customRole, currentRate: $currentRate)';
  }
}

/// @nodoc
abstract mixin class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) _then) =
      _$MemberCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String userId,
      String userName,
      String userEmail,
      MemberRole role,
      DateTime joinedAt,
      OrganizationRole? customRole,
      CurrentRate? currentRate});

  $OrganizationRoleCopyWith<$Res>? get customRole;
  $CurrentRateCopyWith<$Res>? get currentRate;
}

/// @nodoc
class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._self, this._then);

  final Member _self;
  final $Res Function(Member) _then;

  /// Create a copy of Member
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
              as MemberRole,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customRole: freezed == customRole
          ? _self.customRole
          : customRole // ignore: cast_nullable_to_non_nullable
              as OrganizationRole?,
      currentRate: freezed == currentRate
          ? _self.currentRate
          : currentRate // ignore: cast_nullable_to_non_nullable
              as CurrentRate?,
    ));
  }

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationRoleCopyWith<$Res>? get customRole {
    if (_self.customRole == null) {
      return null;
    }

    return $OrganizationRoleCopyWith<$Res>(_self.customRole!, (value) {
      return _then(_self.copyWith(customRole: value));
    });
  }

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentRateCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
      return null;
    }

    return $CurrentRateCopyWith<$Res>(_self.currentRate!, (value) {
      return _then(_self.copyWith(currentRate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Member].
extension MemberPatterns on Member {
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
    TResult Function(_Member value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Member() when $default != null:
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
    TResult Function(_Member value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Member():
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
    TResult? Function(_Member value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Member() when $default != null:
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
            MemberRole role,
            DateTime joinedAt,
            OrganizationRole? customRole,
            CurrentRate? currentRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Member() when $default != null:
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
            MemberRole role,
            DateTime joinedAt,
            OrganizationRole? customRole,
            CurrentRate? currentRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Member():
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
            MemberRole role,
            DateTime joinedAt,
            OrganizationRole? customRole,
            CurrentRate? currentRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Member() when $default != null:
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

class _Member implements Member {
  const _Member(
      {required this.id,
      required this.organizationId,
      required this.userId,
      required this.userName,
      required this.userEmail,
      required this.role,
      required this.joinedAt,
      this.customRole,
      this.currentRate});

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
  final MemberRole role;
  @override
  final DateTime joinedAt;
  @override
  final OrganizationRole? customRole;

  /// Действующая ставка (фича payroll); null — не задана
  /// либо ответ старого бэка без поля.
  @override
  final CurrentRate? currentRate;

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Member &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, organizationId, userId,
      userName, userEmail, role, joinedAt, customRole, currentRate);

  @override
  String toString() {
    return 'Member(id: $id, organizationId: $organizationId, userId: $userId, userName: $userName, userEmail: $userEmail, role: $role, joinedAt: $joinedAt, customRole: $customRole, currentRate: $currentRate)';
  }
}

/// @nodoc
abstract mixin class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) _then) =
      __$MemberCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String organizationId,
      String userId,
      String userName,
      String userEmail,
      MemberRole role,
      DateTime joinedAt,
      OrganizationRole? customRole,
      CurrentRate? currentRate});

  @override
  $OrganizationRoleCopyWith<$Res>? get customRole;
  @override
  $CurrentRateCopyWith<$Res>? get currentRate;
}

/// @nodoc
class __$MemberCopyWithImpl<$Res> implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(this._self, this._then);

  final _Member _self;
  final $Res Function(_Member) _then;

  /// Create a copy of Member
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
    return _then(_Member(
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
              as MemberRole,
      joinedAt: null == joinedAt
          ? _self.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customRole: freezed == customRole
          ? _self.customRole
          : customRole // ignore: cast_nullable_to_non_nullable
              as OrganizationRole?,
      currentRate: freezed == currentRate
          ? _self.currentRate
          : currentRate // ignore: cast_nullable_to_non_nullable
              as CurrentRate?,
    ));
  }

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationRoleCopyWith<$Res>? get customRole {
    if (_self.customRole == null) {
      return null;
    }

    return $OrganizationRoleCopyWith<$Res>(_self.customRole!, (value) {
      return _then(_self.copyWith(customRole: value));
    });
  }

  /// Create a copy of Member
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentRateCopyWith<$Res>? get currentRate {
    if (_self.currentRate == null) {
      return null;
    }

    return $CurrentRateCopyWith<$Res>(_self.currentRate!, (value) {
      return _then(_self.copyWith(currentRate: value));
    });
  }
}

// dart format on
