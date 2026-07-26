import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
abstract class NotificationDto with _$NotificationDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NotificationDto({
    required String id,
    required String type,
    required String title,
    required bool isRead,
    required DateTime createdAt,
    String? body,
    Map<String, dynamic>? payload,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}

@freezed
abstract class PaginatedNotificationsDto with _$PaginatedNotificationsDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory PaginatedNotificationsDto({
    required List<NotificationDto> items,
    required int total,
    required int limit,
    required int offset,
  }) = _PaginatedNotificationsDto;

  factory PaginatedNotificationsDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedNotificationsDtoFromJson(json);
}
