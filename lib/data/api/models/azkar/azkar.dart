import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:templatecmd/data/api/models/_models.dart';

part 'azkar.g.dart';
part 'azkar.freezed.dart';

@freezed
abstract class AzkarM with _$AzkarM {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory AzkarM({
    int? id,
    String? text,
    List<TranslationM>? translations,
  }) = _AzkarM;

  factory AzkarM.fromJson(Map<String, Object?> json) => _$AzkarMFromJson(json);
}
