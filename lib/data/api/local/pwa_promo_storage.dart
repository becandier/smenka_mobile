import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/core/constants/prefs_keys.dart';

/// Отметка о показе разового промо установки PWA (`pwa_install_promo`).
///
/// Хранится в SharedPreferences (на web — localStorage), т.е. привязана к
/// браузеру/устройству и переживает перелогин: промо про установку самого
/// приложения, показывать его повторно каждому пользователю смысла нет.
class PwaPromoStorage {
  PwaPromoStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  /// Промо уже показывали на этом устройстве.
  bool get isPromoShown =>
      _prefs.getBool(PrefsKeys.pwaInstallPromoShown) ?? false;

  /// Запоминает, что промо показано, — автоматически оно больше не всплывёт.
  Future<void> markPromoShown() =>
      _prefs.setBool(PrefsKeys.pwaInstallPromoShown, true);
}
