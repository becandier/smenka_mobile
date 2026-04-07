// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'super_admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuperAdminState {
  SectionData<List<Organization>> get organizations;

  /// Create a copy of SuperAdminState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuperAdminStateCopyWith<SuperAdminState> get copyWith =>
      _$SuperAdminStateCopyWithImpl<SuperAdminState>(
          this as SuperAdminState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuperAdminState &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizations);

  @override
  String toString() {
    return 'SuperAdminState(organizations: $organizations)';
  }
}

/// @nodoc
abstract mixin class $SuperAdminStateCopyWith<$Res> {
  factory $SuperAdminStateCopyWith(
          SuperAdminState value, $Res Function(SuperAdminState) _then) =
      _$SuperAdminStateCopyWithImpl;
  @useResult
  $Res call({SectionData<List<Organization>> organizations});

  $SectionDataCopyWith<List<Organization>, $Res> get organizations;
}

/// @nodoc
class _$SuperAdminStateCopyWithImpl<$Res>
    implements $SuperAdminStateCopyWith<$Res> {
  _$SuperAdminStateCopyWithImpl(this._self, this._then);

  final SuperAdminState _self;
  final $Res Function(SuperAdminState) _then;

  /// Create a copy of SuperAdminState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizations = null,
  }) {
    return _then(_self.copyWith(
      organizations: null == organizations
          ? _self.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Organization>>,
    ));
  }

  /// Create a copy of SuperAdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Organization>, $Res> get organizations {
    return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations,
        (value) {
      return _then(_self.copyWith(organizations: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SuperAdminState].
extension SuperAdminStatePatterns on SuperAdminState {
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
    TResult Function(_SuperAdminState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SuperAdminState() when $default != null:
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
    TResult Function(_SuperAdminState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuperAdminState():
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
    TResult? Function(_SuperAdminState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuperAdminState() when $default != null:
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
    TResult Function(SectionData<List<Organization>> organizations)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SuperAdminState() when $default != null:
        return $default(_that.organizations);
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
    TResult Function(SectionData<List<Organization>> organizations) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuperAdminState():
        return $default(_that.organizations);
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
    TResult? Function(SectionData<List<Organization>> organizations)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SuperAdminState() when $default != null:
        return $default(_that.organizations);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SuperAdminState implements SuperAdminState {
  const _SuperAdminState(
      {this.organizations = const SectionData<List<Organization>>()});

  @override
  @JsonKey()
  final SectionData<List<Organization>> organizations;

  /// Create a copy of SuperAdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperAdminStateCopyWith<_SuperAdminState> get copyWith =>
      __$SuperAdminStateCopyWithImpl<_SuperAdminState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperAdminState &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizations);

  @override
  String toString() {
    return 'SuperAdminState(organizations: $organizations)';
  }
}

/// @nodoc
abstract mixin class _$SuperAdminStateCopyWith<$Res>
    implements $SuperAdminStateCopyWith<$Res> {
  factory _$SuperAdminStateCopyWith(
          _SuperAdminState value, $Res Function(_SuperAdminState) _then) =
      __$SuperAdminStateCopyWithImpl;
  @override
  @useResult
  $Res call({SectionData<List<Organization>> organizations});

  @override
  $SectionDataCopyWith<List<Organization>, $Res> get organizations;
}

/// @nodoc
class __$SuperAdminStateCopyWithImpl<$Res>
    implements _$SuperAdminStateCopyWith<$Res> {
  __$SuperAdminStateCopyWithImpl(this._self, this._then);

  final _SuperAdminState _self;
  final $Res Function(_SuperAdminState) _then;

  /// Create a copy of SuperAdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organizations = null,
  }) {
    return _then(_SuperAdminState(
      organizations: null == organizations
          ? _self.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Organization>>,
    ));
  }

  /// Create a copy of SuperAdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Organization>, $Res> get organizations {
    return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations,
        (value) {
      return _then(_self.copyWith(organizations: value));
    });
  }
}

// dart format on
