import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/pages/payroll/cubit/payroll_state.dart';

/// Отчёт «кому сколько заплатить» за период (admin/owner).
class PayrollCubit extends Cubit<PayrollState> {
  PayrollCubit({
    required String orgId,
    required PayrollRepository payrollRepository,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _payrollRepository = payrollRepository,
        _organizationRepository = organizationRepository,
        super(const PayrollState()) {
    load();
    loadMembers();
  }

  final String _orgId;
  final PayrollRepository _payrollRepository;
  final OrganizationRepository _organizationRepository;

  String get orgId => _orgId;

  /// Монотонный токен запроса: ответы устаревших запросов игнорируются.
  int _requestId = 0;

  Future<void> load() async {
    final requestId = ++_requestId;
    emit(state.copyWith(payroll: state.payroll.toLoading()));

    final (DateTime? dateFrom, DateTime? dateTo) = switch (state.preset) {
      final preset? => () {
          final bounds = preset.boundsUtc(DateTime.now());
          return (bounds.fromUtc, bounds.toUtc);
        }(),
      null => (state.customFrom, state.customTo),
    };

    final result = await _payrollRepository.getPayroll(
      _orgId,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
    if (requestId != _requestId) return;

    result.fold(
      onSuccess: (payroll) {
        emit(state.copyWith(payroll: state.payroll.toSuccess(payroll)));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            payroll: state.payroll.toError(error.message, code: error.code),
          ),
        );
      },
    );
  }

  /// Карта участников для навигации на деталь. Ошибка не критична:
  /// отчёт работает и без неё; UI повторяет загрузку при тапе по строке,
  /// для которой участник не нашёлся.
  Future<void> loadMembers() async {
    final result = await _organizationRepository.getMembers(_orgId);
    result.fold(
      onSuccess: (members) {
        emit(
          state.copyWith(
            membersByUserId: {
              for (final member in members) member.userId: member,
            },
          ),
        );
      },
      onFailure: (_) {
        // Навигация на деталь участника будет недоступна — не критично.
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
    emit(
      state.copyWith(preset: null, customFrom: dateFrom, customTo: dateTo),
    );
    load();
  }
}
