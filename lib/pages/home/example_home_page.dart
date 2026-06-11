import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/pages/theme/_theme.dart';

@RoutePage()
class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Example Home Page'), ThemeButtonWidget()],
        ),
      ),
    );
  }
}
