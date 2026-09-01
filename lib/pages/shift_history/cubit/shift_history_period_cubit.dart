import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_period_state.dart';

/// Единый источник окна периода экрана «История смен»
/// (`shift_history_earnings/mobile.md`, «A. Единый выбор периода»).
///
/// Границы окна вычисляет клиент. `ShiftHistoryPage` слушает этот кубит и
/// прокидывает вычисленные `dateFrom`/`dateTo` в три независимых кубита
/// экрана (`ShiftHistoryCubit`, `ShiftStatsCubit`, `ShiftEarningsCubit`)
/// через `setPeriod` — тот же приём, что и с контекстом из
/// `shift_history_scope`. Серверный параметр `period` этим экраном больше
/// не используется ни одним из трёх запросов: одни и те же `date_from`/
/// `date_to` уходят везде.
///
/// Не зависит ни от репозитория, ни от других кубитов — чистое вычисление
/// границ на клиенте, без сети.
class ShiftHistoryPeriodCubit extends Cubit<ShiftHistoryPeriodState> {
  ShiftHistoryPeriodCubit() : super(_resolve(PeriodPreset.week));

  static ShiftHistoryPeriodState _resolve(PeriodPreset preset) {
    final bounds = preset.boundsUtc(DateTime.now());
    return ShiftHistoryPeriodState(
      selectedPreset: preset,
      dateFrom: bounds.fromUtc,
      dateTo: bounds.toUtc,
    );
  }

  /// Пресет «Неделя»/«Месяц» — `day` этот экран не показывает (mobile.md:
  /// «пресет "День" убирается»), но тип `PeriodPreset` общий с
  /// payroll-экранами, поэтому вызывающая сторона (UI) сама ограничивает
  /// набор кнопок.
  void changePeriod(PeriodPreset preset) {
    if (preset == state.selectedPreset) return;
    emit(_resolve(preset));
  }

  /// Применить произвольное окно (UTC-границы, хотя бы одна непуста).
  /// Обе `null` — сброс кастомного окна: возврат к дефолтному пресету
  /// (неделя).
  void setCustomRange(DateTime? dateFrom, DateTime? dateTo) {
    if (dateFrom == null && dateTo == null) {
      if (state.isCustomRange) changePeriod(PeriodPreset.week);
      return;
    }
    emit(
      ShiftHistoryPeriodState(
        selectedPreset: null,
        dateFrom: dateFrom,
        dateTo: dateTo,
      ),
    );
  }
}
