import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_overtime_request.freezed.dart';

enum OvertimeStatus { pending, approved, rejected }

/// Заявка на переработку по завершённой смене (не более одной активной
/// заявки — `pending`/`approved` — на смену). Подаёт сотрудник, согласует
/// owner/admin в веб-админке.
@freezed
abstract class ShiftOvertimeRequest with _$ShiftOvertimeRequest {
  const factory ShiftOvertimeRequest({
    required String id,
    required int minutes,
    required OvertimeStatus status,
    required String comment,
    required DateTime createdAt,
    String? reviewComment,
    DateTime? reviewedAt,
  }) = _ShiftOvertimeRequest;
}
