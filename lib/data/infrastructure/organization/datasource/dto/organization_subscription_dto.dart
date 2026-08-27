import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_subscription_dto.freezed.dart';
part 'organization_subscription_dto.g.dart';

/// DTO вложенного объекта `subscription` из `GET /organizations/{org_id}`
/// (`tariffs`, `SubscriptionResponse` на бэке).
///
/// Бэк отдаёт больше полей (`plan_code`, `limits`, `usage`, `features`,
/// цену и т.д.) — они мобилке не нужны (гейтинг фич вне scope мобильного
/// трека, см. `docs/tasks/tariffs/mobile.md`) и намеренно не парсятся;
/// `json_serializable` игнорирует незнакомые ключи.
@freezed
abstract class OrganizationSubscriptionDto with _$OrganizationSubscriptionDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrganizationSubscriptionDto({
    required String status,
    int? daysLeft,
    DateTime? trialEndsAt,
    DateTime? currentPeriodEnd,
    DateTime? graceEndsAt,
  }) = _OrganizationSubscriptionDto;

  factory OrganizationSubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$OrganizationSubscriptionDtoFromJson(json);
}
