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
          resolver.routeName == LoginRoute.name) {
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
          page: DebugRoute.page,
          path: '/debug',
        ),
        AutoRoute(
          path: '/',
          page: MainRouterRoute.page,
          children: [
            AutoRoute(
              path: '',
              page: HomeTab.page,
              children: [
                AutoRoute(
                  path: 'home',
                  initial: true,
                  page: ExampleHomeRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsTab.page,
              children: [
                AutoRoute(
                  path: 'settings',
                  initial: true,
                  page: ExampleHomeRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'HomeTab')

/// Home Tab Page for the app
class HomeTabPage extends AutoRouter {
  /// Home Tab Page for the app
  const HomeTabPage({super.key});
}

@RoutePage(name: 'SettingsTab')

/// Settings Tab Page for the app
class SettingsTabPage extends AutoRouter {
  /// Settings Tab Page for the app
  const SettingsTabPage({super.key});
}
