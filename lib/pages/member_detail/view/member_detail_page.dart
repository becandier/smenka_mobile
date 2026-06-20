import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_cubit.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_state.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_rates_cubit.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_rates_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_header_section.dart';
part '../widgets/_effective_section.dart';
part '../widgets/_rates_section.dart';

@RoutePage()
class MemberDetailPage extends StatelessWidget {
  const MemberDetailPage({
    required this.orgId,
    required this.member,
    super.key,
  });

  final String orgId;
  final Member member;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MemberDetailCubit(
            orgId: orgId,
            member: member,
            organizationRepository: context.read<OrganizationRepository>(),
            checklistRepository: context.read<ChecklistRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => MemberRatesCubit(
            orgId: orgId,
            memberId: member.id,
            payrollRepository: context.read<PayrollRepository>(),
          ),
        ),
      ],
      child: const _MemberDetailView(),
    );
  }
}

class _MemberDetailView extends StatelessWidget {
  const _MemberDetailView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocSelector<MemberDetailCubit, MemberDetailState, bool>(
      selector: (state) => state.canManage,
      builder: (context, canManage) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.memberDetailTitle),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const _HeaderSection(),
              if (canManage) ...const [
                SizedBox(height: 16),
                _RatesSection(),
                SizedBox(height: 16),
                _EffectiveSection(),
              ],
            ],
          ),
        );
      },
    );
  }
}
