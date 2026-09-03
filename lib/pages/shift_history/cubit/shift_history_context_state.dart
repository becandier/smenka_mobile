import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_history_context_state.freezed.dart';

@freezed
abstract class ShiftHistoryContextState with _$ShiftHistoryContextState {
  const factory ShiftHistoryContextState({
    @Default(SectionData<List<Organization>>())
    SectionData<List<Organization>> organizations,

    /// Резолв контекста ещё не завершён (нет сохранённого выбора — ждём
    /// загрузку организаций для дефолта, см. mobile.md, «Загрузка»).
    /// `ShiftHistoryCubit`/`ShiftStatsCubit` не должны запрашивать данные,
    /// пока это `true`.
    @Default(true) bool isLoading,

    /// `null` — контекст ничем не ограничивает выборку: либо доступных
    /// организаций нет вовсе (селектор скрыт, `scope` на бэк не уходит),
    /// либо резолв ещё не завершён ([isLoading]). Иначе — одно из значений
    /// `all`/`personal`/`organization`, выбранное пользователем или
    /// вычисленное по умолчанию.
    ShiftScope? scope,

    /// Заполнено только при `scope == ShiftScope.organization`.
    String? organizationId,
  }) = _ShiftHistoryContextState;
  const ShiftHistoryContextState._();

  /// Организации, доступные для истории: подмножество [organizations], где
  /// пользователь — участник (`myRole != owner`). По ADR-001 owner не
  /// member и смен в организации не имеет (см. mobile.md, «Терминология»).
  List<Organization> get availableOrganizations {
    final orgs = organizations.data;
    if (orgs == null) return const <Organization>[];
    return orgs.where((o) => !o.myRole.isOwner).toList(growable: false);
  }

  /// Организации загружены успешно и доступная для истории хотя бы одна —
  /// только тогда показывается селектор (mobile.md, «Селектор контекста»).
  bool get hasOrganizations =>
      organizations.isSuccess && availableOrganizations.isNotEmpty;

  Organization? get selectedOrganization {
    if (scope != ShiftScope.organization) return null;
    final id = organizationId;
    if (id == null) return null;
    return availableOrganizations.where((o) => o.id == id).firstOrNull;
  }

  /// Контекст представления времени для КОНКРЕТНОЙ смены списка: её
  /// собственная таймзона ([Shift.organizationTimezone]) либо (rolling
  /// fallback) уже загруженная организация из [availableOrganizations] —
  /// без лишнего запроса на каждую смену. Актуально и для «Все смены»
  /// (список из нескольких организаций — контекст своей строки), и для
  /// фильтра по одной организации.
  AppTimeContext timeContextFor(Shift shift) {
    final orgId = shift.organizationId;
    if (orgId == null) return const AppTimeContext.device();
    final scopedTimezone = availableOrganizations
        .where((o) => o.id == orgId)
        .firstOrNull
        ?.timezone;
    return shift.timeContext(scopedOrganizationTimezone: scopedTimezone);
  }

  /// Контекст календарных вычислений периода/фильтра ЭКРАНА (не строки):
  /// своя IANA-зона на экране конкретной организации, иначе — устройство,
  /// поскольку общий фильтр «Все смены»/«Персональные» не может
  /// одновременно представлять календарные сутки нескольких организаций.
  AppTimeContext get periodContext {
    if (scope != ShiftScope.organization) return const AppTimeContext.device();
    final timeZone = selectedOrganization?.timezone;
    return timeZone == null
        ? const AppTimeContext.device()
        : AppTimeContext.organization(timeZone);
  }
}
