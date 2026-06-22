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

  /// Отчёт «кому сколько заплатить» за период.
  ///
  /// [includePenalties] (фича fines) → query `include_penalties`; на бэке
  /// default `true`. При `false` поля штрафов в ответе обнулены, `net = gross`.
  Future<PayrollDto> getPayroll(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    bool? includePenalties,
  }) async {
    final query = _periodQuery(dateFrom, dateTo);
    if (includePenalties != null) {
      query['include_penalties'] = includePenalties;
    }
    final response = await _dio.get<Map<String, dynamic>>(
      '/organizations/$orgId/payroll',
      queryParameters: query,
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
