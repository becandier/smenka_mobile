import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/my_tests/cubit/my_tests_cubit.dart';
import 'package:smenka_mobile/pages/my_tests/cubit/my_tests_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_my_tests_widgets.dart';

@RoutePage()
class MyTestsPage extends StatelessWidget {
  const MyTestsPage({this.initialOrganizationId, super.key});

  /// Предвыбор фильтра — при входе из хаба конкретной организации.
  final String? initialOrganizationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyTestsCubit(
        testRepository: context.read<TestRepository>(),
        organizationRepository: context.read<OrganizationRepository>(),
        initialOrganizationId: initialOrganizationId,
      ),
      child: const _MyTestsView(),
    );
  }
}

class _MyTestsView extends StatelessWidget {
  const _MyTestsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myTestsTitle), centerTitle: true),
      body: Column(
        children: [
          const _OrgFilterRow(),
          Expanded(
            child:
                PaginatedSectionDataList<
                  MyTestsCubit,
                  MyTestsState,
                  TestAssignment
                >(
                  selector: (state) => state.assignments,
                  itemBuilder: (context, assignment, index) => _MyTestCard(
                    assignment: assignment,
                    onTap: () async {
                      final cubit = context.read<MyTestsCubit>();
                      // Экран прохождения может показать «Тест больше не
                      // назначен» (снятие/удаление за время просмотра) —
                      // после возврата список должен сам обновиться, а не
                      // ждать ручного pull-to-refresh.
                      await context.router.root.push(
                        TestAttemptRoute(assignmentId: assignment.id),
                      );
                      unawaited(cubit.loadAssignments());
                    },
                  ),
                  onLoadMore: () => context
                      .read<MyTestsCubit>()
                      .loadAssignments(isRefresh: false),
                  onRefresh: () =>
                      context.read<MyTestsCubit>().loadAssignments(),
                  emptyBuilder: () => AppEmptyState(
                    icon: Icons.fact_check_outlined,
                    title: l10n.myTestsEmpty,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
