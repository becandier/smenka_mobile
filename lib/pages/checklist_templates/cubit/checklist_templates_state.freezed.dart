// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_templates_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistTemplatesState {
  SectionData<List<ChecklistTemplate>> get templates;
  bool get includeArchived;
  FeatureStatus get actionStatus;
  String? get actionError;

  /// Create a copy of ChecklistTemplatesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChecklistTemplatesStateCopyWith<ChecklistTemplatesState> get copyWith =>
      _$ChecklistTemplatesStateCopyWithImpl<ChecklistTemplatesState>(
          this as ChecklistTemplatesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChecklistTemplatesState &&
            (identical(other.templates, templates) ||
                other.templates == templates) &&
            (identical(other.includeArchived, includeArchived) ||
                other.includeArchived == includeArchived) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, templates, includeArchived, actionStatus, actionError);

  @override
  String toString() {
    return 'ChecklistTemplatesState(templates: $templates, includeArchived: $includeArchived, actionStatus: $actionStatus, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $ChecklistTemplatesStateCopyWith<$Res> {
  factory $ChecklistTemplatesStateCopyWith(ChecklistTemplatesState value,
          $Res Function(ChecklistTemplatesState) _then) =
      _$ChecklistTemplatesStateCopyWithImpl;
  @useResult
  $Res call(
      {SectionData<List<ChecklistTemplate>> templates,
      bool includeArchived,
      FeatureStatus actionStatus,
      String? actionError});

  $SectionDataCopyWith<List<ChecklistTemplate>, $Res> get templates;
}

/// @nodoc
class _$ChecklistTemplatesStateCopyWithImpl<$Res>
    implements $ChecklistTemplatesStateCopyWith<$Res> {
  _$ChecklistTemplatesStateCopyWithImpl(this._self, this._then);

  final ChecklistTemplatesState _self;
  final $Res Function(ChecklistTemplatesState) _then;

  /// Create a copy of ChecklistTemplatesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templates = null,
    Object? includeArchived = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
  }) {
    return _then(_self.copyWith(
      templates: null == templates
          ? _self.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as SectionData<List<ChecklistTemplate>>,
      includeArchived: null == includeArchived
          ? _self.includeArchived
          : includeArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChecklistTemplatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<ChecklistTemplate>, $Res> get templates {
    return $SectionDataCopyWith<List<ChecklistTemplate>, $Res>(_self.templates,
        (value) {
      return _then(_self.copyWith(templates: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChecklistTemplatesState].
extension ChecklistTemplatesStatePatterns on ChecklistTemplatesState {
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
    TResult Function(_ChecklistTemplatesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplatesState() when $default != null:
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
    TResult Function(_ChecklistTemplatesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplatesState():
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
    TResult? Function(_ChecklistTemplatesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplatesState() when $default != null:
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
            SectionData<List<ChecklistTemplate>> templates,
            bool includeArchived,
            FeatureStatus actionStatus,
            String? actionError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplatesState() when $default != null:
        return $default(_that.templates, _that.includeArchived,
            _that.actionStatus, _that.actionError);
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
            SectionData<List<ChecklistTemplate>> templates,
            bool includeArchived,
            FeatureStatus actionStatus,
            String? actionError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplatesState():
        return $default(_that.templates, _that.includeArchived,
            _that.actionStatus, _that.actionError);
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
            SectionData<List<ChecklistTemplate>> templates,
            bool includeArchived,
            FeatureStatus actionStatus,
            String? actionError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChecklistTemplatesState() when $default != null:
        return $default(_that.templates, _that.includeArchived,
            _that.actionStatus, _that.actionError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChecklistTemplatesState implements ChecklistTemplatesState {
  const _ChecklistTemplatesState(
      {this.templates = const SectionData<List<ChecklistTemplate>>(),
      this.includeArchived = false,
      this.actionStatus = FeatureStatus.initial,
      this.actionError});

  @override
  @JsonKey()
  final SectionData<List<ChecklistTemplate>> templates;
  @override
  @JsonKey()
  final bool includeArchived;
  @override
  @JsonKey()
  final FeatureStatus actionStatus;
  @override
  final String? actionError;

  /// Create a copy of ChecklistTemplatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChecklistTemplatesStateCopyWith<_ChecklistTemplatesState> get copyWith =>
      __$ChecklistTemplatesStateCopyWithImpl<_ChecklistTemplatesState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChecklistTemplatesState &&
            (identical(other.templates, templates) ||
                other.templates == templates) &&
            (identical(other.includeArchived, includeArchived) ||
                other.includeArchived == includeArchived) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, templates, includeArchived, actionStatus, actionError);

  @override
  String toString() {
    return 'ChecklistTemplatesState(templates: $templates, includeArchived: $includeArchived, actionStatus: $actionStatus, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$ChecklistTemplatesStateCopyWith<$Res>
    implements $ChecklistTemplatesStateCopyWith<$Res> {
  factory _$ChecklistTemplatesStateCopyWith(_ChecklistTemplatesState value,
          $Res Function(_ChecklistTemplatesState) _then) =
      __$ChecklistTemplatesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SectionData<List<ChecklistTemplate>> templates,
      bool includeArchived,
      FeatureStatus actionStatus,
      String? actionError});

  @override
  $SectionDataCopyWith<List<ChecklistTemplate>, $Res> get templates;
}

/// @nodoc
class __$ChecklistTemplatesStateCopyWithImpl<$Res>
    implements _$ChecklistTemplatesStateCopyWith<$Res> {
  __$ChecklistTemplatesStateCopyWithImpl(this._self, this._then);

  final _ChecklistTemplatesState _self;
  final $Res Function(_ChecklistTemplatesState) _then;

  /// Create a copy of ChecklistTemplatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? templates = null,
    Object? includeArchived = null,
    Object? actionStatus = null,
    Object? actionError = freezed,
  }) {
    return _then(_ChecklistTemplatesState(
      templates: null == templates
          ? _self.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as SectionData<List<ChecklistTemplate>>,
      includeArchived: null == includeArchived
          ? _self.includeArchived
          : includeArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      actionStatus: null == actionStatus
          ? _self.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      actionError: freezed == actionError
          ? _self.actionError
          : actionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ChecklistTemplatesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SectionDataCopyWith<List<ChecklistTemplate>, $Res> get templates {
    return $SectionDataCopyWith<List<ChecklistTemplate>, $Res>(_self.templates,
        (value) {
      return _then(_self.copyWith(templates: value));
    });
  }
}

// dart format on
