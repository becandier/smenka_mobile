import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/pwa/pwa_install_method.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/shared/pwa/_pwa.dart';
// Точечные импорты вместо барреля `widgets/_widgets.dart`: тот тянет за собой
// виджеты с `app_router` → `pages/_features` → web-only `google_sign_in_web`,
// который не компилируется на Dart VM и делает экран нетестируемым.
import 'package:smenka_mobile/widgets/app_bottom_sheet.dart';
import 'package:smenka_mobile/widgets/app_button.dart';

part '../widgets/_pwa_install_benefits.dart';
part '../widgets/_pwa_install_steps.dart';

/// Промо установки PWA (`pwa_install_promo`) — модальный bottom sheet.
///
/// Открывается двумя путями: разово после первого входа (шелл реагирует на
/// `PwaInstallState.promoRequested`) и в любой момент по иконке «Установить
/// приложение» в аппбаре главной. Содержимое зависит от того, что умеет
/// браузер (`PwaInstallState.method`).
@RoutePage(name: 'PwaInstallRoute')
class PwaInstallModal extends StatefulWidget {
  const PwaInstallModal({super.key});

  @override
  State<PwaInstallModal> createState() => _PwaInstallModalState();
}

class _PwaInstallModalState extends State<PwaInstallModal> {
  @override
  void initState() {
    super.initState();
    // Модалку увидели — независимо от исхода автоматически она больше не
    // всплывёт (ТЗ: промо разовое).
    context.read<PwaInstallCubit>().markPromoSeen();
  }

  Future<void> _install() async {
    final router = context.router;
    await context.read<PwaInstallCubit>().promptInstall();
    // Исход нативного диалога (установил/отказался) не разбираем — по ТЗ
    // модалка в обоих случаях просто закрывается.
    if (!mounted) return;
    await router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return AppBottomSheet(
      child: BlocBuilder<PwaInstallCubit, PwaInstallState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            // stretch, а не start: инструкция-плашка и кнопки должны занимать
            // всю ширину листа, тексты при этом остаются выровнены по левому
            // краю.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.pwaInstallTitle,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.pwaInstallSubtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: context.appColors.muted,
                ),
              ),
              const SizedBox(height: 20),
              const _PwaInstallBenefits(),
              const SizedBox(height: 20),
              // Пока модалка открыта, браузер может прислать
              // `beforeinstallprompt` — BlocBuilder тут же заменит инструкцию
              // на кнопку «Установить».
              ..._buildActions(context, state.method),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context, PwaInstallMethod method) {
    final l10n = context.l10n;

    return switch (method) {
      PwaInstallMethod.nativePrompt => [
        AppButton(onPressed: _install, label: l10n.pwaInstallAction),
        const SizedBox(height: 8),
        _LaterButton(label: l10n.pwaInstallLater),
      ],
      PwaInstallMethod.iosShareSheet => [
        _PwaInstallSteps(
          title: l10n.pwaInstallIosStepsTitle,
          steps: [
            (icon: Icons.ios_share, text: l10n.pwaInstallIosStepShare),
            (
              icon: Icons.add_to_home_screen,
              text: l10n.pwaInstallIosStepAddToHome,
            ),
            (
              icon: Icons.check_circle_outline,
              text: l10n.pwaInstallIosStepConfirm,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _LaterButton(label: l10n.pwaInstallGotIt),
      ],
      PwaInstallMethod.manual => [
        _PwaInstallSteps(
          title: l10n.pwaInstallManualStepsTitle,
          steps: [(icon: Icons.more_vert, text: l10n.pwaInstallManualHint)],
        ),
        const SizedBox(height: 20),
        _LaterButton(label: l10n.pwaInstallGotIt),
      ],
    };
  }
}

/// Закрывающее действие модалки: «Позже» рядом с кнопкой установки и
/// «Понятно» под ручной инструкцией — поведение одинаковое.
class _LaterButton extends StatelessWidget {
  const _LaterButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () => context.router.maybePop(),
        child: Text(label),
      ),
    );
  }
}
