import 'package:flutter/material.dart';
import 'package:smenka_mobile/widgets/app_toast/app_toast_manager.dart';

extension AppModalsX on BuildContext {
  AppModals get modals => AppModals._(this);
}

class AppModals {
  const AppModals._(this._context);

  final BuildContext _context;

  void showError(String message) {
    AppToastManager.instance.showError(_context, message);
  }

  void showSuccess(String message) {
    AppToastManager.instance.showSuccess(_context, message);
  }

  void showInfo(String message) {
    AppToastManager.instance.showInfo(_context, message);
  }

  void showWarning(String message) {
    AppToastManager.instance.showWarning(_context, message);
  }
}
