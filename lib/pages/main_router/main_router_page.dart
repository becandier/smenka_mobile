import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/data/domain/user/models/user.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

@RoutePage()
class MainRouterPage extends StatefulWidget {
  const MainRouterPage({super.key});

  @override
  State<MainRouterPage> createState() => _MainRouterPageState();
}

class _MainRouterPageState extends State<MainRouterPage> {
  bool _isSuperAdmin = false;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final result = await context.read<UserRepository>().getMe();
    result.fold(
      onSuccess: (user) {
        if (mounted && user.role == UserRole.superAdmin) {
          setState(() => _isSuperAdmin = true);
        }
      },
      onFailure: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 0,
      routes: [
        const ShiftTab(),
        const HistoryTab(),
        const OrganizationsTab(),
        const ProfileTab(),
        if (_isSuperAdmin) const SuperAdminTab(),
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
          if (_isSuperAdmin)
            NavigationDestination(
              icon: const Icon(Icons.admin_panel_settings_outlined),
              selectedIcon: const Icon(Icons.admin_panel_settings),
              label: context.l10n.superAdminTitle,
            ),
        ];
        final selectedIndex =
            tabsRouter.activeIndex.clamp(0, destinations.length - 1);

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
