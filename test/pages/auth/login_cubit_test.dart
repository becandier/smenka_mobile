import 'package:flutter/foundation.dart';
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
    // Дефолт для конструктора LoginCubit (он сам дёргает getOAuthConfig в
    // фоне) — конкретные тесты OAuth-конфига переопределяют своими стабами.
    when(
      () => repo.getOAuthConfig(clientType: any(named: 'clientType')),
    ).thenAnswer((_) async => const Task.success(OAuthConfig()));
  });

  LoginCubit buildCubit() => LoginCubit(authRepository: repo);

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
      final cubit = buildCubit();

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
      final cubit = buildCubit();

      await cubit.login();

      expect(cubit.state.errorCode, 'RATE_LIMIT_EXCEEDED');
      expect(cubit.state.isLocked, isFalse);
      await cubit.close();
    });

    test('редактирование email снимает блокировку и код ошибки', () async {
      stubLogin(
        const ApiException.server(message: 'locked', code: 'ACCOUNT_LOCKED'),
      );
      final cubit = buildCubit();
      await cubit.login();
      expect(cubit.state.isLocked, isTrue);

      cubit.updateEmail('new@mail.com');

      expect(cubit.state.isLocked, isFalse);
      expect(cubit.state.errorCode, isNull);
      expect(cubit.state.error, isNull);
      await cubit.close();
    });
  });

  group('LoginCubit OAuth config', () {
    tearDown(() => debugDefaultTargetPlatformOverride = null);

    test(
      'Android: только один запрос (android) — Apple на Android не предлагаем',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
        when(() => repo.getOAuthConfig(clientType: 'android')).thenAnswer(
          (_) async => const Task.success(
            OAuthConfig(
              google: OAuthProviderConfig(clientId: 'g-android', enabled: true),
            ),
          ),
        );
        final cubit = buildCubit();

        await pumpEventQueue();

        expect(cubit.state.googleEnabled, isTrue);
        expect(cubit.state.appleEnabled, isFalse);
        expect(cubit.state.oauthConfig?.google?.clientId, 'g-android');
        verify(() => repo.getOAuthConfig(clientType: 'android')).called(1);
        verifyNever(() => repo.getOAuthConfig(clientType: 'web'));
        verifyNever(() => repo.getOAuthConfig(clientType: 'ios'));

        // Кнопка Apple не рендерится (appleEnabled=false), но и сам метод
        // на Android — no-op, без обращения к sign_in_with_apple SDK.
        final result = await cubit.signInWithApple();
        expect(result, LoginResult.cancelled);
        await cubit.close();
      },
    );

    test('iOS: один запрос (ios), google и apple из одного ответа', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => repo.getOAuthConfig(clientType: 'ios')).thenAnswer(
        (_) async => const Task.success(
          OAuthConfig(
            google: OAuthProviderConfig(clientId: 'g-ios', enabled: true),
            apple: OAuthProviderConfig(clientId: 'a-ios', enabled: false),
          ),
        ),
      );
      final cubit = buildCubit();

      await pumpEventQueue();

      expect(cubit.state.googleEnabled, isTrue);
      // enabled: false у провайдера → кнопка не показывается
      expect(cubit.state.appleEnabled, isFalse);
      verify(() => repo.getOAuthConfig(clientType: 'ios')).called(1);
      verifyNever(() => repo.getOAuthConfig(clientType: 'android'));
      verifyNever(() => repo.getOAuthConfig(clientType: 'web'));
      await cubit.close();
    });

    test(
      'провайдер не настроен (оба null) → кнопки скрыты, без ошибок',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
        when(
          () => repo.getOAuthConfig(clientType: 'ios'),
        ).thenAnswer((_) async => const Task.success(OAuthConfig()));
        final cubit = buildCubit();

        await pumpEventQueue();

        expect(cubit.state.showOAuthSection, isFalse);
        await cubit.close();
      },
    );

    test('ошибка запроса конфига не ломает форму email/пароль', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(() => repo.getOAuthConfig(clientType: 'ios')).thenAnswer(
        (_) async => const Task.failure(ApiException.network(message: 'net')),
      );
      stubLogin(
        const ApiException.server(message: 'locked', code: 'ACCOUNT_LOCKED'),
      );
      final cubit = buildCubit();

      await pumpEventQueue();
      expect(cubit.state.showOAuthSection, isFalse);
      expect(cubit.state.error, isNull);

      await cubit.login();
      expect(cubit.state.status, FeatureStatus.error);
      await cubit.close();
    });

    test(
      'неподдерживаемая платформа (macOS) — конфиг не запрашивается',
      () async {
        debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
        final cubit = buildCubit();

        await pumpEventQueue();

        expect(cubit.state.oauthConfig, isNull);
        verifyNever(
          () => repo.getOAuthConfig(clientType: any(named: 'clientType')),
        );
        final result = await cubit.signInWithGoogle();
        expect(result, LoginResult.cancelled);
        await cubit.close();
      },
    );

    test('повторный тап во время загрузки игнорируется (без гонки)', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      when(
        () => repo.getOAuthConfig(clientType: 'ios'),
      ).thenAnswer((_) async => const Task.success(OAuthConfig()));
      final cubit = buildCubit();
      await pumpEventQueue();

      // Пока предыдущий OAuth-вызов не завершился (isLoading=true) — второй
      // вызов должен быть no-op, а не конкурентно лезть в SDK.
      final first = cubit.signInWithGoogle();
      final second = await cubit.signInWithGoogle();
      expect(second, LoginResult.cancelled);
      await first;
      await cubit.close();
    });
  });
}
