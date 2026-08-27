import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_method.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_platform_api.dart';
import 'package:smenka_mobile/data/api/local/pwa_promo_storage.dart';
import 'package:smenka_mobile/shared/pwa/_pwa.dart';

/// Подменяет браузер: тесты гоняются на VM, где реальный
/// `PwaInstallPlatform` — no-op заглушка.
class _FakePlatform implements PwaInstallPlatformApi {
  _FakePlatform({
    this.isWeb = true,
    this.isStandalone = false,
    this.isIos = false,
    this.hasInstallPrompt = false,
  });

  @override
  final bool isWeb;
  @override
  final bool isStandalone;
  @override
  final bool isIos;
  @override
  bool hasInstallPrompt;

  final _controller = StreamController<PwaPlatformSignal>.broadcast();

  bool started = false;
  bool disposed = false;
  int promptCalls = 0;

  @override
  Stream<PwaPlatformSignal> get signals => _controller.stream;

  @override
  void start() => started = true;

  @override
  Future<void> showInstallPrompt() async {
    promptCalls++;
    hasInstallPrompt = false;
    emit(PwaPlatformSignal.promptConsumed);
  }

  @override
  Future<void> dispose() async {
    disposed = true;
    await _controller.close();
  }

  void emit(PwaPlatformSignal signal) => _controller.add(signal);
}

/// Хранилище отметки промо в памяти — SharedPreferences в тестах не нужен.
class _FakeStorage implements PwaPromoStorage {
  _FakeStorage({bool shown = false}) : _shown = shown;

  bool _shown;
  int writes = 0;

  @override
  bool get isPromoShown => _shown;

  @override
  Future<void> markPromoShown() async {
    _shown = true;
    writes++;
  }
}

void main() {
  PwaInstallCubit build({
    required _FakePlatform platform,
    _FakeStorage? storage,
    Duration promoDelay = Duration.zero,
  }) => PwaInstallCubit(
    storage: storage ?? _FakeStorage(),
    platform: platform,
    promoDelay: promoDelay,
  );

  group('детект платформы', () {
    test('native: фича выключена целиком, на браузер не подписываемся', () {
      final platform = _FakePlatform(isWeb: false);
      final cubit = build(platform: platform);

      expect(cubit.state.isWeb, isFalse);
      expect(cubit.state.isEntryPointVisible, isFalse);
      expect(platform.started, isFalse);
    });

    test('standalone: точку входа не показываем', () {
      final cubit = build(platform: _FakePlatform(isStandalone: true));

      expect(cubit.state.isStandalone, isTrue);
      expect(cubit.state.isEntryPointVisible, isFalse);
    });

    test('обычный браузер: точка входа видна, слушатели подключены', () {
      final platform = _FakePlatform();
      final cubit = build(platform: platform);

      expect(cubit.state.isEntryPointVisible, isTrue);
      expect(platform.started, isTrue);
    });
  });

  group('способ установки', () {
    test('deferred prompt на старте → нативный диалог', () {
      final cubit = build(platform: _FakePlatform(hasInstallPrompt: true));

      expect(cubit.state.method, PwaInstallMethod.nativePrompt);
    });

    test('iOS без prompt → инструкция «Поделиться»', () {
      final cubit = build(platform: _FakePlatform(isIos: true));

      expect(cubit.state.method, PwaInstallMethod.iosShareSheet);
    });

    test('прочие браузеры → универсальная инструкция', () {
      final cubit = build(platform: _FakePlatform());

      expect(cubit.state.method, PwaInstallMethod.manual);
    });

    test('beforeinstallprompt после старта переключает на кнопку', () async {
      final platform = _FakePlatform();
      final cubit = build(platform: platform);
      expect(cubit.state.method, PwaInstallMethod.manual);

      platform.emit(PwaPlatformSignal.promptAvailable);
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.method, PwaInstallMethod.nativePrompt);
    });

    test('израсходованный prompt возвращает ручную инструкцию', () async {
      final platform = _FakePlatform(hasInstallPrompt: true);
      final cubit = build(platform: platform);

      await cubit.promptInstall();
      await Future<void>.delayed(Duration.zero);

      expect(platform.promptCalls, 1);
      expect(cubit.state.canPromptNatively, isFalse);
      expect(cubit.state.method, PwaInstallMethod.manual);
    });
  });

  group('разовое промо', () {
    test('первый вход в браузере → промо запрашивается', () async {
      final cubit = build(platform: _FakePlatform());

      await cubit.requestFirstRunPromo();

      expect(cubit.state.promoRequested, isTrue);
    });

    test('уже показывали → промо не запрашивается', () async {
      final cubit = build(
        platform: _FakePlatform(),
        storage: _FakeStorage(shown: true),
      );

      await cubit.requestFirstRunPromo();

      expect(cubit.state.promoShown, isTrue);
      expect(cubit.state.promoRequested, isFalse);
    });

    test('native → промо не запрашивается', () async {
      final cubit = build(platform: _FakePlatform(isWeb: false));

      await cubit.requestFirstRunPromo();

      expect(cubit.state.promoRequested, isFalse);
    });

    test('standalone → промо не запрашивается', () async {
      final cubit = build(platform: _FakePlatform(isStandalone: true));

      await cubit.requestFirstRunPromo();

      expect(cubit.state.promoRequested, isFalse);
    });

    test(
      'показ модалки помечает промо и второй раз оно не всплывает',
      () async {
        final storage = _FakeStorage();
        final cubit = build(platform: _FakePlatform(), storage: storage);

        await cubit.requestFirstRunPromo();
        await cubit.markPromoSeen();

        expect(cubit.state.promoRequested, isFalse);
        expect(cubit.state.promoShown, isTrue);
        expect(storage.writes, 1);

        await cubit.requestFirstRunPromo();
        expect(cubit.state.promoRequested, isFalse);
      },
    );

    test('повторный markPromoSeen не пишет в хранилище второй раз', () async {
      final storage = _FakeStorage();
      final cubit = build(platform: _FakePlatform(), storage: storage);

      await cubit.markPromoSeen();
      await cubit.markPromoSeen();

      expect(storage.writes, 1);
    });

    test('установка во время задержки отменяет промо', () async {
      final platform = _FakePlatform();
      final cubit = build(
        platform: platform,
        promoDelay: const Duration(milliseconds: 20),
      );

      final pending = cubit.requestFirstRunPromo();
      platform.emit(PwaPlatformSignal.installed);
      await pending;

      expect(cubit.state.isInstalled, isTrue);
      expect(cubit.state.promoRequested, isFalse);
    });
  });

  group('appinstalled', () {
    test('скрывает точку входа и гасит промо', () async {
      final storage = _FakeStorage();
      final platform = _FakePlatform();
      final cubit = build(platform: platform, storage: storage);

      platform.emit(PwaPlatformSignal.installed);
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state.isInstalled, isTrue);
      expect(cubit.state.isEntryPointVisible, isFalse);
      expect(storage.writes, 1);
    });
  });

  test('close отписывается от браузера', () async {
    final platform = _FakePlatform();
    final cubit = build(platform: platform);

    await cubit.close();

    expect(platform.disposed, isTrue);
  });
}
