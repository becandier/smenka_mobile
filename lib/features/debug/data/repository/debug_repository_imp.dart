import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:templatecmd/app/config/_config.dart';
import 'package:templatecmd/features/debug/data/repository/debug_repository.dart';

class IDebugRepositoryImp extends DebugRepository {
  IDebugRepositoryImp({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;
  @override
  Future<void> setFlavor(Flavors flavor) async {
    await sharedPreferences.setString('flavor', flavor.name);
  }

  @override
  FutureOr<Flavors> getFlavor() {
    final flavor = sharedPreferences.getString('flavor');
    if (flavor == null) {
      return Flavors.prod;
    }
    return Flavors.values.byName(flavor);
  }
}
