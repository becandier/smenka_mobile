import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/adjustment/datasource/dto/_dto.dart';

/// HTTP-вызовы фичи `manual_time_entry` (ручные начисления): своя лента
/// сотрудника. CRUD начислений — только веб-админка, вне scope мобилки.
/// Конверт `{data}` уже развёрнут интерсептором.
class AdjustmentDataSource {
  AdjustmentDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Свои начисления за период (offset-пагинация).
  Future<PaginatedMyAdjustmentsDto> getMyAdjustments(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) async {
    final query = <String, dynamic>{'limit': limit, 'offset': offset};
    if (dateFrom != null) query['date_from'] = dateFrom.toIso8601String();
    if (dateTo != null) query['date_to'] = dateTo.toIso8601String();

    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/my-adjustments',
      queryParameters: query,
    );
    return PaginatedMyAdjustmentsDto.fromJson(response.data!);
  }
}
