// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'members_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MembersState {
  SectionData<List<Member>> get members;
  OrgMembershipRole? get viewerRole;
  FeatureStatus get actionStatus;
  String? get actionError;
  String get currentUserId;

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MembersStateCopyWith<MembersState> get copyWith =>
      _$MembersStateCopyWithImpl<MembersState>(
          this as MembersState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MembersState &&
            (identical(other.members, members) || other.members == members) &&
            (identical(other.viewerRole, viewerRole) ||
                other.viewerRole == viewerRole) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, members, viewerRole,
      actionStatus, actionError, currentUserId);

  @override
  String toString() {
    return 'MembersState(members: $members, viewerRole: $viewerRole, actionStatus: $actionStatus, actionError: $actionError, currentUserId: $currentUserId)';
  }
}

/// @nodoc
abstract mixin class $MembersStateCopyWith<$Res> {
  factory $MembersStateCopyWith(
          MembersState value, $Res Function(MembersState) _then) =
      _$MembersStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<List<Member>> members,
      OrgMembershipRole? viewerRole,
      FeatureStatus actionStatus,
      String? actionError,
      String currentUserId});

  $SectionDataCopyWith<List<Member>, $Res> get members;
}

/// @nodoc
class _$MembersStateCopyWithImpl<$Res> implements $MembersStateCopyWith<$Res> {
  _$MembersStateCopyWithImpl(this._self, this._then);

  final MembersState _self;
  final $Res Function(MembersState) _then;

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
    Object? viewerRole = freezed,
    Object? actionStatus = null,
    Object? actionError = freezed,
    Object? currentUserId = null,
  }) {
    return _then(_self.copyWith(
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Member>>,
      viewerRole: freezed == viewerRole
          ? _self.viewerRole
          : viewerRole // ignore: cast_nullable_to_non_nullable
              as OrgMembershipRole?,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUserId: null == currentUserId
          ? _self.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Member>, $Res> get members {
    return $SectionDataCopyWith<List<Member>, $Res>(_self.members, (value) {
      return _then(_self.copyWith(members: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MembersState].
extension MembersStatePatterns on MembersState {
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
    TResult Function(_MembersState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MembersState() when $default != null:
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
    TResult Function(_MembersState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MembersState():
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
    TResult? Function(_MembersState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MembersState() when $default != null:
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
            SectionData<List<Member>> members,
            OrgMembershipRole? viewerRole,
            FeatureStatus actionStatus,
            String? actionError,
            String currentUserId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MembersState() when $default != null:
        return $default(_that.members, _that.viewerRole, _that.actionStatus,
            _that.actionError, _that.currentUserId);
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
            SectionData<List<Member>> members,
            OrgMembershipRole? viewerRole,
            FeatureStatus actionStatus,
            String? actionError,
            String currentUserId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MembersState():
        return $default(_that.members, _that.viewerRole, _that.actionStatus,
            _that.actionError, _that.currentUserId);
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
            SectionData<List<Member>> members,
            OrgMembershipRole? viewerRole,
            FeatureStatus actionStatus,
            String? actionError,
            String currentUserId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MembersState() when $default != null:
        return $default(_that.members, _that.viewerRole, _that.actionStatus,
            _that.actionError, _that.currentUserId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MembersState extends MembersState {
  const _MembersState(
      {this.members = const SectionData<List<Member>>(),
      this.viewerRole,
      this.actionStatus = FeatureStatus.initial,
      this.actionError,
      this.currentUserId = ''})
      : super._();

  @override
  @JsonKey()
  final SectionData<List<Member>> members;
  @override
  final OrgMembershipRole? viewerRole;
  @override
  @JsonKey()
  final FeatureStatus actionStatus;
  @override
  final String? actionError;
  @override
  @JsonKey()
  final String currentUserId;

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MembersStateCopyWith<_MembersState> get copyWith =>
      __$MembersStateCopyWithImpl<_MembersState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MembersState &&
            (identical(other.members, members) || other.members == members) &&
            (identical(other.viewerRole, viewerRole) ||
                other.viewerRole == viewerRole) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.currentUserId, currentUserId) ||
                other.currentUserId == currentUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, members, viewerRole,
      actionStatus, actionError, currentUserId);

  @override
  String toString() {
    return 'MembersState(members: $members, viewerRole: $viewerRole, actionStatus: $actionStatus, actionError: $actionError, currentUserId: $currentUserId)';
  }
}

/// @nodoc
abstract mixin class _$MembersStateCopyWith<$Res>
    implements $MembersStateCopyWith<$Res> {
  factory _$MembersStateCopyWith(
          _MembersState value, $Res Function(_MembersState) _then) =
      __$MembersStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<List<Member>> members,
      OrgMembershipRole? viewerRole,
      FeatureStatus actionStatus,
      String? actionError,
      String currentUserId});

  @override
  $SectionDataCopyWith<List<Member>, $Res> get members;
}

/// @nodoc
class __$MembersStateCopyWithImpl<$Res>
    implements _$MembersStateCopyWith<$Res> {
  __$MembersStateCopyWithImpl(this._self, this._then);

  final _MembersState _self;
  final $Res Function(_MembersState) _then;

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? members = null,
    Object? viewerRole = freezed,
    Object? actionStatus = null,
    Object? actionError = freezed,
    Object? currentUserId = null,
  }) {
    return _then(_MembersState(
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Member>>,
      viewerRole: freezed == viewerRole
          ? _self.viewerRole
          : viewerRole // ignore: cast_nullable_to_non_nullable
              as OrgMembershipRole?,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUserId: null == currentUserId
          ? _self.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MembersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Member>, $Res> get members {
    return $SectionDataCopyWith<List<Member>, $Res>(_self.members, (value) {
      return _then(_self.copyWith(members: value));
    });
  }
}

// dart format on
