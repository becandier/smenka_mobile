import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/organization/models/member.dart';
import 'package:smenka_mobile/data/domain/organization/models/organization_subscription.dart';
import 'package:smenka_mobile/data/domain/organization_role/models/_models.dart';

part 'organization.freezed.dart';

enum OrgMembershipRole { owner, admin, employee }

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String ownerId,
    required String inviteCode,
    required bool isDeleted,
    required DateTime createdAt,
    @Default(false) bool geoCheckEnabled,

    /// Требовать привязку рабочей точки к смене. При гео-проверке точка
    /// определяется сервером; при выключенной гео — выбирается сотрудником
    /// (обязательно, если флаг включён).
    @Default(false) bool requireWorkLocation,

    /// IANA-таймзона организации (`Europe/Moscow`, …) — плановое время
    /// графиков (`work_schedules`) показывается в ней, не в локальном
    /// времени устройства. Дефолт совпадает с server_default бэка на случай
    /// устаревшего кэша без поля.
    @Default('Europe/Moscow') String timezone,

    /// Срок подачи заявки на переработку в днях с момента `finished_at`
    /// смены (`organization_settings.overtime_request_days`, денормализовано
    /// в объект организации). Дефолт совпадает с server_default бэка на
    /// случай устаревшего кэша без поля.
    @Default(7) int overtimeRequestDays,

    /// Минуты окна дозаполнения чек-листа после завершения смены
    /// (`OrganizationSettings.checklist_grace_minutes`,
    /// `checklist_grace_period`). Контракт фичи денормализует поле только в
    /// `GET/PATCH /organizations/{id}/settings` (admin/owner-only) — на
    /// этот ответ employee доступа не имеет, поэтому здесь поле нужно по
    /// прецеденту [overtimeRequestDays] (тот же класс задачи: employee без
    /// доступа к `/settings` должен знать значение настройки). `null` —
    /// бэк это поле сюда не прислал: предупреждение при завершении смены
    /// тогда просто не упоминает окно (безопасная деградация — число,
    /// которое не подтверждено сервером, не показываем).
    int? checklistGraceMinutes,
    OrgMembershipRole? myRole,
    OrganizationRole? myCustomRole,

    /// Состояние подписки (`tariffs`). Заполняется бэком только для
    /// owner/admin/super_admin и только в `GET /organizations/{org_id}` —
    /// в списке организаций и для employee всегда `null` (additive-поле,
    /// см. mobile.md фичи `tariffs`).
    OrganizationSubscription? subscription,
  }) = _Organization;
}

extension OrgMembershipRoleX on OrgMembershipRole? {
  bool get isOwner => this == OrgMembershipRole.owner;

  MemberRole? get asSystemRole => switch (this) {
    OrgMembershipRole.admin => MemberRole.admin,
    OrgMembershipRole.employee => MemberRole.employee,
    OrgMembershipRole.owner => null,
    null => null,
  };
}
