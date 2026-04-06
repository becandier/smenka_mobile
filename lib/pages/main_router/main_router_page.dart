import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

@RoutePage()
class MainRouterPage extends StatelessWidget {
  const MainRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            height: 65,
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: [
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
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: context.l10n.shiftProfile,
              ),
            ],
          ),
        );
      },
    );
  }
}
