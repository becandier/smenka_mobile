import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/pages/shift_checklists/cubit/shift_checklists_state.dart';

class ShiftChecklistsCubit extends Cubit<ShiftChecklistsState> {
  ShiftChecklistsCubit({
    required String shiftId,
    required ChecklistRepository checklistRepository,
  })  : _shiftId = shiftId,
        _checklistRepository = checklistRepository,
        super(const ShiftChecklistsState()) {
    loadChecklists();
  }

  final String _shiftId;
  final ChecklistRepository _checklistRepository;

  String get shiftId => _shiftId;

  Future<void> loadChecklists() async {
    emit(state.copyWith(instances: state.instances.toLoading()));
    final result = await _checklistRepository.getShiftChecklists(_shiftId);
    result.fold(
      onSuccess: (list) {
        emit(state.copyWith(instances: state.instances.toSuccess(list)));
      },
      onFailure: (error) {
        emit(state.copyWith(instances: state.instances.toError(error.message)));
      },
    );
  }
}
