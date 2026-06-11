import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_dto.freezed.dart';
part 'rate_dto.g.dart';

@freezed
abstract class RateDto with _$RateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RateDto({
    required String id,
    required String memberId,
    required int rateAmountMinor,
    required String rateType,
    required String currency,
    required DateTime effectiveFrom,
    required DateTime createdAt,
    String? note,
  }) = _RateDto;

  factory RateDto.fromJson(Map<String, dynamic> json) =>
      _$RateDtoFromJson(json);
}

@freezed
abstract class CurrentRateDto with _$CurrentRateDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CurrentRateDto({
    required int rateAmountMinor,
    required String rateType,
    required String currency,
    required DateTime effectiveFrom,
  }) = _CurrentRateDto;

  factory CurrentRateDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentRateDtoFromJson(json);
}
