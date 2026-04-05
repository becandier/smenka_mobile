import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_stats.freezed.dart';

@freezed
abstract class EmployeeStats with _$EmployeeStats {
  const factory EmployeeStats({
    required String userId,
    required String userName,
    required String userEmail,
    required int shiftCount,
    required int totalWorkedSeconds,
    required int averageShiftSeconds,
  }) = _EmployeeStats;
}

@freezed
abstract class OrgStats with _$OrgStats {
  const factory OrgStats({
    required String period,
    required int totalWorkedSeconds,
    required int shiftCount,
    required int averageShiftSeconds,
    required List<EmployeeStats> perEmployee,
  }) = _OrgStats;
}
