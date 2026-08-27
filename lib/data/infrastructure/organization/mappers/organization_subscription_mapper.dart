import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/organization/datasource/dto/_dto.dart';

extension OrganizationSubscriptionMapper on OrganizationSubscriptionDto {
  OrganizationSubscription toDomain() {
    return OrganizationSubscription(
      status: SubscriptionStatus.fromValue(status),
      daysLeft: daysLeft,
      currentPeriodEnd: currentPeriodEnd,
      graceEndsAt: graceEndsAt,
    );
  }
}
