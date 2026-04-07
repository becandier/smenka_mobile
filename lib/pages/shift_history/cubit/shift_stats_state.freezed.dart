// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftStatsState {
  SectionData<ShiftStats> get stats;
  StatsPeriod get selectedPeriod;

  /// Create a copy of ShiftStatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShiftStatsStateCopyWith<ShiftStatsState> get copyWith =>
      _$ShiftStatsStateCopyWithImpl<ShiftStatsState>(
          this as ShiftStatsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShiftStatsState &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.selectedPeriod, selectedPeriod) ||
                other.selectedPeriod == selectedPeriod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stats, selectedPeriod);

  @override
  String toString() {
    return 'ShiftStatsState(stats: $stats, selectedPeriod: $selectedPeriod)';
  }
}

/// @nodoc
abstract mixin class $ShiftStatsStateCopyWith<$Res> {
  factory $ShiftStatsStateCopyWith(
          ShiftStatsState value, $Res Function(ShiftStatsState) _then) =
      _$ShiftStatsStateCopyWithImpl;
  @useResult
  $Res call({SectionData<ShiftStats> stats, StatsPeriod selectedPeriod});

  $SectionDataCopyWith<ShiftStats, $Res> get stats;
}

/// @nodoc
class _$ShiftStatsStateCopyWithImpl<$Res>
    implements $ShiftStatsStateCopyWith<$Res> {
  _$ShiftStatsStateCopyWithImpl(this._self, this._then);

  final ShiftStatsState _self;
  final $Res Function(ShiftStatsState) _then;

  /// Create a copy of ShiftStatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? selectedPeriod = null,
  }) {
    return _then(_self.copyWith(
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as SectionData<ShiftStats>,
      selectedPeriod: null == selectedPeriod
          ? _self.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as StatsPeriod,
    ));
  }

  /// Create a copy of ShiftStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<ShiftStats, $Res> get stats {
    return $SectionDataCopyWith<ShiftStats, $Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ShiftStatsState].
extension ShiftStatsStatePatterns on ShiftStatsState {
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
    TResult Function(_ShiftStatsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsState() when $default != null:
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
    TResult Function(_ShiftStatsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsState():
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
    TResult? Function(_ShiftStatsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsState() when $default != null:
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
    TResult Function(SectionData<ShiftStats> stats, StatsPeriod selectedPeriod)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsState() when $default != null:
        return $default(_that.stats, _that.selectedPeriod);
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
    TResult Function(SectionData<ShiftStats> stats, StatsPeriod selectedPeriod)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsState():
        return $default(_that.stats, _that.selectedPeriod);
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
            SectionData<ShiftStats> stats, StatsPeriod selectedPeriod)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsState() when $default != null:
        return $default(_that.stats, _that.selectedPeriod);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShiftStatsState implements ShiftStatsState {
  const _ShiftStatsState(
      {this.stats = const SectionData<ShiftStats>(),
      this.selectedPeriod = StatsPeriod.day});

  @override
  @JsonKey()
  final SectionData<ShiftStats> stats;
  @override
  @JsonKey()
  final StatsPeriod selectedPeriod;

  /// Create a copy of ShiftStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShiftStatsStateCopyWith<_ShiftStatsState> get copyWith =>
      __$ShiftStatsStateCopyWithImpl<_ShiftStatsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShiftStatsState &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.selectedPeriod, selectedPeriod) ||
                other.selectedPeriod == selectedPeriod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stats, selectedPeriod);

  @override
  String toString() {
    return 'ShiftStatsState(stats: $stats, selectedPeriod: $selectedPeriod)';
  }
}

/// @nodoc
abstract mixin class _$ShiftStatsStateCopyWith<$Res>
    implements $ShiftStatsStateCopyWith<$Res> {
  factory _$ShiftStatsStateCopyWith(
          _ShiftStatsState value, $Res Function(_ShiftStatsState) _then) =
      __$ShiftStatsStateCopyWithImpl;
  @override
  @useResult
  $Res call({SectionData<ShiftStats> stats, StatsPeriod selectedPeriod});

  @override
  $SectionDataCopyWith<ShiftStats, $Res> get stats;
}

/// @nodoc
class __$ShiftStatsStateCopyWithImpl<$Res>
    implements _$ShiftStatsStateCopyWith<$Res> {
  __$ShiftStatsStateCopyWithImpl(this._self, this._then);

  final _ShiftStatsState _self;
  final $Res Function(_ShiftStatsState) _then;

  /// Create a copy of ShiftStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stats = null,
    Object? selectedPeriod = null,
  }) {
    return _then(_ShiftStatsState(
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as SectionData<ShiftStats>,
      selectedPeriod: null == selectedPeriod
          ? _self.selectedPeriod
          : selectedPeriod // ignore: cast_nullable_to_non_nullable
              as StatsPeriod,
    ));
  }

  /// Create a copy of ShiftStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<ShiftStats, $Res> get stats {
    return $SectionDataCopyWith<ShiftStats, $Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

// dart format on
