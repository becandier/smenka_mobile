import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

part 'shift_detail_state.freezed.dart';

@freezed
abstract class ShiftDetailState with _$ShiftDetailState {
  const factory ShiftDetailState({
    required Shift shift,

    /// Организация смены — грузится лениво, только если у смены есть график
    /// (нужна для таймзоны планового времени). Персональная смена и смена
    /// без графика её не запрашивают.
    @Default(SectionData<Organization>())
    SectionData<Organization> organization,

    /// Статус действия с заявкой на переработку (подача/отмена) — transient.
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
    String? actionErrorCode,
  }) = _ShiftDetailState;
  const ShiftDetailState._();

  bool get isActionLoading => actionStatus == FeatureStatus.loading;

  /// Видимость кнопки «Добавить переработку» (ТЗ п.3, backend.md R6):
  /// клиентское приближение серверного `OVERTIME_NOT_APPLICABLE`. Гейт
  /// «график есть» — ответственность вызывающей стороны (секция рендерится
  /// только когда `scheduledEndAt != null`).
  bool get canAddOvertime {
    final finishedAt = shift.finishedAt;
    final scheduledEnd = shift.scheduledEndAt;
    if (finishedAt == null || scheduledEnd == null) return false;
    if (finishedAt.isAfter(scheduledEnd)) return false;
    final overtime = shift.overtime;
    if (overtime != null && overtime.status != OvertimeStatus.rejected) {
      return false;
    }
    return _isWithinOvertimeRequestPeriod(finishedAt);
  }

  /// Срок подачи ещё не истёк? Приближение серверной проверки
  /// `now - finished_at <= overtime_request_days` (backend.md R6). Поле
  /// приходит в объекте организации, которую `ShiftDetailCubit` грузит
  /// лениво — пока она не загрузилась (idle/loading/error), окно не
  /// ограничиваем: кнопку не должен прятать сетевой сбой, а сервер в любом
  /// случае остаётся последним рубежом при отправке формы.
  bool _isWithinOvertimeRequestPeriod(DateTime finishedAt) {
    final overtimeRequestDays = organization.data?.overtimeRequestDays;
    if (overtimeRequestDays == null) return true;
    final elapsed = DateTime.now().toUtc().difference(finishedAt.toUtc());
    return elapsed <= Duration(days: overtimeRequestDays);
  }
}
