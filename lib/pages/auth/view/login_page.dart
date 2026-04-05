import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Заглушка экрана входа.
/// TODO: реализовать полноценный UI авторизации.
@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    this.onResult,
  });

  /// Callback при успешной авторизации — вызывается guard-ом
  final void Function(bool didLogin)? onResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Вход',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text('Экран авторизации (заглушка)'),
          ],
        ),
      ),
    );
  }
}
