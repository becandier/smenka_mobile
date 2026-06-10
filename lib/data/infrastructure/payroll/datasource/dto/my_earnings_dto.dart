import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/payroll_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/rate_dto.dart';

part 'my_earnings_dto.freezed.dart';
part 'my_earnings_dto.g.dart';

@freezed
abstract class MyEarningsDto with _$MyEarningsDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MyEarningsDto({
    required PayrollPeriodDto period,
    required String currency,
    required int workedSeconds,
    required int shiftsCount,
    required int grossAmountMinor,
    required bool hasMissingRate,
    CurrentRateDto? currentRate,
  }) = _MyEarningsDto;

  factory MyEarningsDto.fromJson(Map<String, dynamic> json) =>
      _$MyEarningsDtoFromJson(json);
}
