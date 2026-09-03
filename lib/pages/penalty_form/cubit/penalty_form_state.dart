import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';

part 'penalty_form_state.freezed.dart';

@freezed
abstract class PenaltyFormState with _$PenaltyFormState {
  const factory PenaltyFormState({
    /// Активные шаблоны для выбора (загружаются при открытии формы).
    @Default(SectionData<List<PenaltyTemplate>>())
    SectionData<List<PenaltyTemplate>> templates,

    /// Статус отправки формы (назначение/исправление).
    @Default(FeatureStatus.initial) FeatureStatus submitStatus,
    String? submitErrorCode,
    String? submitError,

    /// IANA-таймзона организации — дата штрафа (`occurredAt`) всегда её
    /// бизнес-событие, выбор дня и отображение идут в этой зоне, не в
    /// зоне устройства. `null` до первого ответа `getById` — угадывать
    /// зону нельзя, поэтому [timeContext] на этот момент нейтрально отдаёт
    /// устройство, а не заведомо неверную org-зону.
    String? organizationTimezone,
  }) = _PenaltyFormState;
  const PenaltyFormState._();

  bool get isSubmitting => submitStatus == FeatureStatus.loading;

  AppTimeContext get timeContext => switch (organizationTimezone) {
    final zone? => AppTimeContext.organization(zone),
    null => const AppTimeContext.device(),
  };
}
