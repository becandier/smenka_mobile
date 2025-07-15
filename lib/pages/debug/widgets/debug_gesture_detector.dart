import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templatecmd/app/_app.dart';
import 'package:templatecmd/l10n/localization_extension.dart';
import 'package:templatecmd/pages/debug/cubit/debug_cubit.dart';

/// Виджет-детектор заданной последовательности жестов.
/// При выполнении последовательности из 3 длинных тапов
/// вызывается pushDebugScreen.
class DebugGestureDetector extends StatefulWidget {
  const DebugGestureDetector({
    required this.child,
    required this.password,
    this.navigatorKey,
    super.key,
    this.timeoutBetweenTaps = const Duration(seconds: 2),
  });

  final Widget child;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Duration timeoutBetweenTaps;
  final String password;

  @override
  State<DebugGestureDetector> createState() => _DebugGestureDetectorState();
}

class _DebugGestureDetectorState extends State<DebugGestureDetector> {
  // Количество длинных тапов для активации
  static const _requiredTapCount = 3;

  // Текущее количество зарегистрированных тапов
  int _tapCount = 0;
  Timer? _resetTimer;

  // Сбрасываем количество тапов
  void _resetTapCount() {
    _tapCount = 0;
  }

  // Записываем тап
  void _registerLongTap() {
    // Отменяем предыдущий таймер и запускаем новый
    _resetTimer?.cancel();
    _tapCount++;
    final isDeviceAccess =
        context.read<DebugCubit>().state.isDeviceAccess ?? false;
    // Если достигнуто нужное количество тапов, вызываем проверку пароля
    if (_tapCount == _requiredTapCount) {
      _resetTapCount();
      if (isDeviceAccess) {
        pushDebugScreen();
      } else {
        Future.delayed(
          Duration.zero,
          _promptPassword,
        );
      }
      return;
    }

    // Запускаем таймер сброса
    _resetTimer = Timer(widget.timeoutBetweenTaps, _resetTapCount);
  }

  // Переходим в экран отладки
  void pushDebugScreen() {
    final checkContext = widget.navigatorKey != null &&
            widget.navigatorKey!.currentContext != null
        ? widget.navigatorKey!.currentContext!
        : context;
    context.read<DebugCubit>().setDeviceAccess();
    checkContext.router.push(
      const DebugRoute(),
    );
  }

  // Проверяем введенный пароль
  Future<void> _promptPassword() async {
    var isValid = false;
    final checkContext = widget.navigatorKey != null &&
            widget.navigatorKey!.currentContext != null
        ? widget.navigatorKey!.currentContext!
        : context;
    isValid = await showEnterPasswordModal(checkContext) ?? false;

    if (isValid) {
      pushDebugScreen();
    }
  }

  // Показываем модалку для ввода пароля
  Future<bool?> showEnterPasswordModal(
    BuildContext checkContext,
  ) {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    // Переменная для отслеживания видимости пароля
    var obscureText = true;

    void handleSubmit(BuildContext context) {
      if (controller.text == widget.password) {
        context.router.maybePop(true);
      } else {
        formKey.currentState?.validate();
      }
    }

    return showDialog<bool>(
      context: checkContext,
      useRootNavigator: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Form(
              key: formKey,
              child: AlertDialog(
                title: Text(context.l10n.enterInDebugMode),
                content: TextFormField(
                  autofocus: true,
                  validator: (value) => value == widget.password
                      ? null
                      : context.l10n.passwordIncorrect,
                  controller: controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    labelText: context.l10n.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                  onFieldSubmitted: (_) => handleSubmit(context),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.router.maybePop(false);
                    },
                    child: Text(
                      context.l10n.cancel,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => handleSubmit(context),
                    child: Text(context.l10n.login),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: _registerLongTap,
      child: widget.child,
    );
  }
}
