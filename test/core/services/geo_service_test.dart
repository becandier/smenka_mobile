import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/services/geo_logger.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';

class _MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

Position _position({double accuracy = 10}) => Position(
  latitude: 55.75,
  longitude: 37.61,
  timestamp: DateTime.utc(2026, 7, 8, 12),
  accuracy: accuracy,
  altitude: 0,
  altitudeAccuracy: 0,
  heading: 0,
  headingAccuracy: 0,
  speed: 0,
  speedAccuracy: 0,
);

void main() {
  late _MockGeolocatorPlatform geolocator;

  setUpAll(() {
    registerFallbackValue(const LocationSettings());
  });

  setUp(() {
    geolocator = _MockGeolocatorPlatform();
  });

  GeoService nativeService({List<String>? steps}) => GeoService(
    geolocator: geolocator,
    isWeb: false,
    logger: steps == null
        ? GeoLogger.silent()
        : GeoLogger(breadcrumb: steps.add),
    // Короткие таймауты: моки отвечают синхронно, .timeout() не должен мешать.
    nativePrimaryTimeout: const Duration(milliseconds: 200),
    nativeFallbackTimeout: const Duration(milliseconds: 200),
  );

  GeoService webService({bool insecure = false, List<String>? steps}) =>
      GeoService(
        geolocator: geolocator,
        isWeb: true,
        insecureContextProbe: () => insecure,
        logger: steps == null
            ? GeoLogger.silent()
            : GeoLogger(breadcrumb: steps.add),
        webTimeout: const Duration(milliseconds: 200),
      );

  void stubGetPosition(Position position) {
    when(
      () => geolocator.getCurrentPosition(
        locationSettings: any(named: 'locationSettings'),
      ),
    ).thenAnswer((_) async => position);
  }

  group('native', () {
    test('сервис геолокации выключен → GeoServiceDisabled', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => false);

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoServiceDisabled>());
      expect((result as GeoFailure).code, geoServiceDisabledCode);
      verifyNever(() => geolocator.getCurrentPosition());
    });

    test('denied → повторный запрос → grant → success', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.denied);
      when(
        () => geolocator.requestPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      stubGetPosition(_position());

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoSuccess>());
      final success = result as GeoSuccess;
      expect(success.latitude, 55.75);
      expect(success.lowAccuracy, isFalse);
      verify(() => geolocator.requestPermission()).called(1);
    });

    test('denied остаётся denied → GeoPermissionDenied', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.denied);
      when(
        () => geolocator.requestPermission(),
      ).thenAnswer((_) async => LocationPermission.denied);

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoPermissionDenied>());
      expect((result as GeoFailure).code, geoPermissionDeniedCode);
    });

    test('deniedForever → GeoPermissionDeniedForever (без запроса)', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.deniedForever);

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoPermissionDeniedForever>());
      expect((result as GeoFailure).code, geoPermissionDeniedForeverCode);
      verifyNever(() => geolocator.requestPermission());
    });

    test('timeout основной → fallback medium → success', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);

      var calls = 0;
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenAnswer((_) async {
        calls++;
        if (calls == 1) throw TimeoutException('slow');
        return _position();
      });

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoSuccess>());
      expect(calls, 2); // high + fallback medium
      verifyNever(() => geolocator.getLastKnownPosition());
    });

    test('timeout везде → getLastKnownPosition success', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(TimeoutException('slow'));
      when(
        () => geolocator.getLastKnownPosition(),
      ).thenAnswer((_) async => _position(accuracy: 40));

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoSuccess>());
      verify(() => geolocator.getLastKnownPosition()).called(1);
    });

    test('timeout везде + пустой кэш → GeoUnavailable', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(TimeoutException('slow'));
      when(
        () => geolocator.getLastKnownPosition(),
      ).thenAnswer((_) async => null);

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoUnavailable>());
      expect((result as GeoFailure).code, geoUnavailableCode);
    });

    test('PositionUnavailable основной → fallback medium → success', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);

      var calls = 0;
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenAnswer((_) async {
        calls++;
        if (calls == 1) throw const PositionUpdateException('no fix');
        return _position();
      });

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoSuccess>());
      expect(calls, 2); // high + fallback medium
      verifyNever(() => geolocator.getLastKnownPosition());
    });

    test('PositionUnavailable везде + пустой кэш → GeoUnavailable', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(const PositionUpdateException('no fix'));
      when(
        () => geolocator.getLastKnownPosition(),
      ).thenAnswer((_) async => null);

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoUnavailable>());
      expect((result as GeoFailure).code, geoUnavailableCode);
      // detail пробрасывается из последнего PositionUpdateException.
      expect(result.detail, 'no fix');
      verify(() => geolocator.getLastKnownPosition()).called(1);
    });

    test('getLastKnownPosition бросает исключение → GeoUnavailable', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(TimeoutException('slow'));
      // Кэш сам падает: try/catch внутри сервиса глотает → position=null.
      when(
        () => geolocator.getLastKnownPosition(),
      ).thenThrow(Exception('cache boom'));

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoUnavailable>());
      // detail — от таймаута, а не от исключения кэша: значит бросок кэша
      // проглочен внутренним try/catch, а не долетел до внешнего рубежа.
      expect((result as GeoFailure).detail, 'slow');
      verify(() => geolocator.getLastKnownPosition()).called(1);
    });

    test('сервис выключен во время запроса → GeoServiceDisabled', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      // Сервис успели выключить между проверкой и запросом позиции.
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(const LocationServiceDisabledException());

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoServiceDisabled>());
      expect((result as GeoFailure).code, geoServiceDisabledCode);
      // Ранний возврат: ни fallback, ни кэш не трогаем.
      verifyNever(() => geolocator.getLastKnownPosition());
    });

    test('доступ отозван во время запроса → GeoPermissionDenied', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(const PermissionDeniedException('revoked'));

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoPermissionDenied>());
      expect((result as GeoFailure).code, geoPermissionDeniedCode);
      verifyNever(() => geolocator.getLastKnownPosition());
    });

    test(
      'неожиданная ошибка основной попытки → fallback medium → success',
      () async {
        // Регресс на hardening: непредвиденное исключение high-accuracy попытки
        // не должно проваливать флоу мимо fallback — medium даёт результат.
        when(
          () => geolocator.isLocationServiceEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => geolocator.checkPermission(),
        ).thenAnswer((_) async => LocationPermission.whileInUse);

        var calls = 0;
        when(
          () => geolocator.getCurrentPosition(
            locationSettings: any(named: 'locationSettings'),
          ),
        ).thenAnswer((_) async {
          calls++;
          if (calls == 1) throw StateError('unexpected');
          return _position();
        });

        final result = await nativeService().getCurrentPosition();

        expect(result, isA<GeoSuccess>());
        expect(calls, 2); // high (упала) + fallback medium (успех)
      },
    );

    test('низкая точность → флаг lowAccuracy', () async {
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => true);
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);
      stubGetPosition(_position(accuracy: 500));

      final result = await nativeService().getCurrentPosition();

      expect(result, isA<GeoSuccess>());
      expect((result as GeoSuccess).lowAccuracy, isTrue);
    });
  });

  group('web', () {
    test(
      'insecure context → GeoInsecureContext (без запроса позиции)',
      () async {
        final result = await webService(insecure: true).getCurrentPosition();

        expect(result, isA<GeoInsecureContext>());
        expect((result as GeoFailure).code, geoInsecureContextCode);
        verifyNever(() => geolocator.getCurrentPosition());
        verifyNever(() => geolocator.checkPermission());
      },
    );

    test(
      'success c enableHighAccuracy=false (medium); без getLastKnown',
      () async {
        stubGetPosition(_position(accuracy: 30));

        final result = await webService().getCurrentPosition();

        expect(result, isA<GeoSuccess>());
        // На web не полагаемся на проверки разрешений/сервиса и не трогаем кэш.
        verifyNever(() => geolocator.isLocationServiceEnabled());
        verifyNever(() => geolocator.checkPermission());
        verifyNever(() => geolocator.getLastKnownPosition());

        final captured = verify(
          () => geolocator.getCurrentPosition(
            locationSettings: captureAny(named: 'locationSettings'),
          ),
        ).captured;
        final settings = captured.single as LocationSettings;
        expect(settings.accuracy, LocationAccuracy.medium);
      },
    );

    test('PermissionDenied → GeoPermissionDeniedForever (web)', () async {
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(const PermissionDeniedException('blocked'));

      final result = await webService().getCurrentPosition();

      expect(result, isA<GeoPermissionDeniedForever>());
      expect((result as GeoFailure).code, geoPermissionDeniedForeverCode);
    });

    test('timeout → GeoUnavailable', () async {
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(TimeoutException('slow'));

      final result = await webService().getCurrentPosition();

      expect(result, isA<GeoUnavailable>());
    });

    test('position unavailable → GeoUnavailable', () async {
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(const PositionUpdateException('no fix'));

      final result = await webService().getCurrentPosition();

      expect(result, isA<GeoUnavailable>());
    });

    test('несовместимый браузер (нет API) → GeoUnsupported', () async {
      // Отсутствие navigator.geolocation на web всплывает неожиданной ошибкой
      // из getCurrentPosition — сервис трактует её как «не поддерживается».
      when(
        () => geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        ),
      ).thenThrow(UnsupportedError('no navigator.geolocation'));

      final result = await webService().getCurrentPosition();

      expect(result, isA<GeoUnsupported>());
      expect((result as GeoFailure).code, geoUnsupportedCode);
    });
  });

  group('пост-диагностика (geo_troubleshooting)', () {
    // Маппинг geolocator_web: granted→whileInUse, prompt→denied,
    // denied→deniedForever. Проверяем, что читаем его именно так.
    final permissionCases = <(LocationPermission, GeoPermissionState)>[
      (LocationPermission.whileInUse, GeoPermissionState.granted),
      (LocationPermission.always, GeoPermissionState.granted),
      (LocationPermission.deniedForever, GeoPermissionState.blocked),
      (LocationPermission.denied, GeoPermissionState.notRequested),
      (LocationPermission.unableToDetermine, GeoPermissionState.unknown),
    ];

    for (final (platformValue, expected) in permissionCases) {
      test('checkPermissionState: $platformValue → $expected', () async {
        when(
          () => geolocator.checkPermission(),
        ).thenAnswer((_) async => platformValue);

        expect(await webService().checkPermissionState(), expected);
      });
    }

    test('Permissions API недоступен (исключение) → unknown', () async {
      // geolocator_web бросает ArgumentError на незнакомом состоянии, старый
      // Safari — вовсе не отдаёт navigator.permissions.
      when(() => geolocator.checkPermission()).thenThrow(ArgumentError('nope'));

      expect(
        await webService().checkPermissionState(),
        GeoPermissionState.unknown,
      );
    });

    test('сайту доступ разрешён, а позиции нет → блок на уровне ОС', () async {
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);

      expect(await webService().diagnoseBlockLevel(), GeoBlockLevel.system);
    });

    test('доступ заблокирован в браузере → блок на уровне сайта', () async {
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.deniedForever);

      expect(await webService().diagnoseBlockLevel(), GeoBlockLevel.site);
    });

    test('уровень не определить → unknown', () async {
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.unableToDetermine);

      expect(await webService().diagnoseBlockLevel(), GeoBlockLevel.unknown);
    });

    test('diagnose на web не спрашивает системный переключатель', () async {
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.whileInUse);

      final diagnostics = await webService().diagnose();

      expect(diagnostics.permission, GeoPermissionState.granted);
      // У браузера нет своего тумблера геолокации — поле не применимо.
      expect(diagnostics.serviceEnabled, isNull);
      verifyNever(() => geolocator.isLocationServiceEnabled());
    });

    test('diagnose на native отдаёт состояние служб геолокации', () async {
      when(
        () => geolocator.checkPermission(),
      ).thenAnswer((_) async => LocationPermission.deniedForever);
      when(
        () => geolocator.isLocationServiceEnabled(),
      ).thenAnswer((_) async => false);

      final diagnostics = await nativeService().diagnose();

      expect(diagnostics.permission, GeoPermissionState.blocked);
      expect(diagnostics.serviceEnabled, isFalse);
    });

    test('успешная позиция несёт фактическую точность', () async {
      stubGetPosition(_position(accuracy: 42));

      final result = await webService().getCurrentPosition();

      expect((result as GeoSuccess).accuracyMeters, 42);
    });
  });

  group('логирование шагов', () {
    test('пишет платформу и успех в крошки', () async {
      final steps = <String>[];
      stubGetPosition(_position());

      await webService(steps: steps).getCurrentPosition();

      expect(steps, contains('start platform=web'));
      expect(steps.any((s) => s.startsWith('success')), isTrue);
    });
  });
}
