// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_stats_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftStatsDto {
  int get totalWorkedSeconds;
  int get shiftCount;
  int get averageShiftSeconds;

  /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
  String? get period;

  /// Фактически применённое окно статистики (UTC).
  DateTime? get rangeFrom;
  DateTime? get rangeTo;

  /// Create a copy of ShiftStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShiftStatsDtoCopyWith<ShiftStatsDto> get copyWith =>
      _$ShiftStatsDtoCopyWithImpl<ShiftStatsDto>(
          this as ShiftStatsDto, _$identity);

  /// Serializes this ShiftStatsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShiftStatsDto &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.rangeFrom, rangeFrom) ||
                other.rangeFrom == rangeFrom) &&
            (identical(other.rangeTo, rangeTo) || other.rangeTo == rangeTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalWorkedSeconds, shiftCount,
      averageShiftSeconds, period, rangeFrom, rangeTo);

  @override
  String toString() {
    return 'ShiftStatsDto(totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds, period: $period, rangeFrom: $rangeFrom, rangeTo: $rangeTo)';
  }
}

/// @nodoc
abstract mixin class $ShiftStatsDtoCopyWith<$Res> {
  factory $ShiftStatsDtoCopyWith(
          ShiftStatsDto value, $Res Function(ShiftStatsDto) _then) =
      _$ShiftStatsDtoCopyWithImpl;
  @useResult
  $Res call(
      {int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds,
      String? period,
      DateTime? rangeFrom,
      DateTime? rangeTo});
}

/// @nodoc
class _$ShiftStatsDtoCopyWithImpl<$Res>
    implements $ShiftStatsDtoCopyWith<$Res> {
  _$ShiftStatsDtoCopyWithImpl(this._self, this._then);

  final ShiftStatsDto _self;
  final $Res Function(ShiftStatsDto) _then;

  /// Create a copy of ShiftStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWorkedSeconds = null,
    Object? shiftCount = null,
    Object? averageShiftSeconds = null,
    Object? period = freezed,
    Object? rangeFrom = freezed,
    Object? rangeTo = freezed,
  }) {
    return _then(_self.copyWith(
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
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      rangeFrom: freezed == rangeFrom
          ? _self.rangeFrom
          : rangeFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rangeTo: freezed == rangeTo
          ? _self.rangeTo
          : rangeTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShiftStatsDto].
extension ShiftStatsDtoPatterns on ShiftStatsDto {
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
    TResult Function(_ShiftStatsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsDto() when $default != null:
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
    TResult Function(_ShiftStatsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsDto():
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
    TResult? Function(_ShiftStatsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsDto() when $default != null:
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
            int totalWorkedSeconds,
            int shiftCount,
            int averageShiftSeconds,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsDto() when $default != null:
        return $default(
            _that.totalWorkedSeconds,
            _that.shiftCount,
            _that.averageShiftSeconds,
            _that.period,
            _that.rangeFrom,
            _that.rangeTo);
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
            int totalWorkedSeconds,
            int shiftCount,
            int averageShiftSeconds,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsDto():
        return $default(
            _that.totalWorkedSeconds,
            _that.shiftCount,
            _that.averageShiftSeconds,
            _that.period,
            _that.rangeFrom,
            _that.rangeTo);
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
            int totalWorkedSeconds,
            int shiftCount,
            int averageShiftSeconds,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftStatsDto() when $default != null:
        return $default(
            _that.totalWorkedSeconds,
            _that.shiftCount,
            _that.averageShiftSeconds,
            _that.period,
            _that.rangeFrom,
            _that.rangeTo);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ShiftStatsDto implements ShiftStatsDto {
  const _ShiftStatsDto(
      {required this.totalWorkedSeconds,
      required this.shiftCount,
      required this.averageShiftSeconds,
      this.period,
      this.rangeFrom,
      this.rangeTo});
  factory _ShiftStatsDto.fromJson(Map<String, dynamic> json) =>
      _$ShiftStatsDtoFromJson(json);

  @override
  final int totalWorkedSeconds;
  @override
  final int shiftCount;
  @override
  final int averageShiftSeconds;

  /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
  @override
  final String? period;

  /// Фактически применённое окно статистики (UTC).
  @override
  final DateTime? rangeFrom;
  @override
  final DateTime? rangeTo;

  /// Create a copy of ShiftStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShiftStatsDtoCopyWith<_ShiftStatsDto> get copyWith =>
      __$ShiftStatsDtoCopyWithImpl<_ShiftStatsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShiftStatsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShiftStatsDto &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.rangeFrom, rangeFrom) ||
                other.rangeFrom == rangeFrom) &&
            (identical(other.rangeTo, rangeTo) || other.rangeTo == rangeTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalWorkedSeconds, shiftCount,
      averageShiftSeconds, period, rangeFrom, rangeTo);

  @override
  String toString() {
    return 'ShiftStatsDto(totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds, period: $period, rangeFrom: $rangeFrom, rangeTo: $rangeTo)';
  }
}

/// @nodoc
abstract mixin class _$ShiftStatsDtoCopyWith<$Res>
    implements $ShiftStatsDtoCopyWith<$Res> {
  factory _$ShiftStatsDtoCopyWith(
          _ShiftStatsDto value, $Res Function(_ShiftStatsDto) _then) =
      __$ShiftStatsDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds,
      String? period,
      DateTime? rangeFrom,
      DateTime? rangeTo});
}

/// @nodoc
class __$ShiftStatsDtoCopyWithImpl<$Res>
    implements _$ShiftStatsDtoCopyWith<$Res> {
  __$ShiftStatsDtoCopyWithImpl(this._self, this._then);

  final _ShiftStatsDto _self;
  final $Res Function(_ShiftStatsDto) _then;

  /// Create a copy of ShiftStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalWorkedSeconds = null,
    Object? shiftCount = null,
    Object? averageShiftSeconds = null,
    Object? period = freezed,
    Object? rangeFrom = freezed,
    Object? rangeTo = freezed,
  }) {
    return _then(_ShiftStatsDto(
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
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      rangeFrom: freezed == rangeFrom
          ? _self.rangeFrom
          : rangeFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rangeTo: freezed == rangeTo
          ? _self.rangeTo
          : rangeTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
