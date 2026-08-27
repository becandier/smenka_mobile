import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/shared/pwa/_pwa.dart';

@RoutePage()
class MainRouterPage extends StatefulWidget {
  const MainRouterPage({super.key});

  @override
  State<MainRouterPage> createState() => _MainRouterPageState();
}

class _MainRouterPageState extends State<MainRouterPage> {
  @override
  void initState() {
    super.initState();
    // Разовое промо установки PWA (pwa_install_promo). Шелл собирается только
    // для авторизованного пользователя, а post-frame гарантирует, что модалка
    // не перекроет первую отрисовку главной. Дальше кубит сам решает, нужно
    // ли промо (web? не standalone? ещё не показывали?) и выдерживает паузу
    // под `beforeinstallprompt`. На native — no-op.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(context.read<PwaInstallCubit>().requestFirstRunPromo());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PwaInstallCubit, PwaInstallState>(
      listenWhen: (prev, curr) => !prev.promoRequested && curr.promoRequested,
      listener: (context, state) =>
          context.router.root.push(const PwaInstallRoute()),
      child: AutoTabsRouter(
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
      ),
    );
  }
}
