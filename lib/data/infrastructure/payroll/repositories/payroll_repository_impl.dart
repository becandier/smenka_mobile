import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/payroll_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/payroll_mapper.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/rate_mapper.dart';

class PayrollRepositoryImpl with TaskHandler implements PayrollRepository {
  PayrollRepositoryImpl({required PayrollDataSource dataSource})
      : _dataSource = dataSource;

  final PayrollDataSource _dataSource;

  /// Ответ на нашу же мутацию обязан содержать известный `rate_type`;
  /// иначе это аномалия бэка — уйдёт в TaskFailure через catch в [execute].
  Rate _toDomainStrict(RateDto dto) {
    final rate = dto.toDomainOrNull();
    if (rate == null) {
      throw ArgumentError.value(dto.rateType, 'rate_type', 'Unknown rate type');
    }
    return rate;
  }

  @override
  Future<Task<List<Rate>>> getRates(String orgId, String memberId) {
    return execute(() async {
      final dtos = await _dataSource.getRates(orgId, memberId);
      // Записи с неизвестным rate_type пропускаем (forward-совместимость).
      return dtos.map((dto) => dto.toDomainOrNull()).whereType<Rate>().toList();
    });
  }

  @override
  Future<Task<Rate>> createRate(
    String orgId,
    String memberId, {
    required int rateAmountMinor,
    required RateType rateType,
    required DateTime effectiveFrom,
    String? note,
  }) {
    return execute(() async {
      final dto = await _dataSource.createRate(
        orgId,
        memberId,
        rateAmountMinor: rateAmountMinor,
        rateType: rateType.apiValue,
        effectiveFrom: effectiveFrom,
        note: note,
      );
      return _toDomainStrict(dto);
    });
  }

  @override
  Future<Task<Rate>> updateRate(
    String orgId,
    String memberId,
    String rateId, {
    int? rateAmountMinor,
    RateType? rateType,
    DateTime? effectiveFrom,
    String? note,
  }) {
    return execute(() async {
      final dto = await _dataSource.updateRate(
        orgId,
        memberId,
        rateId,
        rateAmountMinor: rateAmountMinor,
        rateType: rateType?.apiValue,
        effectiveFrom: effectiveFrom,
        note: note,
      );
      return _toDomainStrict(dto);
    });
  }

  @override
  Future<Task<void>> deleteRate(
    String orgId,
    String memberId,
    String rateId,
  ) {
    return executeVoid(() => _dataSource.deleteRate(orgId, memberId, rateId));
  }

  @override
  Future<Task<Payroll>> getPayroll(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return execute(() async {
      final dto = await _dataSource.getPayroll(
        orgId,
        dateFrom: dateFrom,
        dateTo: dateTo,
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
