import 'dart:async';

import 'package:templatecmd/app/config/_config.dart';

abstract class DebugRepository {
  FutureOr<void> setFlavor(Flavors flavor);
  FutureOr<Flavors> getFlavor();

  /// Доступ к режиму отладки
  FutureOr<void> setDeviceAccess();

  /// Получить доступ к режиму отладки
  FutureOr<bool> getDeviceAccess();
}
