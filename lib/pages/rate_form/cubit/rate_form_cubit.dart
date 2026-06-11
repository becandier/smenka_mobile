import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/pages/rate_form/cubit/rate_form_state.dart';

/// Сабмит формы ставки: добавление новой записи истории (POST)
/// либо исправление существующей (PATCH, если передан `rateId`).
class RateFormCubit extends Cubit<RateFormState> {
  RateFormCubit({
    required String orgId,
    required String memberId,
    required PayrollRepository payrollRepository,
    String? rateId,
  }) : _orgId = orgId,
       _memberId = memberId,
       _rateId = rateId,
       _payrollRepository = payrollRepository,
       super(const RateFormState());

  final String _orgId;
  final String _memberId;
  final String? _rateId;
  final PayrollRepository _payrollRepository;

  bool get isEdit => _rateId != null;

  Future<bool> submit({
    required int rateAmountMinor,
    required RateType rateType,
    required DateTime effectiveFromUtc,
    String? note,
  }) async {
    emit(
      state.copyWith(
        status: FeatureStatus.loading,
        errorMessage: null,
        errorCode: null,
      ),
    );

    final rateId = _rateId;
    final result = rateId == null
        ? await _payrollRepository.createRate(
            _orgId,
            _memberId,
            rateAmountMinor: rateAmountMinor,
            rateType: rateType,
            effectiveFrom: effectiveFromUtc,
            note: note,
          )
        : await _payrollRepository.updateRate(
            _orgId,
            _memberId,
            rateId,
            rateAmountMinor: rateAmountMinor,
            rateType: rateType,
            effectiveFrom: effectiveFromUtc,
            note: note,
          );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(status: FeatureStatus.success));
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            status: FeatureStatus.error,
            errorMessage: error.message,
            errorCode: error.code,
          ),
        );
        return false;
      },
    );
  }
}
