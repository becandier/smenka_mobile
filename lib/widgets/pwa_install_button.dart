import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/shared/pwa/_pwa.dart';

/// Постоянная точка входа в промо установки PWA (`pwa_install_promo`) —
/// действие аппбара главной.
///
/// Скрывается сама: на native, в уже установленном PWA (standalone) и после
/// события `appinstalled` (см. `PwaInstallState.isEntryPointVisible`). Читает
/// глобальный [PwaInstallCubit] (см. `lib/shared/pwa/`), поэтому своего
/// провайдера не требует.
class PwaInstallButton extends StatelessWidget {
  const PwaInstallButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isVisible = context.select(
      (PwaInstallCubit cubit) => cubit.state.isEntryPointVisible,
    );

    if (!isVisible) return const SizedBox.shrink();

    return IconButton(
      tooltip: context.l10n.pwaInstallEntryPoint,
      icon: const Icon(Icons.install_mobile_outlined),
      onPressed: () => context.router.root.push(const PwaInstallRoute()),
    );
  }
}
