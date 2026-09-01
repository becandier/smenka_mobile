import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/domain/payroll/repositories/payroll_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_earnings_state.dart';

/// Заработок за период в шапке «Истории смен»
/// (`shift_history_earnings/mobile.md`, «B. Деньги за период»).
///
/// Новый и независимый кубит — не знает ни о `ShiftHistoryCubit`, ни о
/// `ShiftStatsCubit`. Контекст (`scope`/`organizationId`) и окно
/// (`dateFrom`/`dateTo`) приходят извне от `ShiftHistoryPage`, как уже
/// сделано для остальных кубитов экрана (`setContext`/`setPeriod` — тот же
/// приём, что и `ShiftHistoryCubit`/`ShiftStatsCubit`).
///
/// Запрос `GET /organizations/{org_id}/my-earnings` уходит, только когда
/// выбран контекст конкретной организации: персональные смены и «все
/// смены» заработка не имеют в принципе (ADR-005 п.8) — запрос вообще не
/// шлётся, а не шлётся и превращается в ошибку/ноль.
class ShiftEarningsCubit extends Cubit<ShiftEarningsState> {
  ShiftEarningsCubit({required PayrollRepository payrollRepository})
    : _payrollRepository = payrollRepository,
      super(const ShiftEarningsState());

  final PayrollRepository _payrollRepository;

  bool _contextApplied = false;
  bool _periodApplied = false;

  /// Монотонный токен запроса: ответы устаревших запросов игнорируются.
  int _requestId = 0;

  void setContext(ShiftScope? scope, String? organizationId) {
    final unchanged =
        _contextApplied &&
        state.scope == scope &&
        state.organizationId == organizationId;
    _contextApplied = true;
    if (unchanged) return;
    emit(state.copyWith(scope: scope, organizationId: organizationId));
    _maybeLoad();
  }

  void setPeriod(DateTime? dateFrom, DateTime? dateTo) {
    final unchanged =
        _periodApplied && state.dateFrom == dateFrom && state.dateTo == dateTo;
    _periodApplied = true;
    if (unchanged) return;
    emit(state.copyWith(dateFrom: dateFrom, dateTo: dateTo));
    _maybeLoad();
  }

  void _maybeLoad() {
    if (!_contextApplied || !_periodApplied) return;
    unawaited(_load());
  }

  Future<void> _load() async {
    final requestId = ++_requestId;
    final organizationId = state.organizationId;

    if (state.scope != ShiftScope.organization || organizationId == null) {
      // Персональный контекст/«все смены» — заработка не существует
      // (ADR-005 п.8), запрос не уходит вовсе; блок в шапке не рисуется.
      emit(state.copyWith(earnings: const SectionData<MyEarnings>()));
      return;
    }

    emit(state.copyWith(earnings: state.earnings.toLoading()));

    final result = await _payrollRepository.getMyEarnings(
      organizationId,
      dateFrom: state.dateFrom,
      dateTo: state.dateTo,
    );
    if (requestId != _requestId) return;

    result.fold(
      onSuccess: (earnings) {
        emit(state.copyWith(earnings: state.earnings.toSuccess(earnings)));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            earnings: state.earnings.toError(error.message, code: error.code),
          ),
        );
      },
    );
  }

  /// Повторить запрос после ошибки (mobile.md: «Ошибка запроса заработка
  /// не ломает экран... вместо денег — состояние ошибки с возможностью
  /// повторить»).
  Future<void> retry() => _load();
}
