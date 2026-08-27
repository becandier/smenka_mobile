import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_method.dart';

part 'pwa_install_state.freezed.dart';

@freezed
abstract class PwaInstallState with _$PwaInstallState {
  const factory PwaInstallState({
    /// Приложение открыто в браузере. На native остаётся `false` — вся фича
    /// выключена.
    @Default(false) bool isWeb,

    /// Запущено как установленное PWA (`display-mode: standalone`).
    @Default(false) bool isStandalone,

    /// Установку поймали в этой сессии (событие `appinstalled`).
    @Default(false) bool isInstalled,

    /// Пойман `beforeinstallprompt` — доступен нативный диалог установки.
    @Default(false) bool canPromptNatively,

    /// iOS/iPadOS — только ручная установка через «Поделиться».
    @Default(false) bool isIos,

    /// Разовое промо уже показывали на этом устройстве.
    @Default(false) bool promoShown,

    /// Разовое промо пора открыть — шелл слушает флаг и пушит модалку.
    @Default(false) bool promoRequested,
  }) = _PwaInstallState;

  const PwaInstallState._();

  /// Точку входа («Установить приложение») показываем только в браузере, вне
  /// standalone и до установки.
  bool get isEntryPointVisible => isWeb && !isStandalone && !isInstalled;

  /// Что именно предлагать в модалке. Нативный диалог приоритетнее ручных
  /// инструкций: если браузер отдал `beforeinstallprompt`, ставим в один тап.
  PwaInstallMethod get method {
    if (canPromptNatively) return PwaInstallMethod.nativePrompt;
    if (isIos) return PwaInstallMethod.iosShareSheet;
    return PwaInstallMethod.manual;
  }
}
