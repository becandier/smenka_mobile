import 'dart:typed_data';

import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/file_storage/models/_models.dart';

/// Прогресс отправки файла: [sent] из [total] байт (signature совпадает с
/// `ProgressCallback` из Dio, но домен не зависит от транспортного слоя).
typedef UploadProgressCallback = void Function(int sent, int total);

/// Единый клиент файлового хранилища (`file_storage`).
///
/// Платформенный репозиторий: сам экранов не имеет, им пользуются фичи-
/// потребители (фото чек-листов, база знаний, аватары) — чтобы загрузка и
/// обновление ссылок были одинаковыми. Загрузка идёт через бэкенд (multipart),
/// показ — по presigned GET URL, который отдаёт бэк.
abstract class FilesRepository {
  /// Загружает файл в хранилище и возвращает его метаданные со свежим `url`.
  ///
  /// [organizationId] обязателен для org-категорий (`checklist_photo`,
  /// `knowledge_base`); для персональных (`avatar`) — не передаётся.
  /// [onSendProgress] позволяет потребителю показать индикатор отправки.
  Future<Task<StoredFile>> uploadFile({
    required Uint8List bytes,
    required String filename,
    required FileCategory category,
    String? organizationId,
    UploadProgressCallback? onSendProgress,
  });

  /// Возвращает метаданные файла со свежим presigned `url`.
  ///
  /// Нужен, когда сохранённый URL протух (storage отдал 403/404) — клиент
  /// запрашивает новую ссылку по стабильному [fileId].
  Future<Task<StoredFile>> getFile(String fileId);
}
