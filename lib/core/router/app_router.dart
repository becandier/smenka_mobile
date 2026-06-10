import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/location/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
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
      final isAuthRoute = resolver.routeName == LoginRoute.name ||
          resolver.routeName == VerifyRoute.name;

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
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: VerifyRoute.page,
          path: '/verify',
        ),
        AutoRoute(
          page: DebugRoute.page,
          path: '/debug',
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
                AutoRoute(
                  path: '',
                  initial: true,
                  page: ShiftHistoryRoute.page,
                ),
                AutoRoute(
                  path: 'detail',
                  page: ShiftDetailRoute.page,
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
              path: 'organizations',
              page: OrganizationsTab.page,
              children: [
                AutoRoute(
                  path: '',
                  initial: true,
                  page: OrganizationsRoute.page,
                ),
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
                AutoRoute(
                  path: '',
                  initial: true,
                  page: ProfileRoute.page,
                ),
                CustomRoute<void>(
                  path: 'edit',
                  page: EditProfileRoute.page,
                  customRouteBuilder: _modalBottomSheetBuilder,
                ),
                ..._orgDetailRoutes('org-detail/:orgId'),
              ],
            ),
            AutoRoute(
              path: 'admin',
              page: SuperAdminTab.page,
              children: [
                AutoRoute(
                  path: '',
                  initial: true,
                  page: SuperAdminRoute.page,
                ),
                CustomRoute<void>(
                  path: 'create-org',
                  page: CreateOrgRoute.page,
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
      AutoRoute(
        path: '$basePath/members/:userId',
        page: MemberDetailRoute.page,
      ),
      AutoRoute(path: '$basePath/settings', page: OrgSettingsRoute.page),
      AutoRoute(path: '$basePath/locations', page: WorkLocationsRoute.page),
      AutoRoute(
        path: '$basePath/locations/add',
        page: AddEditLocationRoute.page,
      ),
      AutoRoute(path: '$basePath/roles', page: RolesRoute.page),
      AutoRoute(
        path: '$basePath/checklist-templates',
        page: ChecklistTemplatesRoute.page,
      ),
      AutoRoute(
        path: '$basePath/checklist-templates/:templateId',
        page: ChecklistTemplateDetailRoute.page,
      ),
      AutoRoute(path: '$basePath/shifts', page: OrgShiftsRoute.page),
      AutoRoute(
        path: '$basePath/shifts/:shiftId',
        page: OrgShiftDetailRoute.page,
      ),
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
      AutoRoute(path: '$basePath/stats', page: OrgStatsRoute.page),
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

@RoutePage(name: 'SuperAdminTab')

/// Super Admin Tab Page for the app
class SuperAdminTabPage extends AutoRouter {
  /// Super Admin Tab Page for the app
  const SuperAdminTabPage({super.key});
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
