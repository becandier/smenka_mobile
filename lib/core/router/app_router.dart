import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/pages/_features.dart';

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
      if (authNotifier.isAuthenticated ||
          resolver.routeName == LoginRoute.name ||
          resolver.routeName == VerifyRoute.name) {
        resolver.next();
      } else {
        resolver.redirectUntil(
          LoginRoute(
            onResult: (didLogin) => resolver.next(didLogin),
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
              ],
            ),
            AutoRoute(
              path: 'history',
              page: HistoryTab.page,
              children: [
                AutoRoute(
                  path: '',
                  initial: true,
                  page: ExampleHomeRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileTab.page,
              children: [
                AutoRoute(
                  path: '',
                  initial: true,
                  page: ExampleHomeRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}

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

@RoutePage(name: 'ProfileTab')

/// Profile Tab Page for the app
class ProfileTabPage extends AutoRouter {
  /// Profile Tab Page for the app
  const ProfileTabPage({super.key});
}
