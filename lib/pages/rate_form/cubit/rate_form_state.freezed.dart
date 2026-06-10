// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateFormState {
  FeatureStatus get status;
  String? get errorMessage;
  String? get errorCode;

  /// Create a copy of RateFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RateFormStateCopyWith<RateFormState> get copyWith =>
      _$RateFormStateCopyWithImpl<RateFormState>(
          this as RateFormState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RateFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, errorCode);

  @override
  String toString() {
    return 'RateFormState(status: $status, errorMessage: $errorMessage, errorCode: $errorCode)';
  }
}

/// @nodoc
abstract mixin class $RateFormStateCopyWith<$Res> {
  factory $RateFormStateCopyWith(
          RateFormState value, $Res Function(RateFormState) _then) =
      _$RateFormStateCopyWithImpl;
  @useResult
  $Res call({FeatureStatus status, String? errorMessage, String? errorCode});
}

/// @nodoc
class _$RateFormStateCopyWithImpl<$Res>
    implements $RateFormStateCopyWith<$Res> {
  _$RateFormStateCopyWithImpl(this._self, this._then);

  final RateFormState _self;
  final $Res Function(RateFormState) _then;

  /// Create a copy of RateFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _self.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [RateFormState].
extension RateFormStatePatterns on RateFormState {
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
    TResult Function(_RateFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateFormState() when $default != null:
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
    TResult Function(_RateFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateFormState():
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
    TResult? Function(_RateFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateFormState() when $default != null:
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
            FeatureStatus status, String? errorMessage, String? errorCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateFormState() when $default != null:
        return $default(_that.status, _that.errorMessage, _that.errorCode);
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
            FeatureStatus status, String? errorMessage, String? errorCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateFormState():
        return $default(_that.status, _that.errorMessage, _that.errorCode);
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
            FeatureStatus status, String? errorMessage, String? errorCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateFormState() when $default != null:
        return $default(_that.status, _that.errorMessage, _that.errorCode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RateFormState extends RateFormState {
  const _RateFormState(
      {this.status = FeatureStatus.initial, this.errorMessage, this.errorCode})
      : super._();

  @override
  @JsonKey()
  final FeatureStatus status;
  @override
  final String? errorMessage;
  @override
  final String? errorCode;

  /// Create a copy of RateFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateFormStateCopyWith<_RateFormState> get copyWith =>
      __$RateFormStateCopyWithImpl<_RateFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage, errorCode);

  @override
  String toString() {
    return 'RateFormState(status: $status, errorMessage: $errorMessage, errorCode: $errorCode)';
  }
}

/// @nodoc
abstract mixin class _$RateFormStateCopyWith<$Res>
    implements $RateFormStateCopyWith<$Res> {
  factory _$RateFormStateCopyWith(
          _RateFormState value, $Res Function(_RateFormState) _then) =
      __$RateFormStateCopyWithImpl;
  @override
  @useResult
  $Res call({FeatureStatus status, String? errorMessage, String? errorCode});
}

/// @nodoc
class __$RateFormStateCopyWithImpl<$Res>
    implements _$RateFormStateCopyWith<$Res> {
  __$RateFormStateCopyWithImpl(this._self, this._then);

  final _RateFormState _self;
  final $Res Function(_RateFormState) _then;

  /// Create a copy of RateFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_RateFormState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _self.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
