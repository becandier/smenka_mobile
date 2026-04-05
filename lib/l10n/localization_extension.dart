import 'package:flutter/widgets.dart';
import 'package:smenka_mobile/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}
