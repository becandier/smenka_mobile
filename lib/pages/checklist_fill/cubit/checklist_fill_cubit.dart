import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_fill_state.dart';

class ChecklistFillCubit extends Cubit<ChecklistFillState> {
  ChecklistFillCubit({
    required String shiftId,
    required String instanceId,
    required ChecklistRepository checklistRepository,
    bool readOnly = false,
  }) : _shiftId = shiftId,
       _instanceId = instanceId,
       _checklistRepository = checklistRepository,
       super(ChecklistFillState(readOnly: readOnly)) {
    loadInstance();
  }

  final String _shiftId;
  final String _instanceId;
  final ChecklistRepository _checklistRepository;

  final Map<String, Timer> _commentDebouncers = {};

  @override
  Future<void> close() {
    for (final timer in _commentDebouncers.values) {
      timer.cancel();
    }
    _commentDebouncers.clear();
    return super.close();
  }

  Future<void> loadInstance() async {
    emit(state.copyWith(instance: state.instance.toLoading()));
    final result = await _checklistRepository.getInstanceDetail(
      _shiftId,
      _instanceId,
    );
    result.fold(
      onSuccess: (detail) {
        emit(state.copyWith(instance: state.instance.toSuccess(detail)));
      },
      onFailure: (error) {
        emit(state.copyWith(instance: state.instance.toError(error.message)));
      },
    );
  }

  Future<void> toggleItem(ChecklistInstanceItem item) async {
    if (state.readOnly) return;
    await _update(item, isCompleted: !item.isCompleted, comment: item.comment);
  }

  void scheduleCommentUpdate(ChecklistInstanceItem item, String? comment) {
    if (state.readOnly) return;
    _commentDebouncers[item.id]?.cancel();
    _commentDebouncers[item.id] = Timer(const Duration(milliseconds: 600), () {
      _update(item, isCompleted: item.isCompleted, comment: comment);
    });
  }

  Future<void> _update(
    ChecklistInstanceItem item, {
    required bool isCompleted,
    String? comment,
  }) async {
    final statuses = {...state.itemStatuses};
    statuses[item.id] = FeatureStatus.loading;
    emit(state.copyWith(itemStatuses: statuses, saveError: null));

    final result = await _checklistRepository.updateInstanceItem(
      _shiftId,
      _instanceId,
      item.id,
      isCompleted: isCompleted,
      comment: comment,
    );

    result.fold(
      onSuccess: (updated) {
        final newStatuses = {...state.itemStatuses};
        newStatuses[item.id] = FeatureStatus.success;

        final detail = state.instance.data;
        if (detail != null) {
          final newItems = detail.items
              .map((i) => i.id == updated.id ? updated : i)
              .toList();
          emit(
            state.copyWith(
              instance: state.instance.toSuccess(
                detail.copyWith(items: newItems),
              ),
              itemStatuses: newStatuses,
            ),
          );
        } else {
          emit(state.copyWith(itemStatuses: newStatuses));
        }
        // Reload to refresh status (pending/completed)
        loadInstance();
      },
      onFailure: (error) {
        final newStatuses = {...state.itemStatuses};
        newStatuses[item.id] = FeatureStatus.error;
        emit(
          state.copyWith(itemStatuses: newStatuses, saveError: error.message),
        );
      },
    );
  }
}
