// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslationM _$TranslationMFromJson(Map<String, dynamic> json) =>
    _TranslationM(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      text: json['text'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      translation: json['translation'] as String?,
      transliteration: json['transliteration'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TranslationMToJson(_TranslationM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'title': instance.title,
      'description': instance.description,
      'translation': instance.translation,
      'transliteration': instance.transliteration,
      'count': instance.count,
    };
