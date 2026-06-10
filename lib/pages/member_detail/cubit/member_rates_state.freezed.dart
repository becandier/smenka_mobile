// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_rates_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberRatesState {
  /// История ставок участника (effective_from DESC, без пагинации).
  SectionData<List<Rate>> get rates;

  /// Статус одноразового действия (удаление записи).
  FeatureStatus get actionStatus;
  String? get actionError;
  String? get actionErrorCode;

  /// Create a copy of MemberRatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberRatesStateCopyWith<MemberRatesState> get copyWith =>
      _$MemberRatesStateCopyWithImpl<MemberRatesState>(
          this as MemberRatesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberRatesState &&
            (identical(other.rates, rates) || other.rates == rates) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.actionErrorCode, actionErrorCode) ||
                other.actionErrorCode == actionErrorCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rates, actionStatus, actionError, actionErrorCode);

  @override
  String toString() {
    return 'MemberRatesState(rates: $rates, actionStatus: $actionStatus, actionError: $actionError, actionErrorCode: $actionErrorCode)';
  }
}

/// @nodoc
abstract mixin class $MemberRatesStateCopyWith<$Res> {
  factory $MemberRatesStateCopyWith(
          MemberRatesState value, $Res Function(MemberRatesState) _then) =
      _$MemberRatesStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<List<Rate>> rates,
      FeatureStatus actionStatus,
      String? actionError,
      String? actionErrorCode});

  $SectionDataCopyWith<List<Rate>, $Res> get rates;
}

/// @nodoc
class _$MemberRatesStateCopyWithImpl<$Res>
    implements $MemberRatesStateCopyWith<$Res> {
  _$MemberRatesStateCopyWithImpl(this._self, this._then);

  final MemberRatesState _self;
  final $Res Function(MemberRatesState) _then;

  /// Create a copy of MemberRatesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rates = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
    Object? actionErrorCode = freezed,
  }) {
    return _then(_self.copyWith(
      rates: null == rates
          ? _self.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Rate>>,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      actionErrorCode: freezed == actionErrorCode
          ? _self.actionErrorCode
          : actionErrorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of MemberRatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Rate>, $Res> get rates {
    return $SectionDataCopyWith<List<Rate>, $Res>(_self.rates, (value) {
      return _then(_self.copyWith(rates: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MemberRatesState].
extension MemberRatesStatePatterns on MemberRatesState {
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
    TResult Function(_MemberRatesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberRatesState() when $default != null:
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
    TResult Function(_MemberRatesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberRatesState():
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
    TResult? Function(_MemberRatesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberRatesState() when $default != null:
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
    TResult Function(SectionData<List<Rate>> rates, FeatureStatus actionStatus,
            String? actionError, String? actionErrorCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberRatesState() when $default != null:
        return $default(_that.rates, _that.actionStatus, _that.actionError,
            _that.actionErrorCode);
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
    TResult Function(SectionData<List<Rate>> rates, FeatureStatus actionStatus,
            String? actionError, String? actionErrorCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberRatesState():
        return $default(_that.rates, _that.actionStatus, _that.actionError,
            _that.actionErrorCode);
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
    TResult? Function(SectionData<List<Rate>> rates, FeatureStatus actionStatus,
            String? actionError, String? actionErrorCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberRatesState() when $default != null:
        return $default(_that.rates, _that.actionStatus, _that.actionError,
            _that.actionErrorCode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberRatesState extends MemberRatesState {
  const _MemberRatesState(
      {this.rates = const SectionData<List<Rate>>(),
      this.actionStatus = FeatureStatus.initial,
      this.actionError,
      this.actionErrorCode})
      : super._();

  /// История ставок участника (effective_from DESC, без пагинации).
  @override
  @JsonKey()
  final SectionData<List<Rate>> rates;

  /// Статус одноразового действия (удаление записи).
  @override
  @JsonKey()
  final FeatureStatus actionStatus;
  @override
  final String? actionError;
  @override
  final String? actionErrorCode;

  /// Create a copy of MemberRatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberRatesStateCopyWith<_MemberRatesState> get copyWith =>
      __$MemberRatesStateCopyWithImpl<_MemberRatesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberRatesState &&
            (identical(other.rates, rates) || other.rates == rates) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.actionErrorCode, actionErrorCode) ||
                other.actionErrorCode == actionErrorCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rates, actionStatus, actionError, actionErrorCode);

  @override
  String toString() {
    return 'MemberRatesState(rates: $rates, actionStatus: $actionStatus, actionError: $actionError, actionErrorCode: $actionErrorCode)';
  }
}

/// @nodoc
abstract mixin class _$MemberRatesStateCopyWith<$Res>
    implements $MemberRatesStateCopyWith<$Res> {
  factory _$MemberRatesStateCopyWith(
          _MemberRatesState value, $Res Function(_MemberRatesState) _then) =
      __$MemberRatesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<List<Rate>> rates,
      FeatureStatus actionStatus,
      String? actionError,
      String? actionErrorCode});

  @override
  $SectionDataCopyWith<List<Rate>, $Res> get rates;
}

/// @nodoc
class __$MemberRatesStateCopyWithImpl<$Res>
    implements _$MemberRatesStateCopyWith<$Res> {
  __$MemberRatesStateCopyWithImpl(this._self, this._then);

  final _MemberRatesState _self;
  final $Res Function(_MemberRatesState) _then;

  /// Create a copy of MemberRatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rates = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
    Object? actionErrorCode = freezed,
  }) {
    return _then(_MemberRatesState(
      rates: null == rates
          ? _self.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as SectionData<List<Rate>>,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
      actionErrorCode: freezed == actionErrorCode
          ? _self.actionErrorCode
          : actionErrorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of MemberRatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<Rate>, $Res> get rates {
    return $SectionDataCopyWith<List<Rate>, $Res>(_self.rates, (value) {
      return _then(_self.copyWith(rates: value));
    });
  }
}

// dart format on
