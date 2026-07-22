import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/overtime_request/cubit/overtime_request_state.dart';

/// Логика модалки «Добавить переработку»: только отправка формы
/// (`POST /shifts/{shift_id}/overtime`). Поля формы (минуты/комментарий)
/// живут в самом виджете, как в `PenaltyFormCubit`.
class OvertimeRequestCubit extends Cubit<OvertimeRequestState> {
  OvertimeRequestCubit({
    required String shiftId,
    required ShiftRepository shiftRepository,
  }) : _shiftId = shiftId,
       _shiftRepository = shiftRepository,
       super(const OvertimeRequestState());

  final String _shiftId;
  final ShiftRepository _shiftRepository;

  /// Возвращает созданную заявку при успехе (для обновления карточки смены
  /// вызывающей стороной) или `null` при ошибке.
  Future<ShiftOvertimeRequest?> submit({
    required int minutes,
    required String comment,
  }) async {
    emit(
      state.copyWith(
        submitStatus: FeatureStatus.loading,
        submitError: null,
        submitErrorCode: null,
      ),
    );
    final result = await _shiftRepository.requestOvertime(
      _shiftId,
      minutes: minutes,
      comment: comment,
    );
    return result.fold(
      onSuccess: (request) {
        emit(state.copyWith(submitStatus: FeatureStatus.success));
        return request;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            submitStatus: FeatureStatus.error,
            submitError: error.message,
            submitErrorCode: error.code,
          ),
        );
        return null;
      },
    );
  }
}
