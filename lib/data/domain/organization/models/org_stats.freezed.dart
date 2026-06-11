// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeStats {
  String get userId;
  String get userName;
  String get userEmail;
  int get shiftCount;
  int get totalWorkedSeconds;
  int get averageShiftSeconds;

  /// Create a copy of EmployeeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmployeeStatsCopyWith<EmployeeStats> get copyWith =>
      _$EmployeeStatsCopyWithImpl<EmployeeStats>(
          this as EmployeeStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmployeeStats &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userEmail,
      shiftCount, totalWorkedSeconds, averageShiftSeconds);

  @override
  String toString() {
    return 'EmployeeStats(userId: $userId, userName: $userName, userEmail: $userEmail, shiftCount: $shiftCount, totalWorkedSeconds: $totalWorkedSeconds, averageShiftSeconds: $averageShiftSeconds)';
  }
}

/// @nodoc
abstract mixin class $EmployeeStatsCopyWith<$Res> {
  factory $EmployeeStatsCopyWith(
          EmployeeStats value, $Res Function(EmployeeStats) _then) =
      _$EmployeeStatsCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String userEmail,
      int shiftCount,
      int totalWorkedSeconds,
      int averageShiftSeconds});
}

/// @nodoc
class _$EmployeeStatsCopyWithImpl<$Res>
    implements $EmployeeStatsCopyWith<$Res> {
  _$EmployeeStatsCopyWithImpl(this._self, this._then);

  final EmployeeStats _self;
  final $Res Function(EmployeeStats) _then;

  /// Create a copy of EmployeeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? shiftCount = null,
    Object? totalWorkedSeconds = null,
    Object? averageShiftSeconds = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      shiftCount: null == shiftCount
          ? _self.shiftCount
          : shiftCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalWorkedSeconds: null == totalWorkedSeconds
          ? _self.totalWorkedSeconds
          : totalWorkedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      averageShiftSeconds: null == averageShiftSeconds
          ? _self.averageShiftSeconds
          : averageShiftSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmployeeStats].
extension EmployeeStatsPatterns on EmployeeStats {
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
    TResult Function(_EmployeeStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmployeeStats() when $default != null:
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
    TResult Function(_EmployeeStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmployeeStats():
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
    TResult? Function(_EmployeeStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmployeeStats() when $default != null:
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
    TResult Function(String userId, String userName, String userEmail,
            int shiftCount, int totalWorkedSeconds, int averageShiftSeconds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmployeeStats() when $default != null:
        return $default(
            _that.userId,
            _that.userName,
            _that.userEmail,
            _that.shiftCount,
            _that.totalWorkedSeconds,
            _that.averageShiftSeconds);
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
    TResult Function(String userId, String userName, String userEmail,
            int shiftCount, int totalWorkedSeconds, int averageShiftSeconds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmployeeStats():
        return $default(
            _that.userId,
            _that.userName,
            _that.userEmail,
            _that.shiftCount,
            _that.totalWorkedSeconds,
            _that.averageShiftSeconds);
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
    TResult? Function(String userId, String userName, String userEmail,
            int shiftCount, int totalWorkedSeconds, int averageShiftSeconds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmployeeStats() when $default != null:
        return $default(
            _that.userId,
            _that.userName,
            _that.userEmail,
            _that.shiftCount,
            _that.totalWorkedSeconds,
            _that.averageShiftSeconds);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EmployeeStats implements EmployeeStats {
  const _EmployeeStats(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.shiftCount,
      required this.totalWorkedSeconds,
      required this.averageShiftSeconds});

  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final int shiftCount;
  @override
  final int totalWorkedSeconds;
  @override
  final int averageShiftSeconds;

  /// Create a copy of EmployeeStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmployeeStatsCopyWith<_EmployeeStats> get copyWith =>
      __$EmployeeStatsCopyWithImpl<_EmployeeStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmployeeStats &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userEmail,
      shiftCount, totalWorkedSeconds, averageShiftSeconds);

  @override
  String toString() {
    return 'EmployeeStats(userId: $userId, userName: $userName, userEmail: $userEmail, shiftCount: $shiftCount, totalWorkedSeconds: $totalWorkedSeconds, averageShiftSeconds: $averageShiftSeconds)';
  }
}

/// @nodoc
abstract mixin class _$EmployeeStatsCopyWith<$Res>
    implements $EmployeeStatsCopyWith<$Res> {
  factory _$EmployeeStatsCopyWith(
          _EmployeeStats value, $Res Function(_EmployeeStats) _then) =
      __$EmployeeStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String userEmail,
      int shiftCount,
      int totalWorkedSeconds,
      int averageShiftSeconds});
}

/// @nodoc
class __$EmployeeStatsCopyWithImpl<$Res>
    implements _$EmployeeStatsCopyWith<$Res> {
  __$EmployeeStatsCopyWithImpl(this._self, this._then);

  final _EmployeeStats _self;
  final $Res Function(_EmployeeStats) _then;

  /// Create a copy of EmployeeStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? shiftCount = null,
    Object? totalWorkedSeconds = null,
    Object? averageShiftSeconds = null,
  }) {
    return _then(_EmployeeStats(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userEmail: null == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      shiftCount: null == shiftCount
          ? _self.shiftCount
          : shiftCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalWorkedSeconds: null == totalWorkedSeconds
          ? _self.totalWorkedSeconds
          : totalWorkedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      averageShiftSeconds: null == averageShiftSeconds
          ? _self.averageShiftSeconds
          : averageShiftSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$OrgStats {
  int get totalWorkedSeconds;
  int get shiftCount;
  int get averageShiftSeconds;
  List<EmployeeStats> get perEmployee;

  /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
  String? get period;

  /// Фактически применённое окно статистики (UTC).
  DateTime? get rangeFrom;
  DateTime? get rangeTo;

  /// Create a copy of OrgStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrgStatsCopyWith<OrgStats> get copyWith =>
      _$OrgStatsCopyWithImpl<OrgStats>(this as OrgStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrgStats &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds) &&
            const DeepCollectionEquality()
                .equals(other.perEmployee, perEmployee) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.rangeFrom, rangeFrom) ||
                other.rangeFrom == rangeFrom) &&
            (identical(other.rangeTo, rangeTo) || other.rangeTo == rangeTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalWorkedSeconds,
      shiftCount,
      averageShiftSeconds,
      const DeepCollectionEquality().hash(perEmployee),
      period,
      rangeFrom,
      rangeTo);

  @override
  String toString() {
    return 'OrgStats(totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds, perEmployee: $perEmployee, period: $period, rangeFrom: $rangeFrom, rangeTo: $rangeTo)';
  }
}

/// @nodoc
abstract mixin class $OrgStatsCopyWith<$Res> {
  factory $OrgStatsCopyWith(OrgStats value, $Res Function(OrgStats) _then) =
      _$OrgStatsCopyWithImpl;
  @useResult
  $Res call(
      {int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds,
      List<EmployeeStats> perEmployee,
      String? period,
      DateTime? rangeFrom,
      DateTime? rangeTo});
}

/// @nodoc
class _$OrgStatsCopyWithImpl<$Res> implements $OrgStatsCopyWith<$Res> {
  _$OrgStatsCopyWithImpl(this._self, this._then);

  final OrgStats _self;
  final $Res Function(OrgStats) _then;

  /// Create a copy of OrgStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWorkedSeconds = null,
    Object? shiftCount = null,
    Object? averageShiftSeconds = null,
    Object? perEmployee = null,
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
      perEmployee: null == perEmployee
          ? _self.perEmployee
          : perEmployee // ignore: cast_nullable_to_non_nullable
              as List<EmployeeStats>,
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

/// Adds pattern-matching-related methods to [OrgStats].
extension OrgStatsPatterns on OrgStats {
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
    TResult Function(_OrgStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgStats() when $default != null:
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
    TResult Function(_OrgStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStats():
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
    TResult? Function(_OrgStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStats() when $default != null:
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
            List<EmployeeStats> perEmployee,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgStats() when $default != null:
        return $default(
            _that.totalWorkedSeconds,
            _that.shiftCount,
            _that.averageShiftSeconds,
            _that.perEmployee,
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
            List<EmployeeStats> perEmployee,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStats():
        return $default(
            _that.totalWorkedSeconds,
            _that.shiftCount,
            _that.averageShiftSeconds,
            _that.perEmployee,
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
            List<EmployeeStats> perEmployee,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStats() when $default != null:
        return $default(
            _that.totalWorkedSeconds,
            _that.shiftCount,
            _that.averageShiftSeconds,
            _that.perEmployee,
            _that.period,
            _that.rangeFrom,
            _that.rangeTo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrgStats implements OrgStats {
  const _OrgStats(
      {required this.totalWorkedSeconds,
      required this.shiftCount,
      required this.averageShiftSeconds,
      required final List<EmployeeStats> perEmployee,
      this.period,
      this.rangeFrom,
      this.rangeTo})
      : _perEmployee = perEmployee;

  @override
  final int totalWorkedSeconds;
  @override
  final int shiftCount;
  @override
  final int averageShiftSeconds;
  final List<EmployeeStats> _perEmployee;
  @override
  List<EmployeeStats> get perEmployee {
    if (_perEmployee is EqualUnmodifiableListView) return _perEmployee;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_perEmployee);
  }

  /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
  @override
  final String? period;

  /// Фактически применённое окно статистики (UTC).
  @override
  final DateTime? rangeFrom;
  @override
  final DateTime? rangeTo;

  /// Create a copy of OrgStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrgStatsCopyWith<_OrgStats> get copyWith =>
      __$OrgStatsCopyWithImpl<_OrgStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgStats &&
            (identical(other.totalWorkedSeconds, totalWorkedSeconds) ||
                other.totalWorkedSeconds == totalWorkedSeconds) &&
            (identical(other.shiftCount, shiftCount) ||
                other.shiftCount == shiftCount) &&
            (identical(other.averageShiftSeconds, averageShiftSeconds) ||
                other.averageShiftSeconds == averageShiftSeconds) &&
            const DeepCollectionEquality()
                .equals(other._perEmployee, _perEmployee) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.rangeFrom, rangeFrom) ||
                other.rangeFrom == rangeFrom) &&
            (identical(other.rangeTo, rangeTo) || other.rangeTo == rangeTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalWorkedSeconds,
      shiftCount,
      averageShiftSeconds,
      const DeepCollectionEquality().hash(_perEmployee),
      period,
      rangeFrom,
      rangeTo);

  @override
  String toString() {
    return 'OrgStats(totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds, perEmployee: $perEmployee, period: $period, rangeFrom: $rangeFrom, rangeTo: $rangeTo)';
  }
}

/// @nodoc
abstract mixin class _$OrgStatsCopyWith<$Res>
    implements $OrgStatsCopyWith<$Res> {
  factory _$OrgStatsCopyWith(_OrgStats value, $Res Function(_OrgStats) _then) =
      __$OrgStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds,
      List<EmployeeStats> perEmployee,
      String? period,
      DateTime? rangeFrom,
      DateTime? rangeTo});
}

/// @nodoc
class __$OrgStatsCopyWithImpl<$Res> implements _$OrgStatsCopyWith<$Res> {
  __$OrgStatsCopyWithImpl(this._self, this._then);

  final _OrgStats _self;
  final $Res Function(_OrgStats) _then;

  /// Create a copy of OrgStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalWorkedSeconds = null,
    Object? shiftCount = null,
    Object? averageShiftSeconds = null,
    Object? perEmployee = null,
    Object? period = freezed,
    Object? rangeFrom = freezed,
    Object? rangeTo = freezed,
  }) {
    return _then(_OrgStats(
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
      perEmployee: null == perEmployee
          ? _self._perEmployee
          : perEmployee // ignore: cast_nullable_to_non_nullable
              as List<EmployeeStats>,
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
