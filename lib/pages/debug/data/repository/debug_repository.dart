import 'dart:async';

import 'package:smenka_mobile/app/config/_config.dart';

abstract class DebugRepository {
  /// Установка текущего флаера
  FutureOr<void> setFlavor(Flavors flavor);

  /// Получение текущего флаера
  FutureOr<Flavors> getFlavor();

  /// Установка доступа к режиму отладки
  FutureOr<void> setDeviceAccess();

  /// Получить доступ к режиму отладки
  FutureOr<bool> getDeviceAccess();
}
