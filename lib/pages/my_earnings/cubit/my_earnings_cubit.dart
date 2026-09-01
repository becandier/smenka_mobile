import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/pages/my_earnings/cubit/my_earnings_state.dart';

/// Личный заработок сотрудника за период (org_member).
class MyEarningsCubit extends Cubit<MyEarningsState> {
  MyEarningsCubit({
    required String orgId,
    required PayrollRepository payrollRepository,
    DateTime? initialDateFrom,
    DateTime? initialDateTo,
  }) : _orgId = orgId,
       _payrollRepository = payrollRepository,
       super(_resolveInitialState(initialDateFrom, initialDateTo)) {
    load();
  }

  final String _orgId;
  final PayrollRepository _payrollRepository;

  String get orgId => _orgId;

  /// Границы пришли из истории смен (`earnings_drilldown/mobile.md`, «A») —
  /// стартуем сразу на произвольном окне с этими датами вместо дефолтного
  /// пресета «месяц». Обе даты должны быть заданы вместе: `dateFrom`/
  /// `dateTo` в истории всегда приходят парой (`ShiftHistoryPeriodState`).
  static MyEarningsState _resolveInitialState(
    DateTime? dateFrom,
    DateTime? dateTo,
  ) {
    if (dateFrom == null || dateTo == null) return const MyEarningsState();
    return MyEarningsState(
      preset: null,
      customFrom: dateFrom,
      customTo: dateTo,
    );
  }

  /// Монотонный токен запроса: ответы устаревших запросов игнорируются.
  int _requestId = 0;

  Future<void> load() async {
    final requestId = ++_requestId;
    emit(state.copyWith(earnings: state.earnings.toLoading()));

    final (DateTime? dateFrom, DateTime? dateTo) = switch (state.preset) {
      final preset? => () {
        final bounds = preset.boundsUtc(DateTime.now());
        return (bounds.fromUtc, bounds.toUtc);
      }(),
      null => (state.customFrom, state.customTo),
    };

    final result = await _payrollRepository.getMyEarnings(
      _orgId,
      dateFrom: dateFrom,
      dateTo: dateTo,
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

  void setPreset(PeriodPreset preset) {
    if (preset == state.preset) return;
    emit(state.copyWith(preset: preset, customFrom: null, customTo: null));
    load();
  }

  /// Произвольное окно (UTC-границы). Обе `null` — возврат к месяцу.
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) setPreset(PeriodPreset.month);
      return;
    }
    emit(state.copyWith(preset: null, customFrom: dateFrom, customTo: dateTo));
    load();
  }
}
