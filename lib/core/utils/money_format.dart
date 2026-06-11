/// Форматирование и парсинг денег. Деньги в приложении — только целые
/// минорные единицы (копейки, `int`); double не используется
/// ни при парсинге, ни при хранении (см. ТЗ payroll).
library;

/// `1234567` (копейки) → `12 345,67 ₽` (узкий неразрывный пробел-разделитель).
String formatMoneyMinor(int amountMinor) {
  final isNegative = amountMinor < 0;
  final absolute = amountMinor.abs();
  final rubles = absolute ~/ 100;
  final kopecks = absolute % 100;

  final digits = rubles.toString();
  final grouped = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    grouped.write(digits[i]);
    final remaining = digits.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      grouped.write(' ');
    }
  }

  final sign = isNegative ? '−' : '';
  final kopecksStr = kopecks.toString().padLeft(2, '0');
  return '$sign$grouped,$kopecksStr ₽';
}

/// Допустимый ввод суммы: только цифры рублей и до двух цифр копеек.
/// Строгий шаблон отсекает hex (`0x10`), знаки (`+`/`-`), экспоненту —
/// всё то, что молча принял бы `int.tryParse`.
final RegExp _rublesInputPattern = RegExp(r'^(\d{1,9})(?:[.,](\d{1,2}))?$');

/// Ввод суммы в рублях («150», «150,5», «150.50») → копейки.
/// Без double: целочисленный разбор рублей и копеек.
/// `null` — ввод некорректен (пусто, не число, знак/hex, больше 2 знаков
/// после запятой, больше 9 цифр рублей — защита от переполнения).
int? parseRublesToMinor(String input) {
  final normalized = input.trim().replaceAll(' ', '').replaceAll('\u00A0', '');
  final match = _rublesInputPattern.firstMatch(normalized);
  if (match == null) return null;

  final rubles = int.parse(match.group(1) ?? '0');
  final kopecksStr = match.group(2);
  final kopecks = kopecksStr == null
      ? 0
      : int.parse(kopecksStr.padRight(2, '0'));

  return rubles * 100 + kopecks;
}
