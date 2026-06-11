import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/network/task_handler.dart';
import 'package:smenka_mobile/data/domain/user/_user.dart';
import 'package:smenka_mobile/data/infrastructure/user/datasource/user_datasource.dart';
import 'package:smenka_mobile/data/infrastructure/user/mappers/_mappers.dart';

class UserRepositoryImpl with TaskHandler implements UserRepository {
  UserRepositoryImpl({required UserDataSource dataSource})
    : _dataSource = dataSource;

  final UserDataSource _dataSource;

  @override
  Future<Task<User>> getMe() {
    return execute(() async {
      final dto = await _dataSource.getMe();
      return dto.toDomain();
    });
  }

  @override
  Future<Task<User>> updateMe({String? name, String? phone}) {
    return execute(() async {
      final dto = await _dataSource.updateMe(name: name, phone: phone);
      return dto.toDomain();
    });
  }
}
