import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/pages/auth/cubit/login_cubit.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repo;

  setUp(() {
    repo = _MockAuthRepository();
  });

  void stubLogin(ApiException error) {
    when(
      () => repo.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => Task<AuthToken>.failure(error));
  }

  group('LoginCubit error.code mapping', () {
    test('423 ACCOUNT_LOCKED → errorCode + isLocked', () async {
      stubLogin(
        const ApiException.server(message: 'locked', code: 'ACCOUNT_LOCKED'),
      );
      final cubit = LoginCubit(authRepository: repo);

      final result = await cubit.login();

      expect(result, LoginResult.error);
      expect(cubit.state.status, FeatureStatus.error);
      expect(cubit.state.errorCode, 'ACCOUNT_LOCKED');
      expect(cubit.state.isLocked, isTrue);
      await cubit.close();
    });

    test('429 RATE_LIMIT_EXCEEDED → errorCode, но не блокирует', () async {
      stubLogin(
        const ApiException.server(
          message: 'too many',
          code: 'RATE_LIMIT_EXCEEDED',
        ),
      );
      final cubit = LoginCubit(authRepository: repo);

      await cubit.login();

      expect(cubit.state.errorCode, 'RATE_LIMIT_EXCEEDED');
      expect(cubit.state.isLocked, isFalse);
      await cubit.close();
    });

    test('редактирование email снимает блокировку и код ошибки', () async {
      stubLogin(
        const ApiException.server(message: 'locked', code: 'ACCOUNT_LOCKED'),
      );
      final cubit = LoginCubit(authRepository: repo);
      await cubit.login();
      expect(cubit.state.isLocked, isTrue);

      cubit.updateEmail('new@mail.com');

      expect(cubit.state.isLocked, isFalse);
      expect(cubit.state.errorCode, isNull);
      expect(cubit.state.error, isNull);
      await cubit.close();
    });
  });
}
