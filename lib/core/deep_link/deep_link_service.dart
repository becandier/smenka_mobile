import 'dart:async';

import 'package:app_links/app_links.dart';

/// Сервис обработки deep links.
/// Парсит входящие URI и извлекает инвайт-коды.
class DeepLinkService {
  DeepLinkService() : _appLinks = AppLinks();

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _subscription;

  final _inviteCodeController = StreamController<String>.broadcast();

  /// Стрим инвайт-кодов из deep links
  Stream<String> get inviteCodeStream => _inviteCodeController.stream;

  /// Инициализация: подписка на стрим и проверка initial link
  Future<void> init() async {
    _subscription = _appLinks.uriLinkStream.listen(_handleUri);

    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _handleUri(initialUri);
    }
  }

  void _handleUri(Uri uri) {
    final code = _extractInviteCode(uri);
    if (code != null) {
      _inviteCodeController.add(code);
    }
  }

  /// Извлечь инвайт-код из URI.
  /// Поддерживает:
  /// - smenka://invite/{code}
  /// - https://smenka.app/invite/{code}
  String? _extractInviteCode(Uri uri) {
    // Custom scheme: smenka://invite/ABC12345
    // host = "invite", pathSegments = ["ABC12345"]
    if (uri.scheme == 'smenka' && uri.host == 'invite') {
      final segments = uri.pathSegments;
      if (segments.isNotEmpty && segments.first.isNotEmpty) {
        return segments.first;
      }
      return null;
    }

    // Universal link: https://smenka.app/invite/ABC12345
    // pathSegments = ["invite", "ABC12345"]
    if (uri.pathSegments.length >= 2 && uri.pathSegments.first == 'invite') {
      final code = uri.pathSegments[1];
      if (code.isNotEmpty) return code;
    }

    return null;
  }

  void dispose() {
    _subscription?.cancel();
    _inviteCodeController.close();
  }
}
