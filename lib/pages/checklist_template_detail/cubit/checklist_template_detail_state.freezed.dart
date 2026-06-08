// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_template_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistTemplateDetailState {
  SectionData<ChecklistTemplateDetail> get template;
  SectionData<List<OrganizationRole>> get roles;
  SectionData<ChecklistAssignment> get assignments;
  SectionData<List<Member>> get members;
  Set<String> get pendingMemberIds;
  FeatureStatus get actionStatus;
  String? get actionError;

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistTemplateDetailStateCopyWith<ChecklistTemplateDetailState>
      get copyWith => _$ChecklistTemplateDetailStateCopyWithImpl<
              ChecklistTemplateDetailState>(
          this as ChecklistTemplateDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistTemplateDetailState &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.roles, roles) || other.roles == roles) &&
            (identical(other.assignments, assignments) ||
                other.assignments == assignments) &&
            (identical(other.members, members) || other.members == members) &&
            const DeepCollectionEquality()
                .equals(other.pendingMemberIds, pendingMemberIds) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      template,
      roles,
      assignments,
      members,
      const DeepCollectionEquality().hash(pendingMemberIds),
      actionStatus,
      actionError);

  @override
  String toString() {
    return 'ChecklistTemplateDetailState(template: $template, roles: $roles, assignments: $assignments, members: $members, pendingMemberIds: $pendingMemberIds, actionStatus: $actionStatus, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $ChecklistTemplateDetailStateCopyWith<$Res> {
  factory $ChecklistTemplateDetailStateCopyWith(
          ChecklistTemplateDetailState value,
          $Res Function(ChecklistTemplateDetailState) _then) =
      _$ChecklistTemplateDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<ChecklistTemplateDetail> template,
      SectionData<List<OrganizationRole>> roles,
      SectionData<ChecklistAssignment> assignments,
      SectionData<List<Member>> members,
      Set<String> pendingMemberIds,
      FeatureStatus actionStatus,
      String? actionError});

  $SectionDataCopyWith<ChecklistTemplateDetail, $Res> get template;
  $SectionDataCopyWith<List<OrganizationRole>, $Res> get roles;
  $SectionDataCopyWith<ChecklistAssignment, $Res> get assignments;
  $SectionDataCopyWith<List<Member>, $Res> get members;
}

/// @nodoc
class _$ChecklistTemplateDetailStateCopyWithImpl<$Res>
    implements $ChecklistTemplateDetailStateCopyWith<$Res> {
  _$ChecklistTemplateDetailStateCopyWithImpl(this._self, this._then);

  final ChecklistTemplateDetailState _self;
  final $Res Function(ChecklistTemplateDetailState) _then;

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
    Object? roles = null,
    Object? assignments = null,
    Object? members = null,
    Object? pendingMemberIds = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      template: null == template
          ? _self.template
          : template // ignore: cast_nullable_to_non_nullable
              as SectionData<ChecklistTemplateDetail>,
      roles: null == roles
          ? _self.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as SectionData<List<OrganizationRole>>,
      assignments: null == assignments
          ? _self.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as SectionData<ChecklistAssignment>,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Member>>,
      pendingMemberIds: null == pendingMemberIds
          ? _self.pendingMemberIds
          : pendingMemberIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<ChecklistTemplateDetail, $Res> get template {
    return $SectionDataCopyWith<ChecklistTemplateDetail, $Res>(_self.template,
        (value) {
      return _then(_self.copyWith(template: value));
    });
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<OrganizationRole>, $Res> get roles {
    return $SectionDataCopyWith<List<OrganizationRole>, $Res>(_self.roles,
        (value) {
      return _then(_self.copyWith(roles: value));
    });
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<ChecklistAssignment, $Res> get assignments {
    return $SectionDataCopyWith<ChecklistAssignment, $Res>(_self.assignments,
        (value) {
      return _then(_self.copyWith(assignments: value));
    });
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Member>, $Res> get members {
    return $SectionDataCopyWith<List<Member>, $Res>(_self.members, (value) {
      return _then(_self.copyWith(members: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChecklistTemplateDetailState].
extension ChecklistTemplateDetailStatePatterns on ChecklistTemplateDetailState {
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
    TResult Function(_ChecklistTemplateDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplateDetailState() when $default != null:
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
    TResult Function(_ChecklistTemplateDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplateDetailState():
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
    TResult? Function(_ChecklistTemplateDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplateDetailState() when $default != null:
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
            SectionData<ChecklistTemplateDetail> template,
            SectionData<List<OrganizationRole>> roles,
            SectionData<ChecklistAssignment> assignments,
            SectionData<List<Member>> members,
            Set<String> pendingMemberIds,
            FeatureStatus actionStatus,
            String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplateDetailState() when $default != null:
        return $default(
            _that.template,
            _that.roles,
            _that.assignments,
            _that.members,
            _that.pendingMemberIds,
            _that.actionStatus,
            _that.actionError);
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
            SectionData<ChecklistTemplateDetail> template,
            SectionData<List<OrganizationRole>> roles,
            SectionData<ChecklistAssignment> assignments,
            SectionData<List<Member>> members,
            Set<String> pendingMemberIds,
            FeatureStatus actionStatus,
            String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplateDetailState():
        return $default(
            _that.template,
            _that.roles,
            _that.assignments,
            _that.members,
            _that.pendingMemberIds,
            _that.actionStatus,
            _that.actionError);
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
            SectionData<ChecklistTemplateDetail> template,
            SectionData<List<OrganizationRole>> roles,
            SectionData<ChecklistAssignment> assignments,
            SectionData<List<Member>> members,
            Set<String> pendingMemberIds,
            FeatureStatus actionStatus,
            String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplateDetailState() when $default != null:
        return $default(
            _that.template,
            _that.roles,
            _that.assignments,
            _that.members,
            _that.pendingMemberIds,
            _that.actionStatus,
            _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistTemplateDetailState implements ChecklistTemplateDetailState {
  const _ChecklistTemplateDetailState(
      {this.template = const SectionData<ChecklistTemplateDetail>(),
      this.roles = const SectionData<List<OrganizationRole>>(),
      this.assignments = const SectionData<ChecklistAssignment>(),
      this.members = const SectionData<List<Member>>(),
      final Set<String> pendingMemberIds = const <String>{},
      this.actionStatus = FeatureStatus.initial,
      this.actionError})
      : _pendingMemberIds = pendingMemberIds;

  @override
  @JsonKey()
  final SectionData<ChecklistTemplateDetail> template;
  @override
  @JsonKey()
  final SectionData<List<OrganizationRole>> roles;
  @override
  @JsonKey()
  final SectionData<ChecklistAssignment> assignments;
  @override
  @JsonKey()
  final SectionData<List<Member>> members;
  final Set<String> _pendingMemberIds;
  @override
  @JsonKey()
  Set<String> get pendingMemberIds {
    if (_pendingMemberIds is EqualUnmodifiableSetView) return _pendingMemberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pendingMemberIds);
  }

  @override
  @JsonKey()
  final FeatureStatus actionStatus;
  @override
  final String? actionError;

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistTemplateDetailStateCopyWith<_ChecklistTemplateDetailState>
      get copyWith => __$ChecklistTemplateDetailStateCopyWithImpl<
          _ChecklistTemplateDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistTemplateDetailState &&
            (identical(other.template, template) ||
                other.template == template) &&
            (identical(other.roles, roles) || other.roles == roles) &&
            (identical(other.assignments, assignments) ||
                other.assignments == assignments) &&
            (identical(other.members, members) || other.members == members) &&
            const DeepCollectionEquality()
                .equals(other._pendingMemberIds, _pendingMemberIds) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      template,
      roles,
      assignments,
      members,
      const DeepCollectionEquality().hash(_pendingMemberIds),
      actionStatus,
      actionError);

  @override
  String toString() {
    return 'ChecklistTemplateDetailState(template: $template, roles: $roles, assignments: $assignments, members: $members, pendingMemberIds: $pendingMemberIds, actionStatus: $actionStatus, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistTemplateDetailStateCopyWith<$Res>
    implements $ChecklistTemplateDetailStateCopyWith<$Res> {
  factory _$ChecklistTemplateDetailStateCopyWith(
          _ChecklistTemplateDetailState value,
          $Res Function(_ChecklistTemplateDetailState) _then) =
      __$ChecklistTemplateDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<ChecklistTemplateDetail> template,
      SectionData<List<OrganizationRole>> roles,
      SectionData<ChecklistAssignment> assignments,
      SectionData<List<Member>> members,
      Set<String> pendingMemberIds,
      FeatureStatus actionStatus,
      String? actionError});

  @override
  $SectionDataCopyWith<ChecklistTemplateDetail, $Res> get template;
  @override
  $SectionDataCopyWith<List<OrganizationRole>, $Res> get roles;
  @override
  $SectionDataCopyWith<ChecklistAssignment, $Res> get assignments;
  @override
  $SectionDataCopyWith<List<Member>, $Res> get members;
}

/// @nodoc
class __$ChecklistTemplateDetailStateCopyWithImpl<$Res>
    implements _$ChecklistTemplateDetailStateCopyWith<$Res> {
  __$ChecklistTemplateDetailStateCopyWithImpl(this._self, this._then);

  final _ChecklistTemplateDetailState _self;
  final $Res Function(_ChecklistTemplateDetailState) _then;

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? template = null,
    Object? roles = null,
    Object? assignments = null,
    Object? members = null,
    Object? pendingMemberIds = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
  }) {
    return _then(_ChecklistTemplateDetailState(
      template: null == template
          ? _self.template
          : template // ignore: cast_nullable_to_non_nullable
              as SectionData<ChecklistTemplateDetail>,
      roles: null == roles
          ? _self.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as SectionData<List<OrganizationRole>>,
      assignments: null == assignments
          ? _self.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as SectionData<ChecklistAssignment>,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Member>>,
      pendingMemberIds: null == pendingMemberIds
          ? _self._pendingMemberIds
          : pendingMemberIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<ChecklistTemplateDetail, $Res> get template {
    return $SectionDataCopyWith<ChecklistTemplateDetail, $Res>(_self.template,
        (value) {
      return _then(_self.copyWith(template: value));
    });
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<OrganizationRole>, $Res> get roles {
    return $SectionDataCopyWith<List<OrganizationRole>, $Res>(_self.roles,
        (value) {
      return _then(_self.copyWith(roles: value));
    });
  }

  /// Create a copy of ChecklistTemplateDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<ChecklistAssignment, $Res> get assignments {
    return $SectionDataCopyWith<ChecklistAssignment, $Res>(_self.assignments,
        (value) {
      return _then(_self.copyWith(assignments: value));
    });
  }

  /// Create a copy of ChecklistTemplateDetailState
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
