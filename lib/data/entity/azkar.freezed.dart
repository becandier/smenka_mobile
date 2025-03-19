// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'azkar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AzkarE {
  int get id;
  String get text;
  String? get description;

  /// Create a copy of AzkarE
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AzkarECopyWith<AzkarE> get copyWith =>
      _$AzkarECopyWithImpl<AzkarE>(this as AzkarE, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AzkarE &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, description);

  @override
  String toString() {
    return 'AzkarE(id: $id, text: $text, description: $description)';
  }
}

/// @nodoc
abstract mixin class $AzkarECopyWith<$Res> {
  factory $AzkarECopyWith(AzkarE value, $Res Function(AzkarE) _then) =
      _$AzkarECopyWithImpl;
  @useResult
  $Res call({int id, String text, String? description});
}

/// @nodoc
class _$AzkarECopyWithImpl<$Res> implements $AzkarECopyWith<$Res> {
  _$AzkarECopyWithImpl(this._self, this._then);

  final AzkarE _self;
  final $Res Function(AzkarE) _then;

  /// Create a copy of AzkarE
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _AzkarE implements AzkarE {
  const _AzkarE({required this.id, required this.text, this.description});

  @override
  final int id;
  @override
  final String text;
  @override
  final String? description;

  /// Create a copy of AzkarE
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AzkarECopyWith<_AzkarE> get copyWith =>
      __$AzkarECopyWithImpl<_AzkarE>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AzkarE &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, description);

  @override
  String toString() {
    return 'AzkarE(id: $id, text: $text, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$AzkarECopyWith<$Res> implements $AzkarECopyWith<$Res> {
  factory _$AzkarECopyWith(_AzkarE value, $Res Function(_AzkarE) _then) =
      __$AzkarECopyWithImpl;
  @override
  @useResult
  $Res call({int id, String text, String? description});
}

/// @nodoc
class __$AzkarECopyWithImpl<$Res> implements _$AzkarECopyWith<$Res> {
  __$AzkarECopyWithImpl(this._self, this._then);

  final _AzkarE _self;
  final $Res Function(_AzkarE) _then;

  /// Create a copy of AzkarE
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? description = freezed,
  }) {
    return _then(_AzkarE(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
