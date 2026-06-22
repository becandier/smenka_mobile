import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/domain/penalty/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/penalty/datasource/dto/_dto.dart';

/// HTTP-вызовы фичи fines: шаблоны штрафов, CRUD штрафов организации,
/// свои штрафы. Конверт `{data}` уже развёрнут интерсептором.
class PenaltyDataSource {
  PenaltyDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Активные шаблоны штрафов (без пагинации).
  Future<List<PenaltyTemplateDto>> getTemplates(String orgId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/penalty-templates',
    );
    final items = response.data!['items'] as List<dynamic>;
    return items
        .cast<Map<String, dynamic>>()
        .map(PenaltyTemplateDto.fromJson)
        .toList();
  }

  /// Список штрафов организации (фильтры + offset-пагинация).
  Future<PaginatedPenaltiesDto> getPenalties(
    String orgId, {
    String? memberId,
    String? shiftId,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  }) async {
    final query = <String, dynamic>{'limit': limit, 'offset': offset};
    if (memberId != null) query['member_id'] = memberId;
    if (shiftId != null) query['shift_id'] = shiftId;
    if (dateFrom != null) query['date_from'] = dateFrom.toIso8601String();
    if (dateTo != null) query['date_to'] = dateTo.toIso8601String();

    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/penalties',
      queryParameters: query,
    );
    return PaginatedPenaltiesDto.fromJson(response.data!);
  }

  /// Деталь штрафа.
  Future<PenaltyDto> getPenalty(String orgId, String penaltyId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/penalties/$penaltyId',
    );
    return PenaltyDto.fromJson(response.data!);
  }

  /// Назначить штраф.
  Future<PenaltyDto> createPenalty(
    String orgId,
    CreatePenaltyInput input,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/penalties',
      data: _createBody(input),
    );
    return PenaltyDto.fromJson(response.data!);
  }

  /// Исправить штраф (в тело уходят только заданные поля).
  Future<PenaltyDto> updatePenalty(
    String orgId,
    String penaltyId,
    UpdatePenaltyInput input,
  ) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/penalties/$penaltyId',
      data: _updateBody(input),
    );
    return PenaltyDto.fromJson(response.data!);
  }

  /// Снять штраф (soft-delete на бэке).
  Future<void> deletePenalty(String orgId, String penaltyId) async {
    await _dio.delete<void>('/organizations/$orgId/penalties/$penaltyId');
  }

  /// Свои штрафы за период (offset-пагинация).
  Future<PaginatedMyPenaltiesDto> getMyPenalties(
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
      '/organizations/$orgId/my-penalties',
      queryParameters: query,
    );
    return PaginatedMyPenaltiesDto.fromJson(response.data!);
  }

  Map<String, dynamic> _createBody(CreatePenaltyInput input) {
    final body = <String, dynamic>{
      'member_id': input.memberId,
      'reason': input.reason,
      'amount_minor': input.amountMinor,
    };
    final templateId = input.templateId;
    if (templateId != null) body['template_id'] = templateId;
    final currency = input.currency;
    if (currency != null) body['currency'] = currency;
    final shiftId = input.shiftId;
    if (shiftId != null) body['shift_id'] = shiftId;
    final occurredAt = input.occurredAt;
    if (occurredAt != null) body['occurred_at'] = occurredAt.toIso8601String();
    final comment = input.comment;
    if (comment != null) body['comment'] = comment;
    return body;
  }

  Map<String, dynamic> _updateBody(UpdatePenaltyInput input) {
    final body = <String, dynamic>{};
    final reason = input.reason;
    if (reason != null) body['reason'] = reason;
    final amountMinor = input.amountMinor;
    if (amountMinor != null) body['amount_minor'] = amountMinor;
    final currency = input.currency;
    if (currency != null) body['currency'] = currency;
    final shiftId = input.shiftId;
    if (shiftId != null) body['shift_id'] = shiftId;
    final occurredAt = input.occurredAt;
    if (occurredAt != null) body['occurred_at'] = occurredAt.toIso8601String();
    final comment = input.comment;
    if (comment != null) body['comment'] = comment;
    return body;
  }
}
