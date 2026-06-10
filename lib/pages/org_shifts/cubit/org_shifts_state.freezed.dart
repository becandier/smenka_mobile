// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_shifts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgShiftsState {
  PaginatedSectionData<Shift> get shifts;

  /// Фильтр по статусу (null = все)
  ShiftStatus? get filterStatus;

  /// Фильтр по дате — от
  DateTime? get filterDateFrom;

  /// Фильтр по дате — до
  DateTime? get filterDateTo;

  /// Фильтр по сотруднику (`?user_id`); null = все сотрудники
  String? get filterUserId;

  /// Имя выбранного сотрудника — для отображения в управляющем элементе
  String? get filterUserName;

  /// Create a copy of OrgShiftsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrgShiftsStateCopyWith<OrgShiftsState> get copyWith =>
      _$OrgShiftsStateCopyWithImpl<OrgShiftsState>(
          this as OrgShiftsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrgShiftsState &&
            (identical(other.shifts, shifts) || other.shifts == shifts) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.filterDateFrom, filterDateFrom) ||
                other.filterDateFrom == filterDateFrom) &&
            (identical(other.filterDateTo, filterDateTo) ||
                other.filterDateTo == filterDateTo) &&
            (identical(other.filterUserId, filterUserId) ||
                other.filterUserId == filterUserId) &&
            (identical(other.filterUserName, filterUserName) ||
                other.filterUserName == filterUserName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shifts, filterStatus,
      filterDateFrom, filterDateTo, filterUserId, filterUserName);

  @override
  String toString() {
    return 'OrgShiftsState(shifts: $shifts, filterStatus: $filterStatus, filterDateFrom: $filterDateFrom, filterDateTo: $filterDateTo, filterUserId: $filterUserId, filterUserName: $filterUserName)';
  }
}

/// @nodoc
abstract mixin class $OrgShiftsStateCopyWith<$Res> {
  factory $OrgShiftsStateCopyWith(
          OrgShiftsState value, $Res Function(OrgShiftsState) _then) =
      _$OrgShiftsStateCopyWithImpl;
  @useResult
  $Res call(
      {PaginatedSectionData<Shift> shifts,
      ShiftStatus? filterStatus,
      DateTime? filterDateFrom,
      DateTime? filterDateTo,
      String? filterUserId,
      String? filterUserName});

  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts;
}

/// @nodoc
class _$OrgShiftsStateCopyWithImpl<$Res>
    implements $OrgShiftsStateCopyWith<$Res> {
  _$OrgShiftsStateCopyWithImpl(this._self, this._then);

  final OrgShiftsState _self;
  final $Res Function(OrgShiftsState) _then;

  /// Create a copy of OrgShiftsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shifts = null,
    Object? filterStatus = freezed,
    Object? filterDateFrom = freezed,
    Object? filterDateTo = freezed,
    Object? filterUserId = freezed,
    Object? filterUserName = freezed,
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
      filterUserId: freezed == filterUserId
          ? _self.filterUserId
          : filterUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      filterUserName: freezed == filterUserName
          ? _self.filterUserName
          : filterUserName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of OrgShiftsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts {
    return $PaginatedSectionDataCopyWith<Shift, $Res>(_self.shifts, (value) {
      return _then(_self.copyWith(shifts: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrgShiftsState].
extension OrgShiftsStatePatterns on OrgShiftsState {
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
    TResult Function(_OrgShiftsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgShiftsState() when $default != null:
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
    TResult Function(_OrgShiftsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgShiftsState():
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
    TResult? Function(_OrgShiftsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgShiftsState() when $default != null:
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
            DateTime? filterDateTo,
            String? filterUserId,
            String? filterUserName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgShiftsState() when $default != null:
        return $default(_that.shifts, _that.filterStatus, _that.filterDateFrom,
            _that.filterDateTo, _that.filterUserId, _that.filterUserName);
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
            DateTime? filterDateTo,
            String? filterUserId,
            String? filterUserName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgShiftsState():
        return $default(_that.shifts, _that.filterStatus, _that.filterDateFrom,
            _that.filterDateTo, _that.filterUserId, _that.filterUserName);
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
            DateTime? filterDateTo,
            String? filterUserId,
            String? filterUserName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgShiftsState() when $default != null:
        return $default(_that.shifts, _that.filterStatus, _that.filterDateFrom,
            _that.filterDateTo, _that.filterUserId, _that.filterUserName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrgShiftsState extends OrgShiftsState {
  const _OrgShiftsState(
      {this.shifts = const PaginatedSectionData<Shift>(),
      this.filterStatus,
      this.filterDateFrom,
      this.filterDateTo,
      this.filterUserId,
      this.filterUserName})
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

  /// Фильтр по сотруднику (`?user_id`); null = все сотрудники
  @override
  final String? filterUserId;

  /// Имя выбранного сотрудника — для отображения в управляющем элементе
  @override
  final String? filterUserName;

  /// Create a copy of OrgShiftsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrgShiftsStateCopyWith<_OrgShiftsState> get copyWith =>
      __$OrgShiftsStateCopyWithImpl<_OrgShiftsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgShiftsState &&
            (identical(other.shifts, shifts) || other.shifts == shifts) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.filterDateFrom, filterDateFrom) ||
                other.filterDateFrom == filterDateFrom) &&
            (identical(other.filterDateTo, filterDateTo) ||
                other.filterDateTo == filterDateTo) &&
            (identical(other.filterUserId, filterUserId) ||
                other.filterUserId == filterUserId) &&
            (identical(other.filterUserName, filterUserName) ||
                other.filterUserName == filterUserName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shifts, filterStatus,
      filterDateFrom, filterDateTo, filterUserId, filterUserName);

  @override
  String toString() {
    return 'OrgShiftsState(shifts: $shifts, filterStatus: $filterStatus, filterDateFrom: $filterDateFrom, filterDateTo: $filterDateTo, filterUserId: $filterUserId, filterUserName: $filterUserName)';
  }
}

/// @nodoc
abstract mixin class _$OrgShiftsStateCopyWith<$Res>
    implements $OrgShiftsStateCopyWith<$Res> {
  factory _$OrgShiftsStateCopyWith(
          _OrgShiftsState value, $Res Function(_OrgShiftsState) _then) =
      __$OrgShiftsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PaginatedSectionData<Shift> shifts,
      ShiftStatus? filterStatus,
      DateTime? filterDateFrom,
      DateTime? filterDateTo,
      String? filterUserId,
      String? filterUserName});

  @override
  $PaginatedSectionDataCopyWith<Shift, $Res> get shifts;
}

/// @nodoc
class __$OrgShiftsStateCopyWithImpl<$Res>
    implements _$OrgShiftsStateCopyWith<$Res> {
  __$OrgShiftsStateCopyWithImpl(this._self, this._then);

  final _OrgShiftsState _self;
  final $Res Function(_OrgShiftsState) _then;

  /// Create a copy of OrgShiftsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shifts = null,
    Object? filterStatus = freezed,
    Object? filterDateFrom = freezed,
    Object? filterDateTo = freezed,
    Object? filterUserId = freezed,
    Object? filterUserName = freezed,
  }) {
    return _then(_OrgShiftsState(
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
      filterUserId: freezed == filterUserId
          ? _self.filterUserId
          : filterUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      filterUserName: freezed == filterUserName
          ? _self.filterUserName
          : filterUserName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of OrgShiftsState
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
