// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftStats {
  String get period;
  int get totalWorkedSeconds;
  int get shiftCount;
  int get averageShiftSeconds;

  /// Create a copy of ShiftStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShiftStatsCopyWith<ShiftStats> get copyWith =>
      _$ShiftStatsCopyWithImpl<ShiftStats>(this as ShiftStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShiftStats &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, period, totalWorkedSeconds, shiftCount, averageShiftSeconds);

  @override
  String toString() {
    return 'ShiftStats(period: $period, totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds)';
  }
}

/// @nodoc
abstract mixin class $ShiftStatsCopyWith<$Res> {
  factory $ShiftStatsCopyWith(
          ShiftStats value, $Res Function(ShiftStats) _then) =
      _$ShiftStatsCopyWithImpl;
  @useResult
  $Res call(
      {String period,
      int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds});
}

/// @nodoc
class _$ShiftStatsCopyWithImpl<$Res> implements $ShiftStatsCopyWith<$Res> {
  _$ShiftStatsCopyWithImpl(this._self, this._then);

  final ShiftStats _self;
  final $Res Function(ShiftStats) _then;

  /// Create a copy of ShiftStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? totalWorkedSeconds = null,
    Object? shiftCount = null,
    Object? averageShiftSeconds = null,
  }) {
    return _then(_self.copyWith(
      period: null == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      totalWorkedSeconds: null == totalWorkedSeconds
          ? _self.totalWorkedSeconds
          : totalWorkedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      shiftCount: null == shiftCount
          ? _self.shiftCount
          : shiftCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageShiftSeconds: null == averageShiftSeconds
          ? _self.averageShiftSeconds
          : averageShiftSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShiftStats].
extension ShiftStatsPatterns on ShiftStats {
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
    TResult Function(_ShiftStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftStats() when $default != null:
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
    TResult Function(_ShiftStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStats():
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
    TResult? Function(_ShiftStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStats() when $default != null:
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
    TResult Function(String period, int totalWorkedSeconds, int shiftCount,
            int averageShiftSeconds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftStats() when $default != null:
        return $default(_that.period, _that.totalWorkedSeconds,
            _that.shiftCount, _that.averageShiftSeconds);
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
    TResult Function(String period, int totalWorkedSeconds, int shiftCount,
            int averageShiftSeconds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStats():
        return $default(_that.period, _that.totalWorkedSeconds,
            _that.shiftCount, _that.averageShiftSeconds);
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
    TResult? Function(String period, int totalWorkedSeconds, int shiftCount,
            int averageShiftSeconds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStats() when $default != null:
        return $default(_that.period, _that.totalWorkedSeconds,
            _that.shiftCount, _that.averageShiftSeconds);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShiftStats implements ShiftStats {
  const _ShiftStats(
      {required this.period,
      required this.totalWorkedSeconds,
      required this.shiftCount,
      required this.averageShiftSeconds});

  @override
  final String period;
  @override
  final int totalWorkedSeconds;
  @override
  final int shiftCount;
  @override
  final int averageShiftSeconds;

  /// Create a copy of ShiftStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShiftStatsCopyWith<_ShiftStats> get copyWith =>
      __$ShiftStatsCopyWithImpl<_ShiftStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShiftStats &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, period, totalWorkedSeconds, shiftCount, averageShiftSeconds);

  @override
  String toString() {
    return 'ShiftStats(period: $period, totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds)';
  }
}

/// @nodoc
abstract mixin class _$ShiftStatsCopyWith<$Res>
    implements $ShiftStatsCopyWith<$Res> {
  factory _$ShiftStatsCopyWith(
          _ShiftStats value, $Res Function(_ShiftStats) _then) =
      __$ShiftStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String period,
      int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds});
}

/// @nodoc
class __$ShiftStatsCopyWithImpl<$Res> implements _$ShiftStatsCopyWith<$Res> {
  __$ShiftStatsCopyWithImpl(this._self, this._then);

  final _ShiftStats _self;
  final $Res Function(_ShiftStats) _then;

  /// Create a copy of ShiftStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? period = null,
    Object? totalWorkedSeconds = null,
    Object? shiftCount = null,
    Object? averageShiftSeconds = null,
  }) {
    return _then(_ShiftStats(
      period: null == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      totalWorkedSeconds: null == totalWorkedSeconds
          ? _self.totalWorkedSeconds
          : totalWorkedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      shiftCount: null == shiftCount
          ? _self.shiftCount
          : shiftCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageShiftSeconds: null == averageShiftSeconds
          ? _self.averageShiftSeconds
          : averageShiftSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
