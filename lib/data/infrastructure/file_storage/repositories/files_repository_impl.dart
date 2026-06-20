import 'dart:typed_data';

import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/infrastructure/file_storage/datasource/files_datasource.dart';

class FilesRepositoryImpl with TaskHandler implements FilesRepository {
  FilesRepositoryImpl({required FilesDataSource dataSource})
    : _dataSource = dataSource;

  final FilesDataSource _dataSource;

  @override
  Future<Task<StoredFile>> uploadFile({
    required Uint8List bytes,
    required String filename,
    required FileCategory category,
    String? organizationId,
    UploadProgressCallback? onSendProgress,
  }) {
    return execute(
      () => _dataSource.uploadFile(
        bytes: bytes,
        filename: filename,
        category: category,
        organizationId: organizationId,
        onSendProgress: onSendProgress,
      ),
    );
  }

  @override
  Future<Task<StoredFile>> getFile(String fileId) {
    return execute(() => _dataSource.getFile(fileId));
  }
}
