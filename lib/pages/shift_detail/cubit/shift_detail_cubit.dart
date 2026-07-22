import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_detail/cubit/shift_detail_state.dart';

/// Деталь одной (своей) смены (read-only, кроме заявки на переработку).
///
/// Заявку подаёт отдельная модалка (`OvertimeRequestCubit`); этот кубит
/// только применяет её результат к уже показанной смене и отменяет
/// `pending`-заявку. Оба кубита не зависят друг от друга.
class ShiftDetailCubit extends Cubit<ShiftDetailState> {
  ShiftDetailCubit({
    required Shift shift,
    required ShiftRepository shiftRepository,
    required OrganizationRepository organizationRepository,
  }) : _shiftRepository = shiftRepository,
       _organizationRepository = organizationRepository,
       super(ShiftDetailState(shift: shift)) {
    final orgId = shift.organizationId;
    // Организация нужна только ради таймзоны планового времени — грузим,
    // только если у смены реально есть график.
    if (orgId != null && shift.scheduledStartAt != null) {
      _loadOrganization(orgId);
    }
  }

  final ShiftRepository _shiftRepository;
  final OrganizationRepository _organizationRepository;

  @override
  void emit(ShiftDetailState state) {
    if (!isClosed) super.emit(state);
  }

  Future<void> _loadOrganization(String orgId) async {
    emit(state.copyWith(organization: state.organization.toLoading()));
    final result = await _organizationRepository.getById(orgId);
    result.fold(
      onSuccess: (org) =>
          emit(state.copyWith(organization: state.organization.toSuccess(org))),
      onFailure: (error) => emit(
        state.copyWith(
          organization: state.organization.toError(
            error.message,
            code: error.code,
          ),
        ),
      ),
    );
  }

  /// Применяет заявку, только что созданную модалкой `OvertimeRequestPage`.
  void applyOvertimeRequest(ShiftOvertimeRequest request) {
    emit(state.copyWith(shift: state.shift.copyWith(overtime: request)));
  }

  /// Отзывает свою `pending`-заявку. `true` — успех.
  Future<bool> cancelOvertimeRequest() async {
    emit(
      state.copyWith(
        actionStatus: FeatureStatus.loading,
        actionError: null,
        actionErrorCode: null,
      ),
    );
    final result = await _shiftRepository.cancelOvertimeRequest(state.shift.id);
    return result.fold(
      onSuccess: (_) {
        emit(
          state.copyWith(
            shift: state.shift.copyWith(overtime: null),
            actionStatus: FeatureStatus.success,
          ),
        );
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
            actionErrorCode: error.code,
          ),
        );
        return false;
      },
    );
  }
}
