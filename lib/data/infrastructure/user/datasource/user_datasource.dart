import 'package:dio/dio.dart';
import 'package:smenka_mobile/data/infrastructure/user/datasource/dto/_dto.dart';

class UserDataSource {
  UserDataSource({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<UserDto> getMe() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/users/me');
    return UserDto.fromJson(response.data!);
  }

  Future<UserDto> updateMe({String? name, String? phone}) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (phone != null) data['phone'] = phone;

    final response = await _dio.patch<Map<String, dynamic>>(
      '/api/v1/users/me',
      data: data,
    );
    return UserDto.fromJson(response.data!);
  }
}
