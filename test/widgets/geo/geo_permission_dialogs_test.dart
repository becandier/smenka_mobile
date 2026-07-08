import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/services/geo_logger.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/l10n/app_localizations.dart';
import 'package:smenka_mobile/widgets/geo/geo_permission_dialogs.dart';

class _MockGeolocatorPlatform extends Mock implements GeolocatorPlatform {}

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('ru'));
  });

  Widget harness(void Function(BuildContext) onTap) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru'),
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => onTap(context),
            child: const Text('open'),
          ),
        ),
      ),
    );
  }

  group('GeoDeniedForeverDialog', () {
    testWidgets(
      'web: инструкция + «Повторить», без кнопки системных настроек',
      (tester) async {
        var retried = false;
        await tester.pumpWidget(
          harness(
            (context) => showGeoDeniedForeverDialog(
              context,
              geoService: GeoService(isWeb: true, logger: GeoLogger.silent()),
              onRetry: () => retried = true,
              isWeb: true,
            ),
          ),
        );

        await tester.tap(find.text('open'));
        await tester.pumpAndSettle();

        expect(find.text(l10n.geoPermissionWebMessage), findsOneWidget);
        expect(find.text(l10n.geoRetry), findsOneWidget);
        // Ключевой критерий: на web НЕТ мёртвой кнопки системных настроек.
        expect(find.text(l10n.geoOpenAppSettings), findsNothing);

        await tester.tap(find.text(l10n.geoRetry));
        await tester.pumpAndSettle();

        expect(retried, isTrue);
        // Диалог закрылся.
        expect(find.text(l10n.geoPermissionWebMessage), findsNothing);
      },
    );

    testWidgets(
      'native: кнопка «Открыть настройки приложения» дёргает сервис',
      (tester) async {
        final geolocator = _MockGeolocatorPlatform();
        when(geolocator.openAppSettings).thenAnswer((_) async => true);
        final geoService = GeoService(
          geolocator: geolocator,
          isWeb: false,
          logger: GeoLogger.silent(),
        );

        await tester.pumpWidget(
          harness(
            (context) => showGeoDeniedForeverDialog(
              context,
              geoService: geoService,
              onRetry: () {},
              isWeb: false,
            ),
          ),
        );

        await tester.tap(find.text('open'));
        await tester.pumpAndSettle();

        expect(find.text(l10n.geoOpenAppSettings), findsOneWidget);
        expect(find.text(l10n.geoRetry), findsNothing);

        await tester.tap(find.text(l10n.geoOpenAppSettings));
        await tester.pumpAndSettle();

        verify(geolocator.openAppSettings).called(1);
      },
    );
  });

  group('GeoServiceDisabledDialog', () {
    testWidgets('кнопка «Включить» открывает настройки геолокации', (
      tester,
    ) async {
      final geolocator = _MockGeolocatorPlatform();
      when(geolocator.openLocationSettings).thenAnswer((_) async => true);
      final geoService = GeoService(
        geolocator: geolocator,
        isWeb: false,
        logger: GeoLogger.silent(),
      );

      await tester.pumpWidget(
        harness((context) => showGeoServiceDisabledDialog(context, geoService)),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      expect(find.text(l10n.geoServiceDisabledMessage), findsOneWidget);
      expect(find.text(l10n.geoOpenSettings), findsOneWidget);

      await tester.tap(find.text(l10n.geoOpenSettings));
      await tester.pumpAndSettle();

      verify(geolocator.openLocationSettings).called(1);
    });
  });
}
