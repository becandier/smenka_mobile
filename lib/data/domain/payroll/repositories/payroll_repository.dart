import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';

/// Ставки и расчёт зарплаты (фича payroll).
///
/// Мутации ставок доступны только `org_admin`; история видна admin/owner;
/// `my-earnings` — любому участнику организации (owner != member, ADR-001).
abstract class PayrollRepository {
  /// История ставок участника (`effective_from DESC`, без пагинации).
  Future<Task<List<Rate>>> getRates(String orgId, String memberId);

  /// Добавить ставку — новая строка истории (прошлые не перезаписываются).
  Future<Task<Rate>> createRate(
    String orgId,
    String memberId, {
    required int rateAmountMinor,
    required RateType rateType,
    required DateTime effectiveFrom,
    String? note,
  });

  /// Исправить ошибочную запись истории (не «новая ставка с даты»).
  Future<Task<Rate>> updateRate(
    String orgId,
    String memberId,
    String rateId, {
    int? rateAmountMinor,
    RateType? rateType,
    DateTime? effectiveFrom,
    String? note,
  });

  /// Удалить ошибочную запись истории.
  Future<Task<void>> deleteRate(String orgId, String memberId, String rateId);

  /// Отчёт «кому сколько заплатить» за период (admin/owner).
  /// Окно: UTC, `dateTo` включительно; открытые границы допустимы.
  Future<Task<Payroll>> getPayroll(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
  });

  /// Свой заработок за период + текущая ставка (org_member).
  Future<Task<MyEarnings>> getMyEarnings(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
  });
}
