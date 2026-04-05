import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smenka_mobile/widgets/app_toast/app_toast.dart';

class AppToastManager {
  AppToastManager._();

  static final AppToastManager _instance = AppToastManager._();
  static AppToastManager get instance => _instance;

  OverlayEntry? _currentEntry;
  Timer? _autoHideTimer;

  void show(
    BuildContext context, {
    required String message,
    required AppToastType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    _autoHideTimer?.cancel();
    _currentEntry?.remove();
    _currentEntry = null;

    final key = GlobalKey<AppToastState>();
    late final OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppToast(
          key: key,
          message: message,
          type: type,
          onDismissed: () => _removeEntry(entry),
        ),
      ),
    );

    _currentEntry = entry;

    Overlay.of(context, rootOverlay: true).insert(entry);

    _autoHideTimer = Timer(duration, () {
      key.currentState?.dismiss();
    });
  }

  void _removeEntry(OverlayEntry entry) {
    entry.remove();
    if (_currentEntry == entry) {
      _currentEntry = null;
    }
  }

  void showSuccess(BuildContext context, String message) {
    show(context, message: message, type: AppToastType.success);
  }

  void showError(BuildContext context, String message) {
    show(context, message: message, type: AppToastType.error);
  }

  void showInfo(BuildContext context, String message) {
    show(context, message: message, type: AppToastType.info);
  }

  void showWarning(BuildContext context, String message) {
    show(context, message: message, type: AppToastType.warning);
  }
}
