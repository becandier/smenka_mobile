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
    @Default(0) int penaltyAmountMinor,
    @Default(0) int penaltiesCount,
    @Default(0) int adjustmentAmountMinor,
    @Default(0) int adjustmentsCount,
    @Default(0) int netAmountMinor,
    @Default(0) int plannedAmountMinor,
    @Default(0) int deltaAmountMinor,
    @Default(0) int overtimeSeconds,
    @Default(0) int lateCount,
    @Default(0) int lateSecondsTotal,
    CurrentRateDto? currentRate,
  }) = _MyEarningsDto;

  factory MyEarningsDto.fromJson(Map<String, dynamic> json) =>
      _$MyEarningsDtoFromJson(json);
}
