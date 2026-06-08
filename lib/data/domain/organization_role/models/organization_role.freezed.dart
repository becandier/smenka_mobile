// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationRole {
  String get id;
  String get name;
  DateTime get createdAt;

  /// Create a copy of OrganizationRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationRoleCopyWith<OrganizationRole> get copyWith =>
      _$OrganizationRoleCopyWithImpl<OrganizationRole>(
          this as OrganizationRole, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationRole &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt);

  @override
  String toString() {
    return 'OrganizationRole(id: $id, name: $name, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $OrganizationRoleCopyWith<$Res> {
  factory $OrganizationRoleCopyWith(
          OrganizationRole value, $Res Function(OrganizationRole) _then) =
      _$OrganizationRoleCopyWithImpl;
  @useResult
  $Res call({String id, String name, DateTime createdAt});
}

/// @nodoc
class _$OrganizationRoleCopyWithImpl<$Res>
    implements $OrganizationRoleCopyWith<$Res> {
  _$OrganizationRoleCopyWithImpl(this._self, this._then);

  final OrganizationRole _self;
  final $Res Function(OrganizationRole) _then;

  /// Create a copy of OrganizationRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrganizationRole].
extension OrganizationRolePatterns on OrganizationRole {
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
    TResult Function(_OrganizationRole value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationRole() when $default != null:
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
    TResult Function(_OrganizationRole value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRole():
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
    TResult? Function(_OrganizationRole value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRole() when $default != null:
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
    TResult Function(String id, String name, DateTime createdAt)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationRole() when $default != null:
        return $default(_that.id, _that.name, _that.createdAt);
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
    TResult Function(String id, String name, DateTime createdAt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRole():
        return $default(_that.id, _that.name, _that.createdAt);
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
    TResult? Function(String id, String name, DateTime createdAt)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRole() when $default != null:
        return $default(_that.id, _that.name, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrganizationRole implements OrganizationRole {
  const _OrganizationRole(
      {required this.id, required this.name, required this.createdAt});

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;

  /// Create a copy of OrganizationRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationRoleCopyWith<_OrganizationRole> get copyWith =>
      __$OrganizationRoleCopyWithImpl<_OrganizationRole>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationRole &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt);

  @override
  String toString() {
    return 'OrganizationRole(id: $id, name: $name, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationRoleCopyWith<$Res>
    implements $OrganizationRoleCopyWith<$Res> {
  factory _$OrganizationRoleCopyWith(
          _OrganizationRole value, $Res Function(_OrganizationRole) _then) =
      __$OrganizationRoleCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, DateTime createdAt});
}

/// @nodoc
class __$OrganizationRoleCopyWithImpl<$Res>
    implements _$OrganizationRoleCopyWith<$Res> {
  __$OrganizationRoleCopyWithImpl(this._self, this._then);

  final _OrganizationRole _self;
  final $Res Function(_OrganizationRole) _then;

  /// Create a copy of OrganizationRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
  }) {
    return _then(_OrganizationRole(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
