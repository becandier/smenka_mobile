import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/org_shift_detail/cubit/org_shift_detail_cubit.dart';
import 'package:smenka_mobile/pages/org_shift_detail/cubit/org_shift_detail_state.dart';
import 'package:smenka_mobile/pages/shift_checklists/cubit/shift_checklists_cubit.dart';
import 'package:smenka_mobile/pages/shift_checklists/cubit/shift_checklists_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_org_shift_detail_info.dart';
part '../widgets/_org_shift_detail_checklists.dart';

/// Экран детали ЧУЖОЙ орг-смены (owner/admin, только чтение).
/// Принимает `orgId` + `shiftId` из path. Данные —
/// `GET /organizations/{org_id}/shifts/{shift_id}`.
@RoutePage()
class OrgShiftDetailPage extends StatelessWidget {
  const OrgShiftDetailPage({
    @pathParam required this.orgId,
    @pathParam required this.shiftId,
    super.key,
  });

  final String orgId;
  final String shiftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrgShiftDetailCubit(
        orgId: orgId,
        shiftId: shiftId,
        organizationRepository: context.read<OrganizationRepository>(),
      ),
      child: _OrgShiftDetailView(orgId: orgId, shiftId: shiftId),
    );
  }
}

class _OrgShiftDetailView extends StatelessWidget {
  const _OrgShiftDetailView({required this.orgId, required this.shiftId});

  final String orgId;
  final String shiftId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.shiftDetailTitle), centerTitle: true),
      body: BlocBuilder<OrgShiftDetailCubit, OrgShiftDetailState>(
        builder: (context, state) {
          final section = state.shift;

          if (section.isLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (section.status == FeatureStatus.error) {
            return _ErrorState(
              code: section.errorCode,
              fallback: section.error,
            );
          }

          final shift = section.data;
          if (shift == null) {
            return const SizedBox.shrink();
          }

          return _Content(orgId: orgId, shiftId: shiftId, shift: shift);
        },
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.orgId,
    required this.shiftId,
    required this.shift,
  });

  final String orgId;
  final String shiftId;
  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ShiftAuthorBlock(
          userId: shift.userId,
          userName: shift.userName,
          userEmail: shift.userEmail,
          role: shift.role,
          customRoleName: shift.customRoleName,
        ),
        const SizedBox(height: 16),
        // Единственное пишущее действие на этом экране (фича fines):
        // быстро оштрафовать сотрудника по этой смене.
        _FineShiftButton(orgId: orgId, shift: shift),
        const SizedBox(height: 20),
        _OrgShiftInfoSection(shift: shift),
        const SizedBox(height: 24),
        ShiftPauseList(pauses: shift.pauses),
        const SizedBox(height: 24),
        _OrgShiftDetailChecklists(orgId: orgId, shiftId: shiftId),
      ],
    );
  }
}

/// Кнопка «Оштрафовать» по конкретной смене (admin/owner).
///
/// Разрешает `member_id` сотрудника смены по `user_id` (через список
/// участников орг), затем открывает форму штрафа с предзаполнением
/// (`shift_id` = id смены, `occurred_at` = `started_at`).
class _FineShiftButton extends StatefulWidget {
  const _FineShiftButton({required this.orgId, required this.shift});

  final String orgId;
  final Shift shift;

  @override
  State<_FineShiftButton> createState() => _FineShiftButtonState();
}

class _FineShiftButtonState extends State<_FineShiftButton> {
  bool _loading = false;

  Future<void> _fine() async {
    final l10n = context.l10n;
    final orgRepository = context.read<OrganizationRepository>();
    setState(() => _loading = true);

    final result = await orgRepository.getMembers(widget.orgId);
    if (!mounted) return;

    final member = result.fold(
      onSuccess: (members) {
        for (final m in members) {
          if (m.userId == widget.shift.userId) return m;
        }
        return null;
      },
      onFailure: (_) => null,
    );

    if (member == null) {
      setState(() => _loading = false);
      if (mounted) context.modals.showError(l10n.errorMemberNotFound);
      return;
    }

    final created = await context.router.push<bool>(
      PenaltyFormRoute(
        orgId: widget.orgId,
        memberId: member.id,
        userId: member.userId,
        userName: member.userName,
        shiftId: widget.shift.id,
        initialOccurredAt: widget.shift.startedAt,
      ),
    );
    if (!mounted) return;
    setState(() => _loading = false);
    if (created ?? false) {
      context.modals.showSuccess(l10n.finesAssignedSuccess);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.finesQuickAssign,
      isLoading: _loading,
      onPressed: _fine,
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.code, required this.fallback});

  final String? code;
  final String? fallback;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final isAccessOrMissing =
        code == 'SHIFT_NOT_FOUND' ||
        code == 'ORG_NOT_FOUND' ||
        code == 'FORBIDDEN';

    final icon = switch (code) {
      'FORBIDDEN' => Icons.lock_outline,
      'SHIFT_NOT_FOUND' || 'ORG_NOT_FOUND' => Icons.search_off,
      _ => Icons.error_outline,
    };

    return AppEmptyState(
      icon: icon,
      title: localizedErrorMessage(context, code: code, fallback: fallback),
      actionLabel: isAccessOrMissing ? l10n.shiftDetailBackToList : l10n.retry,
      onAction: isAccessOrMissing
          ? () => context.router.maybePop()
          : () => context.read<OrgShiftDetailCubit>().load(),
    );
  }
}
