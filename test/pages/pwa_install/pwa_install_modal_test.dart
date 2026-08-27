import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_platform_api.dart';
import 'package:smenka_mobile/core/theme/app_theme.dart';
import 'package:smenka_mobile/data/api/local/pwa_promo_storage.dart';
import 'package:smenka_mobile/l10n/app_localizations.dart';
import 'package:smenka_mobile/pages/pwa_install/view/pwa_install_modal.dart';
import 'package:smenka_mobile/shared/pwa/_pwa.dart';

/// Подменяет браузер: тесты гоняются на Dart VM, где реальный
/// `PwaInstallPlatform` — no-op заглушка.
class _FakePlatform implements PwaInstallPlatformApi {
  _FakePlatform({this.isIos = false, this.hasInstallPrompt = false});

  // Модалка открывается только там, где точка входа видна, — web и не
  // standalone (эти ветки покрыты в `pwa_install_cubit_test.dart`).
  @override
  bool get isWeb => true;
  @override
  bool get isStandalone => false;
  @override
  final bool isIos;
  @override
  bool hasInstallPrompt;

  final _controller = StreamController<PwaPlatformSignal>.broadcast();

  @override
  Stream<PwaPlatformSignal> get signals => _controller.stream;

  @override
  void start() {}

  @override
  Future<void> showInstallPrompt() async => hasInstallPrompt = false;

  @override
  Future<void> dispose() => _controller.close();

  void emit(PwaPlatformSignal signal) => _controller.add(signal);
}

class _FakeStorage implements PwaPromoStorage {
  bool shown = false;

  @override
  bool get isPromoShown => shown;

  @override
  Future<void> markPromoShown() async => shown = true;
}

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('ru'));
  });

  Widget harness(PwaInstallCubit cubit) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru'),
      home: BlocProvider<PwaInstallCubit>.value(
        value: cubit,
        child: const Scaffold(body: PwaInstallModal()),
      ),
    );
  }

  PwaInstallCubit build(_FakePlatform platform, [_FakeStorage? storage]) =>
      PwaInstallCubit(
        storage: storage ?? _FakeStorage(),
        platform: platform,
        promoDelay: Duration.zero,
      );

  // Тап по «Установить» здесь не проверяем: обработчик закрывает модалку через
  // `context.router`, а auto_route в этом харнессе нет. Вызов `promptInstall`
  // покрыт `test/shared/pwa/pwa_install_cubit_test.dart`.
  testWidgets('Chromium: кнопка «Установить» вместо инструкции', (
    tester,
  ) async {
    final cubit = build(_FakePlatform(hasInstallPrompt: true));
    addTearDown(cubit.close);

    await tester.pumpWidget(harness(cubit));

    expect(find.text(l10n.pwaInstallAction), findsOneWidget);
    expect(find.text(l10n.pwaInstallLater), findsOneWidget);
    expect(find.text(l10n.pwaInstallIosStepShare), findsNothing);
    expect(find.text(l10n.pwaInstallManualHint), findsNothing);
  });

  testWidgets('iOS Safari: пошаговая инструкция «Поделиться»', (tester) async {
    final cubit = build(_FakePlatform(isIos: true));
    addTearDown(cubit.close);

    await tester.pumpWidget(harness(cubit));

    expect(find.text(l10n.pwaInstallIosStepsTitle), findsOneWidget);
    expect(find.text(l10n.pwaInstallIosStepShare), findsOneWidget);
    expect(find.text(l10n.pwaInstallIosStepAddToHome), findsOneWidget);
    expect(find.text(l10n.pwaInstallGotIt), findsOneWidget);
    expect(find.text(l10n.pwaInstallAction), findsNothing);
  });

  testWidgets('прочие браузеры: универсальная подсказка про меню', (
    tester,
  ) async {
    final cubit = build(_FakePlatform());
    addTearDown(cubit.close);

    await tester.pumpWidget(harness(cubit));

    expect(find.text(l10n.pwaInstallManualHint), findsOneWidget);
    expect(find.text(l10n.pwaInstallAction), findsNothing);
  });

  testWidgets('пойманный при открытой модалке prompt даёт кнопку', (
    tester,
  ) async {
    final platform = _FakePlatform();
    final cubit = build(platform);
    addTearDown(cubit.close);

    await tester.pumpWidget(harness(cubit));
    expect(find.text(l10n.pwaInstallManualHint), findsOneWidget);

    platform.emit(PwaPlatformSignal.promptAvailable);
    await tester.pumpAndSettle();

    expect(find.text(l10n.pwaInstallAction), findsOneWidget);
    expect(find.text(l10n.pwaInstallManualHint), findsNothing);
  });

  testWidgets('открытие модалки помечает промо показанным', (tester) async {
    final storage = _FakeStorage();
    final cubit = build(_FakePlatform(), storage);
    addTearDown(cubit.close);

    await tester.pumpWidget(harness(cubit));
    await tester.pump();

    expect(storage.shown, isTrue);
    expect(cubit.state.promoShown, isTrue);
  });
}
