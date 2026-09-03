import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
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
/// Не зависит от репозитория и от других кубитов — чистое вычисление
/// границ на клиенте, без сети. Контекст ([AppTimeContext]) приходит извне
/// через [applyContext] (та же связка, что и `setContext` у сиблингов):
/// на экране «Все смены»/«Персональные» пресет считается по календарю
/// устройства, на экране конкретной организации — по её IANA-таймзоне.
class ShiftHistoryPeriodCubit extends Cubit<ShiftHistoryPeriodState> {
  ShiftHistoryPeriodCubit()
    : super(_resolve(PeriodPreset.week, const AppTimeContext.device()));

  /// Последний резолвленный контекст экрана — используется для пересчёта
  /// активного пресета при смене периода ([changePeriod]).
  AppTimeContext _context = const AppTimeContext.device();

  static ShiftHistoryPeriodState _resolve(
    PeriodPreset preset,
    AppTimeContext context,
  ) {
    final bounds = preset.boundsUtc(DateTime.now().toUtc(), context);
    return ShiftHistoryPeriodState(
      selectedPreset: preset,
      dateFrom: bounds.fromUtc,
      dateTo: bounds.toUtc,
    );
  }

  /// Резолвленный контекст экрана (`ShiftHistoryContextCubit`, вызывается
  /// из `ShiftHistoryPage` тем же приёмом, что и `setContext` у сиблингов).
  /// Пересчитывает границы активного пресета в новом контексте; произвольный
  /// диапазон ([isCustomRange]) уже вычислен вызывающей стороной
  /// (`DateRangePickerResult`) и не пересчитывается.
  void applyContext(AppTimeContext context) {
    _context = context;
    final preset = state.selectedPreset;
    if (preset == null) return;
    emit(_resolve(preset, context));
  }

  /// Пресет «Неделя»/«Месяц» — `day` этот экран не показывает (mobile.md:
  /// «пресет "День" убирается»), но тип `PeriodPreset` общий с
  /// payroll-экранами, поэтому вызывающая сторона (UI) сама ограничивает
  /// набор кнопок.
  void changePeriod(PeriodPreset preset) {
    if (preset == state.selectedPreset) return;
    emit(_resolve(preset, _context));
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
