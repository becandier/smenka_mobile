import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/shift/models/shift.dart';

part 'paginated_list.freezed.dart';

@freezed
abstract class PaginatedShifts with _$PaginatedShifts {
  const factory PaginatedShifts({
    required List<Shift> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedShifts;
}
