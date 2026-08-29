import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат подтверждения персональной смены (`shift_org_default`, блок B).
/// Закрытие свайпом/тапом по фону возвращает `null` — вызывающая сторона
/// ничего не стартует, организационный контекст на экране не меняется.
enum PersonalShiftConfirmAction {
  /// Основное действие при одной доступной организации — продолжить обычный
  /// флоу старта организационной смены (уже выбранной на экране).
  startOrganization,

  /// «Всё равно персональную» — стартовать персональную смену
  /// (`ShiftTrackerCubit.startPersonalShift`).
  startPersonal,
}

/// Модалка подтверждения персональной смены (`shift_org_default`, блок B):
/// показывается, когда сотрудник — участник хотя бы одной организации, но
/// инициировал персональную смену через второстепенную ссылку на idle-экране
/// (`_PersonalShiftLink`). Предупреждает о последствиях (руководитель не
/// увидит смену, она не попадёт в отчёты и начисления) и предлагает вернуться
/// к организационному контексту вместо неосознанного личного трекера.
@RoutePage()
class PersonalShiftConfirmPage extends StatelessWidget {
  const PersonalShiftConfirmPage({this.singleOrganizationName, super.key});

  /// Имя единственной доступной организации. Если задано — основное действие
  /// предлагает стартовать именно её смену («Начать в «Name»»). Если `null`
  /// (доступных организаций две и более) — основное действие «Выбрать
  /// организацию», закрывает модалку без выбора конкретной (на экране уже
  /// выбрана одна из них селектором).
  final String? singleOrganizationName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final orgName = singleOrganizationName;

    return AppBottomSheet(
      title: l10n.shiftPersonalConfirmTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, color: colors.warning, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.shiftPersonalConfirmBody,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            label: orgName != null
                ? l10n.shiftPersonalConfirmStartOrg(orgName)
                : l10n.shiftPersonalConfirmChooseOrg,
            onPressed: () {
              if (orgName != null) {
                context.router.maybePop(
                  PersonalShiftConfirmAction.startOrganization,
                );
              } else {
                // «Выбрать организацию» — закрыть модалку без выбора,
                // организационный контекст на экране уже выбран селектором.
                context.router.maybePop();
              }
            },
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () => context.router.maybePop(
                PersonalShiftConfirmAction.startPersonal,
              ),
              child: Text(l10n.shiftPersonalConfirmStartPersonal),
            ),
          ),
        ],
      ),
    );
  }
}
