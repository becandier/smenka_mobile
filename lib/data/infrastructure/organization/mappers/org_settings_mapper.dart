import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension OrgSettingsMapper on OrgSettingsDto {
  OrgSettings toDomain() {
    return OrgSettings(
      organizationId: organizationId,
      geoCheckEnabled: geoCheckEnabled,
      autoFinishHours: autoFinishHours,
      maxPauseMinutes: maxPauseMinutes,
      maxPausesPerShift: maxPausesPerShift,
    );
  }
}
