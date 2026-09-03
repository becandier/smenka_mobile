import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/data/domain/adjustment/_adjustment.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/my_adjustments/cubit/my_adjustments_state.dart';

/// Свои начисления/удержания за период (employee, `my-adjustments`, только
/// чтение; `manual_time_entry`).
class MyAdjustmentsCubit extends Cubit<MyAdjustmentsState>
    with PaginationMixin<MyAdjustmentsState> {
  MyAdjustmentsCubit({
    required String orgId,
    required AdjustmentRepository adjustmentRepository,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _adjustmentRepository = adjustmentRepository,
       _organizationRepository = organizationRepository,
       super(const MyAdjustmentsState()) {
    loadAdjustments();
    unawaited(_loadOrganizationTimezone());
  }

  final String _orgId;
  final AdjustmentRepository _adjustmentRepository;
  final OrganizationRepository _organizationRepository;

  /// Один запрос за время жизни экрана (см. `MyPenaltiesCubit`, тот же
  /// приём). Ошибка молча оставляет дефолт.
  Future<void> _loadOrganizationTimezone() async {
    final result = await _organizationRepository.getById(_orgId);
    result.fold(
      onSuccess: (org) {
        emit(state.copyWith(organizationTimezone: org.timezone));
        if (!state.isCustomRange) loadAdjustments();
      },
      onFailure: (_) {},
    );
  }

  ({DateTime? from, DateTime? to}) get _window {
    final preset = state.preset;
    if (preset != null) {
      final bounds = preset.boundsUtc(DateTime.now().toUtc(), state.timeContext);
      return (from: bounds.fromUtc, to: bounds.toUtc);
    }
    return (from: state.customFrom, to: state.customTo);
  }

  Future<void> loadAdjustments({bool isRefresh = true}) {
    final window = _window;
    return fetchPaginated<MyAdjustment>(
      getSection: (s) => s.adjustments,
      updateState: (s, section) => s.copyWith(adjustments: section),
      fetch: (page, perPage) => _adjustmentRepository.getMyAdjustments(
        _orgId,
        dateFrom: window.from,
        dateTo: window.to,
        limit: perPage,
        offset: (page - 1) * perPage,
      ),
      isRefresh: isRefresh,
    );
  }

  void loadMore() => loadAdjustments(isRefresh: false);

  void setPreset(PeriodPreset preset) {
    if (preset == state.preset) return;
    emit(state.copyWith(preset: preset, customFrom: null, customTo: null));
    loadAdjustments();
  }

  /// Произвольное окно (UTC-границы). Обе `null` — возврат к месяцу.
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) setPreset(PeriodPreset.month);
      return;
    }
    emit(state.copyWith(preset: null, customFrom: dateFrom, customTo: dateTo));
    loadAdjustments();
  }
}
