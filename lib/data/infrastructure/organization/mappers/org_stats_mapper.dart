import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension EmployeeStatsMapper on EmployeeStatsDto {
  EmployeeStats toDomain() {
    return EmployeeStats(
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      shiftCount: shiftCount,
      totalWorkedSeconds: totalWorkedSeconds,
      averageShiftSeconds: averageShiftSeconds,
    );
  }
}

extension OrgStatsMapper on OrgStatsDto {
  OrgStats toDomain() {
    return OrgStats(
      period: period,
      totalWorkedSeconds: totalWorkedSeconds,
      shiftCount: shiftCount,
      averageShiftSeconds: averageShiftSeconds,
      perEmployee: perEmployee.map((e) => e.toDomain()).toList(),
      rangeFrom: rangeFrom,
      rangeTo: rangeTo,
    );
  }
}
