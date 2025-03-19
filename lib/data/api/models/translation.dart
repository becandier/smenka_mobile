import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation.g.dart';
part 'translation.freezed.dart';

@freezed
abstract class TranslationM with _$TranslationM {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory TranslationM({
    int? id,
    String? name,
    String? text,
    String? title,
    String? description,
    String? translation,
    String? transliteration,
    int? count,
  }) = _TranslationM;

  factory TranslationM.fromJson(Map<String, Object?> json) =>
      _$TranslationMFromJson(json);
}
