import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'member_detail_state.freezed.dart';

@freezed
abstract class MemberDetailState with _$MemberDetailState {
  const factory MemberDetailState({
    required Member member,
    OrgMembershipRole? viewerRole,
    @Default(SectionData<List<EffectiveChecklistTemplate>>())
    SectionData<List<EffectiveChecklistTemplate>> effective,
    // Точки организации — только для отображения названий охвата чек-листа
    // (`EffectiveChecklistTemplate.locationIds`). Своего loading/error не
    // заводим: не резолвился id → нейтральный фолбэк в UI.
    @Default(<WorkLocation>[]) List<WorkLocation> workLocations,

    /// IANA-таймзона организации — ставки/штрафы участника всегда её
    /// бизнес-события (см. `_RatesSection`/`_PenaltiesSection`). Дефолт до
    /// загрузки совпадает с server_default `Organization.timezone`.
    @Default('Europe/Moscow') String organizationTimezone,
  }) = _MemberDetailState;
  const MemberDetailState._();

  bool get canManage =>
      viewerRole == OrgMembershipRole.owner ||
      viewerRole == OrgMembershipRole.admin;

  AppTimeContext get timeContext =>
      AppTimeContext.organization(organizationTimezone);
}
