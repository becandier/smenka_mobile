import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/data/api/local/shift_history_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_context_state.dart';

/// Селектор контекста таба «История смен» (`shift_history_scope`).
///
/// Не грузит и не фильтрует сами смены — только резолвит/хранит выбранный
/// [ShiftScope]+`organizationId` и список организаций для селектора.
/// `ShiftHistoryCubit`/`ShiftStatsCubit` получают итоговый контекст извне
/// (см. `ShiftHistoryPage` — слушает этот кубит и прокидывает `setContext`
/// в оба независимых кубита экрана, mobile.md: «инвариант "кубиты не
/// зависят друг от друга" сохраняется»).
///
/// Хранилище — своё, [ShiftHistoryContextStorage], НЕ `ShiftContextStorage`
/// главного экрана (`shift_org_default`): выбор истории независим от
/// контекста трекера.
class ShiftHistoryContextCubit extends Cubit<ShiftHistoryContextState> {
  ShiftHistoryContextCubit({
    required OrganizationRepository organizationRepository,
    required ShiftHistoryContextStorage contextStorage,
  }) : _organizationRepository = organizationRepository,
       _contextStorage = contextStorage,
       super(const ShiftHistoryContextState()) {
    _applySavedMarker(_contextStorage.read());
    _orgSubscription = _organizationRepository.watchMyOrganizations().listen((
      orgs,
    ) {
      emit(state.copyWith(organizations: state.organizations.toSuccess(orgs)));
      _resolveOrReconcile();
    });
    unawaited(_organizationRepository.fetchMyOrganizations());
  }

  final OrganizationRepository _organizationRepository;
  final ShiftHistoryContextStorage _contextStorage;

  StreamSubscription<List<Organization>>? _orgSubscription;

  /// Правило 1 (mobile.md, «Дефолт и запоминание»): сохранённый маркер, если
  /// он есть, применяется сразу, не дожидаясь загрузки организаций —
  /// список смен/статистика уходят с ним немедленно, организации грузятся
  /// параллельно только для подписи и наполнения селектора. Валидность
  /// org-маркера перепроверяется в [_resolveOrReconcile], когда организации
  /// загрузятся.
  void _applySavedMarker(String? marker) {
    if (marker == null) {
      // Сохранённого выбора нет — дефолт вычисляется после загрузки
      // организаций (_resolveOrReconcile), состояние остаётся isLoading.
      return;
    }
    if (marker == ShiftScope.personal.value) {
      emit(
        state.copyWith(
          isLoading: false,
          scope: ShiftScope.personal,
          organizationId: null,
        ),
      );
    } else if (marker == ShiftScope.all.value) {
      emit(
        state.copyWith(
          isLoading: false,
          scope: ShiftScope.all,
          organizationId: null,
        ),
      );
    } else {
      // Иначе — UUID организации.
      emit(
        state.copyWith(
          isLoading: false,
          scope: ShiftScope.organization,
          organizationId: marker,
        ),
      );
    }
  }

  /// Вызывается после каждого апдейта списка организаций.
  ///
  /// Ветка A (правило 2/3, mobile.md): `state.isLoading` — сохранённого
  /// выбора не было, дефолт вычисляется теперь: первая доступная
  /// организация либо (доступных нет) — контекст без ограничения (селектор
  /// скрыт, `scope` не уходит на бэк).
  ///
  /// Ветка B: контекст уже резолвлен (сохранённым маркером) — только
  /// перепроверка валидности. Доступных организаций не осталось вовсе →
  /// молча сбрасываем ограничение (mobile.md: «без ошибки и без тоста»).
  /// Была выбрана организация, которой больше нет среди доступных →
  /// молча переключаем на первую доступную. `personal`/`all` валидны
  /// всегда, пока есть хоть одна доступная организация (иначе см. выше).
  ///
  /// Ни в одном из авто-путей выбор НЕ сохраняется в [_contextStorage] —
  /// персистится только осознанный выбор пользователя (см.
  /// [selectOrganization]/[selectPersonal]/[selectAll]), по аналогии с
  /// `ShiftTrackerCubit._maybePreselectContext`.
  void _resolveOrReconcile() {
    if (!state.organizations.isSuccess) return;
    final available = state.availableOrganizations;

    if (state.isLoading) {
      if (available.isNotEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            scope: ShiftScope.organization,
            organizationId: available.first.id,
          ),
        );
      } else {
        emit(
          state.copyWith(isLoading: false, scope: null, organizationId: null),
        );
      }
      return;
    }

    if (available.isEmpty) {
      if (state.scope != null) {
        emit(state.copyWith(scope: null, organizationId: null));
      }
      return;
    }

    if (state.scope == ShiftScope.organization &&
        !available.any((o) => o.id == state.organizationId)) {
      emit(state.copyWith(organizationId: available.first.id));
    }
  }

  /// Выбор организации в селекторе — осознанное действие, запоминается.
  void selectOrganization(String organizationId) {
    if (state.scope == ShiftScope.organization &&
        state.organizationId == organizationId) {
      return;
    }
    emit(
      state.copyWith(
        isLoading: false,
        scope: ShiftScope.organization,
        organizationId: organizationId,
      ),
    );
    unawaited(_contextStorage.save(organizationId));
  }

  /// Пункт «Персональные» — осознанное действие, запоминается.
  void selectPersonal() {
    if (state.scope == ShiftScope.personal) return;
    emit(
      state.copyWith(
        isLoading: false,
        scope: ShiftScope.personal,
        organizationId: null,
      ),
    );
    unawaited(_contextStorage.save(ShiftScope.personal.value));
  }

  /// Пункт «Все смены» — осознанное действие, запоминается.
  void selectAll() {
    if (state.scope == ShiftScope.all) return;
    emit(
      state.copyWith(
        isLoading: false,
        scope: ShiftScope.all,
        organizationId: null,
      ),
    );
    unawaited(_contextStorage.save(ShiftScope.all.value));
  }

  @override
  Future<void> close() {
    _orgSubscription?.cancel();
    return super.close();
  }
}
