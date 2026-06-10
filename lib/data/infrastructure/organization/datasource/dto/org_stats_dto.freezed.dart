// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_stats_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeStatsDto {
  String get userId;
  String get userName;
  String get userEmail;
  int get shiftCount;
  int get totalWorkedSeconds;
  int get averageShiftSeconds;

  /// Create a copy of EmployeeStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmployeeStatsDtoCopyWith<EmployeeStatsDto> get copyWith =>
      _$EmployeeStatsDtoCopyWithImpl<EmployeeStatsDto>(
          this as EmployeeStatsDto, _$identity);

  /// Serializes this EmployeeStatsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmployeeStatsDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userEmail,
      shiftCount, totalWorkedSeconds, averageShiftSeconds);

  @override
  String toString() {
    return 'EmployeeStatsDto(userId: $userId, userName: $userName, userEmail: $userEmail, shiftCount: $shiftCount, totalWorkedSeconds: $totalWorkedSeconds, averageShiftSeconds: $averageShiftSeconds)';
  }
}

/// @nodoc
abstract mixin class $EmployeeStatsDtoCopyWith<$Res> {
  factory $EmployeeStatsDtoCopyWith(
          EmployeeStatsDto value, $Res Function(EmployeeStatsDto) _then) =
      _$EmployeeStatsDtoCopyWithImpl;
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
class _$EmployeeStatsDtoCopyWithImpl<$Res>
    implements $EmployeeStatsDtoCopyWith<$Res> {
  _$EmployeeStatsDtoCopyWithImpl(this._self, this._then);

  final EmployeeStatsDto _self;
  final $Res Function(EmployeeStatsDto) _then;

  /// Create a copy of EmployeeStatsDto
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

/// Adds pattern-matching-related methods to [EmployeeStatsDto].
extension EmployeeStatsDtoPatterns on EmployeeStatsDto {
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
    TResult Function(_EmployeeStatsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmployeeStatsDto() when $default != null:
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
    TResult Function(_EmployeeStatsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmployeeStatsDto():
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
    TResult? Function(_EmployeeStatsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmployeeStatsDto() when $default != null:
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
      case _EmployeeStatsDto() when $default != null:
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
      case _EmployeeStatsDto():
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
      case _EmployeeStatsDto() when $default != null:
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _EmployeeStatsDto implements EmployeeStatsDto {
  const _EmployeeStatsDto(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.shiftCount,
      required this.totalWorkedSeconds,
      required this.averageShiftSeconds});
  factory _EmployeeStatsDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeStatsDtoFromJson(json);

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

  /// Create a copy of EmployeeStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmployeeStatsDtoCopyWith<_EmployeeStatsDto> get copyWith =>
      __$EmployeeStatsDtoCopyWithImpl<_EmployeeStatsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmployeeStatsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmployeeStatsDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, userEmail,
      shiftCount, totalWorkedSeconds, averageShiftSeconds);

  @override
  String toString() {
    return 'EmployeeStatsDto(userId: $userId, userName: $userName, userEmail: $userEmail, shiftCount: $shiftCount, totalWorkedSeconds: $totalWorkedSeconds, averageShiftSeconds: $averageShiftSeconds)';
  }
}

/// @nodoc
abstract mixin class _$EmployeeStatsDtoCopyWith<$Res>
    implements $EmployeeStatsDtoCopyWith<$Res> {
  factory _$EmployeeStatsDtoCopyWith(
          _EmployeeStatsDto value, $Res Function(_EmployeeStatsDto) _then) =
      __$EmployeeStatsDtoCopyWithImpl;
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
class __$EmployeeStatsDtoCopyWithImpl<$Res>
    implements _$EmployeeStatsDtoCopyWith<$Res> {
  __$EmployeeStatsDtoCopyWithImpl(this._self, this._then);

  final _EmployeeStatsDto _self;
  final $Res Function(_EmployeeStatsDto) _then;

  /// Create a copy of EmployeeStatsDto
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
    return _then(_EmployeeStatsDto(
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
mixin _$OrgStatsDto {
  int get totalWorkedSeconds;
  int get shiftCount;
  int get averageShiftSeconds;
  List<EmployeeStatsDto> get perEmployee;

  /// Пресет окна (`day|week|month`); null, если окно задано диапазоном.
  String? get period;

  /// Фактически применённое окно статистики (UTC).
  DateTime? get rangeFrom;
  DateTime? get rangeTo;

  /// Create a copy of OrgStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrgStatsDtoCopyWith<OrgStatsDto> get copyWith =>
      _$OrgStatsDtoCopyWithImpl<OrgStatsDto>(this as OrgStatsDto, _$identity);

  /// Serializes this OrgStatsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrgStatsDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'OrgStatsDto(totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds, perEmployee: $perEmployee, period: $period, rangeFrom: $rangeFrom, rangeTo: $rangeTo)';
  }
}

/// @nodoc
abstract mixin class $OrgStatsDtoCopyWith<$Res> {
  factory $OrgStatsDtoCopyWith(
          OrgStatsDto value, $Res Function(OrgStatsDto) _then) =
      _$OrgStatsDtoCopyWithImpl;
  @useResult
  $Res call(
      {int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds,
      List<EmployeeStatsDto> perEmployee,
      String? period,
      DateTime? rangeFrom,
      DateTime? rangeTo});
}

/// @nodoc
class _$OrgStatsDtoCopyWithImpl<$Res> implements $OrgStatsDtoCopyWith<$Res> {
  _$OrgStatsDtoCopyWithImpl(this._self, this._then);

  final OrgStatsDto _self;
  final $Res Function(OrgStatsDto) _then;

  /// Create a copy of OrgStatsDto
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
              as List<EmployeeStatsDto>,
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

/// Adds pattern-matching-related methods to [OrgStatsDto].
extension OrgStatsDtoPatterns on OrgStatsDto {
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
    TResult Function(_OrgStatsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgStatsDto() when $default != null:
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
    TResult Function(_OrgStatsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsDto():
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
    TResult? Function(_OrgStatsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsDto() when $default != null:
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
            List<EmployeeStatsDto> perEmployee,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrgStatsDto() when $default != null:
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
            List<EmployeeStatsDto> perEmployee,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsDto():
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
            List<EmployeeStatsDto> perEmployee,
            String? period,
            DateTime? rangeFrom,
            DateTime? rangeTo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrgStatsDto() when $default != null:
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

@JsonSerializable(fieldRename: FieldRename.snake)
class _OrgStatsDto implements OrgStatsDto {
  const _OrgStatsDto(
      {required this.totalWorkedSeconds,
      required this.shiftCount,
      required this.averageShiftSeconds,
      required final List<EmployeeStatsDto> perEmployee,
      this.period,
      this.rangeFrom,
      this.rangeTo})
      : _perEmployee = perEmployee;
  factory _OrgStatsDto.fromJson(Map<String, dynamic> json) =>
      _$OrgStatsDtoFromJson(json);

  @override
  final int totalWorkedSeconds;
  @override
  final int shiftCount;
  @override
  final int averageShiftSeconds;
  final List<EmployeeStatsDto> _perEmployee;
  @override
  List<EmployeeStatsDto> get perEmployee {
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

  /// Create a copy of OrgStatsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrgStatsDtoCopyWith<_OrgStatsDto> get copyWith =>
      __$OrgStatsDtoCopyWithImpl<_OrgStatsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrgStatsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgStatsDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'OrgStatsDto(totalWorkedSeconds: $totalWorkedSeconds, shiftCount: $shiftCount, averageShiftSeconds: $averageShiftSeconds, perEmployee: $perEmployee, period: $period, rangeFrom: $rangeFrom, rangeTo: $rangeTo)';
  }
}

/// @nodoc
abstract mixin class _$OrgStatsDtoCopyWith<$Res>
    implements $OrgStatsDtoCopyWith<$Res> {
  factory _$OrgStatsDtoCopyWith(
          _OrgStatsDto value, $Res Function(_OrgStatsDto) _then) =
      __$OrgStatsDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalWorkedSeconds,
      int shiftCount,
      int averageShiftSeconds,
      List<EmployeeStatsDto> perEmployee,
      String? period,
      DateTime? rangeFrom,
      DateTime? rangeTo});
}

/// @nodoc
class __$OrgStatsDtoCopyWithImpl<$Res> implements _$OrgStatsDtoCopyWith<$Res> {
  __$OrgStatsDtoCopyWithImpl(this._self, this._then);

  final _OrgStatsDto _self;
  final $Res Function(_OrgStatsDto) _then;

  /// Create a copy of OrgStatsDto
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
    return _then(_OrgStatsDto(
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
              as List<EmployeeStatsDto>,
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
