/// Округляет [duration] вверх до целых минут — так «40 сек осталось» не
/// схлопывается в «0 мин» (что читалось бы как «время вышло», хотя действие
/// ещё разрешено). НЕ форматирование настенного времени (это разница двух
/// UTC-моментов) — поэтому не через `AppTime`, а обычная арифметика
/// `Duration`.
///
/// Используется для обратных отсчётов окна дозаполнения чек-листа
/// (`checklist_grace_period`): шапка `ChecklistFillPage` и блок на
/// idle-экране `ShiftTrackerPage`.
int wholeMinutesCeil(Duration duration) {
  if (duration <= Duration.zero) return 0;
  return (duration.inSeconds / 60).ceil();
}
