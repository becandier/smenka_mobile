import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/pages/geo_diagnostics/cubit/geo_diagnostics_cubit.dart';
import 'package:smenka_mobile/pages/geo_diagnostics/cubit/geo_diagnostics_state.dart';

class _MockGeoService extends Mock implements GeoService {}

void main() {
  late _MockGeoService geo;

  setUp(() {
    geo = _MockGeoService();
    when(() => geo.isWeb).thenReturn(true);
    when(() => geo.diagnose()).thenAnswer(
      (_) async => const GeoDiagnostics(permission: GeoPermissionState.blocked),
    );
  });

  GeoDiagnosticsCubit build({TargetPlatform platform = TargetPlatform.macOS}) =>
      GeoDiagnosticsCubit(geoService: geo, platform: platform);

  group('resolveGeoInstructionsTarget', () {
    test('native — одна инструкция про настройки приложения', () {
      expect(
        resolveGeoInstructionsTarget(
          isWeb: false,
          platform: TargetPlatform.iOS,
        ),
        GeoInstructionsTarget.nativeApp,
      );
    });

    test('web — набор инструкций по ОС', () {
      expect(
        resolveGeoInstructionsTarget(
          isWeb: true,
          platform: TargetPlatform.macOS,
        ),
        GeoInstructionsTarget.webMacOs,
      );
      expect(
        resolveGeoInstructionsTarget(
          isWeb: true,
          platform: TargetPlatform.windows,
        ),
        GeoInstructionsTarget.webWindows,
      );
      expect(
        resolveGeoInstructionsTarget(
          isWeb: true,
          platform: TargetPlatform.android,
        ),
        GeoInstructionsTarget.webAndroid,
      );
      expect(
        resolveGeoInstructionsTarget(isWeb: true, platform: TargetPlatform.iOS),
        GeoInstructionsTarget.webIos,
      );
      // Неопознанная ОС — универсальная инструкция, а не пустой блок.
      expect(
        resolveGeoInstructionsTarget(
          isWeb: true,
          platform: TargetPlatform.linux,
        ),
        GeoInstructionsTarget.webOther,
      );
    });
  });

  group('GeoDiagnosticsCubit', () {
    test('на старте читает состояние разрешений', () async {
      final cubit = build();
      await pumpEventQueue();

      expect(cubit.state.target, GeoInstructionsTarget.webMacOs);
      expect(cubit.state.status.data?.permission, GeoPermissionState.blocked);
      expect(cubit.state.status.status, FeatureStatus.success);
      await cubit.close();
    });

    test('тест кладёт исход в состояние и перечитывает статус', () async {
      when(
        () => geo.getCurrentPosition(),
      ).thenAnswer((_) async => const GeoUnavailable());

      final cubit = build();
      await pumpEventQueue();
      await cubit.runTest();

      expect(cubit.state.test.data, isA<GeoUnavailable>());
      // Браузерный prompt мог изменить разрешение — статус читается заново.
      verify(() => geo.diagnose()).called(2);
      await cubit.close();
    });

    test('успешный тест сохраняет координаты и точность', () async {
      when(() => geo.getCurrentPosition()).thenAnswer(
        (_) async => const GeoSuccess(
          latitude: 55.75,
          longitude: 37.61,
          lowAccuracy: true,
          accuracyMeters: 250,
        ),
      );

      final cubit = build();
      await pumpEventQueue();
      await cubit.runTest();

      final result = cubit.state.test.data;
      expect(result, isA<GeoSuccess>());
      expect((result! as GeoSuccess).accuracyMeters, 250);
      expect((result as GeoSuccess).lowAccuracy, isTrue);
      await cubit.close();
    });

    test('повторный тап по «Проверить» не запускает второй прогон', () async {
      var calls = 0;
      when(() => geo.getCurrentPosition()).thenAnswer((_) async {
        calls++;
        await Future<void>.delayed(const Duration(milliseconds: 20));
        return const GeoUnavailable();
      });

      final cubit = build();
      await pumpEventQueue();
      final first = cubit.runTest();
      await cubit.runTest();
      await first;

      expect(calls, 1);
      await cubit.close();
    });
  });
}
