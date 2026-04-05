import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/user/models/_models.dart';

abstract class UserRepository {
  Future<Task<User>> getMe();
  Future<Task<User>> updateMe({String? name, String? phone});
}
