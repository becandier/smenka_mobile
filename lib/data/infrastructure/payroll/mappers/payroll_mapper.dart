import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/rate_mapper.dart';

extension PayrollPeriodMapper on PayrollPeriodDto {
  PayrollPeriod toDomain() {
    return PayrollPeriod(dateFrom: dateFrom, dateTo: dateTo);
  }
}

extension PayrollItemMapper on PayrollItemDto {
  PayrollItem toDomain() {
    return PayrollItem(
      userId: userId,
      userName: userName,
      workedSeconds: workedSeconds,
      shiftsCount: shiftsCount,
      grossAmountMinor: grossAmountMinor,
      unpaidSeconds: unpaidSeconds,
      unpaidShiftsCount: unpaidShiftsCount,
      hasMissingRate: hasMissingRate,
    );
  }
}

extension PayrollMapper on PayrollDto {
  Payroll toDomain() {
    return Payroll(
      period: period.toDomain(),
      currency: currency,
      items: items.map((item) => item.toDomain()).toList(),
      totals: PayrollTotals(
        workedSeconds: totals.workedSeconds,
        shiftsCount: totals.shiftsCount,
        grossAmountMinor: totals.grossAmountMinor,
      ),
    );
  }
}

extension MyEarningsMapper on MyEarningsDto {
  MyEarnings toDomain() {
    return MyEarnings(
      period: period.toDomain(),
      currency: currency,
      workedSeconds: workedSeconds,
      shiftsCount: shiftsCount,
      grossAmountMinor: grossAmountMinor,
      hasMissingRate: hasMissingRate,
      currentRate: currentRate?.toDomain(),
    );
  }
}
