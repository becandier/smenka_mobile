import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/employee_test/_employee_test.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/test_attempt/cubit/test_attempt_cubit.dart';
import 'package:smenka_mobile/pages/test_attempt/cubit/test_attempt_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_blocked_view.dart';
part '../widgets/_filling_view.dart';
part '../widgets/_result_view.dart';
part '../widgets/_unassigned_view.dart';

@RoutePage()
class TestAttemptPage extends StatelessWidget {
  const TestAttemptPage({@pathParam required this.assignmentId, super.key});

  final String assignmentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestAttemptCubit(
        assignmentId: assignmentId,
        repository: context.read<TestRepository>(),
      ),
      child: const _TestAttemptView(),
    );
  }
}

class _TestAttemptView extends StatelessWidget {
  const _TestAttemptView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<TestAttemptCubit, TestAttemptState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.assignment?.template.title ?? l10n.testAttemptTitle,
            ),
            centerTitle: true,
          ),
          body: SafeArea(child: _buildBody(context, state)),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, TestAttemptState state) {
    if (state.unassigned) {
      return _UnassignedView(state: state);
    }
    if (state.isFatalError) {
      return SectionError(
        error: localizedErrorMessage(
          context,
          code: state.errorCode,
          fallback: state.error,
        ),
        onRetry: () => context.read<TestAttemptCubit>().retryLoad(),
      );
    }
    if (state.blocked) {
      return _BlockedView(state: state);
    }
    final result = state.result;
    if (state.isResult && result != null) {
      return _ResultView(
        result: result,
        testTitle: state.assignment?.template.title,
      );
    }
    final attempt = state.attempt;
    if (state.isFilling && attempt != null) {
      return _FillingView(state: state, attempt: attempt);
    }
    return const SectionLoader();
  }
}
