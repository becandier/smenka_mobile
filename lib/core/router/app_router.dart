import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart'
    show PhotoSource;
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
// Скрываем доменный PhotoSource (конфиг требования пункта) — здесь тип pop
// bottom-sheet выбора источника, это PhotoSource из PhotoPickerService.
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart'
    hide PhotoSource;
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/pages/_features.dart';
import 'package:smenka_mobile/shared/auth/cubit/auth_cubit.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
/// App Router for the app
class AppRouter extends RootStackRouter {
  /// App Router for the app
  AppRouter({required this.authNotifier});

  /// Нотифаер для реактивного отслеживания состояния авторизации
  final AuthStateNotifier authNotifier;

  @override
  late final List<AutoRouteGuard> guards = [
    AutoRouteGuard.simple((resolver, router) {
      final isAuthRoute =
          resolver.routeName == LoginRoute.name ||
          resolver.routeName == VerifyRoute.name;

      // Экран приглашения обрабатывает оба состояния авторизации сам (см.
      // InviteCubit): авторизованный сразу вступает, неавторизованный
      // сохраняет код и уходит на логин. Гард не должен ни блокировать этот
      // роут для авторизованных (как isAuthRoute), ни редиректить
      // неавторизованных на логин через redirectUntil — иначе экран так и не
      // соберётся и код будет потерян до того, как успеет сохраниться.
      if (resolver.routeName == InviteRoute.name) {
        resolver.next();
        return;
      }

      if (authNotifier.isAuthenticated) {
        if (isAuthRoute) {
          resolver.next(false);
        } else {
          resolver.next();
        }
      } else if (isAuthRoute) {
        resolver.next();
      } else {
        resolver.redirectUntil(
          LoginRoute(
            onResult: ({required bool didLogin}) => resolver.next(didLogin),
          ),
        );
      }
    }),
  ];

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: VerifyRoute.page, path: '/verify'),
    AutoRoute(page: DebugRoute.page, path: '/debug'),
    // Единая точка обработки ссылки-приглашения (web и native): холодный
    // старт по `https://{webAppHost}/invite/:code`, живой deep link или
    // возврат после логина — везде один и тот же роут/экран.
    AutoRoute(page: InviteRoute.page, path: '/invite/:code'),
    // Центр уведомлений (notifications) — root-уровня: колокольчик в
    // аппбаре любого таба пушит его через `context.router.root.push(...)`.
    AutoRoute(page: NotificationsRoute.page, path: '/notifications'),
    // Проверка геолокации (geo_troubleshooting) — root-уровня: открывается и
    // из диалога гео-ошибки на табе «Смена», и из настроек профиля.
    AutoRoute(page: GeoDiagnosticsRoute.page, path: '/geo-diagnostics'),
    // «Мои тесты» + прохождение (employee_tests) — root-уровня: список
    // фильтруется по всем организациям пользователя (не завязан на один
    // `<org-base>`), а прохождение открывается и из списка, и из
    // уведомления `test_assigned` без орг-контекста в пути.
    AutoRoute(page: MyTestsRoute.page, path: '/my-tests'),
    AutoRoute(page: TestAttemptRoute.page, path: '/test-attempt/:assignmentId'),
    // Дубли-регистрации у root (как ShiftChecklistsRoute/ChecklistFillRoute
    // выше у нескольких родителей): нужны для перехода из уведомлений
    // `shift_manual_changed`/`payroll_adjustment_changed` (manual_time_entry)
    // — там нет орг-таба в контексте, из которого обычно пушатся эти экраны.
    AutoRoute(page: ShiftDetailRoute.page, path: '/shift-detail'),
    AutoRoute(page: MyAdjustmentsRoute.page, path: '/my-adjustments/:orgId'),
    // Полноэкранный просмотр фото чек-листа — поверх табов (root), один на все
    // вкладки; пушится через `context.router.root.push(...)`.
    CustomRoute<void>(
      path: '/checklist-photo-viewer',
      page: ChecklistPhotoViewerRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: const Duration(milliseconds: 200),
    ),
    // Выбор источника фото (камера/галерея) — модальный bottom sheet поверх табов.
    CustomRoute<PhotoSource?>(
      path: '/checklist-photo-source',
      page: ChecklistPhotoSourceRoute.page,
      customRouteBuilder: _modalBottomSheetBuilder,
    ),
    // Промо установки PWA (pwa_install_promo) — модальный bottom sheet поверх
    // табов: открывается разово после первого входа (шелл слушает
    // `PwaInstallState.promoRequested`) и по иконке в аппбаре главной.
    // Только web: на native `PwaInstallCubit` остаётся пустым и роут никто
    // не пушит.
    CustomRoute<void>(
      path: '/install-app',
      page: PwaInstallRoute.page,
      customRouteBuilder: _modalBottomSheetBuilder,
    ),
    AutoRoute(
      path: '/',
      page: MainRouterRoute.page,
      children: [
        AutoRoute(
          path: '',
          page: ShiftTab.page,
          children: [
            AutoRoute(
              path: 'shift',
              initial: true,
              page: ShiftTrackerRoute.page,
            ),
            // Фолбэк-старт смены по фото (shift_geo_photo_fallback) —
            // внутри таба «Смена», чтобы переиспользовать те же модалки
            // выбора точки и графика (они зарегистрированы соседями).
            // Результат (стартовавшая смена) типизируется на месте вызова:
            // `context.router.push<Shift?>(...)` — сам `AutoRoute` не
            // параметризуется типом (в отличие от `CustomRoute<T>`), а
            // completer создаётся по типу из push.
            AutoRoute(
              path: 'geo-fallback-start',
              page: GeoFallbackStartRoute.page,
            ),
            // Выбор рабочей точки при старте смены — модальный bottom sheet.
            CustomRoute<WorkLocationPickerResult?>(
              path: 'work-location-picker',
              page: WorkLocationPickerRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            // Выбор точки при пересечении нескольких гео-зон
            // (shift_start_location_choice) — модальный bottom sheet.
            CustomRoute<NearbyWorkLocationPickerResult?>(
              path: 'nearby-work-location-picker',
              page: NearbyWorkLocationPickerRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            // Выбор графика работы при старте смены (work_schedules) —
            // модальный bottom sheet.
            CustomRoute<WorkSchedulePickerResult?>(
              path: 'work-schedule-picker',
              page: WorkSchedulePickerRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            // Подтверждение персональной смены при наличии организационного
            // контекста (shift_org_default, блок B) — модальный bottom sheet.
            CustomRoute<PersonalShiftConfirmAction?>(
              path: 'personal-shift-confirm',
              page: PersonalShiftConfirmRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            AutoRoute(
              path: 'shifts/:shiftId/checklists',
              page: ShiftChecklistsRoute.page,
            ),
            AutoRoute(
              path: 'shifts/:shiftId/checklists/:instanceId',
              page: ChecklistFillRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: 'history',
          page: HistoryTab.page,
          children: [
            AutoRoute(path: '', initial: true, page: ShiftHistoryRoute.page),
            CustomRoute<DateRangePickerResult?>(
              path: 'date-range',
              page: DateRangePickerRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            AutoRoute(path: 'detail', page: ShiftDetailRoute.page),
            // Заявка на переработку по завершённой смене — модальный bottom
            // sheet (work_schedules).
            CustomRoute<ShiftOvertimeRequest?>(
              path: 'detail/overtime-request',
              page: OvertimeRequestRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            AutoRoute(
              path: 'shifts/:shiftId/checklists',
              page: ShiftChecklistsRoute.page,
            ),
            AutoRoute(
              path: 'shifts/:shiftId/checklists/:instanceId',
              page: ChecklistFillRoute.page,
            ),
            // Блок «Заработано» в шапке истории ведёт в «Мой заработок» той
            // же организации (earnings_drilldown) — в отличие от
            // `_orgDetailRoutes`, где `orgId` приходит из basePath родителя,
            // здесь его нет, поэтому параметр указан в пути явно.
            AutoRoute(path: 'my-earnings/:orgId', page: MyEarningsRoute.page),
            // Дальше по цепочке из «Моего заработка» — штрафы и ручные
            // начисления (fines/manual_time_entry); без них следующий тап
            // из этой же вкладки так же молча не сработает.
            AutoRoute(path: 'my-penalties/:orgId', page: MyPenaltiesRoute.page),
            AutoRoute(
              path: 'my-adjustments/:orgId',
              page: MyAdjustmentsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: 'organizations',
          page: OrganizationsTab.page,
          children: [
            AutoRoute(path: '', initial: true, page: OrganizationsRoute.page),
            CustomRoute<void>(
              path: 'join',
              page: JoinOrgRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            ..._orgDetailRoutes('detail/:orgId'),
          ],
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileTab.page,
          children: [
            AutoRoute(path: '', initial: true, page: ProfileRoute.page),
            CustomRoute<void>(
              path: 'edit',
              page: EditProfileRoute.page,
              customRouteBuilder: _modalBottomSheetBuilder,
            ),
            ..._orgDetailRoutes('org-detail/:orgId'),
          ],
        ),
      ],
    ),
  ];
}

/// Общие роуты организации, переиспользуемые в нескольких табах.
List<AutoRoute> _orgDetailRoutes(String basePath) => [
  AutoRoute(path: basePath, page: OrganizationDetailRoute.page),
  AutoRoute(path: '$basePath/members', page: OrgMembersRoute.page),
  AutoRoute(path: '$basePath/members/:userId', page: MemberDetailRoute.page),
  AutoRoute(path: '$basePath/shifts', page: OrgShiftsRoute.page),
  AutoRoute(path: '$basePath/shifts/:shiftId', page: OrgShiftDetailRoute.page),
  // Чек-листы чужой смены (read-only) — доступны из детали орг-смены
  // в тех же табах (organizations/profile/admin).
  AutoRoute(
    path: '$basePath/shifts/:shiftId/checklists/:instanceId',
    page: ChecklistFillRoute.page,
  ),
  CustomRoute<EmployeePickerResult?>(
    path: '$basePath/employee-picker',
    page: EmployeePickerRoute.page,
    customRouteBuilder: _modalBottomSheetBuilder,
  ),
  CustomRoute<DateRangePickerResult?>(
    path: '$basePath/date-range',
    page: DateRangePickerRoute.page,
    customRouteBuilder: _modalBottomSheetBuilder,
  ),
  AutoRoute(path: '$basePath/stats', page: OrgStatsRoute.page),
  AutoRoute(path: '$basePath/my-earnings', page: MyEarningsRoute.page),
  AutoRoute(path: '$basePath/payroll', page: PayrollRoute.page),
  // Штрафы (фича fines): свой список (employee) + модалки назначения штрафа
  // и выбора смены (admin/owner) — модалки через bottom sheet.
  AutoRoute(path: '$basePath/my-penalties', page: MyPenaltiesRoute.page),
  // Ручные начисления (manual_time_entry): свой список (employee, read-only),
  // вход — из «Мой заработок».
  AutoRoute(path: '$basePath/my-adjustments', page: MyAdjustmentsRoute.page),
  CustomRoute<bool>(
    path: '$basePath/penalty-form',
    page: PenaltyFormRoute.page,
    customRouteBuilder: _modalBottomSheetBuilder,
  ),
  CustomRoute<ShiftPickerResult?>(
    path: '$basePath/shift-picker',
    page: ShiftPickerRoute.page,
    customRouteBuilder: _modalBottomSheetBuilder,
  ),
  // База знаний (knowledge_base, read-only): дерево разделов/страниц +
  // экран страницы с нативным рендером блоков.
  AutoRoute(path: '$basePath/knowledge-base', page: KnowledgeTreeRoute.page),
  AutoRoute(
    path: '$basePath/knowledge-base/:nodeId',
    page: KnowledgePageRoute.page,
  ),
];

@RoutePage(name: 'ShiftTab')
/// Shift Tab Page for the app
class ShiftTabPage extends AutoRouter {
  /// Shift Tab Page for the app
  const ShiftTabPage({super.key});
}

@RoutePage(name: 'HistoryTab')
/// History Tab Page for the app
class HistoryTabPage extends AutoRouter {
  /// History Tab Page for the app
  const HistoryTabPage({super.key});
}

@RoutePage(name: 'OrganizationsTab')
/// Organizations Tab Page for the app
class OrganizationsTabPage extends StatelessWidget {
  /// Organizations Tab Page for the app
  const OrganizationsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrganizationsCubit(
        organizationRepository: context.read<OrganizationRepository>(),
        userRepository: context.read<UserRepository>(),
      ),
      child: const AutoRouter(),
    );
  }
}

@RoutePage(name: 'ProfileTab')
/// Profile Tab Page for the app
class ProfileTabPage extends StatelessWidget {
  /// Profile Tab Page for the app
  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        userRepository: context.read<UserRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
        authCubit: context.read<AuthCubit>(),
      ),
      child: const AutoRouter(),
    );
  }
}

Route<T> _modalBottomSheetBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return ModalBottomSheetRoute<T>(
    builder: (_) => child,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: false,
    settings: page,
  );
}
