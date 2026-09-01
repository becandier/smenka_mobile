/// Срез истории смен для `GET /shifts` и `GET /shifts/stats`
/// (`shift_history_scope/backend.md`).
///
/// `null` на уровне репозитория/кубитов = параметр `scope` не передаётся
/// вовсе — обратно совместимо с поведением до этой фичи (бэк трактует
/// отсутствие параметра как [all]).
enum ShiftScope {
  all('all'),
  personal('personal'),
  organization('organization');

  const ShiftScope(this.value);

  final String value;

  static ShiftScope? fromValue(String? value) =>
      values.where((scope) => scope.value == value).firstOrNull;
}
