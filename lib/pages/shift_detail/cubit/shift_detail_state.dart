import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_detail_state.freezed.dart';

@freezed
abstract class ShiftDetailState with _$ShiftDetailState {
  const factory ShiftDetailState({
    required Shift shift,
  }) = _ShiftDetailState;
}
