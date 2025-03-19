import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templatecmd/app/_app.dart';
import 'package:templatecmd/l10n/localization_extension.dart';

/// Типы тапов, которые мы отслеживаем
enum TapType { long, short }

/// Виджет-детектор заданной последовательности жестов.
/// При выполнении последовательности: long, long, short, short,
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
  // Определяем нужную последовательность
  static const _pattern = [
    TapType.long,
    TapType.long,
    TapType.short,
    TapType.short,
  ];

  final List<TapType> _currentSequence = [];
  Timer? _resetTimer;

  void _resetSequence() {
    _currentSequence.clear();
  }

  void _registerTap(TapType tap) {
    // Отменяем предыдущий таймер и запускаем новый
    _resetTimer?.cancel();
    _currentSequence.add(tap);

    // Проверяем, совпадает ли текущая последовательность
    // с началом нужного паттерна
    for (var i = 0; i < _currentSequence.length; i++) {
      if (_currentSequence[i] != _pattern[i]) {
        _resetSequence();
        return;
      }
    }

    // Если последовательность полная, вызываем callback и сбрасываем состояние
    if (_currentSequence.length == _pattern.length) {
      _resetSequence();
      Future.delayed(
        Duration.zero,
        _promptPassword,
      );

      return;
    }

    // Если последовательность не полная, запускаем таймер сброса
    _resetTimer = Timer(widget.timeoutBetweenTaps, _resetSequence);
  }

  void pushDebugScreen() {
    final checkContext = widget.navigatorKey != null &&
            widget.navigatorKey!.currentContext != null
        ? widget.navigatorKey!.currentContext!
        : context;
    checkContext.router.push(
      const DebugRoute(),
    );
  }

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

    // Определяем текущую платформу
    final isIOS = Platform.isIOS;

    if (isIOS) {
      // Cupertino стиль для iOS
      return showCupertinoDialog<bool>(
        context: checkContext,
        useRootNavigator: false,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return CupertinoAlertDialog(
                title: Text(context.l10n.enterInDebugMode),
                content: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: CupertinoTextField(
                    controller: controller,
                    placeholder: context.l10n.password,
                    obscureText: obscureText,
                    autofocus: true,
                    suffix: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: CupertinoColors.systemGrey,
                        size: 22,
                      ),
                    ),
                    onSubmitted: (_) => handleSubmit(context),
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      context.router.maybePop(false);
                    },
                    isDestructiveAction: true,
                    child: Text(context.l10n.cancel),
                  ),
                  CupertinoDialogAction(
                    onPressed: () => handleSubmit(context),
                    isDefaultAction: true,
                    child: Text(context.l10n.login),
                  ),
                ],
              );
            },
          );
        },
      );
    } else {
      // Material стиль для других платформ
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
                      child: Text(context.l10n.cancel),
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
      onTap: () => _registerTap(TapType.short),
      onLongPress: () => _registerTap(TapType.long),
      child: widget.child,
    );
  }
}
