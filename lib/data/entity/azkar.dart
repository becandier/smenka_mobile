import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:templatecmd/data/api/models/azkar/azkar.dart';

part 'azkar.freezed.dart';

@freezed
abstract class AzkarE with _$AzkarE {
  const factory AzkarE({
    required int id,
    required String text,
    String? description,
  }) = _AzkarE;

  factory AzkarE.fromModel(AzkarM model) {
    return AzkarE(
      id: model.id ?? 0,
      text: model.text ?? '',
      description: (model.translations ?? []).isEmpty
          ? null
          : model.translations?.first.text,
    );
  }
}
