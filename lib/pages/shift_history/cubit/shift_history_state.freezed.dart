// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftHistoryState {
  PaginatedSectionData<Shift> get shifts;

  /// Фильтр по статусу (null = все)
  ShiftStatus? get filterStatus;

  /// Фильтр по дате — от
  DateTime? get filterDateFrom;

  /// Фильтр по дате — до
  DateTime? get filterDateTo;

  /// Create a copy of ShiftHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShiftHistoryStateCopyWith<ShiftHistoryState> get copyWith =>
      _$ShiftHistoryStateCopyWithImpl<ShiftHistoryState>(
          this as ShiftHistoryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShiftHistoryState &&
            (identical(other.shifts, shifts) || other.shifts == shifts) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.filterDateFrom, filterDateFrom) ||
                other.filterDateFrom == filterDateFrom) &&
            (identical(other.filterDateTo, filterDateTo) ||
                other.filterDateTo == filterDateTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, shifts, filterStatus, filterDateFrom, filterDateTo);

  @override
  String toString() {
    return 'ShiftHistoryState(shifts: $shifts, filterStatus: $filterStatus, filterDateFrom: $filterDateFrom, filterDateTo: $filterDateTo)';
  }
}

/// @nodoc
abstract mixin class $ShiftHistoryStateCopyWith<$Res> {
  factory $ShiftHistoryStateCopyWith(
          ShiftHistoryState value, $Res Function(ShiftHistoryState) _then) =
      _$ShiftHistoryStateCopyWithImpl;
  @useResult
  $Res call(
      {PaginatedSectionData<Shift> shifts,
      ShiftStatus? filterStatus,
      DateTime? filterDateFrom,
      DateTime? filterDateTo});

  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts;
}

/// @nodoc
class _$ShiftHistoryStateCopyWithImpl<$Res>
    implements $ShiftHistoryStateCopyWith<$Res> {
  _$ShiftHistoryStateCopyWithImpl(this._self, this._then);

  final ShiftHistoryState _self;
  final $Res Function(ShiftHistoryState) _then;

  /// Create a copy of ShiftHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shifts = null,
    Object? filterStatus = freezed,
    Object? filterDateFrom = freezed,
    Object? filterDateTo = freezed,
  }) {
    return _then(_self.copyWith(
      shifts: null == shifts
          ? _self.shifts
          : shifts // ignore: cast_nullable_to_non_nullable
              as PaginatedSectionData<Shift>,
      filterStatus: freezed == filterStatus
          ? _self.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as ShiftStatus?,
      filterDateFrom: freezed == filterDateFrom
          ? _self.filterDateFrom
          : filterDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filterDateTo: freezed == filterDateTo
          ? _self.filterDateTo
          : filterDateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ShiftHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts {
    return $PaginatedSectionDataCopyWith<Shift, $Res>(_self.shifts, (value) {
      return _then(_self.copyWith(shifts: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ShiftHistoryState].
extension ShiftHistoryStatePatterns on ShiftHistoryState {
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
    TResult Function(_ShiftHistoryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftHistoryState() when $default != null:
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
    TResult Function(_ShiftHistoryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftHistoryState():
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
    TResult? Function(_ShiftHistoryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftHistoryState() when $default != null:
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
            PaginatedSectionData<Shift> shifts,
            ShiftStatus? filterStatus,
            DateTime? filterDateFrom,
            DateTime? filterDateTo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShiftHistoryState() when $default != null:
        return $default(_that.shifts, _that.filterStatus, _that.filterDateFrom,
            _that.filterDateTo);
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
            PaginatedSectionData<Shift> shifts,
            ShiftStatus? filterStatus,
            DateTime? filterDateFrom,
            DateTime? filterDateTo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftHistoryState():
        return $default(_that.shifts, _that.filterStatus, _that.filterDateFrom,
            _that.filterDateTo);
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
            PaginatedSectionData<Shift> shifts,
            ShiftStatus? filterStatus,
            DateTime? filterDateFrom,
            DateTime? filterDateTo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShiftHistoryState() when $default != null:
        return $default(_that.shifts, _that.filterStatus, _that.filterDateFrom,
            _that.filterDateTo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShiftHistoryState extends ShiftHistoryState {
  const _ShiftHistoryState(
      {this.shifts = const PaginatedSectionData<Shift>(),
      this.filterStatus,
      this.filterDateFrom,
      this.filterDateTo})
      : super._();

  @override
  @JsonKey()
  final PaginatedSectionData<Shift> shifts;

  /// Фильтр по статусу (null = все)
  @override
  final ShiftStatus? filterStatus;

  /// Фильтр по дате — от
  @override
  final DateTime? filterDateFrom;

  /// Фильтр по дате — до
  @override
  final DateTime? filterDateTo;

  /// Create a copy of ShiftHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShiftHistoryStateCopyWith<_ShiftHistoryState> get copyWith =>
      __$ShiftHistoryStateCopyWithImpl<_ShiftHistoryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShiftHistoryState &&
            (identical(other.shifts, shifts) || other.shifts == shifts) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.filterDateFrom, filterDateFrom) ||
                other.filterDateFrom == filterDateFrom) &&
            (identical(other.filterDateTo, filterDateTo) ||
                other.filterDateTo == filterDateTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, shifts, filterStatus, filterDateFrom, filterDateTo);

  @override
  String toString() {
    return 'ShiftHistoryState(shifts: $shifts, filterStatus: $filterStatus, filterDateFrom: $filterDateFrom, filterDateTo: $filterDateTo)';
  }
}

/// @nodoc
abstract mixin class _$ShiftHistoryStateCopyWith<$Res>
    implements $ShiftHistoryStateCopyWith<$Res> {
  factory _$ShiftHistoryStateCopyWith(
          _ShiftHistoryState value, $Res Function(_ShiftHistoryState) _then) =
      __$ShiftHistoryStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PaginatedSectionData<Shift> shifts,
      ShiftStatus? filterStatus,
      DateTime? filterDateFrom,
      DateTime? filterDateTo});

  @override
  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts;
}

/// @nodoc
class __$ShiftHistoryStateCopyWithImpl<$Res>
    implements _$ShiftHistoryStateCopyWith<$Res> {
  __$ShiftHistoryStateCopyWithImpl(this._self, this._then);

  final _ShiftHistoryState _self;
  final $Res Function(_ShiftHistoryState) _then;

  /// Create a copy of ShiftHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shifts = null,
    Object? filterStatus = freezed,
    Object? filterDateFrom = freezed,
    Object? filterDateTo = freezed,
  }) {
    return _then(_ShiftHistoryState(
      shifts: null == shifts
          ? _self.shifts
          : shifts // ignore: cast_nullable_to_non_nullable
              as PaginatedSectionData<Shift>,
      filterStatus: freezed == filterStatus
          ? _self.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as ShiftStatus?,
      filterDateFrom: freezed == filterDateFrom
          ? _self.filterDateFrom
          : filterDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filterDateTo: freezed == filterDateTo
          ? _self.filterDateTo
          : filterDateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ShiftHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts {
    return $PaginatedSectionDataCopyWith<Shift, $Res>(_self.shifts, (value) {
      return _then(_self.copyWith(shifts: value));
    });
  }
}

// dart format on
