import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_rates_state.dart';

/// История ставок участника (read-only, фича payroll).
/// Не зависит от MemberDetailCubit: права (viewerRole) проверяет UI.
///
/// Загрузка НЕ стартует в конструкторе: GET .../rates доступен только
/// admin/owner, а деталь участника открывает любой член организации —
/// [loadRates] дёргает секция ставок, которая рендерится только при canManage.
/// Управление ставками (создание/правка/удаление) вынесено в веб-админку.
class MemberRatesCubit extends Cubit<MemberRatesState> {
  MemberRatesCubit({
    required String orgId,
    required String memberId,
    required PayrollRepository payrollRepository,
  }) : _orgId = orgId,
       _memberId = memberId,
       _payrollRepository = payrollRepository,
       super(const MemberRatesState());

  final String _orgId;
  final String _memberId;
  final PayrollRepository _payrollRepository;

  String get orgId => _orgId;
  String get memberId => _memberId;

  Future<void> loadRates() async {
    emit(state.copyWith(rates: state.rates.toLoading()));

    final result = await _payrollRepository.getRates(_orgId, _memberId);

    result.fold(
      onSuccess: (rates) {
        emit(state.copyWith(rates: state.rates.toSuccess(rates)));
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            rates: state.rates.toError(error.message, code: error.code),
          ),
        );
      },
    );
  }
}
