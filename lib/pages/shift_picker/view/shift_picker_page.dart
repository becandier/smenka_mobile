import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/_shift.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/shift_picker/cubit/shift_picker_cubit.dart';
import 'package:smenka_mobile/pages/shift_picker/cubit/shift_picker_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат выбора смены для привязки штрафа.
///
/// `shift == null` — выбран пункт «Без смены» (отвязать). Если модалку
/// закрыли свайпом/тапом по фону — роут вернёт `null` целиком, и вызывающая
/// сторона выбор НЕ меняет.
class ShiftPickerResult {
  const ShiftPickerResult(this.shift);

  final Shift? shift;
}

@RoutePage()
class ShiftPickerPage extends StatelessWidget {
  const ShiftPickerPage({
    required this.orgId,
    required this.userId,
    this.selectedShiftId,
    super.key,
  });

  final String orgId;
  final String userId;
  final String? selectedShiftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShiftPickerCubit(
        orgId: orgId,
        userId: userId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: _ShiftPickerView(selectedShiftId: selectedShiftId),
    );
  }
}

class _ShiftPickerView extends StatelessWidget {
  const _ShiftPickerView({this.selectedShiftId});

  final String? selectedShiftId;

  void _pick(BuildContext context, Shift? shift) {
    context.router.maybePop(ShiftPickerResult(shift));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.finesShiftPickerTitle,
      child: BlocBuilder<ShiftPickerCubit, ShiftPickerState>(
        builder: (context, state) {
          final section = state.shifts;

          if (section.isLoading) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }

          if (section.error case final message?) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    localizedErrorMessage(
                      context,
                      code: section.errorCode,
                      fallback: message,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    label: l10n.retry,
                    isOutlined: true,
                    onPressed: () => context.read<ShiftPickerCubit>().load(),
                  ),
                ],
              ),
            );
          }

          final shifts = section.data ?? const <Shift>[];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ShiftRow(
                label: l10n.finesShiftNone,
                isSelected: selectedShiftId == null,
                onTap: () => _pick(context, null),
              ),
              if (shifts.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    l10n.finesShiftPickerEmpty,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.appColors.secondary,
                    ),
                  ),
                )
              else
                ...shifts.map(
                  (shift) => _ShiftRow(
                    label: DateFormat(
                      'dd.MM.yyyy HH:mm',
                    ).format(shift.startedAt.toLocal()),
                    isSelected: shift.id == selectedShiftId,
                    onTap: () => _pick(context, shift),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ShiftRow extends StatelessWidget {
  const _ShiftRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (isSelected)
                Icon(Icons.check, size: 20, color: colors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
