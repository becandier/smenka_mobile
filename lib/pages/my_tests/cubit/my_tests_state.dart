import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/employee_test/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'my_tests_state.freezed.dart';

@freezed
abstract class MyTestsState with _$MyTestsState {
  const factory MyTestsState({
    @Default(PaginatedSectionData<TestAssignment>())
    PaginatedSectionData<TestAssignment> assignments,

    /// Мои организации — для чипов фильтра. Список может быть пуст, пока
    /// не подгрузился (первый экран без организаций скрывает фильтр-ряд).
    @Default(<Organization>[]) List<Organization> organizations,

    /// `null` — «Все организации».
    String? filterOrganizationId,
  }) = _MyTestsState;
  const MyTestsState._();

  /// Контекст представления дедлайна/попыток назначения: см.
  /// `TestAssignmentTimeContext.timeContext` — основной источник это
  /// self-contained `TestAssignment.organizationTimezone` (backend
  /// `23dc2e3`); резолв по уже загруженному [organizations] (без лишнего
  /// запроса на каждое назначение) остаётся клиентским фолбэком на время
  /// rolling-деплоя/невалидной серверной зоны.
  AppTimeContext timeContextFor(TestAssignment assignment) {
    final scopedTimeZone = organizations
        .where((o) => o.id == assignment.organizationId)
        .firstOrNull
        ?.timezone;
    return assignment.timeContext(scopedOrganizationTimezone: scopedTimeZone);
  }
}
