// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    _NotificationDto(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      isRead: json['is_read'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      body: json['body'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NotificationDtoToJson(_NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'is_read': instance.isRead,
      'created_at': instance.createdAt.toIso8601String(),
      'body': instance.body,
      'payload': instance.payload,
    };

_PaginatedNotificationsDto _$PaginatedNotificationsDtoFromJson(
  Map<String, dynamic> json,
) => _PaginatedNotificationsDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => NotificationDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedNotificationsDtoToJson(
  _PaginatedNotificationsDto instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
};
