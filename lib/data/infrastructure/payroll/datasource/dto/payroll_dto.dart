import 'package:freezed_annotation/freezed_annotation.dart';

part 'payroll_dto.freezed.dart';
part 'payroll_dto.g.dart';

@freezed
abstract class PayrollPeriodDto with _$PayrollPeriodDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PayrollPeriodDto({
    DateTime? dateFrom,
    DateTime? dateTo,
  }) = _PayrollPeriodDto;

  factory PayrollPeriodDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollPeriodDtoFromJson(json);
}

@freezed
abstract class PayrollItemDto with _$PayrollItemDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PayrollItemDto({
    required String userId,
    required String userName,
    required int workedSeconds,
    required int shiftsCount,
    required int grossAmountMinor,
    required int unpaidSeconds,
    required int unpaidShiftsCount,
    required bool hasMissingRate,
  }) = _PayrollItemDto;

  factory PayrollItemDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollItemDtoFromJson(json);
}

@freezed
abstract class PayrollTotalsDto with _$PayrollTotalsDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PayrollTotalsDto({
    required int workedSeconds,
    required int shiftsCount,
    required int grossAmountMinor,
  }) = _PayrollTotalsDto;

  factory PayrollTotalsDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollTotalsDtoFromJson(json);
}

@freezed
abstract class PayrollDto with _$PayrollDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PayrollDto({
    required PayrollPeriodDto period,
    required String currency,
    required List<PayrollItemDto> items,
    required PayrollTotalsDto totals,
  }) = _PayrollDto;

  factory PayrollDto.fromJson(Map<String, dynamic> json) =>
      _$PayrollDtoFromJson(json);
}
