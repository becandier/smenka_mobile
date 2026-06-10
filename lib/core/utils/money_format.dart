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

/// Ввод суммы в рублях («150», «150,5», «150.50») → копейки.
/// Без double: целочисленный разбор рублей и копеек.
/// `null` — ввод некорректен (пусто, не число, больше 2 знаков после запятой).
int? parseRublesToMinor(String input) {
  final normalized =
      input.trim().replaceAll(' ', '').replaceAll(' ', '').replaceAll(',', '.');
  if (normalized.isEmpty) return null;

  final parts = normalized.split('.');
  if (parts.length > 2) return null;

  final rubles = int.tryParse(parts[0]);
  if (rubles == null || rubles < 0) return null;

  var kopecks = 0;
  if (parts.length == 2) {
    final kopecksStr = parts[1];
    if (kopecksStr.isEmpty || kopecksStr.length > 2) return null;
    final parsed = int.tryParse(kopecksStr);
    if (parsed == null || parsed < 0) return null;
    kopecks = int.parse(kopecksStr.padRight(2, '0'));
  }

  return rubles * 100 + kopecks;
}
