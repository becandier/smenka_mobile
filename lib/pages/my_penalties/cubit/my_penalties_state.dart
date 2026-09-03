import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';

part 'my_penalties_state.freezed.dart';

@freezed
abstract class MyPenaltiesState with _$MyPenaltiesState {
  const factory MyPenaltiesState({
    @Default(PaginatedSectionData<MyPenalty>())
    PaginatedSectionData<MyPenalty> penalties,

    /// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
    @Default(PeriodPreset.month) PeriodPreset? preset,
    DateTime? customFrom,
    DateTime? customTo,

    /// IANA-таймзона организации — штрафы всегда её бизнес-события.
    /// Дефолт до загрузки совпадает с server_default `Organization.timezone`
    /// (тот же приём, что и в `WorkSchedulePickerRoute`).
    @Default('Europe/Moscow') String organizationTimezone,
  }) = _MyPenaltiesState;
  const MyPenaltiesState._();

  bool get isCustomRange => preset == null;

  AppTimeContext get timeContext =>
      AppTimeContext.organization(organizationTimezone);
}
