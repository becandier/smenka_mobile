import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Архитектурный guard единого временного контура (design.md, «Защита от
/// регрессий», п.1): рукописный presentation-код НЕ должен форматировать
/// UTC-момент напрямую через `intl`/`DateFormat` и НЕ должен звать
/// `.toLocal()` — единственная точка форматирования и конвертации в
/// настенное время явного `AppTimeContext` — `lib/core/time/app_time.dart`.
///
/// Запрещённые паттерны в файле → провал теста с точным перечнем
/// файл+паттерн:
/// - `import 'package:intl/intl.dart'` (форматирование дат мимо `AppTime`;
///   единственное легитимное использование `intl` в проекте — генерируемая
///   локализация, см. [_isExcluded]);
/// - `.toLocal()` — прямой перевод в таймзону устройства мимо явного
///   контекста;
/// - `DateFormat(` — прямое форматирование момента, а не через
///   `AppTime.formatDate/formatTime/formatDateTime`.
///
/// Не сканируются: генерируемые `.g.dart`/`.freezed.dart`, генерируемая
/// локализация `lib/l10n/app_localizations*.dart` (`flutter gen-l10n`) и
/// явно документированные низкоуровневые исключения — см. [_exceptions].
void main() {
  test('presentation-код не форматирует время мимо AppTime/AppTimeContext', () {
    final libDir = Directory('${_projectRoot().path}/lib');
    expect(
      libDir.existsSync(),
      isTrue,
      reason:
          'lib/ directory not found relative to project root '
          '${_projectRoot().path} — run this test from the mobile package',
    );

    final violations = <_Violation>[];

    for (final entity in libDir.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      final relativePath = entity.path
          .substring(_projectRoot().path.length)
          .replaceAll(r'\', '/') // на случай запуска на Windows
          .replaceFirst(RegExp('^/?'), '');

      if (_isGenerated(relativePath) || _isExcluded(relativePath)) {
        continue;
      }

      final content = entity.readAsStringSync();
      violations.addAll(_scan(relativePath, content));
    }

    if (violations.isEmpty) return;

    final report = violations
        .map((v) => '  ${v.filePath} — ${v.pattern}')
        .join('\n');
    fail(
      'Найдены запрещённые паттерны форматирования времени вне '
      'lib/core/time/ (design.md, «Защита от регрессий», п.1). '
      'Используйте AppTime/AppTimeContext с явным контекстом:\n$report',
    );
  });
}

class _Violation {
  const _Violation(this.filePath, this.pattern);

  final String filePath;
  final String pattern;
}

/// Генерируемый код — не сканируем content-wise вовсе.
bool _isGenerated(String relativePath) {
  if (relativePath.endsWith('.g.dart')) return true;
  if (relativePath.endsWith('.freezed.dart')) return true;
  // auto_route (`build_runner`) — тот же класс генерируемого кода, другое
  // расширение.
  if (relativePath.endsWith('.gr.dart')) return true;
  // `flutter gen-l10n` — не имеет суффикса .g.dart/.freezed.dart, но это
  // такой же полностью генерируемый код (ARB → Dart), легитимно использующий
  // `intl` для инфраструктуры локализации.
  if (relativePath.startsWith('lib/l10n/app_localizations')) return true;
  return false;
}

/// Явно документированные низкоуровневые исключения — единственные места
/// вне `lib/core/time/`, которым разрешено напрямую использовать
/// `intl`/`DateFormat`/`.toLocal()`. Каждое исключение обязано быть
/// задокументировано doc-комментарием в самом файле (design.md, «Защита от
/// регрессий»).
const _exceptions = <String>{
  // Единственная точка форматирования и конвертации в настенное время —
  // сам модуль.
  'lib/core/time/app_time.dart',

  // Низкоуровневый IANA/DST-движок (`timezone` package), на котором
  // построен `AppTime`. Единственный вызывающий — `app_time.dart`; здесь же
  // остаются день-diff хелперы (`orgLocalDayDiff`), используемые напрямую
  // ДВУМЯ presentation-файлами для календарного сравнения (не форматирования
  // — возвращают `int`, а не строку), поэтому не триггерят паттерны guard'а.
  'lib/core/utils/org_timezone.dart',

  // Календарный пикер: пользователь выбирает голый календарный день
  // (год/месяц/день, БЕЗ привязки к таймзоне — см. doc-комментарий
  // `DateRangePickerResult` в самом файле) — это не форматирование
  // UTC API-момента, а отображение уже выбранной локальной даты. Перевод
  // выбранного дня в UTC-границы явного контекста делает вызывающая сторона
  // через `AppTime().utcBoundsForDay`.
  'lib/pages/date_range_picker/view/date_range_picker_page.dart',
};

bool _isExcluded(String relativePath) => _exceptions.contains(relativePath);

final RegExp _intlImportPattern = RegExp(
  r'''import\s+['"]package:intl/intl\.dart['"]''',
);
final RegExp _toLocalPattern = RegExp(r'\.toLocal\s*\(\s*\)');
final RegExp _dateFormatCallPattern = RegExp(r'\bDateFormat\s*\(');

List<_Violation> _scan(String relativePath, String content) {
  final found = <_Violation>[];
  if (_intlImportPattern.hasMatch(content)) {
    found.add(_Violation(relativePath, "import 'package:intl/intl.dart'"));
  }
  if (_toLocalPattern.hasMatch(content)) {
    found.add(_Violation(relativePath, '.toLocal()'));
  }
  if (_dateFormatCallPattern.hasMatch(content)) {
    found.add(_Violation(relativePath, 'DateFormat('));
  }
  return found;
}

/// Корень пакета mobile (там, где `pubspec.yaml`) — тест должен находить
/// `lib/` независимо от того, из какой рабочей директории запущен
/// `flutter test` (IDE запускает из корня пакета, но не гарантированно).
Directory _projectRoot() {
  var dir = Directory.current;
  while (true) {
    if (File('${dir.path}/pubspec.yaml').existsSync()) return dir;
    final parent = dir.parent;
    if (parent.path == dir.path) {
      throw StateError('pubspec.yaml not found above ${Directory.current}');
    }
    dir = parent;
  }
}
