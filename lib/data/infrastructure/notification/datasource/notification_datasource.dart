import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/notification/datasource/dto/_dto.dart';

class NotificationDataSource {
  NotificationDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<PaginatedNotificationsDto> getNotifications({
    int limit = 20,
    int offset = 0,
    bool? unread,
  }) async {
    final queryParameters = <String, dynamic>{'limit': limit, 'offset': offset};
    if (unread != null) queryParameters['unread'] = unread;

    final response = await _dio.get<Map<String, dynamic>>(
      '/notifications',
      queryParameters: queryParameters,
    );
    return PaginatedNotificationsDto.fromJson(response.data!);
  }

  Future<int> getUnreadCount() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/notifications/unread-count',
    );
    return response.data!['count'] as int;
  }

  Future<NotificationDto> markRead(String notificationId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/notifications/$notificationId/read',
    );
    return NotificationDto.fromJson(response.data!);
  }

  Future<int> markAllRead() async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/notifications/read-all',
    );
    return response.data!['updated'] as int;
  }
}
