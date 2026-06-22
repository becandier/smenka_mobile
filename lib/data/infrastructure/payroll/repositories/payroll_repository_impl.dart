import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/payroll_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/payroll_mapper.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/rate_mapper.dart';

class PayrollRepositoryImpl with TaskHandler implements PayrollRepository {
  PayrollRepositoryImpl({required PayrollDataSource dataSource})
    : _dataSource = dataSource;

  final PayrollDataSource _dataSource;

  @override
  Future<Task<List<Rate>>> getRates(String orgId, String memberId) {
    return execute(() async {
      final dtos = await _dataSource.getRates(orgId, memberId);
      // Записи с неизвестным rate_type пропускаем (forward-совместимость).
      return dtos.map((dto) => dto.toDomainOrNull()).whereType<Rate>().toList();
    });
  }

  @override
  Future<Task<Payroll>> getPayroll(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    bool? includePenalties,
  }) {
    return execute(() async {
      final dto = await _dataSource.getPayroll(
        orgId,
        dateFrom: dateFrom,
        dateTo: dateTo,
        includePenalties: includePenalties,
      );
      return dto.toDomain();
    });
  }

  @override
  Future<Task<MyEarnings>> getMyEarnings(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return execute(() async {
      final dto = await _dataSource.getMyEarnings(
        orgId,
        dateFrom: dateFrom,
        dateTo: dateTo,
      );
      return dto.toDomain();
    });
  }
}
