import 'dart:async';

import 'package:app_links/app_links.dart';

/// Сервис обработки deep links.
/// Парсит входящие URI и извлекает инвайт-коды.
class DeepLinkService {
  DeepLinkService({required String webAppHost})
    : _webAppHost = webAppHost,
      _appLinks = AppLinks();

  /// Хост веб-версии (из `AppConfig.webAppHost`) — им проверяем universal
  /// links `https://{webAppHost}/invite/{code}`, без хардкода домена.
  final String _webAppHost;
  final AppLinks _appLinks;
  StreamSubscription<Uri>? _subscription;

  final _inviteCodeController = StreamController<String>.broadcast();

  /// Стрим инвайт-кодов из deep links, пришедших пока приложение уже
  /// запущено (живой стрим `app_links`).
  Stream<String> get inviteCodeStream => _inviteCodeController.stream;

  /// Код из ссылки холодного старта (тем, чем был запущен процесс), если он
  /// найден раньше, чем на [inviteCodeStream] успели подписаться.
  ///
  /// [_inviteCodeController] — broadcast-стрим, он не хранит историю событий:
  /// если `_handleUri` из `getInitialLink()` сработает раньше подписки в
  /// `success_app.dart` (а `init()` вызывается на фазе 5.5 `MainAppCubit`,
  /// то есть до создания `_SuccessApp`/подписки), событие будет потеряно
  /// молча. Поэтому холодный старт не льём в стрим, а буферизуем здесь и
  /// отдаём один раз через [consumeInitialCode].
  String? _initialCode;

  /// Инициализация: подписка на стрим и проверка initial link
  Future<void> init() async {
    _subscription = _appLinks.uriLinkStream.listen(_handleUri);

    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _initialCode = _extractInviteCode(initialUri);
    }
  }

  /// Забрать код холодного старта один раз (сразу после подписки на
  /// [inviteCodeStream]). Повторный вызов вернёт `null`.
  String? consumeInitialCode() {
    final code = _initialCode;
    _initialCode = null;
    return code;
  }

  void _handleUri(Uri uri) {
    final code = _extractInviteCode(uri);
    if (code != null) {
      _inviteCodeController.add(code);
    }
  }

  /// Извлечь инвайт-код из URI.
  /// Поддерживает:
  /// - smenka://invite/{code} (обратная совместимость со старыми ссылками)
  /// - https://{webAppHost}/invite/{code} (каноническая ссылка-приглашение)
  ///
  /// Мусорные ссылки (без кода, чужой хост/путь) — возвращают `null` без
  /// исключений.
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

    // Universal link: https://{webAppHost}/invite/ABC12345
    // pathSegments = ["invite", "ABC12345"]. Хост сравниваем без учёта
    // регистра — OS обычно уже отдаёт lower-case host, но не полагаемся на это.
    final isConfiguredWebHost =
        uri.host.toLowerCase() == _webAppHost.toLowerCase();
    if (isConfiguredWebHost &&
        uri.pathSegments.length >= 2 &&
        uri.pathSegments.first == 'invite') {
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
