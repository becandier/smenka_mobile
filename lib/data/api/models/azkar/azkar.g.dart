// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AzkarM _$AzkarMFromJson(Map<String, dynamic> json) => _AzkarM(
      id: (json['id'] as num?)?.toInt(),
      text: json['text'] as String?,
      translations: (json['translations'] as List<dynamic>?)
          ?.map((e) => TranslationM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AzkarMToJson(_AzkarM instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'translations': instance.translations,
    };
