// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationSubscriptionDto _$OrganizationSubscriptionDtoFromJson(
  Map<String, dynamic> json,
) => _OrganizationSubscriptionDto(
  status: json['status'] as String,
  daysLeft: (json['days_left'] as num?)?.toInt(),
  trialEndsAt: json['trial_ends_at'] == null
      ? null
      : DateTime.parse(json['trial_ends_at'] as String),
  currentPeriodEnd: json['current_period_end'] == null
      ? null
      : DateTime.parse(json['current_period_end'] as String),
  graceEndsAt: json['grace_ends_at'] == null
      ? null
      : DateTime.parse(json['grace_ends_at'] as String),
);

Map<String, dynamic> _$OrganizationSubscriptionDtoToJson(
  _OrganizationSubscriptionDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'days_left': instance.daysLeft,
  'trial_ends_at': instance.trialEndsAt?.toIso8601String(),
  'current_period_end': instance.currentPeriodEnd?.toIso8601String(),
  'grace_ends_at': instance.graceEndsAt?.toIso8601String(),
};
