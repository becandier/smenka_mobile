import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:templatecmd/core/router/app_router.dart';

@RoutePage()
class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Example Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AzkarRoute());
        },
        child: const Icon(Icons.arrow_outward),
      ),
    );
  }
}
