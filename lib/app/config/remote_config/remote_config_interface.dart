abstract class AppConfigRemote {
  Future<void> setDefaults(Map<String, dynamic> defaultParameters) async {}

  String getString(String key);

  int getInt(String key);

  bool getBool(String key);
}
