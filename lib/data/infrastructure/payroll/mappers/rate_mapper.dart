import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';

/// Парсинг строкового `rate_type` бэка в [RateType].
/// `byName` не подходит: на бэке snake_case (`per_shift`).
/// Неизвестное значение → null: такая запись пропускается, а не роняет
/// парсинг всего ответа (forward-совместимость с новыми типами ставок).
RateType? rateTypeFromApi(String value) => switch (value) {
  'hourly' => RateType.hourly,
  'per_shift' => RateType.perShift,
  _ => null,
};

extension RateTypeApi on RateType {
  String get apiValue => switch (this) {
    RateType.hourly => 'hourly',
    RateType.perShift => 'per_shift',
  };
}

extension RateMapper on RateDto {
  /// null — неизвестный `rate_type` (запись пропускается вызывающим кодом).
  Rate? toDomainOrNull() {
    final type = rateTypeFromApi(rateType);
    if (type == null) return null;
    return Rate(
      id: id,
      memberId: memberId,
      rateAmountMinor: rateAmountMinor,
      rateType: type,
      currency: currency,
      effectiveFrom: effectiveFrom,
      createdAt: createdAt,
      note: note,
    );
  }
}

extension CurrentRateMapper on CurrentRateDto {
  /// null — неизвестный `rate_type` (трактуется как «ставка не задана»).
  CurrentRate? toDomainOrNull() {
    final type = rateTypeFromApi(rateType);
    if (type == null) return null;
    return CurrentRate(
      rateAmountMinor: rateAmountMinor,
      rateType: type,
      currency: currency,
      effectiveFrom: effectiveFrom,
    );
  }
}
