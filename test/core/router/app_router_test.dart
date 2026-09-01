import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Регрессия: тап «Заработано» в истории смен
/// (`shift_history/widgets/stats_section.dart`, `_openMyEarnings`) пушит
/// `MyEarningsRoute` через `context.router.push` — т.е. в навигатор вкладки
/// `history`, а не root. Если маршрут не зарегистрирован в её children,
/// push молча не находит совпадение, и тап визуально ничего не делает.
/// Та же цепочка тянет `MyPenaltiesRoute`/`MyAdjustmentsRoute` — переходы
/// из `MyEarningsPage` (`my_earnings_page.dart`).
///
/// Проверка — на уровне конфигурации `AppRouter.routes`, текстом
/// исходника `app_router.dart`, а не импортом класса и не рендером
/// виджетов: `app_router.dart` тянет `pages/_features.dart` → экраны
/// авторизации → `google_sign_in_web` → `dart:js_interop`/`dart:ui_web`,
/// которых нет на VM-платформе `flutter test` — импорт роутера в тесте
/// не компилируется (проверено: `Dart library 'dart:ui_web' is not
/// available on this platform`). Поэтому единственный практичный способ
/// поймать такую регрессию без запуска UI — разобрать конфигурацию
/// вкладки `history` как текст.
void main() {
  late String historyChildrenBlock;

  setUpAll(() {
    final source = File('lib/core/router/app_router.dart').readAsStringSync();

    const marker = 'page: HistoryTab.page,';
    final tabIdx = source.indexOf(marker);
    expect(
      tabIdx,
      isNot(-1),
      reason: 'Вкладка history (HistoryTab.page) должна быть в app_router.dart',
    );
    expect(
      source.indexOf(marker, tabIdx + marker.length),
      -1,
      reason: 'Ожидается ровно одна регистрация HistoryTab.page',
    );

    const childrenKeyword = 'children: [';
    final childrenStart =
        source.indexOf(childrenKeyword, tabIdx) + childrenKeyword.length;
    expect(
      childrenStart,
      greaterThan(childrenKeyword.length - 1),
      reason: 'После HistoryTab.page должен идти children: [...]',
    );

    // Находим границу списка children подсчётом глубины квадратных скобок:
    // childrenStart уже стоит сразу после открывающей '[', поэтому глубина
    // стартует с 1 и её нужно свести к 0.
    var depth = 1;
    var i = childrenStart;
    while (depth > 0) {
      final ch = source[i];
      if (ch == '[') depth++;
      if (ch == ']') depth--;
      i++;
    }
    historyChildrenBlock = source.substring(childrenStart, i - 1);
  });

  void expectRouteRegistered({
    required String path,
    required String pageGetter,
  }) {
    final pattern = RegExp(
      "path:\\s*'${RegExp.escape(path)}',\\s*page:\\s*"
      '${RegExp.escape(pageGetter)}',
    );
    expect(
      historyChildrenBlock.contains(pattern),
      isTrue,
      reason:
          "Во вкладке history должен быть AutoRoute(path: '$path', "
          'page: $pageGetter) — иначе push этого роута из истории смен '
          'молча ничего не делает.',
    );
  }

  test('MyEarningsRoute зарегистрирован во вкладке history с явным :orgId', () {
    expectRouteRegistered(
      path: 'my-earnings/:orgId',
      pageGetter: 'MyEarningsRoute.page',
    );
  });

  test(
    'MyPenaltiesRoute зарегистрирован во вкладке history с явным :orgId',
    () {
      expectRouteRegistered(
        path: 'my-penalties/:orgId',
        pageGetter: 'MyPenaltiesRoute.page',
      );
    },
  );

  test(
    'MyAdjustmentsRoute зарегистрирован во вкладке history с явным :orgId',
    () {
      expectRouteRegistered(
        path: 'my-adjustments/:orgId',
        pageGetter: 'MyAdjustmentsRoute.page',
      );
    },
  );

  test('DateRangePickerRoute уже доступен во вкладке history '
      '(переиспользуется MyEarnings/MyPenalties/MyAdjustments)', () {
    // Не часть регрессии (маршрут существовал и раньше), но без него
    // выбор произвольного периода на всех трёх экранах из этой же
    // цепочки не откроется — фиксируем как условие целостности цепочки.
    expect(historyChildrenBlock.contains("path: 'date-range',"), isTrue);
    expect(
      historyChildrenBlock.contains('page: DateRangePickerRoute.page,'),
      isTrue,
    );
  });
}
