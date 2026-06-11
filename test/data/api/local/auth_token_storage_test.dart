import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/data/api/local/auth_token_storage.dart';

class _MockSecureStorage extends Mock implements FlutterSecureStorage {}

const _accessKey = 'auth_access_token';
const _refreshKey = 'auth_refresh_token';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockSecureStorage secure;

  setUp(() {
    secure = _MockSecureStorage();
    // По умолчанию secure storage пуст и операции записи/удаления успешны.
    when(
      () => secure.read(key: any(named: 'key')),
    ).thenAnswer((_) async => null);
    when(
      () => secure.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
    when(() => secure.delete(key: any(named: 'key'))).thenAnswer((_) async {});
  });

  Future<(AuthTokenStorage, SharedPreferences)> buildStorage(
    Map<String, Object> prefsValues,
  ) async {
    SharedPreferences.setMockInitialValues(prefsValues);
    final prefs = await SharedPreferences.getInstance();
    return (AuthTokenStorage(prefs: prefs, secureStorage: secure), prefs);
  }

  group('AuthTokenStorage', () {
    test('init читает токены из secure storage в кэш', () async {
      when(() => secure.read(key: _accessKey)).thenAnswer((_) async => 'A');
      when(() => secure.read(key: _refreshKey)).thenAnswer((_) async => 'R');

      final (storage, _) = await buildStorage({});
      await storage.init();

      expect(storage.accessToken, 'A');
      expect(storage.refreshToken, 'R');
      expect(storage.hasTokens, isTrue);
    });

    test('hasTokens=false когда хранилища пусты', () async {
      final (storage, _) = await buildStorage({});
      await storage.init();

      expect(storage.hasTokens, isFalse);
      expect(storage.accessToken, isNull);
      expect(storage.refreshToken, isNull);
    });

    test('saveTokens пишет в secure storage и обновляет кэш', () async {
      final (storage, _) = await buildStorage({});
      await storage.init();

      await storage.saveTokens(accessToken: 'A', refreshToken: 'R');

      expect(storage.accessToken, 'A');
      expect(storage.refreshToken, 'R');
      expect(storage.hasTokens, isTrue);
      verify(() => secure.write(key: _accessKey, value: 'A')).called(1);
      verify(() => secure.write(key: _refreshKey, value: 'R')).called(1);
    });

    test('clearTokens чистит кэш и secure storage', () async {
      when(() => secure.read(key: _accessKey)).thenAnswer((_) async => 'A');
      when(() => secure.read(key: _refreshKey)).thenAnswer((_) async => 'R');

      final (storage, _) = await buildStorage({});
      await storage.init();
      await storage.clearTokens();

      expect(storage.hasTokens, isFalse);
      expect(storage.accessToken, isNull);
      verify(() => secure.delete(key: _accessKey)).called(1);
      verify(() => secure.delete(key: _refreshKey)).called(1);
    });

    test('миграция: токены из SharedPreferences переносятся в secure storage '
        'и удаляются из открытого хранилища', () async {
      final (storage, prefs) = await buildStorage({
        _accessKey: 'legacyA',
        _refreshKey: 'legacyR',
      });

      await storage.init();

      // Сессия сохранена — пользователь не разлогинен.
      expect(storage.accessToken, 'legacyA');
      expect(storage.refreshToken, 'legacyR');
      expect(storage.hasTokens, isTrue);

      // Перенесены в secure storage.
      verify(() => secure.write(key: _accessKey, value: 'legacyA')).called(1);
      verify(() => secure.write(key: _refreshKey, value: 'legacyR')).called(1);

      // В открытом SharedPreferences токенов больше нет.
      expect(prefs.getString(_accessKey), isNull);
      expect(prefs.getString(_refreshKey), isNull);
    });

    test('не мигрирует, если secure storage уже содержит токены', () async {
      when(
        () => secure.read(key: _accessKey),
      ).thenAnswer((_) async => 'secureA');
      when(
        () => secure.read(key: _refreshKey),
      ).thenAnswer((_) async => 'secureR');

      final (storage, prefs) = await buildStorage({
        _accessKey: 'legacyA',
        _refreshKey: 'legacyR',
      });

      await storage.init();

      expect(storage.accessToken, 'secureA');
      expect(storage.refreshToken, 'secureR');
      verifyNever(() => secure.write(key: _accessKey, value: 'legacyA'));
      // Открытый плейнтекст всё равно вычищается (defense-in-depth).
      expect(prefs.getString(_accessKey), isNull);
    });

    test('частичная legacy-пара не мигрируется', () async {
      final (storage, _) = await buildStorage({_accessKey: 'onlyAccess'});

      await storage.init();

      expect(storage.hasTokens, isFalse);
      verifyNever(() => secure.write(key: _accessKey, value: 'onlyAccess'));
    });

    test('init идемпотентен', () async {
      when(() => secure.read(key: _accessKey)).thenAnswer((_) async => 'A');
      when(() => secure.read(key: _refreshKey)).thenAnswer((_) async => 'R');

      final (storage, _) = await buildStorage({});
      await storage.init();
      await storage.init();

      // Чтение secure storage не повторяется на втором init.
      verify(() => secure.read(key: _accessKey)).called(1);
    });

    test('clearTokens вычищает legacy-токены из SharedPreferences', () async {
      when(() => secure.read(key: _accessKey)).thenAnswer((_) async => 'A');
      when(() => secure.read(key: _refreshKey)).thenAnswer((_) async => 'R');

      final (storage, prefs) = await buildStorage({
        _accessKey: 'legacyA',
        _refreshKey: 'legacyR',
      });
      await storage.init();
      await storage.clearTokens();

      expect(storage.hasTokens, isFalse);
      expect(prefs.getString(_accessKey), isNull);
      expect(prefs.getString(_refreshKey), isNull);
    });

    test('сбой записи в secure storage при миграции НЕ теряет сессию '
        'и оставляет legacy для повторной попытки', () async {
      when(
        () => secure.write(key: _accessKey, value: 'legacyA'),
      ).thenThrow(Exception('keystore unavailable'));

      final (storage, prefs) = await buildStorage({
        _accessKey: 'legacyA',
        _refreshKey: 'legacyR',
      });

      // init не бросает исключение (не роняет запуск приложения).
      await storage.init();

      // Сессия сохранена из legacy-кэша.
      expect(storage.accessToken, 'legacyA');
      expect(storage.hasTokens, isTrue);
      // Плейнтекст остаётся для повторной миграции при следующем старте.
      expect(prefs.getString(_accessKey), 'legacyA');
      expect(prefs.getString(_refreshKey), 'legacyR');
    });

    test('сбой чтения secure storage не роняет init (нет токенов)', () async {
      when(
        () => secure.read(key: _accessKey),
      ).thenThrow(Exception('keychain error'));

      final (storage, _) = await buildStorage({});
      await storage.init();

      expect(storage.hasTokens, isFalse);
    });
  });
}
