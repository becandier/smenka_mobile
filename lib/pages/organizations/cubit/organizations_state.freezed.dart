// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organizations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationsState {
  SectionData<List<Organization>> get organizations;
  SectionData<User> get currentUser;
  FeatureStatus get createStatus;
  FeatureStatus get joinStatus;
  String? get actionError;
  JoinResult? get joinResult;

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationsStateCopyWith<OrganizationsState> get copyWith =>
      _$OrganizationsStateCopyWithImpl<OrganizationsState>(
          this as OrganizationsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationsState &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.createStatus, createStatus) ||
                other.createStatus == createStatus) &&
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.joinResult, joinResult) ||
                other.joinResult == joinResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizations, currentUser,
      createStatus, joinStatus, actionError, joinResult);

  @override
  String toString() {
    return 'OrganizationsState(organizations: $organizations, currentUser: $currentUser, createStatus: $createStatus, joinStatus: $joinStatus, actionError: $actionError, joinResult: $joinResult)';
  }
}

/// @nodoc
abstract mixin class $OrganizationsStateCopyWith<$Res> {
  factory $OrganizationsStateCopyWith(
          OrganizationsState value, $Res Function(OrganizationsState) _then) =
      _$OrganizationsStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<List<Organization>> organizations,
      SectionData<User> currentUser,
      FeatureStatus createStatus,
      FeatureStatus joinStatus,
      String? actionError,
      JoinResult? joinResult});

  $SectionDataCopyWith<List<Organization>, $Res> get organizations;
  $SectionDataCopyWith<User, $Res> get currentUser;
  $JoinResultCopyWith<$Res>? get joinResult;
}

/// @nodoc
class _$OrganizationsStateCopyWithImpl<$Res>
    implements $OrganizationsStateCopyWith<$Res> {
  _$OrganizationsStateCopyWithImpl(this._self, this._then);

  final OrganizationsState _self;
  final $Res Function(OrganizationsState) _then;

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizations = null,
    Object? currentUser = null,
    Object? createStatus = null,
    Object? joinStatus = null,
    Object? actionError = freezed,
    Object? joinResult = freezed,
  }) {
    return _then(_self.copyWith(
      organizations: null == organizations
          ? _self.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Organization>>,
      currentUser: null == currentUser
          ? _self.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as SectionData<User>,
      createStatus: null == createStatus
          ? _self.createStatus
          : createStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      joinStatus: null == joinStatus
          ? _self.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      joinResult: freezed == joinResult
          ? _self.joinResult
          : joinResult // ignore: cast_nullable_to_non_nullable
              as JoinResult?,
    ));
  }

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Organization>, $Res> get organizations {
    return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations,
        (value) {
      return _then(_self.copyWith(organizations: value));
    });
  }

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<User, $Res> get currentUser {
    return $SectionDataCopyWith<User, $Res>(_self.currentUser, (value) {
      return _then(_self.copyWith(currentUser: value));
    });
  }

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JoinResultCopyWith<$Res>? get joinResult {
    if (_self.joinResult == null) {
      return null;
    }

    return $JoinResultCopyWith<$Res>(_self.joinResult!, (value) {
      return _then(_self.copyWith(joinResult: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrganizationsState].
extension OrganizationsStatePatterns on OrganizationsState {
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
    TResult Function(_OrganizationsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationsState() when $default != null:
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
    TResult Function(_OrganizationsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationsState():
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
    TResult? Function(_OrganizationsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationsState() when $default != null:
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
            SectionData<List<Organization>> organizations,
            SectionData<User> currentUser,
            FeatureStatus createStatus,
            FeatureStatus joinStatus,
            String? actionError,
            JoinResult? joinResult)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationsState() when $default != null:
        return $default(
            _that.organizations,
            _that.currentUser,
            _that.createStatus,
            _that.joinStatus,
            _that.actionError,
            _that.joinResult);
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
            SectionData<List<Organization>> organizations,
            SectionData<User> currentUser,
            FeatureStatus createStatus,
            FeatureStatus joinStatus,
            String? actionError,
            JoinResult? joinResult)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationsState():
        return $default(
            _that.organizations,
            _that.currentUser,
            _that.createStatus,
            _that.joinStatus,
            _that.actionError,
            _that.joinResult);
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
            SectionData<List<Organization>> organizations,
            SectionData<User> currentUser,
            FeatureStatus createStatus,
            FeatureStatus joinStatus,
            String? actionError,
            JoinResult? joinResult)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationsState() when $default != null:
        return $default(
            _that.organizations,
            _that.currentUser,
            _that.createStatus,
            _that.joinStatus,
            _that.actionError,
            _that.joinResult);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrganizationsState implements OrganizationsState {
  const _OrganizationsState(
      {this.organizations = const SectionData<List<Organization>>(),
      this.currentUser = const SectionData<User>(),
      this.createStatus = FeatureStatus.initial,
      this.joinStatus = FeatureStatus.initial,
      this.actionError,
      this.joinResult});

  @override
  @JsonKey()
  final SectionData<List<Organization>> organizations;
  @override
  @JsonKey()
  final SectionData<User> currentUser;
  @override
  @JsonKey()
  final FeatureStatus createStatus;
  @override
  @JsonKey()
  final FeatureStatus joinStatus;
  @override
  final String? actionError;
  @override
  final JoinResult? joinResult;

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationsStateCopyWith<_OrganizationsState> get copyWith =>
      __$OrganizationsStateCopyWithImpl<_OrganizationsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationsState &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.createStatus, createStatus) ||
                other.createStatus == createStatus) &&
            (identical(other.joinStatus, joinStatus) ||
                other.joinStatus == joinStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.joinResult, joinResult) ||
                other.joinResult == joinResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizations, currentUser,
      createStatus, joinStatus, actionError, joinResult);

  @override
  String toString() {
    return 'OrganizationsState(organizations: $organizations, currentUser: $currentUser, createStatus: $createStatus, joinStatus: $joinStatus, actionError: $actionError, joinResult: $joinResult)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationsStateCopyWith<$Res>
    implements $OrganizationsStateCopyWith<$Res> {
  factory _$OrganizationsStateCopyWith(
          _OrganizationsState value, $Res Function(_OrganizationsState) _then) =
      __$OrganizationsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<List<Organization>> organizations,
      SectionData<User> currentUser,
      FeatureStatus createStatus,
      FeatureStatus joinStatus,
      String? actionError,
      JoinResult? joinResult});

  @override
  $SectionDataCopyWith<List<Organization>, $Res> get organizations;
  @override
  $SectionDataCopyWith<User, $Res> get currentUser;
  @override
  $JoinResultCopyWith<$Res>? get joinResult;
}

/// @nodoc
class __$OrganizationsStateCopyWithImpl<$Res>
    implements _$OrganizationsStateCopyWith<$Res> {
  __$OrganizationsStateCopyWithImpl(this._self, this._then);

  final _OrganizationsState _self;
  final $Res Function(_OrganizationsState) _then;

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organizations = null,
    Object? currentUser = null,
    Object? createStatus = null,
    Object? joinStatus = null,
    Object? actionError = freezed,
    Object? joinResult = freezed,
  }) {
    return _then(_OrganizationsState(
      organizations: null == organizations
          ? _self.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Organization>>,
      currentUser: null == currentUser
          ? _self.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as SectionData<User>,
      createStatus: null == createStatus
          ? _self.createStatus
          : createStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      joinStatus: null == joinStatus
          ? _self.joinStatus
          : joinStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      joinResult: freezed == joinResult
          ? _self.joinResult
          : joinResult // ignore: cast_nullable_to_non_nullable
              as JoinResult?,
    ));
  }

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Organization>, $Res> get organizations {
    return $SectionDataCopyWith<List<Organization>, $Res>(_self.organizations,
        (value) {
      return _then(_self.copyWith(organizations: value));
    });
  }

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<User, $Res> get currentUser {
    return $SectionDataCopyWith<User, $Res>(_self.currentUser, (value) {
      return _then(_self.copyWith(currentUser: value));
    });
  }

  /// Create a copy of OrganizationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JoinResultCopyWith<$Res>? get joinResult {
    if (_self.joinResult == null) {
      return null;
    }

    return $JoinResultCopyWith<$Res>(_self.joinResult!, (value) {
      return _then(_self.copyWith(joinResult: value));
    });
  }
}

// dart format on
