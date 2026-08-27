class PrefsKeys {
  const PrefsKeys._();

  static const String theme = 'theme_app_key';

  /// Отметка «разовое промо установки PWA уже показывали» (pwa_install_promo).
  /// Флаг привязан к браузеру/устройству, а не к пользователю: промо про
  /// установку самого приложения, а не про его содержимое.
  static const String pwaInstallPromoShown = 'pwa_install_promo_shown';
}
