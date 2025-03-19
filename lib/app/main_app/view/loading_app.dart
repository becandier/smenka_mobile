part of 'app.dart';

// Change for loading screen
class _LoadingApp extends StatelessWidget {
  const _LoadingApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: 2), // Animation scale from 1 to 2
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut, // Smooth animation
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Image.asset(Assets.logo.path, width: 200),
          ),
        ),
      ),
    );
  }
}
