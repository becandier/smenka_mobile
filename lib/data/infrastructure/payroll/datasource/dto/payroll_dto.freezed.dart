// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payroll_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PayrollPeriodDto {
  DateTime? get dateFrom;
  DateTime? get dateTo;

  /// Create a copy of PayrollPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayrollPeriodDtoCopyWith<PayrollPeriodDto> get copyWith =>
      _$PayrollPeriodDtoCopyWithImpl<PayrollPeriodDto>(
          this as PayrollPeriodDto, _$identity);

  /// Serializes this PayrollPeriodDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayrollPeriodDto &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dateFrom, dateTo);

  @override
  String toString() {
    return 'PayrollPeriodDto(dateFrom: $dateFrom, dateTo: $dateTo)';
  }
}

/// @nodoc
abstract mixin class $PayrollPeriodDtoCopyWith<$Res> {
  factory $PayrollPeriodDtoCopyWith(
          PayrollPeriodDto value, $Res Function(PayrollPeriodDto) _then) =
      _$PayrollPeriodDtoCopyWithImpl;
  @useResult
  $Res call({DateTime? dateFrom, DateTime? dateTo});
}

/// @nodoc
class _$PayrollPeriodDtoCopyWithImpl<$Res>
    implements $PayrollPeriodDtoCopyWith<$Res> {
  _$PayrollPeriodDtoCopyWithImpl(this._self, this._then);

  final PayrollPeriodDto _self;
  final $Res Function(PayrollPeriodDto) _then;

  /// Create a copy of PayrollPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
  }) {
    return _then(_self.copyWith(
      dateFrom: freezed == dateFrom
          ? _self.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _self.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PayrollPeriodDto].
extension PayrollPeriodDtoPatterns on PayrollPeriodDto {
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
    TResult Function(_PayrollPeriodDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollPeriodDto() when $default != null:
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
    TResult Function(_PayrollPeriodDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollPeriodDto():
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
    TResult? Function(_PayrollPeriodDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollPeriodDto() when $default != null:
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
    TResult Function(DateTime? dateFrom, DateTime? dateTo)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollPeriodDto() when $default != null:
        return $default(_that.dateFrom, _that.dateTo);
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
    TResult Function(DateTime? dateFrom, DateTime? dateTo) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollPeriodDto():
        return $default(_that.dateFrom, _that.dateTo);
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
    TResult? Function(DateTime? dateFrom, DateTime? dateTo)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollPeriodDto() when $default != null:
        return $default(_that.dateFrom, _that.dateTo);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PayrollPeriodDto implements PayrollPeriodDto {
  const _PayrollPeriodDto({this.dateFrom, this.dateTo});
  factory _PayrollPeriodDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollPeriodDtoFromJson(json);

  @override
  final DateTime? dateFrom;
  @override
  final DateTime? dateTo;

  /// Create a copy of PayrollPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayrollPeriodDtoCopyWith<_PayrollPeriodDto> get copyWith =>
      __$PayrollPeriodDtoCopyWithImpl<_PayrollPeriodDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayrollPeriodDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayrollPeriodDto &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dateFrom, dateTo);

  @override
  String toString() {
    return 'PayrollPeriodDto(dateFrom: $dateFrom, dateTo: $dateTo)';
  }
}

/// @nodoc
abstract mixin class _$PayrollPeriodDtoCopyWith<$Res>
    implements $PayrollPeriodDtoCopyWith<$Res> {
  factory _$PayrollPeriodDtoCopyWith(
          _PayrollPeriodDto value, $Res Function(_PayrollPeriodDto) _then) =
      __$PayrollPeriodDtoCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime? dateFrom, DateTime? dateTo});
}

/// @nodoc
class __$PayrollPeriodDtoCopyWithImpl<$Res>
    implements _$PayrollPeriodDtoCopyWith<$Res> {
  __$PayrollPeriodDtoCopyWithImpl(this._self, this._then);

  final _PayrollPeriodDto _self;
  final $Res Function(_PayrollPeriodDto) _then;

  /// Create a copy of PayrollPeriodDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
  }) {
    return _then(_PayrollPeriodDto(
      dateFrom: freezed == dateFrom
          ? _self.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _self.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$PayrollItemDto {
  String get userId;
  String get userName;
  int get workedSeconds;
  int get shiftsCount;
  int get grossAmountMinor;
  int get unpaidSeconds;
  int get unpaidShiftsCount;
  bool get hasMissingRate;

  /// Create a copy of PayrollItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayrollItemDtoCopyWith<PayrollItemDto> get copyWith =>
      _$PayrollItemDtoCopyWithImpl<PayrollItemDto>(
          this as PayrollItemDto, _$identity);

  /// Serializes this PayrollItemDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayrollItemDto &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.workedSeconds, workedSeconds) ||
                other.workedSeconds == workedSeconds) &&
            (identical(other.shiftsCount, shiftsCount) ||
                other.shiftsCount == shiftsCount) &&
            (identical(other.grossAmountMinor, grossAmountMinor) ||
                other.grossAmountMinor == grossAmountMinor) &&
            (identical(other.unpaidSeconds, unpaidSeconds) ||
                other.unpaidSeconds == unpaidSeconds) &&
            (identical(other.unpaidShiftsCount, unpaidShiftsCount) ||
                other.unpaidShiftsCount == unpaidShiftsCount) &&
            (identical(other.hasMissingRate, hasMissingRate) ||
                other.hasMissingRate == hasMissingRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      workedSeconds,
      shiftsCount,
      grossAmountMinor,
      unpaidSeconds,
      unpaidShiftsCount,
      hasMissingRate);

  @override
  String toString() {
    return 'PayrollItemDto(userId: $userId, userName: $userName, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, unpaidSeconds: $unpaidSeconds, unpaidShiftsCount: $unpaidShiftsCount, hasMissingRate: $hasMissingRate)';
  }
}

/// @nodoc
abstract mixin class $PayrollItemDtoCopyWith<$Res> {
  factory $PayrollItemDtoCopyWith(
          PayrollItemDto value, $Res Function(PayrollItemDto) _then) =
      _$PayrollItemDtoCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String userName,
      int workedSeconds,
      int shiftsCount,
      int grossAmountMinor,
      int unpaidSeconds,
      int unpaidShiftsCount,
      bool hasMissingRate});
}

/// @nodoc
class _$PayrollItemDtoCopyWithImpl<$Res>
    implements $PayrollItemDtoCopyWith<$Res> {
  _$PayrollItemDtoCopyWithImpl(this._self, this._then);

  final PayrollItemDto _self;
  final $Res Function(PayrollItemDto) _then;

  /// Create a copy of PayrollItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? workedSeconds = null,
    Object? shiftsCount = null,
    Object? grossAmountMinor = null,
    Object? unpaidSeconds = null,
    Object? unpaidShiftsCount = null,
    Object? hasMissingRate = null,
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
      workedSeconds: null == workedSeconds
          ? _self.workedSeconds
          : workedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      shiftsCount: null == shiftsCount
          ? _self.shiftsCount
          : shiftsCount // ignore: cast_nullable_to_non_nullable
              as int,
      grossAmountMinor: null == grossAmountMinor
          ? _self.grossAmountMinor
          : grossAmountMinor // ignore: cast_nullable_to_non_nullable
              as int,
      unpaidSeconds: null == unpaidSeconds
          ? _self.unpaidSeconds
          : unpaidSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      unpaidShiftsCount: null == unpaidShiftsCount
          ? _self.unpaidShiftsCount
          : unpaidShiftsCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMissingRate: null == hasMissingRate
          ? _self.hasMissingRate
          : hasMissingRate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [PayrollItemDto].
extension PayrollItemDtoPatterns on PayrollItemDto {
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
    TResult Function(_PayrollItemDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollItemDto() when $default != null:
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
    TResult Function(_PayrollItemDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollItemDto():
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
    TResult? Function(_PayrollItemDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollItemDto() when $default != null:
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
            String userId,
            String userName,
            int workedSeconds,
            int shiftsCount,
            int grossAmountMinor,
            int unpaidSeconds,
            int unpaidShiftsCount,
            bool hasMissingRate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollItemDto() when $default != null:
        return $default(
            _that.userId,
            _that.userName,
            _that.workedSeconds,
            _that.shiftsCount,
            _that.grossAmountMinor,
            _that.unpaidSeconds,
            _that.unpaidShiftsCount,
            _that.hasMissingRate);
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
            String userId,
            String userName,
            int workedSeconds,
            int shiftsCount,
            int grossAmountMinor,
            int unpaidSeconds,
            int unpaidShiftsCount,
            bool hasMissingRate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollItemDto():
        return $default(
            _that.userId,
            _that.userName,
            _that.workedSeconds,
            _that.shiftsCount,
            _that.grossAmountMinor,
            _that.unpaidSeconds,
            _that.unpaidShiftsCount,
            _that.hasMissingRate);
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
            String userId,
            String userName,
            int workedSeconds,
            int shiftsCount,
            int grossAmountMinor,
            int unpaidSeconds,
            int unpaidShiftsCount,
            bool hasMissingRate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollItemDto() when $default != null:
        return $default(
            _that.userId,
            _that.userName,
            _that.workedSeconds,
            _that.shiftsCount,
            _that.grossAmountMinor,
            _that.unpaidSeconds,
            _that.unpaidShiftsCount,
            _that.hasMissingRate);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PayrollItemDto implements PayrollItemDto {
  const _PayrollItemDto(
      {required this.userId,
      required this.userName,
      required this.workedSeconds,
      required this.shiftsCount,
      required this.grossAmountMinor,
      required this.unpaidSeconds,
      required this.unpaidShiftsCount,
      required this.hasMissingRate});
  factory _PayrollItemDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollItemDtoFromJson(json);

  @override
  final String userId;
  @override
  final String userName;
  @override
  final int workedSeconds;
  @override
  final int shiftsCount;
  @override
  final int grossAmountMinor;
  @override
  final int unpaidSeconds;
  @override
  final int unpaidShiftsCount;
  @override
  final bool hasMissingRate;

  /// Create a copy of PayrollItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayrollItemDtoCopyWith<_PayrollItemDto> get copyWith =>
      __$PayrollItemDtoCopyWithImpl<_PayrollItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayrollItemDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayrollItemDto &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.workedSeconds, workedSeconds) ||
                other.workedSeconds == workedSeconds) &&
            (identical(other.shiftsCount, shiftsCount) ||
                other.shiftsCount == shiftsCount) &&
            (identical(other.grossAmountMinor, grossAmountMinor) ||
                other.grossAmountMinor == grossAmountMinor) &&
            (identical(other.unpaidSeconds, unpaidSeconds) ||
                other.unpaidSeconds == unpaidSeconds) &&
            (identical(other.unpaidShiftsCount, unpaidShiftsCount) ||
                other.unpaidShiftsCount == unpaidShiftsCount) &&
            (identical(other.hasMissingRate, hasMissingRate) ||
                other.hasMissingRate == hasMissingRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      workedSeconds,
      shiftsCount,
      grossAmountMinor,
      unpaidSeconds,
      unpaidShiftsCount,
      hasMissingRate);

  @override
  String toString() {
    return 'PayrollItemDto(userId: $userId, userName: $userName, workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor, unpaidSeconds: $unpaidSeconds, unpaidShiftsCount: $unpaidShiftsCount, hasMissingRate: $hasMissingRate)';
  }
}

/// @nodoc
abstract mixin class _$PayrollItemDtoCopyWith<$Res>
    implements $PayrollItemDtoCopyWith<$Res> {
  factory _$PayrollItemDtoCopyWith(
          _PayrollItemDto value, $Res Function(_PayrollItemDto) _then) =
      __$PayrollItemDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      int workedSeconds,
      int shiftsCount,
      int grossAmountMinor,
      int unpaidSeconds,
      int unpaidShiftsCount,
      bool hasMissingRate});
}

/// @nodoc
class __$PayrollItemDtoCopyWithImpl<$Res>
    implements _$PayrollItemDtoCopyWith<$Res> {
  __$PayrollItemDtoCopyWithImpl(this._self, this._then);

  final _PayrollItemDto _self;
  final $Res Function(_PayrollItemDto) _then;

  /// Create a copy of PayrollItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? workedSeconds = null,
    Object? shiftsCount = null,
    Object? grossAmountMinor = null,
    Object? unpaidSeconds = null,
    Object? unpaidShiftsCount = null,
    Object? hasMissingRate = null,
  }) {
    return _then(_PayrollItemDto(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      workedSeconds: null == workedSeconds
          ? _self.workedSeconds
          : workedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      shiftsCount: null == shiftsCount
          ? _self.shiftsCount
          : shiftsCount // ignore: cast_nullable_to_non_nullable
              as int,
      grossAmountMinor: null == grossAmountMinor
          ? _self.grossAmountMinor
          : grossAmountMinor // ignore: cast_nullable_to_non_nullable
              as int,
      unpaidSeconds: null == unpaidSeconds
          ? _self.unpaidSeconds
          : unpaidSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      unpaidShiftsCount: null == unpaidShiftsCount
          ? _self.unpaidShiftsCount
          : unpaidShiftsCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMissingRate: null == hasMissingRate
          ? _self.hasMissingRate
          : hasMissingRate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$PayrollTotalsDto {
  int get workedSeconds;
  int get shiftsCount;
  int get grossAmountMinor;

  /// Create a copy of PayrollTotalsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayrollTotalsDtoCopyWith<PayrollTotalsDto> get copyWith =>
      _$PayrollTotalsDtoCopyWithImpl<PayrollTotalsDto>(
          this as PayrollTotalsDto, _$identity);

  /// Serializes this PayrollTotalsDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayrollTotalsDto &&
            (identical(other.workedSeconds, workedSeconds) ||
                other.workedSeconds == workedSeconds) &&
            (identical(other.shiftsCount, shiftsCount) ||
                other.shiftsCount == shiftsCount) &&
            (identical(other.grossAmountMinor, grossAmountMinor) ||
                other.grossAmountMinor == grossAmountMinor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, workedSeconds, shiftsCount, grossAmountMinor);

  @override
  String toString() {
    return 'PayrollTotalsDto(workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor)';
  }
}

/// @nodoc
abstract mixin class $PayrollTotalsDtoCopyWith<$Res> {
  factory $PayrollTotalsDtoCopyWith(
          PayrollTotalsDto value, $Res Function(PayrollTotalsDto) _then) =
      _$PayrollTotalsDtoCopyWithImpl;
  @useResult
  $Res call({int workedSeconds, int shiftsCount, int grossAmountMinor});
}

/// @nodoc
class _$PayrollTotalsDtoCopyWithImpl<$Res>
    implements $PayrollTotalsDtoCopyWith<$Res> {
  _$PayrollTotalsDtoCopyWithImpl(this._self, this._then);

  final PayrollTotalsDto _self;
  final $Res Function(PayrollTotalsDto) _then;

  /// Create a copy of PayrollTotalsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workedSeconds = null,
    Object? shiftsCount = null,
    Object? grossAmountMinor = null,
  }) {
    return _then(_self.copyWith(
      workedSeconds: null == workedSeconds
          ? _self.workedSeconds
          : workedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      shiftsCount: null == shiftsCount
          ? _self.shiftsCount
          : shiftsCount // ignore: cast_nullable_to_non_nullable
              as int,
      grossAmountMinor: null == grossAmountMinor
          ? _self.grossAmountMinor
          : grossAmountMinor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PayrollTotalsDto].
extension PayrollTotalsDtoPatterns on PayrollTotalsDto {
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
    TResult Function(_PayrollTotalsDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollTotalsDto() when $default != null:
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
    TResult Function(_PayrollTotalsDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollTotalsDto():
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
    TResult? Function(_PayrollTotalsDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollTotalsDto() when $default != null:
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
    TResult Function(int workedSeconds, int shiftsCount, int grossAmountMinor)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollTotalsDto() when $default != null:
        return $default(
            _that.workedSeconds, _that.shiftsCount, _that.grossAmountMinor);
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
    TResult Function(int workedSeconds, int shiftsCount, int grossAmountMinor)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollTotalsDto():
        return $default(
            _that.workedSeconds, _that.shiftsCount, _that.grossAmountMinor);
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
    TResult? Function(int workedSeconds, int shiftsCount, int grossAmountMinor)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollTotalsDto() when $default != null:
        return $default(
            _that.workedSeconds, _that.shiftsCount, _that.grossAmountMinor);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PayrollTotalsDto implements PayrollTotalsDto {
  const _PayrollTotalsDto(
      {required this.workedSeconds,
      required this.shiftsCount,
      required this.grossAmountMinor});
  factory _PayrollTotalsDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollTotalsDtoFromJson(json);

  @override
  final int workedSeconds;
  @override
  final int shiftsCount;
  @override
  final int grossAmountMinor;

  /// Create a copy of PayrollTotalsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayrollTotalsDtoCopyWith<_PayrollTotalsDto> get copyWith =>
      __$PayrollTotalsDtoCopyWithImpl<_PayrollTotalsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayrollTotalsDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayrollTotalsDto &&
            (identical(other.workedSeconds, workedSeconds) ||
                other.workedSeconds == workedSeconds) &&
            (identical(other.shiftsCount, shiftsCount) ||
                other.shiftsCount == shiftsCount) &&
            (identical(other.grossAmountMinor, grossAmountMinor) ||
                other.grossAmountMinor == grossAmountMinor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, workedSeconds, shiftsCount, grossAmountMinor);

  @override
  String toString() {
    return 'PayrollTotalsDto(workedSeconds: $workedSeconds, shiftsCount: $shiftsCount, grossAmountMinor: $grossAmountMinor)';
  }
}

/// @nodoc
abstract mixin class _$PayrollTotalsDtoCopyWith<$Res>
    implements $PayrollTotalsDtoCopyWith<$Res> {
  factory _$PayrollTotalsDtoCopyWith(
          _PayrollTotalsDto value, $Res Function(_PayrollTotalsDto) _then) =
      __$PayrollTotalsDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int workedSeconds, int shiftsCount, int grossAmountMinor});
}

/// @nodoc
class __$PayrollTotalsDtoCopyWithImpl<$Res>
    implements _$PayrollTotalsDtoCopyWith<$Res> {
  __$PayrollTotalsDtoCopyWithImpl(this._self, this._then);

  final _PayrollTotalsDto _self;
  final $Res Function(_PayrollTotalsDto) _then;

  /// Create a copy of PayrollTotalsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? workedSeconds = null,
    Object? shiftsCount = null,
    Object? grossAmountMinor = null,
  }) {
    return _then(_PayrollTotalsDto(
      workedSeconds: null == workedSeconds
          ? _self.workedSeconds
          : workedSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      shiftsCount: null == shiftsCount
          ? _self.shiftsCount
          : shiftsCount // ignore: cast_nullable_to_non_nullable
              as int,
      grossAmountMinor: null == grossAmountMinor
          ? _self.grossAmountMinor
          : grossAmountMinor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$PayrollDto {
  PayrollPeriodDto get period;
  String get currency;
  List<PayrollItemDto> get items;
  PayrollTotalsDto get totals;

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayrollDtoCopyWith<PayrollDto> get copyWith =>
      _$PayrollDtoCopyWithImpl<PayrollDto>(this as PayrollDto, _$identity);

  /// Serializes this PayrollDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayrollDto &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, period, currency,
      const DeepCollectionEquality().hash(items), totals);

  @override
  String toString() {
    return 'PayrollDto(period: $period, currency: $currency, items: $items, totals: $totals)';
  }
}

/// @nodoc
abstract mixin class $PayrollDtoCopyWith<$Res> {
  factory $PayrollDtoCopyWith(
          PayrollDto value, $Res Function(PayrollDto) _then) =
      _$PayrollDtoCopyWithImpl;
  @useResult
  $Res call(
      {PayrollPeriodDto period,
      String currency,
      List<PayrollItemDto> items,
      PayrollTotalsDto totals});

  $PayrollPeriodDtoCopyWith<$Res> get period;
  $PayrollTotalsDtoCopyWith<$Res> get totals;
}

/// @nodoc
class _$PayrollDtoCopyWithImpl<$Res> implements $PayrollDtoCopyWith<$Res> {
  _$PayrollDtoCopyWithImpl(this._self, this._then);

  final PayrollDto _self;
  final $Res Function(PayrollDto) _then;

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? currency = null,
    Object? items = null,
    Object? totals = null,
  }) {
    return _then(_self.copyWith(
      period: null == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as PayrollPeriodDto,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PayrollItemDto>,
      totals: null == totals
          ? _self.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as PayrollTotalsDto,
    ));
  }

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PayrollPeriodDtoCopyWith<$Res> get period {
    return $PayrollPeriodDtoCopyWith<$Res>(_self.period, (value) {
      return _then(_self.copyWith(period: value));
    });
  }

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PayrollTotalsDtoCopyWith<$Res> get totals {
    return $PayrollTotalsDtoCopyWith<$Res>(_self.totals, (value) {
      return _then(_self.copyWith(totals: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PayrollDto].
extension PayrollDtoPatterns on PayrollDto {
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
    TResult Function(_PayrollDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollDto() when $default != null:
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
    TResult Function(_PayrollDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollDto():
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
    TResult? Function(_PayrollDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollDto() when $default != null:
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
    TResult Function(PayrollPeriodDto period, String currency,
            List<PayrollItemDto> items, PayrollTotalsDto totals)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayrollDto() when $default != null:
        return $default(
            _that.period, _that.currency, _that.items, _that.totals);
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
    TResult Function(PayrollPeriodDto period, String currency,
            List<PayrollItemDto> items, PayrollTotalsDto totals)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollDto():
        return $default(
            _that.period, _that.currency, _that.items, _that.totals);
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
    TResult? Function(PayrollPeriodDto period, String currency,
            List<PayrollItemDto> items, PayrollTotalsDto totals)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayrollDto() when $default != null:
        return $default(
            _that.period, _that.currency, _that.items, _that.totals);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _PayrollDto implements PayrollDto {
  const _PayrollDto(
      {required this.period,
      required this.currency,
      required final List<PayrollItemDto> items,
      required this.totals})
      : _items = items;
  factory _PayrollDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollDtoFromJson(json);

  @override
  final PayrollPeriodDto period;
  @override
  final String currency;
  final List<PayrollItemDto> _items;
  @override
  List<PayrollItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PayrollTotalsDto totals;

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayrollDtoCopyWith<_PayrollDto> get copyWith =>
      __$PayrollDtoCopyWithImpl<_PayrollDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayrollDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayrollDto &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totals, totals) || other.totals == totals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, period, currency,
      const DeepCollectionEquality().hash(_items), totals);

  @override
  String toString() {
    return 'PayrollDto(period: $period, currency: $currency, items: $items, totals: $totals)';
  }
}

/// @nodoc
abstract mixin class _$PayrollDtoCopyWith<$Res>
    implements $PayrollDtoCopyWith<$Res> {
  factory _$PayrollDtoCopyWith(
          _PayrollDto value, $Res Function(_PayrollDto) _then) =
      __$PayrollDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PayrollPeriodDto period,
      String currency,
      List<PayrollItemDto> items,
      PayrollTotalsDto totals});

  @override
  $PayrollPeriodDtoCopyWith<$Res> get period;
  @override
  $PayrollTotalsDtoCopyWith<$Res> get totals;
}

/// @nodoc
class __$PayrollDtoCopyWithImpl<$Res> implements _$PayrollDtoCopyWith<$Res> {
  __$PayrollDtoCopyWithImpl(this._self, this._then);

  final _PayrollDto _self;
  final $Res Function(_PayrollDto) _then;

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? period = null,
    Object? currency = null,
    Object? items = null,
    Object? totals = null,
  }) {
    return _then(_PayrollDto(
      period: null == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as PayrollPeriodDto,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PayrollItemDto>,
      totals: null == totals
          ? _self.totals
          : totals // ignore: cast_nullable_to_non_nullable
              as PayrollTotalsDto,
    ));
  }

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PayrollPeriodDtoCopyWith<$Res> get period {
    return $PayrollPeriodDtoCopyWith<$Res>(_self.period, (value) {
      return _then(_self.copyWith(period: value));
    });
  }

  /// Create a copy of PayrollDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PayrollTotalsDtoCopyWith<$Res> get totals {
    return $PayrollTotalsDtoCopyWith<$Res>(_self.totals, (value) {
      return _then(_self.copyWith(totals: value));
    });
  }
}

// dart format on
