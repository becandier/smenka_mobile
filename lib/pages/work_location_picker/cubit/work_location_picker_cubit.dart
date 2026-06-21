import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/work_location_picker/cubit/work_location_picker_state.dart';

/// Загружает список рабочих точек организации для модалки выбора точки при
/// старте смены. Не зависит от других кубитов.
class WorkLocationPickerCubit extends Cubit<WorkLocationPickerState> {
  WorkLocationPickerCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _organizationRepository = organizationRepository,
       super(const WorkLocationPickerState()) {
    load();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;

  Future<void> load() async {
    emit(state.copyWith(locations: state.locations.toLoading()));
    final result = await _organizationRepository.getWorkLocations(_orgId);
    result.fold(
      onSuccess: (items) =>
          emit(state.copyWith(locations: state.locations.toSuccess(items))),
      onFailure: (error) => emit(
        state.copyWith(
          locations: state.locations.toError(error.message, code: error.code),
        ),
      ),
    );
  }
}
