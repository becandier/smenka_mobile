// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_tracker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftTrackerState {
  /// Активная смена (SectionData — loading/error на init, success при наличии)
  SectionData<Shift> get activeShift;

  /// Организации пользователя
  SectionData<List<Organization>> get organizations;

  /// Выбранная организация (null = персональная)
  String? get selectedOrganizationId;

  /// Таймер — обновляется каждую секунду
  int get elapsedSeconds;

  /// Статус действия (start/pause/resume/finish) — transient
  FeatureStatus get actionStatus;
  String? get actionError;

  /// Предупреждение о низкой точности GPS
  bool get showLowAccuracyWarning;

  /// Create a copy of ShiftTrackerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShiftTrackerStateCopyWith<ShiftTrackerState> get copyWith =>
      _$ShiftTrackerStateCopyWithImpl<ShiftTrackerState>(
          this as ShiftTrackerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShiftTrackerState &&
            (identical(other.activeShift, activeShift) ||
                other.activeShift == activeShift) &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations) &&
            (identical(other.selectedOrganizationId, selectedOrganizationId) ||
                other.selectedOrganizationId == selectedOrganizationId) &&
            (identical(other.elapsedSeconds, elapsedSeconds) ||
                other.elapsedSeconds == elapsedSeconds) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.showLowAccuracyWarning, showLowAccuracyWarning) ||
                other.showLowAccuracyWarning == showLowAccuracyWarning));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeShift,
      organizations,
      selectedOrganizationId,
      elapsedSeconds,
      actionStatus,
      actionError,
      showLowAccuracyWarning);

  @override
  String toString() {
    return 'ShiftTrackerState(activeShift: $activeShift, organizations: $organizations, selectedOrganizationId: $selectedOrganizationId, elapsedSeconds: $elapsedSeconds, actionStatus: $actionStatus, actionError: $actionError, showLowAccuracyWarning: $showLowAccuracyWarning)';
  }
}

/// @nodoc
abstract mixin class $ShiftTrackerStateCopyWith<$Res> {
  factory $ShiftTrackerStateCopyWith(
          ShiftTrackerState value, $Res Function(ShiftTrackerState) _then) =
      _$ShiftTrackerStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<Shift> activeShift,
      SectionData<List<Organization>> organizations,
      String? selectedOrganizationId,
      int elapsedSeconds,
      FeatureStatus actionStatus,
      String? actionError,
      bool showLowAccuracyWarning});

  $SectionDataCopyWith<Shift, $Res> get activeShift;
  $SectionDataCopyWith<List<Organization>, $Res> get organizations;
}

/// @nodoc
class _$ShiftTrackerStateCopyWithImpl<$Res>
    implements $ShiftTrackerStateCopyWith<$Res> {
  _$ShiftTrackerStateCopyWithImpl(this._self, this._then);

  final ShiftTrackerState _self;
  final $Res Function(ShiftTrackerState) _then;

  /// Create a copy of ShiftTrackerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeShift = null,
    Object? organizations = null,
    Object? selectedOrganizationId = freezed,
    Object? elapsedSeconds = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
    Object? showLowAccuracyWarning = null,
  }) {
    return _then(_self.copyWith(
      activeShift: null == activeShift
          ? _self.activeShift
          : activeShift // ignore: cast_nullable_to_non_nullable
              as SectionData<Shift>,
      organizations: null == organizations
          ? _self.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Organization>>,
      selectedOrganizationId: freezed == selectedOrganizationId
          ? _self.selectedOrganizationId
          : selectedOrganizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsedSeconds: null == elapsedSeconds
          ? _self.elapsedSeconds
          : elapsedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      showLowAccuracyWarning: null == showLowAccuracyWarning
          ? _self.showLowAccuracyWarning
          : showLowAccuracyWarning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ShiftTrackerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<Shift, $Res> get activeShift {
    return $SectionDataCopyWith<Shift, $Res>(_self.activeShift, (value) {
      return _then(_self.copyWith(activeShift: value));
    });
  }

  /// Create a copy of ShiftTrackerState
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

/// Adds pattern-matching-related methods to [ShiftTrackerState].
extension ShiftTrackerStatePatterns on ShiftTrackerState {
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
    TResult Function(_ShiftTrackerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftTrackerState() when $default != null:
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
    TResult Function(_ShiftTrackerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftTrackerState():
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
    TResult? Function(_ShiftTrackerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftTrackerState() when $default != null:
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
            SectionData<Shift> activeShift,
            SectionData<List<Organization>> organizations,
            String? selectedOrganizationId,
            int elapsedSeconds,
            FeatureStatus actionStatus,
            String? actionError,
            bool showLowAccuracyWarning)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftTrackerState() when $default != null:
        return $default(
            _that.activeShift,
            _that.organizations,
            _that.selectedOrganizationId,
            _that.elapsedSeconds,
            _that.actionStatus,
            _that.actionError,
            _that.showLowAccuracyWarning);
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
            SectionData<Shift> activeShift,
            SectionData<List<Organization>> organizations,
            String? selectedOrganizationId,
            int elapsedSeconds,
            FeatureStatus actionStatus,
            String? actionError,
            bool showLowAccuracyWarning)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftTrackerState():
        return $default(
            _that.activeShift,
            _that.organizations,
            _that.selectedOrganizationId,
            _that.elapsedSeconds,
            _that.actionStatus,
            _that.actionError,
            _that.showLowAccuracyWarning);
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
            SectionData<Shift> activeShift,
            SectionData<List<Organization>> organizations,
            String? selectedOrganizationId,
            int elapsedSeconds,
            FeatureStatus actionStatus,
            String? actionError,
            bool showLowAccuracyWarning)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftTrackerState() when $default != null:
        return $default(
            _that.activeShift,
            _that.organizations,
            _that.selectedOrganizationId,
            _that.elapsedSeconds,
            _that.actionStatus,
            _that.actionError,
            _that.showLowAccuracyWarning);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShiftTrackerState extends ShiftTrackerState {
  const _ShiftTrackerState(
      {this.activeShift = const SectionData<Shift>(),
      this.organizations = const SectionData<List<Organization>>(),
      this.selectedOrganizationId,
      this.elapsedSeconds = 0,
      this.actionStatus = FeatureStatus.initial,
      this.actionError,
      this.showLowAccuracyWarning = false})
      : super._();

  /// Активная смена (SectionData — loading/error на init, success при наличии)
  @override
  @JsonKey()
  final SectionData<Shift> activeShift;

  /// Организации пользователя
  @override
  @JsonKey()
  final SectionData<List<Organization>> organizations;

  /// Выбранная организация (null = персональная)
  @override
  final String? selectedOrganizationId;

  /// Таймер — обновляется каждую секунду
  @override
  @JsonKey()
  final int elapsedSeconds;

  /// Статус действия (start/pause/resume/finish) — transient
  @override
  @JsonKey()
  final FeatureStatus actionStatus;
  @override
  final String? actionError;

  /// Предупреждение о низкой точности GPS
  @override
  @JsonKey()
  final bool showLowAccuracyWarning;

  /// Create a copy of ShiftTrackerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShiftTrackerStateCopyWith<_ShiftTrackerState> get copyWith =>
      __$ShiftTrackerStateCopyWithImpl<_ShiftTrackerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShiftTrackerState &&
            (identical(other.activeShift, activeShift) ||
                other.activeShift == activeShift) &&
            (identical(other.organizations, organizations) ||
                other.organizations == organizations) &&
            (identical(other.selectedOrganizationId, selectedOrganizationId) ||
                other.selectedOrganizationId == selectedOrganizationId) &&
            (identical(other.elapsedSeconds, elapsedSeconds) ||
                other.elapsedSeconds == elapsedSeconds) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.showLowAccuracyWarning, showLowAccuracyWarning) ||
                other.showLowAccuracyWarning == showLowAccuracyWarning));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeShift,
      organizations,
      selectedOrganizationId,
      elapsedSeconds,
      actionStatus,
      actionError,
      showLowAccuracyWarning);

  @override
  String toString() {
    return 'ShiftTrackerState(activeShift: $activeShift, organizations: $organizations, selectedOrganizationId: $selectedOrganizationId, elapsedSeconds: $elapsedSeconds, actionStatus: $actionStatus, actionError: $actionError, showLowAccuracyWarning: $showLowAccuracyWarning)';
  }
}

/// @nodoc
abstract mixin class _$ShiftTrackerStateCopyWith<$Res>
    implements $ShiftTrackerStateCopyWith<$Res> {
  factory _$ShiftTrackerStateCopyWith(
          _ShiftTrackerState value, $Res Function(_ShiftTrackerState) _then) =
      __$ShiftTrackerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<Shift> activeShift,
      SectionData<List<Organization>> organizations,
      String? selectedOrganizationId,
      int elapsedSeconds,
      FeatureStatus actionStatus,
      String? actionError,
      bool showLowAccuracyWarning});

  @override
  $SectionDataCopyWith<Shift, $Res> get activeShift;
  @override
  $SectionDataCopyWith<List<Organization>, $Res> get organizations;
}

/// @nodoc
class __$ShiftTrackerStateCopyWithImpl<$Res>
    implements _$ShiftTrackerStateCopyWith<$Res> {
  __$ShiftTrackerStateCopyWithImpl(this._self, this._then);

  final _ShiftTrackerState _self;
  final $Res Function(_ShiftTrackerState) _then;

  /// Create a copy of ShiftTrackerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeShift = null,
    Object? organizations = null,
    Object? selectedOrganizationId = freezed,
    Object? elapsedSeconds = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
    Object? showLowAccuracyWarning = null,
  }) {
    return _then(_ShiftTrackerState(
      activeShift: null == activeShift
          ? _self.activeShift
          : activeShift // ignore: cast_nullable_to_non_nullable
              as SectionData<Shift>,
      organizations: null == organizations
          ? _self.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Organization>>,
      selectedOrganizationId: freezed == selectedOrganizationId
          ? _self.selectedOrganizationId
          : selectedOrganizationId // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsedSeconds: null == elapsedSeconds
          ? _self.elapsedSeconds
          : elapsedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      showLowAccuracyWarning: null == showLowAccuracyWarning
          ? _self.showLowAccuracyWarning
          : showLowAccuracyWarning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ShiftTrackerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<Shift, $Res> get activeShift {
    return $SectionDataCopyWith<Shift, $Res>(_self.activeShift, (value) {
      return _then(_self.copyWith(activeShift: value));
    });
  }

  /// Create a copy of ShiftTrackerState
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
