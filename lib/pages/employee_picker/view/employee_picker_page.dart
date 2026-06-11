import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/employee_picker/cubit/employee_picker_cubit.dart';
import 'package:smenka_mobile/pages/employee_picker/cubit/employee_picker_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Результат выбора в модалке сотрудников.
///
/// `member == null` — выбран пункт «Все сотрудники» (сброс фильтра).
/// Если модалку закрыли свайпом/тапом по фону — роут вернёт `null` целиком,
/// и вызывающая сторона фильтр НЕ меняет.
class EmployeePickerResult {
  const EmployeePickerResult(this.member);

  final Member? member;
}

@RoutePage()
class EmployeePickerPage extends StatelessWidget {
  const EmployeePickerPage({
    @pathParam required this.orgId,
    this.selectedUserId,
    super.key,
  });

  final String orgId;
  final String? selectedUserId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmployeePickerCubit(
        orgId: orgId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: _EmployeePickerView(selectedUserId: selectedUserId),
    );
  }
}

class _EmployeePickerView extends StatelessWidget {
  const _EmployeePickerView({this.selectedUserId});

  final String? selectedUserId;

  void _pick(BuildContext context, Member? member) {
    context.router.maybePop(EmployeePickerResult(member));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.shiftEmployeePickerTitle,
      child: BlocBuilder<EmployeePickerCubit, EmployeePickerState>(
        builder: (context, state) {
          final section = state.members;

          if (section.isLoading) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }

          if (section.error case final message?) {
            return _ErrorRow(
              message: message,
              onRetry: () => context.read<EmployeePickerCubit>().load(),
            );
          }

          final members = section.data ?? const <Member>[];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _EmployeeRow(
                label: l10n.orgShiftsAllEmployees,
                isSelected: selectedUserId == null,
                onTap: () => _pick(context, null),
              ),
              if (members.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    l10n.shiftEmployeePickerEmpty,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.appColors.secondary,
                    ),
                  ),
                )
              else
                ...members.map(
                  (m) => _EmployeeRow(
                    label: m.userName.trim().isNotEmpty
                        ? m.userName
                        : m.userEmail,
                    subtitle: m.userName.trim().isNotEmpty ? m.userEmail : null,
                    isSelected: m.userId == selectedUserId,
                    onTap: () => _pick(context, m),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _EmployeeRow extends StatelessWidget {
  const _EmployeeRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.subtitle,
  });

  final String label;
  final String? subtitle;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                    if (subtitle case final sub?) ...[
                      const SizedBox(height: 2),
                      Text(
                        sub,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isSelected)
                Icon(Icons.check, color: colors.primary, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorRow extends StatelessWidget {
  const _ErrorRow({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: context.appColors.error),
          ),
          const SizedBox(height: 12),
          AppButton(onPressed: onRetry, label: l10n.retry, isOutlined: true),
        ],
      ),
    );
  }
}
