import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/infrastructure/shift/datasource/dto/shift_dto.dart';

part 'paginated_list_dto.freezed.dart';
part 'paginated_list_dto.g.dart';

@freezed
abstract class PaginatedShiftsDto with _$PaginatedShiftsDto {
  const factory PaginatedShiftsDto({
    required List<ShiftDto> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedShiftsDto;

  factory PaginatedShiftsDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedShiftsDtoFromJson(json);
}
