// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddEditLocationState {
  String get name;
  double get latitude;
  double get longitude;
  int get radiusMeters;
  bool get isEdit;
  String? get locationId;
  FeatureStatus get saveStatus;
  String? get saveError;

  /// Create a copy of AddEditLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddEditLocationStateCopyWith<AddEditLocationState> get copyWith =>
      _$AddEditLocationStateCopyWithImpl<AddEditLocationState>(
          this as AddEditLocationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddEditLocationState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radiusMeters, radiusMeters) ||
                other.radiusMeters == radiusMeters) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.saveStatus, saveStatus) ||
                other.saveStatus == saveStatus) &&
            (identical(other.saveError, saveError) ||
                other.saveError == saveError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude,
      radiusMeters, isEdit, locationId, saveStatus, saveError);

  @override
  String toString() {
    return 'AddEditLocationState(name: $name, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, isEdit: $isEdit, locationId: $locationId, saveStatus: $saveStatus, saveError: $saveError)';
  }
}

/// @nodoc
abstract mixin class $AddEditLocationStateCopyWith<$Res> {
  factory $AddEditLocationStateCopyWith(AddEditLocationState value,
          $Res Function(AddEditLocationState) _then) =
      _$AddEditLocationStateCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      double latitude,
      double longitude,
      int radiusMeters,
      bool isEdit,
      String? locationId,
      FeatureStatus saveStatus,
      String? saveError});
}

/// @nodoc
class _$AddEditLocationStateCopyWithImpl<$Res>
    implements $AddEditLocationStateCopyWith<$Res> {
  _$AddEditLocationStateCopyWithImpl(this._self, this._then);

  final AddEditLocationState _self;
  final $Res Function(AddEditLocationState) _then;

  /// Create a copy of AddEditLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radiusMeters = null,
    Object? isEdit = null,
    Object? locationId = freezed,
    Object? saveStatus = null,
    Object? saveError = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radiusMeters: null == radiusMeters
          ? _self.radiusMeters
          : radiusMeters // ignore: cast_nullable_to_non_nullable
              as int,
      isEdit: null == isEdit
          ? _self.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      saveStatus: null == saveStatus
          ? _self.saveStatus
          : saveStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      saveError: freezed == saveError
          ? _self.saveError
          : saveError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddEditLocationState].
extension AddEditLocationStatePatterns on AddEditLocationState {
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
    TResult Function(_AddEditLocationState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddEditLocationState() when $default != null:
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
    TResult Function(_AddEditLocationState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddEditLocationState():
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
    TResult? Function(_AddEditLocationState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddEditLocationState() when $default != null:
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
            String name,
            double latitude,
            double longitude,
            int radiusMeters,
            bool isEdit,
            String? locationId,
            FeatureStatus saveStatus,
            String? saveError)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddEditLocationState() when $default != null:
        return $default(
            _that.name,
            _that.latitude,
            _that.longitude,
            _that.radiusMeters,
            _that.isEdit,
            _that.locationId,
            _that.saveStatus,
            _that.saveError);
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
            String name,
            double latitude,
            double longitude,
            int radiusMeters,
            bool isEdit,
            String? locationId,
            FeatureStatus saveStatus,
            String? saveError)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddEditLocationState():
        return $default(
            _that.name,
            _that.latitude,
            _that.longitude,
            _that.radiusMeters,
            _that.isEdit,
            _that.locationId,
            _that.saveStatus,
            _that.saveError);
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
            String name,
            double latitude,
            double longitude,
            int radiusMeters,
            bool isEdit,
            String? locationId,
            FeatureStatus saveStatus,
            String? saveError)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddEditLocationState() when $default != null:
        return $default(
            _that.name,
            _that.latitude,
            _that.longitude,
            _that.radiusMeters,
            _that.isEdit,
            _that.locationId,
            _that.saveStatus,
            _that.saveError);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddEditLocationState extends AddEditLocationState {
  const _AddEditLocationState(
      {this.name = '',
      this.latitude = 55.751244,
      this.longitude = 37.618423,
      this.radiusMeters = 100,
      this.isEdit = false,
      this.locationId,
      this.saveStatus = FeatureStatus.initial,
      this.saveError})
      : super._();

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final int radiusMeters;
  @override
  @JsonKey()
  final bool isEdit;
  @override
  final String? locationId;
  @override
  @JsonKey()
  final FeatureStatus saveStatus;
  @override
  final String? saveError;

  /// Create a copy of AddEditLocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddEditLocationStateCopyWith<_AddEditLocationState> get copyWith =>
      __$AddEditLocationStateCopyWithImpl<_AddEditLocationState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddEditLocationState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radiusMeters, radiusMeters) ||
                other.radiusMeters == radiusMeters) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.saveStatus, saveStatus) ||
                other.saveStatus == saveStatus) &&
            (identical(other.saveError, saveError) ||
                other.saveError == saveError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, latitude, longitude,
      radiusMeters, isEdit, locationId, saveStatus, saveError);

  @override
  String toString() {
    return 'AddEditLocationState(name: $name, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters, isEdit: $isEdit, locationId: $locationId, saveStatus: $saveStatus, saveError: $saveError)';
  }
}

/// @nodoc
abstract mixin class _$AddEditLocationStateCopyWith<$Res>
    implements $AddEditLocationStateCopyWith<$Res> {
  factory _$AddEditLocationStateCopyWith(_AddEditLocationState value,
          $Res Function(_AddEditLocationState) _then) =
      __$AddEditLocationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      double latitude,
      double longitude,
      int radiusMeters,
      bool isEdit,
      String? locationId,
      FeatureStatus saveStatus,
      String? saveError});
}

/// @nodoc
class __$AddEditLocationStateCopyWithImpl<$Res>
    implements _$AddEditLocationStateCopyWith<$Res> {
  __$AddEditLocationStateCopyWithImpl(this._self, this._then);

  final _AddEditLocationState _self;
  final $Res Function(_AddEditLocationState) _then;

  /// Create a copy of AddEditLocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radiusMeters = null,
    Object? isEdit = null,
    Object? locationId = freezed,
    Object? saveStatus = null,
    Object? saveError = freezed,
  }) {
    return _then(_AddEditLocationState(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radiusMeters: null == radiusMeters
          ? _self.radiusMeters
          : radiusMeters // ignore: cast_nullable_to_non_nullable
              as int,
      isEdit: null == isEdit
          ? _self.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      saveStatus: null == saveStatus
          ? _self.saveStatus
          : saveStatus // ignore: cast_nullable_to_non_nullable
              as FeatureStatus,
      saveError: freezed == saveError
          ? _self.saveError
          : saveError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
