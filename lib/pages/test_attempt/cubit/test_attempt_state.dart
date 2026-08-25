import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/_models.dart';

part 'test_attempt_state.freezed.dart';

/// Причина, по которой назначение больше недоступно — админ снял его в
/// любой момент (уведомления сотруднику не приходит) или тест удалён, пока
/// сотрудник был на экране. Оба кода приводят к одному и тому же экрану
/// («Тест больше не назначен» / «Тест удалён»), см.
/// `docs/tasks/test_assignment_unassign/mobile.md`.
enum TestUnassignedReason {
  assignmentNotFound('TEST_ASSIGNMENT_NOT_FOUND'),
  templateDeleted('TEST_TEMPLATE_DELETED');

  const TestUnassignedReason(this.value);

  final String value;

  static TestUnassignedReason? fromValue(String? value) =>
      values.where((e) => e.value == value).firstOrNull;
}

@freezed
abstract class TestAttemptState with _$TestAttemptState {
  const factory TestAttemptState({
    @Default(FeatureStatus.initial) FeatureStatus status,
    String? error,
    String? errorCode,

    /// Мета назначения (шаблон, лучший % за прошлые попытки, дедлайн) —
    /// грузится первой, используется и в fill-режиме, и в блокирующем.
    TestAssignment? assignment,

    /// Текущая попытка в процессе прохождения (снимок вопросов). `null`,
    /// когда экран показывает результат или блокирующее сообщение.
    TestAttemptFill? attempt,

    /// Локальный выбор варианта(ов) по `attempt_question_id`. Живёт отдельно
    /// от [attempt] — снимок вопросов с сервера не мутируется.
    @Default(<String, Set<String>>{})
    Map<String, Set<String>> selectedOptionIds,
    @Default(false) bool submitting,
    String? submitErrorCode,
    String? submitError,

    /// Результат после `submit` (или просмотр уже сданной попытки).
    TestResult? result,

    /// `true` — старт попытки невозможен (уже сдан / попытки исчерпаны /
    /// шаблон архивный). Причина — в [errorCode]; итоговый % — из
    /// [assignment] (денормализованные `bestPercent`/`passed`), без
    /// дополнительного похода за попыткой.
    @Default(false) bool blocked,

    /// `true` — назначение снято админом или тест удалён навсегда
    /// (см. [TestUnassignedReason]). В отличие от [blocked] это не
    /// техническая ошибка и не «попробуйте позже» — назначения больше не
    /// существует, повторный запрос ничего не изменит.
    @Default(false) bool unassigned,
  }) = _TestAttemptState;
  const TestAttemptState._();

  bool get isLoading =>
      status == FeatureStatus.loading || status == FeatureStatus.initial;
  bool get isFatalError => status == FeatureStatus.error;
  bool get isFilling =>
      attempt != null && result == null && !blocked && !unassigned;
  bool get isResult => result != null;

  TestUnassignedReason? get unassignedReason =>
      unassigned ? TestUnassignedReason.fromValue(errorCode) : null;

  int get answeredCount =>
      selectedOptionIds.values.where((s) => s.isNotEmpty).length;
}
