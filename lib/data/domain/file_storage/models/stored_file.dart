import 'package:freezed_annotation/freezed_annotation.dart';

part 'stored_file.freezed.dart';

/// Категория файла в хранилище (`file_storage`).
///
/// Определяет политику бэка (лимит размера, разрешённые типы, права) и префикс
/// ключа в бакете. На клиенте важно только строковое [value] — оно уходит в
/// поле `category` при загрузке и приходит обратно в метаданных.
enum FileCategory {
  checklistPhoto('checklist_photo'),
  knowledgeBase('knowledge_base'),
  avatar('avatar'),
  other('other');

  const FileCategory(this.value);

  /// Строковое значение для контракта API (`FileCategory` на бэке).
  final String value;

  /// Парсит значение из ответа бэка; незнакомое → [FileCategory.other].
  static FileCategory fromValue(String raw) => values.firstWhere(
    (category) => category.value == raw,
    orElse: () => FileCategory.other,
  );
}

/// Метаданные файла из единого хранилища + свежий presigned GET URL.
///
/// Хранить у себя нужно [id] (стабильный), а не [url]: presigned-ссылка живёт
/// недолго. Протухший [url] обновляется через `FilesRepository.getFile`.
@freezed
abstract class StoredFile with _$StoredFile {
  const factory StoredFile({
    required String id,
    required FileCategory category,
    required String originalFilename,
    required String contentType,
    required int sizeBytes,

    /// Presigned GET URL с коротким TTL; открывается напрямую с устройства.
    required String url,

    /// Момент протухания [url] (UTC).
    required DateTime urlExpiresAt,
    required DateTime createdAt,
  }) = _StoredFile;
}
