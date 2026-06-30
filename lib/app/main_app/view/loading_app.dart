part of 'app.dart';

// Change for loading screen
class _LoadingApp extends StatelessWidget {
  const _LoadingApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, // paper — фирменный splash-фон
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: 1.4), // мягкое появление знака
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut, // Smooth animation
            builder: (context, scale, child) {
              return Transform.scale(scale: scale, child: child);
            },
            child: SvgPicture.asset('assets/smenka-mark-color.svg', width: 140),
          ),
        ),
      ),
    );
  }
}
