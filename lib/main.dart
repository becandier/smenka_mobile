import 'package:flutter/material.dart';
import 'package:smenka_mobile/app/main_app/view/app.dart';
import 'package:smenka_mobile/core/web/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureWebUrlStrategy();
  runApp(const App());
}
