// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_override.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistMemberOverride {
  String get templateId;
  ChecklistOverrideType get type;

  /// Create a copy of ChecklistMemberOverride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistMemberOverrideCopyWith<ChecklistMemberOverride> get copyWith =>
      _$ChecklistMemberOverrideCopyWithImpl<ChecklistMemberOverride>(
          this as ChecklistMemberOverride, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistMemberOverride &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, templateId, type);

  @override
  String toString() {
    return 'ChecklistMemberOverride(templateId: $templateId, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ChecklistMemberOverrideCopyWith<$Res> {
  factory $ChecklistMemberOverrideCopyWith(ChecklistMemberOverride value,
          $Res Function(ChecklistMemberOverride) _then) =
      _$ChecklistMemberOverrideCopyWithImpl;
  @useResult
  $Res call({String templateId, ChecklistOverrideType type});
}

/// @nodoc
class _$ChecklistMemberOverrideCopyWithImpl<$Res>
    implements $ChecklistMemberOverrideCopyWith<$Res> {
  _$ChecklistMemberOverrideCopyWithImpl(this._self, this._then);

  final ChecklistMemberOverride _self;
  final $Res Function(ChecklistMemberOverride) _then;

  /// Create a copy of ChecklistMemberOverride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      templateId: null == templateId
          ? _self.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistOverrideType,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChecklistMemberOverride].
extension ChecklistMemberOverridePatterns on ChecklistMemberOverride {
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
    TResult Function(_ChecklistMemberOverride value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistMemberOverride() when $default != null:
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
    TResult Function(_ChecklistMemberOverride value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistMemberOverride():
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
    TResult? Function(_ChecklistMemberOverride value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistMemberOverride() when $default != null:
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
    TResult Function(String templateId, ChecklistOverrideType type)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistMemberOverride() when $default != null:
        return $default(_that.templateId, _that.type);
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
    TResult Function(String templateId, ChecklistOverrideType type) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistMemberOverride():
        return $default(_that.templateId, _that.type);
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
    TResult? Function(String templateId, ChecklistOverrideType type)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistMemberOverride() when $default != null:
        return $default(_that.templateId, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistMemberOverride implements ChecklistMemberOverride {
  const _ChecklistMemberOverride(
      {required this.templateId, required this.type});

  @override
  final String templateId;
  @override
  final ChecklistOverrideType type;

  /// Create a copy of ChecklistMemberOverride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistMemberOverrideCopyWith<_ChecklistMemberOverride> get copyWith =>
      __$ChecklistMemberOverrideCopyWithImpl<_ChecklistMemberOverride>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistMemberOverride &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, templateId, type);

  @override
  String toString() {
    return 'ChecklistMemberOverride(templateId: $templateId, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistMemberOverrideCopyWith<$Res>
    implements $ChecklistMemberOverrideCopyWith<$Res> {
  factory _$ChecklistMemberOverrideCopyWith(_ChecklistMemberOverride value,
          $Res Function(_ChecklistMemberOverride) _then) =
      __$ChecklistMemberOverrideCopyWithImpl;
  @override
  @useResult
  $Res call({String templateId, ChecklistOverrideType type});
}

/// @nodoc
class __$ChecklistMemberOverrideCopyWithImpl<$Res>
    implements _$ChecklistMemberOverrideCopyWith<$Res> {
  __$ChecklistMemberOverrideCopyWithImpl(this._self, this._then);

  final _ChecklistMemberOverride _self;
  final $Res Function(_ChecklistMemberOverride) _then;

  /// Create a copy of ChecklistMemberOverride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? templateId = null,
    Object? type = null,
  }) {
    return _then(_ChecklistMemberOverride(
      templateId: null == templateId
          ? _self.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistOverrideType,
    ));
  }
}

/// @nodoc
mixin _$MemberChecklistOverride {
  String get templateId;
  String get templateName;
  ChecklistType get templateType;
  ChecklistOverrideType get type;

  /// Create a copy of MemberChecklistOverride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberChecklistOverrideCopyWith<MemberChecklistOverride> get copyWith =>
      _$MemberChecklistOverrideCopyWithImpl<MemberChecklistOverride>(
          this as MemberChecklistOverride, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberChecklistOverride &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.templateType, templateType) ||
                other.templateType == templateType) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, templateId, templateName, templateType, type);

  @override
  String toString() {
    return 'MemberChecklistOverride(templateId: $templateId, templateName: $templateName, templateType: $templateType, type: $type)';
  }
}

/// @nodoc
abstract mixin class $MemberChecklistOverrideCopyWith<$Res> {
  factory $MemberChecklistOverrideCopyWith(MemberChecklistOverride value,
          $Res Function(MemberChecklistOverride) _then) =
      _$MemberChecklistOverrideCopyWithImpl;
  @useResult
  $Res call(
      {String templateId,
      String templateName,
      ChecklistType templateType,
      ChecklistOverrideType type});
}

/// @nodoc
class _$MemberChecklistOverrideCopyWithImpl<$Res>
    implements $MemberChecklistOverrideCopyWith<$Res> {
  _$MemberChecklistOverrideCopyWithImpl(this._self, this._then);

  final MemberChecklistOverride _self;
  final $Res Function(MemberChecklistOverride) _then;

  /// Create a copy of MemberChecklistOverride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? templateType = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      templateId: null == templateId
          ? _self.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: null == templateName
          ? _self.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      templateType: null == templateType
          ? _self.templateType
          : templateType // ignore: cast_nullable_to_non_nullable
              as ChecklistType,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistOverrideType,
    ));
  }
}

/// Adds pattern-matching-related methods to [MemberChecklistOverride].
extension MemberChecklistOverridePatterns on MemberChecklistOverride {
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
    TResult Function(_MemberChecklistOverride value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberChecklistOverride() when $default != null:
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
    TResult Function(_MemberChecklistOverride value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberChecklistOverride():
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
    TResult? Function(_MemberChecklistOverride value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberChecklistOverride() when $default != null:
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
    TResult Function(String templateId, String templateName,
            ChecklistType templateType, ChecklistOverrideType type)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberChecklistOverride() when $default != null:
        return $default(_that.templateId, _that.templateName,
            _that.templateType, _that.type);
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
    TResult Function(String templateId, String templateName,
            ChecklistType templateType, ChecklistOverrideType type)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberChecklistOverride():
        return $default(_that.templateId, _that.templateName,
            _that.templateType, _that.type);
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
    TResult? Function(String templateId, String templateName,
            ChecklistType templateType, ChecklistOverrideType type)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberChecklistOverride() when $default != null:
        return $default(_that.templateId, _that.templateName,
            _that.templateType, _that.type);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberChecklistOverride implements MemberChecklistOverride {
  const _MemberChecklistOverride(
      {required this.templateId,
      required this.templateName,
      required this.templateType,
      required this.type});

  @override
  final String templateId;
  @override
  final String templateName;
  @override
  final ChecklistType templateType;
  @override
  final ChecklistOverrideType type;

  /// Create a copy of MemberChecklistOverride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberChecklistOverrideCopyWith<_MemberChecklistOverride> get copyWith =>
      __$MemberChecklistOverrideCopyWithImpl<_MemberChecklistOverride>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberChecklistOverride &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.templateName, templateName) ||
                other.templateName == templateName) &&
            (identical(other.templateType, templateType) ||
                other.templateType == templateType) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, templateId, templateName, templateType, type);

  @override
  String toString() {
    return 'MemberChecklistOverride(templateId: $templateId, templateName: $templateName, templateType: $templateType, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$MemberChecklistOverrideCopyWith<$Res>
    implements $MemberChecklistOverrideCopyWith<$Res> {
  factory _$MemberChecklistOverrideCopyWith(_MemberChecklistOverride value,
          $Res Function(_MemberChecklistOverride) _then) =
      __$MemberChecklistOverrideCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String templateId,
      String templateName,
      ChecklistType templateType,
      ChecklistOverrideType type});
}

/// @nodoc
class __$MemberChecklistOverrideCopyWithImpl<$Res>
    implements _$MemberChecklistOverrideCopyWith<$Res> {
  __$MemberChecklistOverrideCopyWithImpl(this._self, this._then);

  final _MemberChecklistOverride _self;
  final $Res Function(_MemberChecklistOverride) _then;

  /// Create a copy of MemberChecklistOverride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? templateId = null,
    Object? templateName = null,
    Object? templateType = null,
    Object? type = null,
  }) {
    return _then(_MemberChecklistOverride(
      templateId: null == templateId
          ? _self.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String,
      templateName: null == templateName
          ? _self.templateName
          : templateName // ignore: cast_nullable_to_non_nullable
              as String,
      templateType: null == templateType
          ? _self.templateType
          : templateType // ignore: cast_nullable_to_non_nullable
              as ChecklistType,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecklistOverrideType,
    ));
  }
}

// dart format on
