import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/pages/verify/cubit/verify_cubit.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repo;

  setUp(() {
    repo = _MockAuthRepository();
  });

  void stubVerify(ApiException error) {
    when(
      () => repo.verify(
        email: any(named: 'email'),
        code: any(named: 'code'),
      ),
    ).thenAnswer((_) async => Task<AuthToken>.failure(error));
  }

  // После 429 TOO_MANY_CODE_ATTEMPTS кулдаун снимается и resend становится
  // доступен — на этом фоне проверяем повторную отправку кода.
  Future<VerifyCubit> cubitWithResendUnlocked() async {
    stubVerify(
      const ApiException.server(
        message: 'too many',
        code: 'TOO_MANY_CODE_ATTEMPTS',
      ),
    );
    final cubit = VerifyCubit(email: 'a@b.com', authRepository: repo)
      ..updateCode('1234');
    await cubit.verify();
    return cubit;
  }

  group('VerifyCubit error.code mapping', () {
    test(
      '429 TOO_MANY_CODE_ATTEMPTS → errorCode + кулдаун сброшен (CTA доступен)',
      () async {
        stubVerify(
          const ApiException.server(
            message: 'too many',
            code: 'TOO_MANY_CODE_ATTEMPTS',
          ),
        );
        final cubit = VerifyCubit(email: 'a@b.com', authRepository: repo)
          ..updateCode('1234');

        await cubit.verify();

        expect(cubit.state.status, FeatureStatus.error);
        expect(cubit.state.errorCode, 'TOO_MANY_CODE_ATTEMPTS');
        expect(cubit.state.cooldownSeconds, 0);
        expect(cubit.state.canResend, isTrue);
        await cubit.close();
      },
    );

    test('400 INVALID_CODE → errorCode, кулдаун не сбрасывается', () async {
      stubVerify(
        const ApiException.server(message: 'invalid', code: 'INVALID_CODE'),
      );
      final cubit = VerifyCubit(email: 'a@b.com', authRepository: repo)
        ..updateCode('1234');

      await cubit.verify();

      expect(cubit.state.status, FeatureStatus.error);
      expect(cubit.state.errorCode, 'INVALID_CODE');
      // Кулдаун стартовал в конструкторе и не должен обнуляться.
      expect(cubit.state.cooldownSeconds, greaterThan(0));
      await cubit.close();
    });
  });

  group('VerifyCubit resendCode', () {
    test('успех → кулдаун перезапущен, ошибка очищена', () async {
      when(
        () => repo.resendCode(email: any(named: 'email')),
      ).thenAnswer((_) async => const Task<void>.success(null));
      final cubit = await cubitWithResendUnlocked();
      expect(cubit.state.canResend, isTrue);

      await cubit.resendCode();

      expect(cubit.state.isResending, isFalse);
      expect(cubit.state.error, isNull);
      expect(cubit.state.errorCode, isNull);
      expect(cubit.state.cooldownSeconds, 30);
      await cubit.close();
    });

    test(
      '429 RATE_LIMIT_EXCEEDED → errorCode сохранён, кулдаун не трогается',
      () async {
        when(() => repo.resendCode(email: any(named: 'email'))).thenAnswer(
          (_) async => const Task<void>.failure(
            ApiException.server(message: 'rl', code: 'RATE_LIMIT_EXCEEDED'),
          ),
        );
        final cubit = await cubitWithResendUnlocked();

        await cubit.resendCode();

        expect(cubit.state.isResending, isFalse);
        expect(cubit.state.errorCode, 'RATE_LIMIT_EXCEEDED');
        expect(cubit.state.cooldownSeconds, 0);
        await cubit.close();
      },
    );
  });
}
