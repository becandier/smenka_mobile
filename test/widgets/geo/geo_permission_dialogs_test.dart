import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/l10n/app_localizations.dart';
import 'package:smenka_mobile/widgets/geo/geo_permission_dialogs.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('ru'));
  });

  /// Открывает диалог по тапу и складывает выбранное действие в [captured].
  Widget harness({
    required GeoFailure failure,
    required bool isWeb,
    GeoBlockLevel blockLevel = GeoBlockLevel.unknown,
    bool allowPhotoFallback = false,
    void Function(GeoFailureAction?)? captured,
  }) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru'),
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              final action = await showGeoFailureDialog(
                context,
                failure: failure,
                blockLevel: blockLevel,
                allowPhotoFallback: allowPhotoFallback,
                isWeb: isWeb,
              );
              captured?.call(action);
            },
            child: const Text('open'),
          ),
        ),
      ),
    );
  }

  Future<void> open(WidgetTester tester) async {
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  group('GeoFailureDialog — «запрещено навсегда»', () {
    testWidgets('web + блок на уровне сайта: инструкция по браузеру, '
        '«Как исправить» и «Повторить», без кнопки системных настроек', (
      tester,
    ) async {
      GeoFailureAction? action;
      await tester.pumpWidget(
        harness(
          failure: const GeoPermissionDeniedForever(),
          isWeb: true,
          blockLevel: GeoBlockLevel.site,
          captured: (value) => action = value,
        ),
      );
      await open(tester);

      expect(find.text(l10n.geoPermissionWebMessage), findsOneWidget);
      expect(find.text(l10n.geoHowToFix), findsOneWidget);
      expect(find.text(l10n.geoRetry), findsOneWidget);
      // Ключевой критерий: на web нет мёртвой кнопки системных настроек.
      expect(find.text(l10n.geoOpenAppSettings), findsNothing);

      await tester.tap(find.text(l10n.geoRetry));
      await tester.pumpAndSettle();

      expect(action, GeoFailureAction.retry);
      expect(find.text(l10n.geoPermissionWebMessage), findsNothing);
    });

    testWidgets(
      'web + блок на уровне ОС: текст про систему, а не про настройки сайта',
      (tester) async {
        GeoFailureAction? action;
        await tester.pumpWidget(
          harness(
            failure: const GeoPermissionDeniedForever(),
            isWeb: true,
            blockLevel: GeoBlockLevel.system,
            captured: (value) => action = value,
          ),
        );
        await open(tester);

        expect(find.text(l10n.geoBlockedBySystemTitle), findsOneWidget);
        expect(find.text(l10n.geoBlockedBySystemMessage), findsOneWidget);
        expect(find.text(l10n.geoPermissionWebMessage), findsNothing);

        await tester.tap(find.text(l10n.geoHowToFix));
        await tester.pumpAndSettle();

        expect(action, GeoFailureAction.howToFix);
      },
    );

    testWidgets(
      'web + уровень неизвестен: универсальный текст про оба уровня',
      (tester) async {
        await tester.pumpWidget(
          harness(failure: const GeoPermissionDeniedForever(), isWeb: true),
        );
        await open(tester);

        expect(find.text(l10n.geoBlockedUnknownLevelMessage), findsOneWidget);
      },
    );

    testWidgets('native: кнопка настроек приложения вместо «Повторить»', (
      tester,
    ) async {
      GeoFailureAction? action;
      await tester.pumpWidget(
        harness(
          failure: const GeoPermissionDeniedForever(),
          isWeb: false,
          captured: (value) => action = value,
        ),
      );
      await open(tester);

      expect(find.text(l10n.geoPermissionDeniedForeverMessage), findsOneWidget);
      expect(find.text(l10n.geoOpenAppSettings), findsOneWidget);
      expect(find.text(l10n.geoRetry), findsNothing);

      await tester.tap(find.text(l10n.geoOpenAppSettings));
      await tester.pumpAndSettle();

      expect(action, GeoFailureAction.openAppSettings);
    });
  });

  group('GeoFailureDialog — прочие отказы', () {
    testWidgets('native «сервис выключен»: кнопка системных настроек гео', (
      tester,
    ) async {
      GeoFailureAction? action;
      await tester.pumpWidget(
        harness(
          failure: const GeoServiceDisabled(),
          isWeb: false,
          captured: (value) => action = value,
        ),
      );
      await open(tester);

      expect(find.text(l10n.geoServiceDisabledMessage), findsOneWidget);
      expect(find.text(l10n.geoOpenSettings), findsOneWidget);

      await tester.tap(find.text(l10n.geoOpenSettings));
      await tester.pumpAndSettle();

      expect(action, GeoFailureAction.openLocationSettings);
    });

    testWidgets('«позиция недоступна»: «Повторить» + «Как исправить»', (
      tester,
    ) async {
      await tester.pumpWidget(
        harness(failure: const GeoUnavailable(), isWeb: true),
      );
      await open(tester);

      expect(find.text(l10n.errorGeoUnavailable), findsOneWidget);
      expect(find.text(l10n.geoRetry), findsOneWidget);
      expect(find.text(l10n.geoHowToFix), findsOneWidget);
    });

    testWidgets('«не поддерживается»: повтора нет, «Как исправить» есть', (
      tester,
    ) async {
      await tester.pumpWidget(
        harness(failure: const GeoUnsupported(), isWeb: true),
      );
      await open(tester);

      expect(find.text(l10n.geoUnsupportedMessage), findsOneWidget);
      expect(find.text(l10n.geoRetry), findsNothing);
      expect(find.text(l10n.geoHowToFix), findsOneWidget);
    });

    testWidgets('«небезопасный контекст»: текст про HTTPS', (tester) async {
      await tester.pumpWidget(
        harness(failure: const GeoInsecureContext(), isWeb: true),
      );
      await open(tester);

      expect(find.text(l10n.geoInsecureContextMessage), findsOneWidget);
    });

    testWidgets('«доступ отклонён»: повтор доступен', (tester) async {
      await tester.pumpWidget(
        harness(failure: const GeoPermissionDenied(), isWeb: false),
      );
      await open(tester);

      expect(find.text(l10n.geoPermissionDenied), findsOneWidget);
      expect(find.text(l10n.geoRetry), findsOneWidget);
    });
  });

  group('фолбэк по фото (shift_geo_photo_fallback)', () {
    // Матрица: действие доступно на ЛЮБОЙ финальной ветке GeoFailure.
    final failures = <GeoFailure>[
      const GeoServiceDisabled(),
      const GeoPermissionDenied(),
      const GeoPermissionDeniedForever(),
      const GeoUnavailable(),
      const GeoInsecureContext(),
      const GeoUnsupported(),
    ];

    for (final failure in failures) {
      testWidgets('${failure.runtimeType}: «Начать по фото» показывается', (
        tester,
      ) async {
        GeoFailureAction? action;
        await tester.pumpWidget(
          harness(
            failure: failure,
            isWeb: true,
            allowPhotoFallback: true,
            captured: (value) => action = value,
          ),
        );
        await open(tester);

        expect(find.text(l10n.shiftStartWithPhoto), findsOneWidget);

        await tester.tap(find.text(l10n.shiftStartWithPhoto));
        await tester.pumpAndSettle();

        expect(action, GeoFailureAction.startWithPhoto);
      });
    }

    testWidgets('без разрешения фолбэка кнопки нет', (tester) async {
      await tester.pumpWidget(
        harness(failure: const GeoUnavailable(), isWeb: true),
      );
      await open(tester);

      expect(find.text(l10n.shiftStartWithPhoto), findsNothing);
    });
  });
}
