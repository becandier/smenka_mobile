// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_stats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgStatsState {
  SectionData<OrgStats> get stats;

  /// Пресет окна (`day|week|month`); null — активен произвольный
  /// диапазон ([customFrom]/[customTo]). Ровно один источник окна.
  String? get period;

  /// Границы произвольного окна (UTC); заданы только при `period == null`,
  /// хотя бы одна из границ непуста.
  DateTime? get customFrom;
  DateTime? get customTo;

  /// Create a copy of OrgStatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrgStatsStateCopyWith<OrgStatsState> get copyWith =>
      _$OrgStatsStateCopyWithImpl<OrgStatsState>(
          this as OrgStatsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrgStatsState &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.customFrom, customFrom) ||
                other.customFrom == customFrom) &&
            (identical(other.customTo, customTo) ||
                other.customTo == customTo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, stats, period, customFrom, customTo);

  @override
  String toString() {
    return 'OrgStatsState(stats: $stats, period: $period, customFrom: $customFrom, customTo: $customTo)';
  }
}

/// @nodoc
abstract mixin class $OrgStatsStateCopyWith<$Res> {
  factory $OrgStatsStateCopyWith(
          OrgStatsState value, $Res Function(OrgStatsState) _then) =
      _$OrgStatsStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<OrgStats> stats,
      String? period,
      DateTime? customFrom,
      DateTime? customTo});

  $SectionDataCopyWith<OrgStats, $Res> get stats;
}

/// @nodoc
class _$OrgStatsStateCopyWithImpl<$Res>
    implements $OrgStatsStateCopyWith<$Res> {
  _$OrgStatsStateCopyWithImpl(this._self, this._then);

  final OrgStatsState _self;
  final $Res Function(OrgStatsState) _then;

  /// Create a copy of OrgStatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? period = freezed,
    Object? customFrom = freezed,
    Object? customTo = freezed,
  }) {
    return _then(_self.copyWith(
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as SectionData<OrgStats>,
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      customFrom: freezed == customFrom
          ? _self.customFrom
          : customFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customTo: freezed == customTo
          ? _self.customTo
          : customTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of OrgStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<OrgStats, $Res> get stats {
    return $SectionDataCopyWith<OrgStats, $Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrgStatsState].
extension OrgStatsStatePatterns on OrgStatsState {
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
    TResult Function(_OrgStatsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgStatsState() when $default != null:
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
    TResult Function(_OrgStatsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsState():
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
    TResult? Function(_OrgStatsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsState() when $default != null:
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
    TResult Function(SectionData<OrgStats> stats, String? period,
            DateTime? customFrom, DateTime? customTo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgStatsState() when $default != null:
        return $default(
            _that.stats, _that.period, _that.customFrom, _that.customTo);
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
    TResult Function(SectionData<OrgStats> stats, String? period,
            DateTime? customFrom, DateTime? customTo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsState():
        return $default(
            _that.stats, _that.period, _that.customFrom, _that.customTo);
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
    TResult? Function(SectionData<OrgStats> stats, String? period,
            DateTime? customFrom, DateTime? customTo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsState() when $default != null:
        return $default(
            _that.stats, _that.period, _that.customFrom, _that.customTo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrgStatsState extends OrgStatsState {
  const _OrgStatsState(
      {this.stats = const SectionData<OrgStats>(),
      this.period = 'week',
      this.customFrom,
      this.customTo})
      : super._();

  @override
  @JsonKey()
  final SectionData<OrgStats> stats;

  /// Пресет окна (`day|week|month`); null — активен произвольный
  /// диапазон ([customFrom]/[customTo]). Ровно один источник окна.
  @override
  @JsonKey()
  final String? period;

  /// Границы произвольного окна (UTC); заданы только при `period == null`,
  /// хотя бы одна из границ непуста.
  @override
  final DateTime? customFrom;
  @override
  final DateTime? customTo;

  /// Create a copy of OrgStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrgStatsStateCopyWith<_OrgStatsState> get copyWith =>
      __$OrgStatsStateCopyWithImpl<_OrgStatsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgStatsState &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.customFrom, customFrom) ||
                other.customFrom == customFrom) &&
            (identical(other.customTo, customTo) ||
                other.customTo == customTo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, stats, period, customFrom, customTo);

  @override
  String toString() {
    return 'OrgStatsState(stats: $stats, period: $period, customFrom: $customFrom, customTo: $customTo)';
  }
}

/// @nodoc
abstract mixin class _$OrgStatsStateCopyWith<$Res>
    implements $OrgStatsStateCopyWith<$Res> {
  factory _$OrgStatsStateCopyWith(
          _OrgStatsState value, $Res Function(_OrgStatsState) _then) =
      __$OrgStatsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<OrgStats> stats,
      String? period,
      DateTime? customFrom,
      DateTime? customTo});

  @override
  $SectionDataCopyWith<OrgStats, $Res> get stats;
}

/// @nodoc
class __$OrgStatsStateCopyWithImpl<$Res>
    implements _$OrgStatsStateCopyWith<$Res> {
  __$OrgStatsStateCopyWithImpl(this._self, this._then);

  final _OrgStatsState _self;
  final $Res Function(_OrgStatsState) _then;

  /// Create a copy of OrgStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stats = null,
    Object? period = freezed,
    Object? customFrom = freezed,
    Object? customTo = freezed,
  }) {
    return _then(_OrgStatsState(
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as SectionData<OrgStats>,
      period: freezed == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as String?,
      customFrom: freezed == customFrom
          ? _self.customFrom
          : customFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customTo: freezed == customTo
          ? _self.customTo
          : customTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of OrgStatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<OrgStats, $Res> get stats {
    return $SectionDataCopyWith<OrgStats, $Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

// dart format on
