import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';

/// Парсинг строкового `rate_type` бэка в [RateType] и обратно.
/// `byName` не подходит: на бэке snake_case (`per_shift`).
RateType rateTypeFromApi(String value) => switch (value) {
      'hourly' => RateType.hourly,
      'per_shift' => RateType.perShift,
      _ => throw ArgumentError.value(value, 'rate_type', 'Unknown rate type'),
    };

extension RateTypeApi on RateType {
  String get apiValue => switch (this) {
        RateType.hourly => 'hourly',
        RateType.perShift => 'per_shift',
      };
}

extension RateMapper on RateDto {
  Rate toDomain() {
    return Rate(
      id: id,
      memberId: memberId,
      rateAmountMinor: rateAmountMinor,
      rateType: rateTypeFromApi(rateType),
      currency: currency,
      effectiveFrom: effectiveFrom,
      createdAt: createdAt,
      note: note,
    );
  }
}

extension CurrentRateMapper on CurrentRateDto {
  CurrentRate toDomain() {
    return CurrentRate(
      rateAmountMinor: rateAmountMinor,
      rateType: rateTypeFromApi(rateType),
      currency: currency,
      effectiveFrom: effectiveFrom,
    );
  }
}
