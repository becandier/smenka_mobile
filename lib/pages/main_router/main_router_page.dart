import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

@RoutePage()
class MainRouterPage extends StatelessWidget {
  const MainRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 0,
      routes: const [
        ShiftTab(),
        HistoryTab(),
        OrganizationsTab(),
        ProfileTab(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        final destinations = [
          NavigationDestination(
            icon: const Icon(Icons.timer_outlined),
            selectedIcon: const Icon(Icons.timer),
            label: context.l10n.shiftTracker,
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_outlined),
            selectedIcon: const Icon(Icons.history),
            label: context.l10n.shiftHistory,
          ),
          NavigationDestination(
            icon: const Icon(Icons.business_outlined),
            selectedIcon: const Icon(Icons.business),
            label: context.l10n.organizationsTitle,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: context.l10n.shiftProfile,
          ),
        ];
        final selectedIndex = tabsRouter.activeIndex.clamp(
          0,
          destinations.length - 1,
        );

        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            height: 65,
            selectedIndex: selectedIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: destinations,
          ),
        );
      },
    );
  }
}
