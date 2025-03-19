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
mixin _$AzkarM {
  int? get id;
  String? get text;
  List<TranslationM>? get translations;

  /// Create a copy of AzkarM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AzkarMCopyWith<AzkarM> get copyWith =>
      _$AzkarMCopyWithImpl<AzkarM>(this as AzkarM, _$identity);

  /// Serializes this AzkarM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AzkarM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other.translations, translations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, const DeepCollectionEquality().hash(translations));

  @override
  String toString() {
    return 'AzkarM(id: $id, text: $text, translations: $translations)';
  }
}

/// @nodoc
abstract mixin class $AzkarMCopyWith<$Res> {
  factory $AzkarMCopyWith(AzkarM value, $Res Function(AzkarM) _then) =
      _$AzkarMCopyWithImpl;
  @useResult
  $Res call({int? id, String? text, List<TranslationM>? translations});
}

/// @nodoc
class _$AzkarMCopyWithImpl<$Res> implements $AzkarMCopyWith<$Res> {
  _$AzkarMCopyWithImpl(this._self, this._then);

  final AzkarM _self;
  final $Res Function(AzkarM) _then;

  /// Create a copy of AzkarM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? translations = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      translations: freezed == translations
          ? _self.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<TranslationM>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AzkarM implements AzkarM {
  _AzkarM({this.id, this.text, final List<TranslationM>? translations})
      : _translations = translations;
  factory _AzkarM.fromJson(Map<String, dynamic> json) => _$AzkarMFromJson(json);

  @override
  final int? id;
  @override
  final String? text;
  final List<TranslationM>? _translations;
  @override
  List<TranslationM>? get translations {
    final value = _translations;
    if (value == null) return null;
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of AzkarM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AzkarMCopyWith<_AzkarM> get copyWith =>
      __$AzkarMCopyWithImpl<_AzkarM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AzkarMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AzkarM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text,
      const DeepCollectionEquality().hash(_translations));

  @override
  String toString() {
    return 'AzkarM(id: $id, text: $text, translations: $translations)';
  }
}

/// @nodoc
abstract mixin class _$AzkarMCopyWith<$Res> implements $AzkarMCopyWith<$Res> {
  factory _$AzkarMCopyWith(_AzkarM value, $Res Function(_AzkarM) _then) =
      __$AzkarMCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? text, List<TranslationM>? translations});
}

/// @nodoc
class __$AzkarMCopyWithImpl<$Res> implements _$AzkarMCopyWith<$Res> {
  __$AzkarMCopyWithImpl(this._self, this._then);

  final _AzkarM _self;
  final $Res Function(_AzkarM) _then;

  /// Create a copy of AzkarM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? translations = freezed,
  }) {
    return _then(_AzkarM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      translations: freezed == translations
          ? _self._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<TranslationM>?,
    ));
  }
}

// dart format on
