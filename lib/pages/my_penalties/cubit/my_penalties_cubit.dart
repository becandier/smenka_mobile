import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/pages/my_penalties/cubit/my_penalties_state.dart';

/// Свои штрафы за период (employee, `my-penalties`, только чтение).
class MyPenaltiesCubit extends Cubit<MyPenaltiesState>
    with PaginationMixin<MyPenaltiesState> {
  MyPenaltiesCubit({
    required String orgId,
    required PenaltyRepository penaltyRepository,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _penaltyRepository = penaltyRepository,
       _organizationRepository = organizationRepository,
       super(const MyPenaltiesState()) {
    loadPenalties();
    unawaited(_loadOrganizationTimezone());
  }

  final String _orgId;
  final PenaltyRepository _penaltyRepository;
  final OrganizationRepository _organizationRepository;

  /// Один запрос за время жизни экрана — таймзона нужна и для пресетов
  /// ([_window]), и для карточек/чипа диапазона (`MyPenaltiesPage`).
  /// Ошибка молча оставляет дефолт (см.
  /// `MyPenaltiesState.organizationTimezone`).
  Future<void> _loadOrganizationTimezone() async {
    final result = await _organizationRepository.getById(_orgId);
    result.fold(
      onSuccess: (org) {
        emit(state.copyWith(organizationTimezone: org.timezone));
        // Пресеты уже вычислены с дефолтной зоной — пересчитываем под
        // фактическую, если пользователь ещё не переключился на диапазон.
        if (!state.isCustomRange) loadPenalties();
      },
      onFailure: (_) {},
    );
  }

  ({DateTime? from, DateTime? to}) get _window {
    final preset = state.preset;
    if (preset != null) {
      final bounds = preset.boundsUtc(
        DateTime.now().toUtc(),
        state.timeContext,
      );
      return (from: bounds.fromUtc, to: bounds.toUtc);
    }
    return (from: state.customFrom, to: state.customTo);
  }

  Future<void> loadPenalties({bool isRefresh = true}) {
    final window = _window;
    return fetchPaginated<MyPenalty>(
      getSection: (s) => s.penalties,
      updateState: (s, section) => s.copyWith(penalties: section),
      fetch: (page, perPage) => _penaltyRepository.getMyPenalties(
        _orgId,
        dateFrom: window.from,
        dateTo: window.to,
        limit: perPage,
        offset: (page - 1) * perPage,
      ),
      isRefresh: isRefresh,
    );
  }

  void loadMore() => loadPenalties(isRefresh: false);

  void setPreset(PeriodPreset preset) {
    if (preset == state.preset) return;
    emit(state.copyWith(preset: preset, customFrom: null, customTo: null));
    loadPenalties();
  }

  /// Произвольное окно (UTC-границы). Обе `null` — возврат к месяцу.
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) setPreset(PeriodPreset.month);
      return;
    }
    emit(state.copyWith(preset: null, customFrom: dateFrom, customTo: dateTo));
    loadPenalties();
  }
}
