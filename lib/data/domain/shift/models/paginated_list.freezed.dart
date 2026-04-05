// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedShifts {
  List<Shift> get items;
  int get total;
  int get limit;
  int get offset;

  /// Create a copy of PaginatedShifts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedShiftsCopyWith<PaginatedShifts> get copyWith =>
      _$PaginatedShiftsCopyWithImpl<PaginatedShifts>(
          this as PaginatedShifts, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedShifts &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), total, limit, offset);

  @override
  String toString() {
    return 'PaginatedShifts(items: $items, total: $total, limit: $limit, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class $PaginatedShiftsCopyWith<$Res> {
  factory $PaginatedShiftsCopyWith(
          PaginatedShifts value, $Res Function(PaginatedShifts) _then) =
      _$PaginatedShiftsCopyWithImpl;
  @useResult
  $Res call({List<Shift> items, int total, int limit, int offset});
}

/// @nodoc
class _$PaginatedShiftsCopyWithImpl<$Res>
    implements $PaginatedShiftsCopyWith<$Res> {
  _$PaginatedShiftsCopyWithImpl(this._self, this._then);

  final PaginatedShifts _self;
  final $Res Function(PaginatedShifts) _then;

  /// Create a copy of PaginatedShifts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Shift>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginatedShifts].
extension PaginatedShiftsPatterns on PaginatedShifts {
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
    TResult Function(_PaginatedShifts value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedShifts() when $default != null:
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
    TResult Function(_PaginatedShifts value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedShifts():
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
    TResult? Function(_PaginatedShifts value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedShifts() when $default != null:
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
    TResult Function(List<Shift> items, int total, int limit, int offset)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginatedShifts() when $default != null:
        return $default(_that.items, _that.total, _that.limit, _that.offset);
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
    TResult Function(List<Shift> items, int total, int limit, int offset)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedShifts():
        return $default(_that.items, _that.total, _that.limit, _that.offset);
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
    TResult? Function(List<Shift> items, int total, int limit, int offset)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginatedShifts() when $default != null:
        return $default(_that.items, _that.total, _that.limit, _that.offset);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PaginatedShifts implements PaginatedShifts {
  const _PaginatedShifts(
      {required final List<Shift> items,
      required this.total,
      required this.limit,
      required this.offset})
      : _items = items;

  final List<Shift> _items;
  @override
  List<Shift> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;

  /// Create a copy of PaginatedShifts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginatedShiftsCopyWith<_PaginatedShifts> get copyWith =>
      __$PaginatedShiftsCopyWithImpl<_PaginatedShifts>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginatedShifts &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), total, limit, offset);

  @override
  String toString() {
    return 'PaginatedShifts(items: $items, total: $total, limit: $limit, offset: $offset)';
  }
}

/// @nodoc
abstract mixin class _$PaginatedShiftsCopyWith<$Res>
    implements $PaginatedShiftsCopyWith<$Res> {
  factory _$PaginatedShiftsCopyWith(
          _PaginatedShifts value, $Res Function(_PaginatedShifts) _then) =
      __$PaginatedShiftsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Shift> items, int total, int limit, int offset});
}

/// @nodoc
class __$PaginatedShiftsCopyWithImpl<$Res>
    implements _$PaginatedShiftsCopyWith<$Res> {
  __$PaginatedShiftsCopyWithImpl(this._self, this._then);

  final _PaginatedShifts _self;
  final $Res Function(_PaginatedShifts) _then;

  /// Create a copy of PaginatedShifts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_PaginatedShifts(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Shift>,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
