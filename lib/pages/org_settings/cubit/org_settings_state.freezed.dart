// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgSettingsState {
  SectionData<OrgSettings> get settings;
  FeatureStatus get saveStatus;
  bool get geoCheckEnabled;
  bool get autoFinishEnabled;
  int? get autoFinishHours;
  int? get maxPauseMinutes;
  int? get maxPausesPerShift;
  bool get hasChanges;

  /// Create a copy of OrgSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrgSettingsStateCopyWith<OrgSettingsState> get copyWith =>
      _$OrgSettingsStateCopyWithImpl<OrgSettingsState>(
          this as OrgSettingsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrgSettingsState &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.saveStatus, saveStatus) ||
                other.saveStatus == saveStatus) &&
            (identical(other.geoCheckEnabled, geoCheckEnabled) ||
                other.geoCheckEnabled == geoCheckEnabled) &&
            (identical(other.autoFinishEnabled, autoFinishEnabled) ||
                other.autoFinishEnabled == autoFinishEnabled) &&
            (identical(other.autoFinishHours, autoFinishHours) ||
                other.autoFinishHours == autoFinishHours) &&
            (identical(other.maxPauseMinutes, maxPauseMinutes) ||
                other.maxPauseMinutes == maxPauseMinutes) &&
            (identical(other.maxPausesPerShift, maxPausesPerShift) ||
                other.maxPausesPerShift == maxPausesPerShift) &&
            (identical(other.hasChanges, hasChanges) ||
                other.hasChanges == hasChanges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      saveStatus,
      geoCheckEnabled,
      autoFinishEnabled,
      autoFinishHours,
      maxPauseMinutes,
      maxPausesPerShift,
      hasChanges);

  @override
  String toString() {
    return 'OrgSettingsState(settings: $settings, saveStatus: $saveStatus, geoCheckEnabled: $geoCheckEnabled, autoFinishEnabled: $autoFinishEnabled, autoFinishHours: $autoFinishHours, maxPauseMinutes: $maxPauseMinutes, maxPausesPerShift: $maxPausesPerShift, hasChanges: $hasChanges)';
  }
}

/// @nodoc
abstract mixin class $OrgSettingsStateCopyWith<$Res> {
  factory $OrgSettingsStateCopyWith(
          OrgSettingsState value, $Res Function(OrgSettingsState) _then) =
      _$OrgSettingsStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<OrgSettings> settings,
      FeatureStatus saveStatus,
      bool geoCheckEnabled,
      bool autoFinishEnabled,
      int? autoFinishHours,
      int? maxPauseMinutes,
      int? maxPausesPerShift,
      bool hasChanges});

  $SectionDataCopyWith<OrgSettings, $Res> get settings;
}

/// @nodoc
class _$OrgSettingsStateCopyWithImpl<$Res>
    implements $OrgSettingsStateCopyWith<$Res> {
  _$OrgSettingsStateCopyWithImpl(this._self, this._then);

  final OrgSettingsState _self;
  final $Res Function(OrgSettingsState) _then;

  /// Create a copy of OrgSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? saveStatus = null,
    Object? geoCheckEnabled = null,
    Object? autoFinishEnabled = null,
    Object? autoFinishHours = freezed,
    Object? maxPauseMinutes = freezed,
    Object? maxPausesPerShift = freezed,
    Object? hasChanges = null,
  }) {
    return _then(_self.copyWith(
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SectionData<OrgSettings>,
      saveStatus: null == saveStatus
          ? _self.saveStatus
          : saveStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      geoCheckEnabled: null == geoCheckEnabled
          ? _self.geoCheckEnabled
          : geoCheckEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoFinishEnabled: null == autoFinishEnabled
          ? _self.autoFinishEnabled
          : autoFinishEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoFinishHours: freezed == autoFinishHours
          ? _self.autoFinishHours
          : autoFinishHours // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPauseMinutes: freezed == maxPauseMinutes
          ? _self.maxPauseMinutes
          : maxPauseMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPausesPerShift: freezed == maxPausesPerShift
          ? _self.maxPausesPerShift
          : maxPausesPerShift // ignore: cast_nullable_to_non_nullable
              as int?,
      hasChanges: null == hasChanges
          ? _self.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of OrgSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<OrgSettings, $Res> get settings {
    return $SectionDataCopyWith<OrgSettings, $Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrgSettingsState].
extension OrgSettingsStatePatterns on OrgSettingsState {
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
    TResult Function(_OrgSettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgSettingsState() when $default != null:
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
    TResult Function(_OrgSettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettingsState():
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
    TResult? Function(_OrgSettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettingsState() when $default != null:
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
            SectionData<OrgSettings> settings,
            FeatureStatus saveStatus,
            bool geoCheckEnabled,
            bool autoFinishEnabled,
            int? autoFinishHours,
            int? maxPauseMinutes,
            int? maxPausesPerShift,
            bool hasChanges)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgSettingsState() when $default != null:
        return $default(
            _that.settings,
            _that.saveStatus,
            _that.geoCheckEnabled,
            _that.autoFinishEnabled,
            _that.autoFinishHours,
            _that.maxPauseMinutes,
            _that.maxPausesPerShift,
            _that.hasChanges);
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
            SectionData<OrgSettings> settings,
            FeatureStatus saveStatus,
            bool geoCheckEnabled,
            bool autoFinishEnabled,
            int? autoFinishHours,
            int? maxPauseMinutes,
            int? maxPausesPerShift,
            bool hasChanges)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettingsState():
        return $default(
            _that.settings,
            _that.saveStatus,
            _that.geoCheckEnabled,
            _that.autoFinishEnabled,
            _that.autoFinishHours,
            _that.maxPauseMinutes,
            _that.maxPausesPerShift,
            _that.hasChanges);
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
            SectionData<OrgSettings> settings,
            FeatureStatus saveStatus,
            bool geoCheckEnabled,
            bool autoFinishEnabled,
            int? autoFinishHours,
            int? maxPauseMinutes,
            int? maxPausesPerShift,
            bool hasChanges)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettingsState() when $default != null:
        return $default(
            _that.settings,
            _that.saveStatus,
            _that.geoCheckEnabled,
            _that.autoFinishEnabled,
            _that.autoFinishHours,
            _that.maxPauseMinutes,
            _that.maxPausesPerShift,
            _that.hasChanges);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrgSettingsState implements OrgSettingsState {
  const _OrgSettingsState(
      {this.settings = const SectionData<OrgSettings>(),
      this.saveStatus = FeatureStatus.initial,
      this.geoCheckEnabled = false,
      this.autoFinishEnabled = false,
      this.autoFinishHours,
      this.maxPauseMinutes,
      this.maxPausesPerShift,
      this.hasChanges = false});

  @override
  @JsonKey()
  final SectionData<OrgSettings> settings;
  @override
  @JsonKey()
  final FeatureStatus saveStatus;
  @override
  @JsonKey()
  final bool geoCheckEnabled;
  @override
  @JsonKey()
  final bool autoFinishEnabled;
  @override
  final int? autoFinishHours;
  @override
  final int? maxPauseMinutes;
  @override
  final int? maxPausesPerShift;
  @override
  @JsonKey()
  final bool hasChanges;

  /// Create a copy of OrgSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrgSettingsStateCopyWith<_OrgSettingsState> get copyWith =>
      __$OrgSettingsStateCopyWithImpl<_OrgSettingsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgSettingsState &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.saveStatus, saveStatus) ||
                other.saveStatus == saveStatus) &&
            (identical(other.geoCheckEnabled, geoCheckEnabled) ||
                other.geoCheckEnabled == geoCheckEnabled) &&
            (identical(other.autoFinishEnabled, autoFinishEnabled) ||
                other.autoFinishEnabled == autoFinishEnabled) &&
            (identical(other.autoFinishHours, autoFinishHours) ||
                other.autoFinishHours == autoFinishHours) &&
            (identical(other.maxPauseMinutes, maxPauseMinutes) ||
                other.maxPauseMinutes == maxPauseMinutes) &&
            (identical(other.maxPausesPerShift, maxPausesPerShift) ||
                other.maxPausesPerShift == maxPausesPerShift) &&
            (identical(other.hasChanges, hasChanges) ||
                other.hasChanges == hasChanges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      settings,
      saveStatus,
      geoCheckEnabled,
      autoFinishEnabled,
      autoFinishHours,
      maxPauseMinutes,
      maxPausesPerShift,
      hasChanges);

  @override
  String toString() {
    return 'OrgSettingsState(settings: $settings, saveStatus: $saveStatus, geoCheckEnabled: $geoCheckEnabled, autoFinishEnabled: $autoFinishEnabled, autoFinishHours: $autoFinishHours, maxPauseMinutes: $maxPauseMinutes, maxPausesPerShift: $maxPausesPerShift, hasChanges: $hasChanges)';
  }
}

/// @nodoc
abstract mixin class _$OrgSettingsStateCopyWith<$Res>
    implements $OrgSettingsStateCopyWith<$Res> {
  factory _$OrgSettingsStateCopyWith(
          _OrgSettingsState value, $Res Function(_OrgSettingsState) _then) =
      __$OrgSettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<OrgSettings> settings,
      FeatureStatus saveStatus,
      bool geoCheckEnabled,
      bool autoFinishEnabled,
      int? autoFinishHours,
      int? maxPauseMinutes,
      int? maxPausesPerShift,
      bool hasChanges});

  @override
  $SectionDataCopyWith<OrgSettings, $Res> get settings;
}

/// @nodoc
class __$OrgSettingsStateCopyWithImpl<$Res>
    implements _$OrgSettingsStateCopyWith<$Res> {
  __$OrgSettingsStateCopyWithImpl(this._self, this._then);

  final _OrgSettingsState _self;
  final $Res Function(_OrgSettingsState) _then;

  /// Create a copy of OrgSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? settings = null,
    Object? saveStatus = null,
    Object? geoCheckEnabled = null,
    Object? autoFinishEnabled = null,
    Object? autoFinishHours = freezed,
    Object? maxPauseMinutes = freezed,
    Object? maxPausesPerShift = freezed,
    Object? hasChanges = null,
  }) {
    return _then(_OrgSettingsState(
      settings: null == settings
          ? _self.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SectionData<OrgSettings>,
      saveStatus: null == saveStatus
          ? _self.saveStatus
          : saveStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      geoCheckEnabled: null == geoCheckEnabled
          ? _self.geoCheckEnabled
          : geoCheckEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoFinishEnabled: null == autoFinishEnabled
          ? _self.autoFinishEnabled
          : autoFinishEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoFinishHours: freezed == autoFinishHours
          ? _self.autoFinishHours
          : autoFinishHours // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPauseMinutes: freezed == maxPauseMinutes
          ? _self.maxPauseMinutes
          : maxPauseMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPausesPerShift: freezed == maxPausesPerShift
          ? _self.maxPausesPerShift
          : maxPausesPerShift // ignore: cast_nullable_to_non_nullable
              as int?,
      hasChanges: null == hasChanges
          ? _self.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of OrgSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<OrgSettings, $Res> get settings {
    return $SectionDataCopyWith<OrgSettings, $Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

// dart format on
