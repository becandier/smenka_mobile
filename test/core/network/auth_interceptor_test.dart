import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/network/auth_interceptor.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';

class _MockTokenStorage extends Mock implements AuthTokenStorage {}

class _MockAuthNotifier extends Mock implements AuthStateNotifier {}

class _MockDio extends Mock implements Dio {}

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

DioException _dioError(
  String path, {
  int? statusCode,
  Map<String, dynamic>? extra,
}) {
  final options = RequestOptions(path: path);
  if (extra != null) options.extra.addAll(extra);
  return DioException(
    requestOptions: options,
    response: statusCode == null
        ? null
        : Response<dynamic>(requestOptions: options, statusCode: statusCode),
  );
}

void main() {
  late _MockTokenStorage storage;
  late _MockAuthNotifier notifier;
  late _MockDio dio;
  late AuthInterceptor interceptor;

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/'));
    registerFallbackValue(_dioError('/'));
    registerFallbackValue(
      Response<dynamic>(requestOptions: RequestOptions(path: '/')),
    );
  });

  setUp(() {
    storage = _MockTokenStorage();
    notifier = _MockAuthNotifier();
    dio = _MockDio();
    when(
      () => dio.options,
    ).thenReturn(BaseOptions(baseUrl: 'https://x/api/v1'));
    interceptor = AuthInterceptor(
      tokenStorage: storage,
      authNotifier: notifier,
      dio: dio,
    );
  });

  group('onRequest', () {
    test('добавляет Bearer-заголовок при наличии access-токена', () {
      when(() => storage.accessToken).thenReturn('TOK');
      final options = RequestOptions(path: '/shifts');
      final handler = _MockRequestHandler();

      interceptor.onRequest(options, handler);

      expect(options.headers['Authorization'], 'Bearer TOK');
      verify(() => handler.next(options)).called(1);
    });

    test('не добавляет заголовок, когда токена нет', () {
      when(() => storage.accessToken).thenReturn(null);
      final options = RequestOptions(path: '/shifts');
      final handler = _MockRequestHandler();

      interceptor.onRequest(options, handler);

      expect(options.headers.containsKey('Authorization'), isFalse);
      verify(() => handler.next(options)).called(1);
    });
  });

  group('onError', () {
    test('не-401 ошибки пропускаются без попытки рефреша', () async {
      final err = _dioError('/shifts', statusCode: 500);
      final handler = _MockErrorHandler();

      await interceptor.onError(err, handler);

      verify(() => handler.next(err)).called(1);
      verifyNever(() => storage.refreshToken);
    });

    test(
      'на auth-эндпоинтах рефреш не запускается (нет зацикливания)',
      () async {
        final err = _dioError('/auth/login', statusCode: 401);
        final handler = _MockErrorHandler();

        await interceptor.onError(err, handler);

        verify(() => handler.next(err)).called(1);
        verifyNever(() => storage.refreshToken);
      },
    );

    test('повторно отмеченный запрос не рефрешится (нет цикла)', () async {
      final err = _dioError(
        '/shifts',
        statusCode: 401,
        extra: {'_retried': true},
      );
      final handler = _MockErrorHandler();

      await interceptor.onError(err, handler);

      verify(() => handler.next(err)).called(1);
      verifyNever(() => storage.refreshToken);
    });

    test('401 без refresh → очистка токенов + unauthenticated', () async {
      when(() => storage.refreshToken).thenReturn(null);
      when(() => storage.clearTokens()).thenAnswer((_) async {});
      final err = _dioError('/shifts', statusCode: 401);
      final handler = _MockErrorHandler();

      await interceptor.onError(err, handler);

      verify(() => storage.clearTokens()).called(1);
      verify(
        () => notifier.setState(const AuthState.unauthenticated()),
      ).called(1);
      verify(() => handler.next(err)).called(1);
    });

    test('401 → успешный refresh → запрос повторён с новым токеном', () async {
      final refreshDio = _MockDio();
      final refreshInterceptor = AuthInterceptor(
        tokenStorage: storage,
        authNotifier: notifier,
        dio: dio,
        refreshDio: refreshDio,
      );

      when(() => storage.refreshToken).thenReturn('oldRefresh');
      when(
        () => storage.saveTokens(
          accessToken: any(named: 'accessToken'),
          refreshToken: any(named: 'refreshToken'),
        ),
      ).thenAnswer((_) async {});
      when(
        () => refreshDio.post<Map<String, dynamic>>(
          '/auth/refresh',
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => Response<Map<String, dynamic>>(
          requestOptions: RequestOptions(path: '/auth/refresh'),
          data: const {
            'data': {'access_token': 'newA', 'refresh_token': 'newR'},
          },
        ),
      );
      when(() => dio.fetch<dynamic>(any())).thenAnswer(
        (inv) async => Response<dynamic>(
          requestOptions: inv.positionalArguments.first as RequestOptions,
          statusCode: 200,
        ),
      );

      final err = _dioError('/shifts', statusCode: 401);
      final handler = _MockErrorHandler();

      await refreshInterceptor.onError(err, handler);

      // Новые токены сохранены.
      verify(
        () => storage.saveTokens(accessToken: 'newA', refreshToken: 'newR'),
      ).called(1);
      // Оригинальный запрос повторён с новым Bearer и флагом _retried.
      final retried =
          verify(() => dio.fetch<dynamic>(captureAny())).captured.single
              as RequestOptions;
      expect(retried.headers['Authorization'], 'Bearer newA');
      expect(retried.extra['_retried'], isTrue);
      // Ответ разрешён, дальнейшая ошибка не пробрасывается.
      verify(() => handler.resolve(any())).called(1);
      verifyNever(() => handler.next(any()));
    });
  });
}
