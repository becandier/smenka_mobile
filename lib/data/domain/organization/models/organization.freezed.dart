// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Organization {
  String get id;
  String get name;
  String get ownerId;
  String get inviteCode;
  bool get isDeleted;
  DateTime get createdAt;
  bool get geoCheckEnabled;
  OrgMembershipRole? get myRole;
  OrganizationRole? get myCustomRole;

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationCopyWith<Organization> get copyWith =>
      _$OrganizationCopyWithImpl<Organization>(
          this as Organization, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Organization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.geoCheckEnabled, geoCheckEnabled) ||
                other.geoCheckEnabled == geoCheckEnabled) &&
            (identical(other.myRole, myRole) || other.myRole == myRole) &&
            (identical(other.myCustomRole, myCustomRole) ||
                other.myCustomRole == myCustomRole));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, ownerId, inviteCode,
      isDeleted, createdAt, geoCheckEnabled, myRole, myCustomRole);

  @override
  String toString() {
    return 'Organization(id: $id, name: $name, ownerId: $ownerId, inviteCode: $inviteCode, isDeleted: $isDeleted, createdAt: $createdAt, geoCheckEnabled: $geoCheckEnabled, myRole: $myRole, myCustomRole: $myCustomRole)';
  }
}

/// @nodoc
abstract mixin class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) _then) =
      _$OrganizationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      String inviteCode,
      bool isDeleted,
      DateTime createdAt,
      bool geoCheckEnabled,
      OrgMembershipRole? myRole,
      OrganizationRole? myCustomRole});

  $OrganizationRoleCopyWith<$Res>? get myCustomRole;
}

/// @nodoc
class _$OrganizationCopyWithImpl<$Res> implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._self, this._then);

  final Organization _self;
  final $Res Function(Organization) _then;

  /// Create a copy of Organization
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
    Object? geoCheckEnabled = null,
    Object? myRole = freezed,
    Object? myCustomRole = freezed,
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
      geoCheckEnabled: null == geoCheckEnabled
          ? _self.geoCheckEnabled
          : geoCheckEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      myRole: freezed == myRole
          ? _self.myRole
          : myRole // ignore: cast_nullable_to_non_nullable
              as OrgMembershipRole?,
      myCustomRole: freezed == myCustomRole
          ? _self.myCustomRole
          : myCustomRole // ignore: cast_nullable_to_non_nullable
              as OrganizationRole?,
    ));
  }

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationRoleCopyWith<$Res>? get myCustomRole {
    if (_self.myCustomRole == null) {
      return null;
    }

    return $OrganizationRoleCopyWith<$Res>(_self.myCustomRole!, (value) {
      return _then(_self.copyWith(myCustomRole: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Organization].
extension OrganizationPatterns on Organization {
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
    TResult Function(_Organization value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Organization() when $default != null:
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
    TResult Function(_Organization value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Organization():
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
    TResult? Function(_Organization value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Organization() when $default != null:
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
            String name,
            String ownerId,
            String inviteCode,
            bool isDeleted,
            DateTime createdAt,
            bool geoCheckEnabled,
            OrgMembershipRole? myRole,
            OrganizationRole? myCustomRole)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Organization() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.ownerId,
            _that.inviteCode,
            _that.isDeleted,
            _that.createdAt,
            _that.geoCheckEnabled,
            _that.myRole,
            _that.myCustomRole);
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
            String name,
            String ownerId,
            String inviteCode,
            bool isDeleted,
            DateTime createdAt,
            bool geoCheckEnabled,
            OrgMembershipRole? myRole,
            OrganizationRole? myCustomRole)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Organization():
        return $default(
            _that.id,
            _that.name,
            _that.ownerId,
            _that.inviteCode,
            _that.isDeleted,
            _that.createdAt,
            _that.geoCheckEnabled,
            _that.myRole,
            _that.myCustomRole);
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
            String name,
            String ownerId,
            String inviteCode,
            bool isDeleted,
            DateTime createdAt,
            bool geoCheckEnabled,
            OrgMembershipRole? myRole,
            OrganizationRole? myCustomRole)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Organization() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.ownerId,
            _that.inviteCode,
            _that.isDeleted,
            _that.createdAt,
            _that.geoCheckEnabled,
            _that.myRole,
            _that.myCustomRole);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Organization implements Organization {
  const _Organization(
      {required this.id,
      required this.name,
      required this.ownerId,
      required this.inviteCode,
      required this.isDeleted,
      required this.createdAt,
      this.geoCheckEnabled = false,
      this.myRole,
      this.myCustomRole});

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
  @override
  @JsonKey()
  final bool geoCheckEnabled;
  @override
  final OrgMembershipRole? myRole;
  @override
  final OrganizationRole? myCustomRole;

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationCopyWith<_Organization> get copyWith =>
      __$OrganizationCopyWithImpl<_Organization>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Organization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.geoCheckEnabled, geoCheckEnabled) ||
                other.geoCheckEnabled == geoCheckEnabled) &&
            (identical(other.myRole, myRole) || other.myRole == myRole) &&
            (identical(other.myCustomRole, myCustomRole) ||
                other.myCustomRole == myCustomRole));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, ownerId, inviteCode,
      isDeleted, createdAt, geoCheckEnabled, myRole, myCustomRole);

  @override
  String toString() {
    return 'Organization(id: $id, name: $name, ownerId: $ownerId, inviteCode: $inviteCode, isDeleted: $isDeleted, createdAt: $createdAt, geoCheckEnabled: $geoCheckEnabled, myRole: $myRole, myCustomRole: $myCustomRole)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(
          _Organization value, $Res Function(_Organization) _then) =
      __$OrganizationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String ownerId,
      String inviteCode,
      bool isDeleted,
      DateTime createdAt,
      bool geoCheckEnabled,
      OrgMembershipRole? myRole,
      OrganizationRole? myCustomRole});

  @override
  $OrganizationRoleCopyWith<$Res>? get myCustomRole;
}

/// @nodoc
class __$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(this._self, this._then);

  final _Organization _self;
  final $Res Function(_Organization) _then;

  /// Create a copy of Organization
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
    Object? geoCheckEnabled = null,
    Object? myRole = freezed,
    Object? myCustomRole = freezed,
  }) {
    return _then(_Organization(
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
      geoCheckEnabled: null == geoCheckEnabled
          ? _self.geoCheckEnabled
          : geoCheckEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      myRole: freezed == myRole
          ? _self.myRole
          : myRole // ignore: cast_nullable_to_non_nullable
              as OrgMembershipRole?,
      myCustomRole: freezed == myCustomRole
          ? _self.myCustomRole
          : myCustomRole // ignore: cast_nullable_to_non_nullable
              as OrganizationRole?,
    ));
  }

  /// Create a copy of Organization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationRoleCopyWith<$Res>? get myCustomRole {
    if (_self.myCustomRole == null) {
      return null;
    }

    return $OrganizationRoleCopyWith<$Res>(_self.myCustomRole!, (value) {
      return _then(_self.copyWith(myCustomRole: value));
    });
  }
}

// dart format on
