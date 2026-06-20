# План рефактора: выпил owner-режима, карты и тяжёлого org-менеджмента (ветка refactor/remove-owner-and-map)

Источник решения: `docs/roles_capabilities_audit.md`. Карта зависимостей кросс-валидирована 4 аудит-агентами + грепами. Цель: app для **сотрудника** и **admin (read-only дашборд)**; всё управление и owner-функции — в веб-админке.

## ЖЁСТКИЕ ГАРДРЕЙЛЫ (не нарушать)
- **Оставить и НЕ трогать employee-фичи:** shift_tracker, shift_history, shift_detail, shift_checklists, checklist_fill (заполнение чек-листов сотрудником!), my_earnings, home, profile, auth, verify, theme, debug, date_range_picker, employee_picker.
- **Оставить admin read-only:** org_shifts, org_shift_detail, org_stats, payroll (просмотр отчёта), members (просмотр списка), member_detail (READ-ONLY).
- **geolocator ОСТАЁТСЯ** (геопроверка смены). Убираем только Yandex-карты.
- **`org.geoCheckEnabled` — поле модели Organization, оно ОСТАЁТСЯ** (читается `shift_tracker_cubit.dart:208`). Удаляем только экран настроек и его write-эндпоинты.
- **super_admin таб ОСТАЁТСЯ** (read-only список орг). Убрать из него только кнопку создания организации.
- В общих репозиториях/датасорсах удалять **только write-методы**, чтения оставлять.
- После правок: `make gen` (роутер+freezed), `make loc` (если правили arb), `flutter analyze` → 0 ошибок, `flutter test`.

## A. УДАЛИТЬ ПАПКИ ЭКРАНОВ (целиком)
- `lib/pages/work_locations/`
- `lib/pages/add_edit_location/`
- `lib/pages/org_settings/`
- `lib/pages/roles/`
- `lib/pages/checklist_templates/`
- `lib/pages/checklist_template_detail/`
- `lib/pages/rate_form/`

## B. УДАЛИТЬ ОТДЕЛЬНЫЕ ФАЙЛЫ
- `lib/widgets/flutter_map_widget.dart`
- `lib/pages/organizations/widgets/_create_org_modal.dart`
- `lib/pages/organization_detail/widgets/_org_invite_section.dart`
- `lib/pages/member_detail/widgets/_system_role_section.dart`
- `lib/pages/member_detail/widgets/_custom_role_section.dart`
- `lib/pages/member_detail/widgets/_overrides_section.dart`

## C. УДАЛИТЬ ДВА ГЛОБАЛЬНЫХ РЕПОЗИТОРИЯ (location + organization_role) — полностью расцепить
Удалить домен/инфру:
- `lib/data/domain/location/` и `lib/data/infrastructure/location/`
- `lib/data/domain/organization_role/` и `lib/data/infrastructure/organization_role/`
- `lib/app/main_app/locator/repositories/location.dart`
- `lib/app/main_app/locator/repositories/organization_role.dart`

Расцепить проводку в этих файлах (убрать ВСЕ упоминания `LocationRepository` и `OrganizationRoleRepository`):
- `lib/app/main_app/cubit/main_app_cubit.dart` — убрать init обоих (`LocationRepositoryInitializer` ~стр.110, `OrganizationRoleRepositoryInitializer` ~стр.108) и их `.get<...>()` в emit success (~стр.156-160); убрать импорты.
- `lib/app/main_app/cubit/main_app_state.dart` — убрать поля `locationRepository` (~стр.23) и `organizationRoleRepository` (~стр.20). (freezed → потом `make gen`.)
- `lib/app/main_app/view/success_app.dart` — убрать поля конструктора/виджета и `RepositoryProvider`-ы для обоих (~стр.19, 39, 127-129 и аналог для role).
- `lib/app/main_app/view/app.dart` — убрать прокидывание `locationRepository`/`organizationRoleRepository` в `_SuccessApp` (~стр.79).
- `lib/app/main_app/locator/repositories/_repositories.dart` — убрать `export 'location.dart';` и `export 'organization_role.dart';`.

## D. ОБРЕЗАТЬ WRITE-МЕТОДЫ В ОБЩИХ РЕПО/ДАТАСОРСАХ (чтения оставить)
- `lib/data/domain/checklist/repositories/checklist_repository.dart` + `lib/data/infrastructure/checklist/datasource/checklist_datasource.dart` — удалить template-management методы: getTemplates, getTemplate, createTemplate, updateTemplate, archiveTemplate, addItem, updateItem, deleteItem, reorderItems, assignToRoles, getAssignments, setMemberOverrides, getMemberOverrides, setPersonalOverride, clearPersonalOverride. **ОСТАВИТЬ shift-instance:** getShiftChecklists, getInstanceDetail, updateInstanceItem, getEffectiveTemplates (нужны checklist_fill/shift_checklists/shift_detail). Убрать осиротевшие template-DTO/модели/мапперы, если станут не нужны.
- `lib/data/domain/payroll/repositories/payroll_repository.dart` + `…/infrastructure/payroll/datasource/payroll_datasource.dart` — удалить createRate, updateRate, deleteRate. **ОСТАВИТЬ:** getRates, getPayroll, getMyEarnings.
- `lib/data/domain/organization/repositories/organization_repository.dart` + `…/infrastructure/organization/datasource/organization_datasource.dart` — удалить: create, delete, rotateInvite, updateMemberRole, removeMember, getSettings, updateSettings, assignCustomRole/setoverride-методы если есть. **ОСТАВИТЬ:** getAll/getById/update(имя орг? — см. ниже), getMembers, getShifts, getShiftDetail, getStats, getAllOrganizations, watch/fetchMyOrganizations, clearCache, join. Если `update` (переименование орг) — это управление и больше нигде не зовётся, тоже удалить. Если `OrgSettings`-модель осиротеет — удалить.

## E. ПРАВКИ UI/КУБИТОВ
- `lib/pages/organization_detail/cubit/organization_detail_cubit.dart` — удалить `rotateInviteCode()` (~106), `deleteOrganization()` (~158), геттер `isOwner` (~26) и owner-ветки `isAdminOrOwner` если станут не нужны (оставить определение роли viewer для гейтинга навигации admin).
- `lib/pages/organization_detail/view/organization_detail_page.dart` — убрать `part …/_org_invite_section.dart`, рендер `_OrgInviteSection` (блок `if (permissions.isOwner)`).
- `lib/pages/organization_detail/widgets/_org_actions_section.dart` — убрать owner-ветку «Удалить организацию»; оставить «Покинуть организацию» для участников.
- `lib/pages/organization_detail/widgets/_org_navigation_section.dart` — убрать пункты навигации к удалённым экранам: WorkLocations, Roles, ChecklistTemplates, OrgSettings. Оставить: Members, MyEarnings(if member), OrgShifts, OrgStats, Payroll.
- `lib/pages/member_detail/view/member_detail_page.dart` — сделать READ-ONLY: убрать кнопку удаления участника в AppBar, убрать секции `_SystemRoleSection`/`_CustomRoleSection`/`_OverridesSection` и их `part`-импорты; оставить просмотр (header, эффективные роли/чек-листы, ставки read-only). Убрать вызов `cubit.removeMember()`.
- `lib/pages/member_detail/cubit/member_detail_cubit.dart` — удалить мутации: updateSystemRole, assignCustomRole, setOverride, clearOverride, removeMember (+ хелпер _runTemplateAction). Оставить read-загрузчики (loadOverrides/loadEffective/loadAvailableRoles только если нужны для отображения; если list ролей был только для назначения — убрать).
- `lib/pages/member_detail/widgets/_rates_section.dart` — READ-ONLY: убрать «добавить/редактировать/удалить ставку» и навигацию в rate_form; оставить отображение текущей ставки и истории (getRates).
- `lib/pages/member_detail/cubit/member_rates_cubit.dart` + `member_rates_state.dart` — оставить `loadRates` (read), удалить мутации (deleteRate и пр.). Если кубит станет пустым обёрткой над чтением — оставить только чтение.
- `lib/pages/members/cubit/members_cubit.dart` — удалить `removeMember()`.
- `lib/pages/members/widgets/_member_tile.dart` — убрать `Dismissible`-свайп удаления; tile остаётся tap-able для перехода в member_detail.
- `lib/pages/organizations/cubit/organizations_cubit.dart` — удалить `createOrganization()` и `resetCreateStatus()`; оставить fetch/load/join.
- `lib/pages/organizations/view/organizations_page.dart` — убрать кнопку/вызов создания организации; оставить список + join.
- `lib/pages/super_admin/view/super_admin_page.dart` — убрать FAB создания организации (CreateOrgRoute).

## F. РОУТЕР И BARREL
- `lib/core/router/app_router.dart` — удалить роуты: WorkLocationsRoute, AddEditLocationRoute, OrgSettingsRoute, RolesRoute, ChecklistTemplatesRoute, ChecklistTemplateDetailRoute, RateFormRoute, CreateOrgRoute. Убрать осиротевшие импорты (location/organization_role/payroll-rate). Затем `make gen`.
- `lib/pages/_features.dart` — убрать экспорты: work_locations, add_edit_location, org_settings, roles, checklist_templates, checklist_template_detail, rate_form.

## G. PUBSPEC / L10N (l10n — последним, опционально)
- `pubspec.yaml` — удалить `yandex_maps_mapkit_lite: ^4.36.0`. **Оставить** geolocator. Затем `flutter pub get`.
- `lib/l10n/app_ru.arb` — удалить ключи, ставшие сиротами (workLocations*, addLocation*, roles*, checklistTemplate*, orgSettings*, orgDetailInvite*/Rotate*/Delete*, member-mutation/rate-form ключи). **Только после** удаления кода; затем `make loc` и `flutter analyze` — если ругается на отсутствующий геттер, ключ вернуть. Сиротские ключи не ломают сборку — при сомнении оставить.

## H. КОМАНДЫ ЗАВЕРШЕНИЯ
1. `flutter pub get`
2. `make gen` (build_runner: router + freezed)
3. `make loc` (если правили arb)
4. `flutter analyze` → 0 ошибок (чинить fallout: мёртвые импорты/ссылки)
5. `flutter test`
6. Итог: краткий отчёт что удалено/поправлено + вывод analyze/test.
