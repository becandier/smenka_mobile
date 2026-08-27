import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_platform.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_platform_api.dart';
import 'package:smenka_mobile/data/api/local/pwa_promo_storage.dart';
import 'package:smenka_mobile/shared/pwa/cubit/pwa_install_state.dart';

/// Состояние промо установки PWA — глобальный кубит уровня приложения (по
/// образцу `AuthCubit`/`NotificationsCubit`, см. `lib/shared/`): точка входа
/// живёт в аппбаре главной, а разовое промо запускает шелл, и обоим нужен один
/// и тот же инстанс.
///
/// Независим от других кубитов (конвенция проекта): только платформенный слой
/// [PwaInstallPlatformApi] и [PwaPromoStorage]. Весь браузерный код — за
/// conditional import, на native кубит просто остаётся в пустом состоянии.
class PwaInstallCubit extends Cubit<PwaInstallState> {
  PwaInstallCubit({
    required PwaPromoStorage storage,
    PwaInstallPlatformApi? platform,
    Duration promoDelay = _defaultPromoDelay,
  }) : _storage = storage,
       _platform = platform ?? PwaInstallPlatform(),
       _promoDelay = promoDelay,
       super(const PwaInstallState()) {
    _init();
  }

  /// Задержка перед разовым промо: Chromium присылает `beforeinstallprompt`
  /// уже после загрузки страницы, поэтому не открываем модалку мгновенно —
  /// иначе пользователь Chrome увидел бы ручную инструкцию вместо кнопки
  /// «Установить». Заодно промо не перекрывает первый экран сразу же.
  static const _defaultPromoDelay = Duration(seconds: 3);

  final PwaPromoStorage _storage;
  final PwaInstallPlatformApi _platform;
  final Duration _promoDelay;

  StreamSubscription<PwaPlatformSignal>? _signalsSubscription;

  void _init() {
    if (!_platform.isWeb) return;

    _platform.start();
    _signalsSubscription = _platform.signals.listen(_onSignal);

    emit(
      state.copyWith(
        isWeb: true,
        isStandalone: _platform.isStandalone,
        isIos: _platform.isIos,
        canPromptNatively: _platform.hasInstallPrompt,
        promoShown: _storage.isPromoShown,
      ),
    );
  }

  void _onSignal(PwaPlatformSignal signal) {
    switch (signal) {
      case PwaPlatformSignal.promptAvailable:
        emit(state.copyWith(canPromptNatively: true));
      case PwaPlatformSignal.promptConsumed:
        emit(state.copyWith(canPromptNatively: false));
      case PwaPlatformSignal.installed:
        // Установили — точки входа скрываем и гасим невыстрелившее промо.
        emit(
          state.copyWith(
            isInstalled: true,
            promoRequested: false,
            promoShown: true,
          ),
        );
        unawaited(_storage.markPromoShown());
    }
  }

  /// Разовое промо после входа в авторизованную зону: если условия сходятся —
  /// через [_promoDelay] выставляет [PwaInstallState.promoRequested], на что
  /// реагирует шелл и открывает модалку.
  Future<void> requestFirstRunPromo() async {
    if (!_isPromoAllowed || state.promoRequested) return;

    await Future<void>.delayed(_promoDelay);

    // За время задержки могли установить приложение, показать промо вручную
    // или закрыть кубит — перепроверяем.
    if (isClosed || !_isPromoAllowed) return;

    emit(state.copyWith(promoRequested: true));
  }

  bool get _isPromoAllowed => state.isEntryPointVisible && !state.promoShown;

  /// Модалка открыта (автоматически или по иконке в аппбаре) — считаем промо
  /// показанным: автоматически оно больше не всплывёт.
  Future<void> markPromoSeen() async {
    if (state.promoShown && !state.promoRequested) return;

    emit(state.copyWith(promoRequested: false, promoShown: true));
    await _storage.markPromoShown();
  }

  /// Нативный диалог установки браузера (кнопка «Установить»).
  Future<void> promptInstall() => _platform.showInstallPrompt();

  @override
  Future<void> close() async {
    await _signalsSubscription?.cancel();
    await _platform.dispose();
    return super.close();
  }
}
