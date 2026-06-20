import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';

/// Ставки и расчёт зарплаты (фича payroll, read-only).
///
/// История ставок видна admin/owner; `my-earnings` — любому участнику
/// организации (owner != member, ADR-001). Управление ставками вынесено
/// в веб-админку.
abstract class PayrollRepository {
  /// История ставок участника (`effective_from DESC`, без пагинации).
  Future<Task<List<Rate>>> getRates(String orgId, String memberId);

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
