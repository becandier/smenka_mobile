part of 'app.dart';

class _ErrorApp extends StatelessWidget {
  const _ErrorApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              context.read<MainAppCubit>().init();
            },
            child: const Text('Error'),
          ),
        ),
      ),
    );
  }
}
