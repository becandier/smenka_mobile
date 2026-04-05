import 'package:flutter/foundation.dart';
import 'package:smenka_mobile/data/domain/auth/models/_models.dart';

/// Реактивный нотифаер состояния авторизации.
/// Используется как reevaluateListenable в auto_route
/// для автоматического пересчёта guards при смене состояния.
class AuthStateNotifier extends ChangeNotifier {
  AuthState _state = const AuthState.unknown();

  /// Текущее состояние авторизации
  AuthState get state => _state;

  /// Авторизован ли пользователь
  bool get isAuthenticated => _state is AuthStateAuthenticated;

  /// Обновить состояние и уведомить слушателей
  void setState(AuthState newState) {
    if (_state == newState) return;
    _state = newState;
    notifyListeners();
  }
}
