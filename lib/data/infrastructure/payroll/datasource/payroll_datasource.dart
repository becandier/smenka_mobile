import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';

/// HTTP-вызовы фичи payroll: ставки участников, отчёт по зарплате,
/// личный заработок. Конверт `{data}` уже развёрнут интерсептором.
class PayrollDataSource {
  PayrollDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// История ставок участника (`effective_from DESC`, без пагинации).
  Future<List<RateDto>> getRates(String orgId, String memberId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/members/$memberId/rates',
    );
    final items = response.data!['items'] as List;
    return items
        .map((item) => RateDto.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Добавить ставку (новая строка истории).
  Future<RateDto> createRate(
    String orgId,
    String memberId, {
    required int rateAmountMinor,
    required String rateType,
    required DateTime effectiveFrom,
    String? note,
  }) async {
    final body = <String, dynamic>{
      'rate_amount_minor': rateAmountMinor,
      'rate_type': rateType,
      'effective_from': effectiveFrom.toIso8601String(),
    };
    if (note != null) body['note'] = note;

    final response = await _dio.post<Map<String, dynamic>>(
      '/organizations/$orgId/members/$memberId/rates',
      data: body,
    );
    return RateDto.fromJson(response.data!);
  }

  /// Исправить запись истории (поля опциональны).
  /// `note` отправляется ВСЕГДА (явный null очищает комментарий) —
  /// форма редактирования шлёт полное состояние записи.
  Future<RateDto> updateRate(
    String orgId,
    String memberId,
    String rateId, {
    int? rateAmountMinor,
    String? rateType,
    DateTime? effectiveFrom,
    String? note,
  }) async {
    final body = <String, dynamic>{'note': note};
    if (rateAmountMinor != null) body['rate_amount_minor'] = rateAmountMinor;
    if (rateType != null) body['rate_type'] = rateType;
    if (effectiveFrom != null) {
      body['effective_from'] = effectiveFrom.toIso8601String();
    }

    final response = await _dio.patch<Map<String, dynamic>>(
      '/organizations/$orgId/members/$memberId/rates/$rateId',
      data: body,
    );
    return RateDto.fromJson(response.data!);
  }

  /// Удалить запись истории.
  Future<void> deleteRate(String orgId, String memberId, String rateId) async {
    await _dio.delete<Map<String, dynamic>>(
      '/organizations/$orgId/members/$memberId/rates/$rateId',
    );
  }

  /// Отчёт «кому сколько заплатить» за период.
  Future<PayrollDto> getPayroll(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/payroll',
      queryParameters: _periodQuery(dateFrom, dateTo),
    );
    return PayrollDto.fromJson(response.data!);
  }

  /// Свой заработок за период + текущая ставка.
  Future<MyEarningsDto> getMyEarnings(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/my-earnings',
      queryParameters: _periodQuery(dateFrom, dateTo),
    );
    return MyEarningsDto.fromJson(response.data!);
  }

  Map<String, dynamic> _periodQuery(DateTime? dateFrom, DateTime? dateTo) {
    final query = <String, dynamic>{};
    if (dateFrom != null) query['date_from'] = dateFrom.toIso8601String();
    if (dateTo != null) query['date_to'] = dateTo.toIso8601String();
    return query;
  }
}
