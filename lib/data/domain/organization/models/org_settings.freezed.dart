// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgSettings {
  String get organizationId;
  bool get geoCheckEnabled;
  int? get autoFinishHours;
  int? get maxPauseMinutes;
  int? get maxPausesPerShift;

  /// Create a copy of OrgSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrgSettingsCopyWith<OrgSettings> get copyWith =>
      _$OrgSettingsCopyWithImpl<OrgSettings>(this as OrgSettings, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrgSettings &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.geoCheckEnabled, geoCheckEnabled) ||
                other.geoCheckEnabled == geoCheckEnabled) &&
            (identical(other.autoFinishHours, autoFinishHours) ||
                other.autoFinishHours == autoFinishHours) &&
            (identical(other.maxPauseMinutes, maxPauseMinutes) ||
                other.maxPauseMinutes == maxPauseMinutes) &&
            (identical(other.maxPausesPerShift, maxPausesPerShift) ||
                other.maxPausesPerShift == maxPausesPerShift));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId, geoCheckEnabled,
      autoFinishHours, maxPauseMinutes, maxPausesPerShift);

  @override
  String toString() {
    return 'OrgSettings(organizationId: $organizationId, geoCheckEnabled: $geoCheckEnabled, autoFinishHours: $autoFinishHours, maxPauseMinutes: $maxPauseMinutes, maxPausesPerShift: $maxPausesPerShift)';
  }
}

/// @nodoc
abstract mixin class $OrgSettingsCopyWith<$Res> {
  factory $OrgSettingsCopyWith(
          OrgSettings value, $Res Function(OrgSettings) _then) =
      _$OrgSettingsCopyWithImpl;
  @useResult
  $Res call(
      {String organizationId,
      bool geoCheckEnabled,
      int? autoFinishHours,
      int? maxPauseMinutes,
      int? maxPausesPerShift});
}

/// @nodoc
class _$OrgSettingsCopyWithImpl<$Res> implements $OrgSettingsCopyWith<$Res> {
  _$OrgSettingsCopyWithImpl(this._self, this._then);

  final OrgSettings _self;
  final $Res Function(OrgSettings) _then;

  /// Create a copy of OrgSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationId = null,
    Object? geoCheckEnabled = null,
    Object? autoFinishHours = freezed,
    Object? maxPauseMinutes = freezed,
    Object? maxPausesPerShift = freezed,
  }) {
    return _then(_self.copyWith(
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      geoCheckEnabled: null == geoCheckEnabled
          ? _self.geoCheckEnabled
          : geoCheckEnabled // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// Adds pattern-matching-related methods to [OrgSettings].
extension OrgSettingsPatterns on OrgSettings {
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
    TResult Function(_OrgSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgSettings() when $default != null:
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
    TResult Function(_OrgSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettings():
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
    TResult? Function(_OrgSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettings() when $default != null:
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
    TResult Function(String organizationId, bool geoCheckEnabled,
            int? autoFinishHours, int? maxPauseMinutes, int? maxPausesPerShift)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgSettings() when $default != null:
        return $default(
            _that.organizationId,
            _that.geoCheckEnabled,
            _that.autoFinishHours,
            _that.maxPauseMinutes,
            _that.maxPausesPerShift);
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
    TResult Function(String organizationId, bool geoCheckEnabled,
            int? autoFinishHours, int? maxPauseMinutes, int? maxPausesPerShift)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettings():
        return $default(
            _that.organizationId,
            _that.geoCheckEnabled,
            _that.autoFinishHours,
            _that.maxPauseMinutes,
            _that.maxPausesPerShift);
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
    TResult? Function(String organizationId, bool geoCheckEnabled,
            int? autoFinishHours, int? maxPauseMinutes, int? maxPausesPerShift)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgSettings() when $default != null:
        return $default(
            _that.organizationId,
            _that.geoCheckEnabled,
            _that.autoFinishHours,
            _that.maxPauseMinutes,
            _that.maxPausesPerShift);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrgSettings implements OrgSettings {
  const _OrgSettings(
      {required this.organizationId,
      required this.geoCheckEnabled,
      this.autoFinishHours,
      this.maxPauseMinutes,
      this.maxPausesPerShift});

  @override
  final String organizationId;
  @override
  final bool geoCheckEnabled;
  @override
  final int? autoFinishHours;
  @override
  final int? maxPauseMinutes;
  @override
  final int? maxPausesPerShift;

  /// Create a copy of OrgSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrgSettingsCopyWith<_OrgSettings> get copyWith =>
      __$OrgSettingsCopyWithImpl<_OrgSettings>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgSettings &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.geoCheckEnabled, geoCheckEnabled) ||
                other.geoCheckEnabled == geoCheckEnabled) &&
            (identical(other.autoFinishHours, autoFinishHours) ||
                other.autoFinishHours == autoFinishHours) &&
            (identical(other.maxPauseMinutes, maxPauseMinutes) ||
                other.maxPauseMinutes == maxPauseMinutes) &&
            (identical(other.maxPausesPerShift, maxPausesPerShift) ||
                other.maxPausesPerShift == maxPausesPerShift));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizationId, geoCheckEnabled,
      autoFinishHours, maxPauseMinutes, maxPausesPerShift);

  @override
  String toString() {
    return 'OrgSettings(organizationId: $organizationId, geoCheckEnabled: $geoCheckEnabled, autoFinishHours: $autoFinishHours, maxPauseMinutes: $maxPauseMinutes, maxPausesPerShift: $maxPausesPerShift)';
  }
}

/// @nodoc
abstract mixin class _$OrgSettingsCopyWith<$Res>
    implements $OrgSettingsCopyWith<$Res> {
  factory _$OrgSettingsCopyWith(
          _OrgSettings value, $Res Function(_OrgSettings) _then) =
      __$OrgSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String organizationId,
      bool geoCheckEnabled,
      int? autoFinishHours,
      int? maxPauseMinutes,
      int? maxPausesPerShift});
}

/// @nodoc
class __$OrgSettingsCopyWithImpl<$Res> implements _$OrgSettingsCopyWith<$Res> {
  __$OrgSettingsCopyWithImpl(this._self, this._then);

  final _OrgSettings _self;
  final $Res Function(_OrgSettings) _then;

  /// Create a copy of OrgSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organizationId = null,
    Object? geoCheckEnabled = null,
    Object? autoFinishHours = freezed,
    Object? maxPauseMinutes = freezed,
    Object? maxPausesPerShift = freezed,
  }) {
    return _then(_OrgSettings(
      organizationId: null == organizationId
          ? _self.organizationId
          : organizationId // ignore: cast_nullable_to_non_nullable
              as String,
      geoCheckEnabled: null == geoCheckEnabled
          ? _self.geoCheckEnabled
          : geoCheckEnabled // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

// dart format on
