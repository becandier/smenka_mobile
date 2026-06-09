import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/org_shift_detail/cubit/org_shift_detail_state.dart';

/// Деталь чужой орг-смены для owner/admin (только чтение).
///
/// Ошибки маппятся по `error.code` на UI-слое: `404 SHIFT_NOT_FOUND`,
/// `404 ORG_NOT_FOUND`, `403 FORBIDDEN`. Не зависит от других кубитов.
class OrgShiftDetailCubit extends Cubit<OrgShiftDetailState> {
  OrgShiftDetailCubit({
    required String orgId,
    required String shiftId,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _shiftId = shiftId,
        _organizationRepository = organizationRepository,
        super(const OrgShiftDetailState()) {
    load();
  }

  final String _orgId;
  final String _shiftId;
  final OrganizationRepository _organizationRepository;

  Future<void> load() async {
    emit(state.copyWith(shift: state.shift.toLoading()));
    final result = await _organizationRepository.getShiftDetail(
      _orgId,
      _shiftId,
    );
    result.fold(
      onSuccess: (shift) =>
          emit(state.copyWith(shift: state.shift.toSuccess(shift))),
      onFailure: (error) => emit(
        state.copyWith(
          shift: state.shift.toError(error.message, code: error.code),
        ),
      ),
    );
  }
}
