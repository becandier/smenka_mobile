import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift.freezed.dart';

enum ShiftStatus { active, paused, finished }

@freezed
abstract class Pause with _$Pause {
  const factory Pause({
    required String id,
    required String shiftId,
    required DateTime startedAt,
    DateTime? finishedAt,
  }) = _Pause;
}

@freezed
abstract class Shift with _$Shift {
  const factory Shift({
    required String id,
    required String userId,
    String? organizationId,
    required DateTime startedAt,
    DateTime? finishedAt,
    required ShiftStatus status,
    required List<Pause> pauses,
    required int workedSeconds,
  }) = _Shift;
}
