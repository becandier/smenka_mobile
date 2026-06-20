import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';

/// Источник данных файлового хранилища: multipart-загрузка и получение свежего
/// presigned URL. Конверт `{data, error}` уже развёрнут интерсептором Dio, так
/// что [Response.data] здесь — это внутренний объект `data`.
class FilesDataSource {
  FilesDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<StoredFile> uploadFile({
    required Uint8List bytes,
    required String filename,
    required FileCategory category,
    String? organizationId,
    UploadProgressCallback? onSendProgress,
  }) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(bytes, filename: filename),
      'category': category.value,
      if (organizationId != null) 'organization_id': organizationId,
    });

    final response = await _dio.post<Map<String, dynamic>>(
      '/files',
      data: formData,
      onSendProgress: onSendProgress,
    );

    return _fromJson(_requireData(response.data));
  }

  Future<StoredFile> getFile(String fileId) async {
    final response = await _dio.get<Map<String, dynamic>>('/files/$fileId');
    return _fromJson(_requireData(response.data));
  }

  Map<String, dynamic> _requireData(Map<String, dynamic>? data) {
    if (data == null) {
      throw const FormatException('Пустой ответ хранилища файлов');
    }
    return data;
  }

  StoredFile _fromJson(Map<String, dynamic> json) => StoredFile(
    id: json['id'] as String,
    category: FileCategory.fromValue(json['category'] as String),
    originalFilename: json['original_filename'] as String,
    contentType: json['content_type'] as String,
    sizeBytes: json['size_bytes'] as int,
    url: json['url'] as String,
    urlExpiresAt: DateTime.parse(json['url_expires_at'] as String).toUtc(),
    createdAt: DateTime.parse(json['created_at'] as String).toUtc(),
  );
}
