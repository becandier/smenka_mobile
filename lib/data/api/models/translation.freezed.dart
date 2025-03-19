// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationM {
  int? get id;
  String? get name;
  String? get text;
  String? get title;
  String? get description;
  String? get translation;
  String? get transliteration;
  int? get count;

  /// Create a copy of TranslationM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TranslationMCopyWith<TranslationM> get copyWith =>
      _$TranslationMCopyWithImpl<TranslationM>(
          this as TranslationM, _$identity);

  /// Serializes this TranslationM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TranslationM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.transliteration, transliteration) ||
                other.transliteration == transliteration) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, text, title,
      description, translation, transliteration, count);

  @override
  String toString() {
    return 'TranslationM(id: $id, name: $name, text: $text, title: $title, description: $description, translation: $translation, transliteration: $transliteration, count: $count)';
  }
}

/// @nodoc
abstract mixin class $TranslationMCopyWith<$Res> {
  factory $TranslationMCopyWith(
          TranslationM value, $Res Function(TranslationM) _then) =
      _$TranslationMCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? text,
      String? title,
      String? description,
      String? translation,
      String? transliteration,
      int? count});
}

/// @nodoc
class _$TranslationMCopyWithImpl<$Res> implements $TranslationMCopyWith<$Res> {
  _$TranslationMCopyWithImpl(this._self, this._then);

  final TranslationM _self;
  final $Res Function(TranslationM) _then;

  /// Create a copy of TranslationM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? text = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? translation = freezed,
    Object? transliteration = freezed,
    Object? count = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
      transliteration: freezed == transliteration
          ? _self.transliteration
          : transliteration // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TranslationM implements TranslationM {
  _TranslationM(
      {this.id,
      this.name,
      this.text,
      this.title,
      this.description,
      this.translation,
      this.transliteration,
      this.count});
  factory _TranslationM.fromJson(Map<String, dynamic> json) =>
      _$TranslationMFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? text;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? translation;
  @override
  final String? transliteration;
  @override
  final int? count;

  /// Create a copy of TranslationM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TranslationMCopyWith<_TranslationM> get copyWith =>
      __$TranslationMCopyWithImpl<_TranslationM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TranslationMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TranslationM &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.transliteration, transliteration) ||
                other.transliteration == transliteration) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, text, title,
      description, translation, transliteration, count);

  @override
  String toString() {
    return 'TranslationM(id: $id, name: $name, text: $text, title: $title, description: $description, translation: $translation, transliteration: $transliteration, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$TranslationMCopyWith<$Res>
    implements $TranslationMCopyWith<$Res> {
  factory _$TranslationMCopyWith(
          _TranslationM value, $Res Function(_TranslationM) _then) =
      __$TranslationMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? text,
      String? title,
      String? description,
      String? translation,
      String? transliteration,
      int? count});
}

/// @nodoc
class __$TranslationMCopyWithImpl<$Res>
    implements _$TranslationMCopyWith<$Res> {
  __$TranslationMCopyWithImpl(this._self, this._then);

  final _TranslationM _self;
  final $Res Function(_TranslationM) _then;

  /// Create a copy of TranslationM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? text = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? translation = freezed,
    Object? transliteration = freezed,
    Object? count = freezed,
  }) {
    return _then(_TranslationM(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      translation: freezed == translation
          ? _self.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
      transliteration: freezed == transliteration
          ? _self.transliteration
          : transliteration // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
