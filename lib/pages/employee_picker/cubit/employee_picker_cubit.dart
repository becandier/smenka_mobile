import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/employee_picker/cubit/employee_picker_state.dart';

/// Загружает список участников организации для модалки выбора сотрудника
/// (фильтр списка смен по `?user_id`). Не зависит от других кубитов.
class EmployeePickerCubit extends Cubit<EmployeePickerState> {
  EmployeePickerCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _organizationRepository = organizationRepository,
        super(const EmployeePickerState()) {
    load();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;

  Future<void> load() async {
    emit(state.copyWith(members: state.members.toLoading()));
    final result = await _organizationRepository.getMembers(_orgId);
    result.fold(
      onSuccess: (members) =>
          emit(state.copyWith(members: state.members.toSuccess(members))),
      onFailure: (error) => emit(
        state.copyWith(
          members: state.members.toError(error.message, code: error.code),
        ),
      ),
    );
  }
}
