// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistItemsSummary {
  int get total;
  int get completed;

  /// Create a copy of ChecklistItemsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistItemsSummaryCopyWith<ChecklistItemsSummary> get copyWith =>
      _$ChecklistItemsSummaryCopyWithImpl<ChecklistItemsSummary>(
          this as ChecklistItemsSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistItemsSummary &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, completed);

  @override
  String toString() {
    return 'ChecklistItemsSummary(total: $total, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class $ChecklistItemsSummaryCopyWith<$Res> {
  factory $ChecklistItemsSummaryCopyWith(ChecklistItemsSummary value,
          $Res Function(ChecklistItemsSummary) _then) =
      _$ChecklistItemsSummaryCopyWithImpl;
  @useResult
  $Res call({int total, int completed});
}

/// @nodoc
class _$ChecklistItemsSummaryCopyWithImpl<$Res>
    implements $ChecklistItemsSummaryCopyWith<$Res> {
  _$ChecklistItemsSummaryCopyWithImpl(this._self, this._then);

  final ChecklistItemsSummary _self;
  final $Res Function(ChecklistItemsSummary) _then;

  /// Create a copy of ChecklistItemsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? completed = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChecklistItemsSummary].
extension ChecklistItemsSummaryPatterns on ChecklistItemsSummary {
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
    TResult Function(_ChecklistItemsSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistItemsSummary() when $default != null:
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
    TResult Function(_ChecklistItemsSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItemsSummary():
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
    TResult? Function(_ChecklistItemsSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItemsSummary() when $default != null:
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
    TResult Function(int total, int completed)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistItemsSummary() when $default != null:
        return $default(_that.total, _that.completed);
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
    TResult Function(int total, int completed) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItemsSummary():
        return $default(_that.total, _that.completed);
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
    TResult? Function(int total, int completed)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistItemsSummary() when $default != null:
        return $default(_that.total, _that.completed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistItemsSummary implements ChecklistItemsSummary {
  const _ChecklistItemsSummary({required this.total, required this.completed});

  @override
  final int total;
  @override
  final int completed;

  /// Create a copy of ChecklistItemsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistItemsSummaryCopyWith<_ChecklistItemsSummary> get copyWith =>
      __$ChecklistItemsSummaryCopyWithImpl<_ChecklistItemsSummary>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistItemsSummary &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, completed);

  @override
  String toString() {
    return 'ChecklistItemsSummary(total: $total, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistItemsSummaryCopyWith<$Res>
    implements $ChecklistItemsSummaryCopyWith<$Res> {
  factory _$ChecklistItemsSummaryCopyWith(_ChecklistItemsSummary value,
          $Res Function(_ChecklistItemsSummary) _then) =
      __$ChecklistItemsSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int completed});
}

/// @nodoc
class __$ChecklistItemsSummaryCopyWithImpl<$Res>
    implements _$ChecklistItemsSummaryCopyWith<$Res> {
  __$ChecklistItemsSummaryCopyWithImpl(this._self, this._then);

  final _ChecklistItemsSummary _self;
  final $Res Function(_ChecklistItemsSummary) _then;

  /// Create a copy of ChecklistItemsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? completed = null,
  }) {
    return _then(_ChecklistItemsSummary(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ChecklistInstance {
  String get id;
  String get name;
  ChecklistType get type;
  bool get isRequired;
  ChecklistInstanceStatus get status;
  ChecklistItemsSummary get itemsSummary;
  DateTime get createdAt;
  DateTime? get completedAt;

  /// Create a copy of ChecklistInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistInstanceCopyWith<ChecklistInstance> get copyWith =>
      _$ChecklistInstanceCopyWithImpl<ChecklistInstance>(
          this as ChecklistInstance, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistInstance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemsSummary, itemsSummary) ||
                other.itemsSummary == itemsSummary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, isRequired,
      status, itemsSummary, createdAt, completedAt);

  @override
  String toString() {
    return 'ChecklistInstance(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, itemsSummary: $itemsSummary, createdAt: $createdAt, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class $ChecklistInstanceCopyWith<$Res> {
  factory $ChecklistInstanceCopyWith(
          ChecklistInstance value, $Res Function(ChecklistInstance) _then) =
      _$ChecklistInstanceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      ChecklistType type,
      bool isRequired,
      ChecklistInstanceStatus status,
      ChecklistItemsSummary itemsSummary,
      DateTime createdAt,
      DateTime? completedAt});

  $ChecklistItemsSummaryCopyWith<$Res> get itemsSummary;
}

/// @nodoc
class _$ChecklistInstanceCopyWithImpl<$Res>
    implements $ChecklistInstanceCopyWith<$Res> {
  _$ChecklistInstanceCopyWithImpl(this._self, this._then);

  final ChecklistInstance _self;
  final $Res Function(ChecklistInstance) _then;

  /// Create a copy of ChecklistInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? status = null,
    Object? itemsSummary = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistType,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecklistInstanceStatus,
      itemsSummary: null == itemsSummary
          ? _self.itemsSummary
          : itemsSummary // ignore: cast_nullable_to_non_nullable
              as ChecklistItemsSummary,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ChecklistInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistItemsSummaryCopyWith<$Res> get itemsSummary {
    return $ChecklistItemsSummaryCopyWith<$Res>(_self.itemsSummary, (value) {
      return _then(_self.copyWith(itemsSummary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChecklistInstance].
extension ChecklistInstancePatterns on ChecklistInstance {
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
    TResult Function(_ChecklistInstance value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstance() when $default != null:
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
    TResult Function(_ChecklistInstance value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstance():
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
    TResult? Function(_ChecklistInstance value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstance() when $default != null:
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
            String id,
            String name,
            ChecklistType type,
            bool isRequired,
            ChecklistInstanceStatus status,
            ChecklistItemsSummary itemsSummary,
            DateTime createdAt,
            DateTime? completedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstance() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.isRequired,
            _that.status,
            _that.itemsSummary,
            _that.createdAt,
            _that.completedAt);
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
            String id,
            String name,
            ChecklistType type,
            bool isRequired,
            ChecklistInstanceStatus status,
            ChecklistItemsSummary itemsSummary,
            DateTime createdAt,
            DateTime? completedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstance():
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.isRequired,
            _that.status,
            _that.itemsSummary,
            _that.createdAt,
            _that.completedAt);
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
            String id,
            String name,
            ChecklistType type,
            bool isRequired,
            ChecklistInstanceStatus status,
            ChecklistItemsSummary itemsSummary,
            DateTime createdAt,
            DateTime? completedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstance() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.isRequired,
            _that.status,
            _that.itemsSummary,
            _that.createdAt,
            _that.completedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistInstance implements ChecklistInstance {
  const _ChecklistInstance(
      {required this.id,
      required this.name,
      required this.type,
      required this.isRequired,
      required this.status,
      required this.itemsSummary,
      required this.createdAt,
      this.completedAt});

  @override
  final String id;
  @override
  final String name;
  @override
  final ChecklistType type;
  @override
  final bool isRequired;
  @override
  final ChecklistInstanceStatus status;
  @override
  final ChecklistItemsSummary itemsSummary;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;

  /// Create a copy of ChecklistInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistInstanceCopyWith<_ChecklistInstance> get copyWith =>
      __$ChecklistInstanceCopyWithImpl<_ChecklistInstance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistInstance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.itemsSummary, itemsSummary) ||
                other.itemsSummary == itemsSummary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, isRequired,
      status, itemsSummary, createdAt, completedAt);

  @override
  String toString() {
    return 'ChecklistInstance(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, itemsSummary: $itemsSummary, createdAt: $createdAt, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistInstanceCopyWith<$Res>
    implements $ChecklistInstanceCopyWith<$Res> {
  factory _$ChecklistInstanceCopyWith(
          _ChecklistInstance value, $Res Function(_ChecklistInstance) _then) =
      __$ChecklistInstanceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ChecklistType type,
      bool isRequired,
      ChecklistInstanceStatus status,
      ChecklistItemsSummary itemsSummary,
      DateTime createdAt,
      DateTime? completedAt});

  @override
  $ChecklistItemsSummaryCopyWith<$Res> get itemsSummary;
}

/// @nodoc
class __$ChecklistInstanceCopyWithImpl<$Res>
    implements _$ChecklistInstanceCopyWith<$Res> {
  __$ChecklistInstanceCopyWithImpl(this._self, this._then);

  final _ChecklistInstance _self;
  final $Res Function(_ChecklistInstance) _then;

  /// Create a copy of ChecklistInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? status = null,
    Object? itemsSummary = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(_ChecklistInstance(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistType,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecklistInstanceStatus,
      itemsSummary: null == itemsSummary
          ? _self.itemsSummary
          : itemsSummary // ignore: cast_nullable_to_non_nullable
              as ChecklistItemsSummary,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of ChecklistInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecklistItemsSummaryCopyWith<$Res> get itemsSummary {
    return $ChecklistItemsSummaryCopyWith<$Res>(_self.itemsSummary, (value) {
      return _then(_self.copyWith(itemsSummary: value));
    });
  }
}

/// @nodoc
mixin _$ChecklistInstanceDetail {
  String get id;
  String get name;
  ChecklistType get type;
  bool get isRequired;
  ChecklistInstanceStatus get status;
  DateTime get createdAt;
  List<ChecklistInstanceItem> get items;
  DateTime? get completedAt;

  /// Create a copy of ChecklistInstanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistInstanceDetailCopyWith<ChecklistInstanceDetail> get copyWith =>
      _$ChecklistInstanceDetailCopyWithImpl<ChecklistInstanceDetail>(
          this as ChecklistInstanceDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistInstanceDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      isRequired,
      status,
      createdAt,
      const DeepCollectionEquality().hash(items),
      completedAt);

  @override
  String toString() {
    return 'ChecklistInstanceDetail(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, createdAt: $createdAt, items: $items, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class $ChecklistInstanceDetailCopyWith<$Res> {
  factory $ChecklistInstanceDetailCopyWith(ChecklistInstanceDetail value,
          $Res Function(ChecklistInstanceDetail) _then) =
      _$ChecklistInstanceDetailCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      ChecklistType type,
      bool isRequired,
      ChecklistInstanceStatus status,
      DateTime createdAt,
      List<ChecklistInstanceItem> items,
      DateTime? completedAt});
}

/// @nodoc
class _$ChecklistInstanceDetailCopyWithImpl<$Res>
    implements $ChecklistInstanceDetailCopyWith<$Res> {
  _$ChecklistInstanceDetailCopyWithImpl(this._self, this._then);

  final ChecklistInstanceDetail _self;
  final $Res Function(ChecklistInstanceDetail) _then;

  /// Create a copy of ChecklistInstanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? status = null,
    Object? createdAt = null,
    Object? items = null,
    Object? completedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistType,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecklistInstanceStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistInstanceItem>,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChecklistInstanceDetail].
extension ChecklistInstanceDetailPatterns on ChecklistInstanceDetail {
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
    TResult Function(_ChecklistInstanceDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceDetail() when $default != null:
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
    TResult Function(_ChecklistInstanceDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceDetail():
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
    TResult? Function(_ChecklistInstanceDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceDetail() when $default != null:
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
            String id,
            String name,
            ChecklistType type,
            bool isRequired,
            ChecklistInstanceStatus status,
            DateTime createdAt,
            List<ChecklistInstanceItem> items,
            DateTime? completedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceDetail() when $default != null:
        return $default(_that.id, _that.name, _that.type, _that.isRequired,
            _that.status, _that.createdAt, _that.items, _that.completedAt);
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
            String id,
            String name,
            ChecklistType type,
            bool isRequired,
            ChecklistInstanceStatus status,
            DateTime createdAt,
            List<ChecklistInstanceItem> items,
            DateTime? completedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceDetail():
        return $default(_that.id, _that.name, _that.type, _that.isRequired,
            _that.status, _that.createdAt, _that.items, _that.completedAt);
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
            String id,
            String name,
            ChecklistType type,
            bool isRequired,
            ChecklistInstanceStatus status,
            DateTime createdAt,
            List<ChecklistInstanceItem> items,
            DateTime? completedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceDetail() when $default != null:
        return $default(_that.id, _that.name, _that.type, _that.isRequired,
            _that.status, _that.createdAt, _that.items, _that.completedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistInstanceDetail implements ChecklistInstanceDetail {
  const _ChecklistInstanceDetail(
      {required this.id,
      required this.name,
      required this.type,
      required this.isRequired,
      required this.status,
      required this.createdAt,
      required final List<ChecklistInstanceItem> items,
      this.completedAt})
      : _items = items;

  @override
  final String id;
  @override
  final String name;
  @override
  final ChecklistType type;
  @override
  final bool isRequired;
  @override
  final ChecklistInstanceStatus status;
  @override
  final DateTime createdAt;
  final List<ChecklistInstanceItem> _items;
  @override
  List<ChecklistInstanceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime? completedAt;

  /// Create a copy of ChecklistInstanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistInstanceDetailCopyWith<_ChecklistInstanceDetail> get copyWith =>
      __$ChecklistInstanceDetailCopyWithImpl<_ChecklistInstanceDetail>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistInstanceDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      isRequired,
      status,
      createdAt,
      const DeepCollectionEquality().hash(_items),
      completedAt);

  @override
  String toString() {
    return 'ChecklistInstanceDetail(id: $id, name: $name, type: $type, isRequired: $isRequired, status: $status, createdAt: $createdAt, items: $items, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistInstanceDetailCopyWith<$Res>
    implements $ChecklistInstanceDetailCopyWith<$Res> {
  factory _$ChecklistInstanceDetailCopyWith(_ChecklistInstanceDetail value,
          $Res Function(_ChecklistInstanceDetail) _then) =
      __$ChecklistInstanceDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ChecklistType type,
      bool isRequired,
      ChecklistInstanceStatus status,
      DateTime createdAt,
      List<ChecklistInstanceItem> items,
      DateTime? completedAt});
}

/// @nodoc
class __$ChecklistInstanceDetailCopyWithImpl<$Res>
    implements _$ChecklistInstanceDetailCopyWith<$Res> {
  __$ChecklistInstanceDetailCopyWithImpl(this._self, this._then);

  final _ChecklistInstanceDetail _self;
  final $Res Function(_ChecklistInstanceDetail) _then;

  /// Create a copy of ChecklistInstanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? isRequired = null,
    Object? status = null,
    Object? createdAt = null,
    Object? items = null,
    Object? completedAt = freezed,
  }) {
    return _then(_ChecklistInstanceDetail(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistType,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecklistInstanceStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChecklistInstanceItem>,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ChecklistInstanceItem {
  String get id;
  String get text;
  bool get isRequired;
  int get position;
  bool get isCompleted;
  int get changeCount;
  String? get comment;
  DateTime? get completedAt;

  /// Create a copy of ChecklistInstanceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistInstanceItemCopyWith<ChecklistInstanceItem> get copyWith =>
      _$ChecklistInstanceItemCopyWithImpl<ChecklistInstanceItem>(
          this as ChecklistInstanceItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistInstanceItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.changeCount, changeCount) ||
                other.changeCount == changeCount) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, isRequired, position,
      isCompleted, changeCount, comment, completedAt);

  @override
  String toString() {
    return 'ChecklistInstanceItem(id: $id, text: $text, isRequired: $isRequired, position: $position, isCompleted: $isCompleted, changeCount: $changeCount, comment: $comment, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class $ChecklistInstanceItemCopyWith<$Res> {
  factory $ChecklistInstanceItemCopyWith(ChecklistInstanceItem value,
          $Res Function(ChecklistInstanceItem) _then) =
      _$ChecklistInstanceItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String text,
      bool isRequired,
      int position,
      bool isCompleted,
      int changeCount,
      String? comment,
      DateTime? completedAt});
}

/// @nodoc
class _$ChecklistInstanceItemCopyWithImpl<$Res>
    implements $ChecklistInstanceItemCopyWith<$Res> {
  _$ChecklistInstanceItemCopyWithImpl(this._self, this._then);

  final ChecklistInstanceItem _self;
  final $Res Function(ChecklistInstanceItem) _then;

  /// Create a copy of ChecklistInstanceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isRequired = null,
    Object? position = null,
    Object? isCompleted = null,
    Object? changeCount = null,
    Object? comment = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      changeCount: null == changeCount
          ? _self.changeCount
          : changeCount // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChecklistInstanceItem].
extension ChecklistInstanceItemPatterns on ChecklistInstanceItem {
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
    TResult Function(_ChecklistInstanceItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceItem() when $default != null:
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
    TResult Function(_ChecklistInstanceItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceItem():
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
    TResult? Function(_ChecklistInstanceItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceItem() when $default != null:
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
            String id,
            String text,
            bool isRequired,
            int position,
            bool isCompleted,
            int changeCount,
            String? comment,
            DateTime? completedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceItem() when $default != null:
        return $default(
            _that.id,
            _that.text,
            _that.isRequired,
            _that.position,
            _that.isCompleted,
            _that.changeCount,
            _that.comment,
            _that.completedAt);
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
            String id,
            String text,
            bool isRequired,
            int position,
            bool isCompleted,
            int changeCount,
            String? comment,
            DateTime? completedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceItem():
        return $default(
            _that.id,
            _that.text,
            _that.isRequired,
            _that.position,
            _that.isCompleted,
            _that.changeCount,
            _that.comment,
            _that.completedAt);
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
            String id,
            String text,
            bool isRequired,
            int position,
            bool isCompleted,
            int changeCount,
            String? comment,
            DateTime? completedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistInstanceItem() when $default != null:
        return $default(
            _that.id,
            _that.text,
            _that.isRequired,
            _that.position,
            _that.isCompleted,
            _that.changeCount,
            _that.comment,
            _that.completedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistInstanceItem implements ChecklistInstanceItem {
  const _ChecklistInstanceItem(
      {required this.id,
      required this.text,
      required this.isRequired,
      required this.position,
      required this.isCompleted,
      required this.changeCount,
      this.comment,
      this.completedAt});

  @override
  final String id;
  @override
  final String text;
  @override
  final bool isRequired;
  @override
  final int position;
  @override
  final bool isCompleted;
  @override
  final int changeCount;
  @override
  final String? comment;
  @override
  final DateTime? completedAt;

  /// Create a copy of ChecklistInstanceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistInstanceItemCopyWith<_ChecklistInstanceItem> get copyWith =>
      __$ChecklistInstanceItemCopyWithImpl<_ChecklistInstanceItem>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistInstanceItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.changeCount, changeCount) ||
                other.changeCount == changeCount) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, isRequired, position,
      isCompleted, changeCount, comment, completedAt);

  @override
  String toString() {
    return 'ChecklistInstanceItem(id: $id, text: $text, isRequired: $isRequired, position: $position, isCompleted: $isCompleted, changeCount: $changeCount, comment: $comment, completedAt: $completedAt)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistInstanceItemCopyWith<$Res>
    implements $ChecklistInstanceItemCopyWith<$Res> {
  factory _$ChecklistInstanceItemCopyWith(_ChecklistInstanceItem value,
          $Res Function(_ChecklistInstanceItem) _then) =
      __$ChecklistInstanceItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      bool isRequired,
      int position,
      bool isCompleted,
      int changeCount,
      String? comment,
      DateTime? completedAt});
}

/// @nodoc
class __$ChecklistInstanceItemCopyWithImpl<$Res>
    implements _$ChecklistInstanceItemCopyWith<$Res> {
  __$ChecklistInstanceItemCopyWithImpl(this._self, this._then);

  final _ChecklistInstanceItem _self;
  final $Res Function(_ChecklistInstanceItem) _then;

  /// Create a copy of ChecklistInstanceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isRequired = null,
    Object? position = null,
    Object? isCompleted = null,
    Object? changeCount = null,
    Object? comment = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_ChecklistInstanceItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _self.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      changeCount: null == changeCount
          ? _self.changeCount
          : changeCount // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
