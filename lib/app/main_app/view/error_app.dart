// Мда..
// ignore_for_file: lines_longer_than_80_chars

part of 'app.dart';

// Автономный fallback-экран: показывается до/без сборки темы, поэтому бренд-цвета
// заданы локальными константами (без ThemeData / context.appColors).
// Значения — байт-в-байт из Smenka Brand Kit v1.0.
const Color _kErrPaper = Color(0xFFFFFFFF); // paper — поверхность
const Color _kErrInk = Color(0xFF1D2530); // ink — текст
const Color _kErrBlue = Color(0xFF4A90D9); // Smenka Blue — акцент

class _ErrorApp extends StatefulWidget {
  const _ErrorApp({required this.error, required this.stackTrace});

  final Object? error;
  final StackTrace? stackTrace;

  @override
  State<_ErrorApp> createState() => _ErrorAppState();
}

class _ErrorAppState extends State<_ErrorApp> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _slideController;
  late Animation<double> _pulseAnimation;
  late Animation<Offset> _slideAnimation;
  bool _showDetails = false;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
        );

    _slideController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  String errorMessage() {
    if (widget.error.toString().contains('AppConfig')) {
      return 'Не удалось загрузить необходимые данные для работы приложения. Пожалуйста, выключите VPN и повторите попытку.';
    }
    return 'К сожалению, что-то пошло не так. Мы уже работаем над исправлением этой проблемы.';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        backgroundColor: _kErrPaper,
        body: DecoratedBox(
          decoration: const BoxDecoration(color: _kErrPaper),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: _kErrBlue,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: _kErrBlue.withValues(alpha: 0.25),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.error_outline,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  SlideTransition(
                    position: _slideAnimation,
                    child: Text(
                      AppLocalizations.of(context)?.errorOccurred ??
                          'Произошла ошибка',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: _kErrInk,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        errorMessage(),
                        style: TextStyle(
                          fontSize: 16,
                          color: _kErrInk.withValues(alpha: 0.7),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SlideTransition(
                    position: _slideAnimation,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<MainAppCubit>().refreshApp();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _kErrBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                        shadowColor: _kErrBlue.withValues(alpha: 0.35),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.refresh, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)?.tryAgain ??
                                'Попробовать снова',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SlideTransition(
                    position: _slideAnimation,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _showDetails = !_showDetails;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)?.errorDetails ??
                                'Детали ошибки',
                            style: TextStyle(
                              color: _kErrInk.withValues(alpha: 0.6),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          AnimatedRotation(
                            turns: _showDetails ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: _kErrInk.withValues(alpha: 0.6),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _showDetails ? 200 : 0,
                    child: _showDetails
                        ? Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _kErrInk.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget.error != null) ...[
                                    Text(
                                      'Error: ${widget.error}',
                                      style: TextStyle(
                                        color: _kErrInk.withValues(alpha: 0.9),
                                        fontSize: 12,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                  if (widget.stackTrace != null)
                                    Text(
                                      widget.stackTrace.toString(),
                                      style: TextStyle(
                                        color: _kErrInk.withValues(alpha: 0.7),
                                        fontSize: 10,
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
