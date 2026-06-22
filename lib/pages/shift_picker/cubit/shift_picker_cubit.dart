import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/shift_picker/cubit/shift_picker_state.dart';

/// Выбор смены сотрудника для привязки штрафа (фича fines).
///
/// Источник — существующий список орг-смен с фильтром по сотруднику
/// (`GET /organizations/{org_id}/shifts?user_id=...`). Грузим первую страницу
/// последних смен — для выбора «к какой смене штраф» этого достаточно.
class ShiftPickerCubit extends Cubit<ShiftPickerState> {
  ShiftPickerCubit({
    required String orgId,
    required String userId,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _userId = userId,
       _organizationRepository = organizationRepository,
       super(const ShiftPickerState()) {
    load();
  }

  final String _orgId;
  final String _userId;
  final OrganizationRepository _organizationRepository;

  Future<void> load() async {
    emit(state.copyWith(shifts: state.shifts.toLoading()));
    final result = await _organizationRepository.getShifts(
      _orgId,
      userId: _userId,
      limit: 50,
    );
    result.fold(
      onSuccess: (paginator) => emit(
        state.copyWith(shifts: state.shifts.toSuccess(paginator.data ?? [])),
      ),
      onFailure: (error) => emit(
        state.copyWith(
          shifts: state.shifts.toError(error.message, code: error.code),
        ),
      ),
    );
  }
}
