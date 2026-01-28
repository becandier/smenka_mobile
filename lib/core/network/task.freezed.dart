// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Task<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Task<$T>()';
  }
}

/// @nodoc
class $TaskCopyWith<T, $Res> {
  $TaskCopyWith(Task<T> _, $Res Function(Task<T>) __);
}

/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns<T> on Task<T> {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskSuccess<T> value)? success,
    TResult Function(TaskFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TaskSuccess() when success != null:
        return success(_that);
      case TaskFailure() when failure != null:
        return failure(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(TaskSuccess<T> value) success,
    required TResult Function(TaskFailure<T> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSuccess():
        return success(_that);
      case TaskFailure():
        return failure(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskSuccess<T> value)? success,
    TResult? Function(TaskFailure<T> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSuccess() when success != null:
        return success(_that);
      case TaskFailure() when failure != null:
        return failure(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(ApiException error)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TaskSuccess() when success != null:
        return success(_that.data);
      case TaskFailure() when failure != null:
        return failure(_that.error);
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
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(ApiException error) failure,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSuccess():
        return success(_that.data);
      case TaskFailure():
        return failure(_that.error);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(ApiException error)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSuccess() when success != null:
        return success(_that.data);
      case TaskFailure() when failure != null:
        return failure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TaskSuccess<T> implements Task<T> {
  const TaskSuccess(this.data);

  final T data;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskSuccessCopyWith<T, TaskSuccess<T>> get copyWith =>
      _$TaskSuccessCopyWithImpl<T, TaskSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Task<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $TaskSuccessCopyWith<T, $Res>
    implements $TaskCopyWith<T, $Res> {
  factory $TaskSuccessCopyWith(
          TaskSuccess<T> value, $Res Function(TaskSuccess<T>) _then) =
      _$TaskSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$TaskSuccessCopyWithImpl<T, $Res>
    implements $TaskSuccessCopyWith<T, $Res> {
  _$TaskSuccessCopyWithImpl(this._self, this._then);

  final TaskSuccess<T> _self;
  final $Res Function(TaskSuccess<T>) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(TaskSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class TaskFailure<T> implements Task<T> {
  const TaskFailure(this.error);

  final ApiException error;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskFailureCopyWith<T, TaskFailure<T>> get copyWith =>
      _$TaskFailureCopyWithImpl<T, TaskFailure<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskFailure<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'Task<$T>.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $TaskFailureCopyWith<T, $Res>
    implements $TaskCopyWith<T, $Res> {
  factory $TaskFailureCopyWith(
          TaskFailure<T> value, $Res Function(TaskFailure<T>) _then) =
      _$TaskFailureCopyWithImpl;
  @useResult
  $Res call({ApiException error});

  $ApiExceptionCopyWith<$Res> get error;
}

/// @nodoc
class _$TaskFailureCopyWithImpl<T, $Res>
    implements $TaskFailureCopyWith<T, $Res> {
  _$TaskFailureCopyWithImpl(this._self, this._then);

  final TaskFailure<T> _self;
  final $Res Function(TaskFailure<T>) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(TaskFailure<T>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiException,
    ));
  }

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiExceptionCopyWith<$Res> get error {
    return $ApiExceptionCopyWith<$Res>(_self.error, (value) {
      return _then(_self.copyWith(error: value));
    });
  }
}

// dart format on
