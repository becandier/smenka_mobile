import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/api/local/shift_history_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/domain/payroll/repositories/payroll_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/applied_range_label.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/date_range_picker/_date_range_picker.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_earnings_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_earnings_state.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_context_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_context_state.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_period_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_period_state.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_state.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_cubit.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/context_selector.dart';
part '../widgets/stats_section.dart';
part '../widgets/shift_filters.dart';
part '../widgets/shift_card.dart';

@RoutePage()
class ShiftHistoryPage extends StatelessWidget {
  const ShiftHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ShiftHistoryContextCubit(
            organizationRepository: context.read<OrganizationRepository>(),
            contextStorage: ShiftHistoryContextStorage(
              prefs: context.read<SharedPreferences>(),
            ),
          ),
        ),
        BlocProvider(create: (_) => ShiftHistoryPeriodCubit()),
        BlocProvider(
          create: (_) => ShiftHistoryCubit(
            shiftRepository: context.read<ShiftRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) =>
              ShiftStatsCubit(shiftRepository: context.read<ShiftRepository>()),
        ),
        BlocProvider(
          create: (_) => ShiftEarningsCubit(
            payrollRepository: context.read<PayrollRepository>(),
          ),
        ),
      ],
      child: const _ShiftHistoryView(),
    );
  }
}

class _ShiftHistoryView extends StatefulWidget {
  const _ShiftHistoryView();

  @override
  State<_ShiftHistoryView> createState() => _ShiftHistoryViewState();
}

class _ShiftHistoryViewState extends State<_ShiftHistoryView> {
  StreamSubscription<ShiftHistoryContextState>? _contextSub;
  StreamSubscription<ShiftHistoryPeriodState>? _periodSub;

  @override
  void initState() {
    super.initState();
    // `BlocListener` не увидел бы состояние, если контекст успел резолвиться
    // синхронно внутри конструктора `ShiftHistoryContextCubit` (сохранённый
    // маркер применяется до подписки любого слушателя) — поэтому здесь
    // читаем текущее состояние явно и подписываемся на дальнейшие изменения
    // одним и тем же обработчиком (см. shift_history_scope/mobile.md,
    // «Загрузка»).
    final contextCubit = context.read<ShiftHistoryContextCubit>();
    _applyContext(contextCubit.state);
    _contextSub = contextCubit.stream.listen(_applyContext);

    // Окно периода вычисляется синхронно в конструкторе
    // `ShiftHistoryPeriodCubit` (дефолт — неделя), поэтому применяем его
    // сразу тем же приёмом, что и контекст выше.
    final periodCubit = context.read<ShiftHistoryPeriodCubit>();
    _applyPeriod(periodCubit.state);
    _periodSub = periodCubit.stream.listen(_applyPeriod);
  }

  /// Прокидывает резолвленный контекст в независимые кубиты экрана. Они не
  /// знают друг о друге и об источнике контекста — только этот метод
  /// связывает их (mobile.md: «инвариант "кубиты не зависят друг от друга"
  /// сохраняется»).
  void _applyContext(ShiftHistoryContextState state) {
    if (state.isLoading) return;
    context.read<ShiftHistoryCubit>().setContext(
      state.scope,
      state.organizationId,
    );
    context.read<ShiftStatsCubit>().setContext(
      state.scope,
      state.organizationId,
    );
    context.read<ShiftEarningsCubit>().setContext(
      state.scope,
      state.organizationId,
    );
    // Пересчитывает границы активного пресета в новом контексте (устройство
    // либо IANA-зона выбранной организации) — см.
    // `ShiftHistoryPeriodCubit.applyContext`.
    context.read<ShiftHistoryPeriodCubit>().applyContext(state.periodContext);
  }

  /// Прокидывает вычисленное окно периода в независимые кубиты экрана —
  /// единственный источник `dateFrom`/`dateTo`, одинаковых во все три
  /// запроса (`shift_history_earnings/mobile.md`, «A»).
  void _applyPeriod(ShiftHistoryPeriodState state) {
    context.read<ShiftHistoryCubit>().setPeriod(state.dateFrom, state.dateTo);
    context.read<ShiftStatsCubit>().setPeriod(state.dateFrom, state.dateTo);
    context.read<ShiftEarningsCubit>().setPeriod(state.dateFrom, state.dateTo);
  }

  @override
  void dispose() {
    unawaited(_contextSub?.cancel());
    unawaited(_periodSub?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _ContextTitle(),
        centerTitle: true,
        actions: const [NotificationBellButton()],
      ),
      body: BlocBuilder<ShiftHistoryContextCubit, ShiftHistoryContextState>(
        // Помимо isLoading, перестраиваемся на смену scope/организации и
        // списка организаций — от них зависят `periodContext`/
        // `timeContextFor`, используемые ниже для карточек и статистики
        // (иначе после переключения организации в селекторе они остались
        // бы вычислены по старому контексту до следующего чужого ребилда).
        buildWhen: (prev, curr) =>
            prev.isLoading != curr.isLoading ||
            prev.scope != curr.scope ||
            prev.organizationId != curr.organizationId ||
            prev.organizations != curr.organizations,
        builder: (context, contextState) {
          // Контекст ещё не резолвлен (нет сохранённого выбора, ждём
          // организации для дефолта) — до этого момента ни список, ни
          // статистика запросов не шлют (см. `_applyContext`).
          if (contextState.isLoading) {
            return const SectionLoader();
          }

          return Column(
            children: [
              _StatsSection(periodContext: contextState.periodContext),
              const _ShiftFilters(),
              Expanded(
                child:
                    PaginatedSectionDataList<
                      ShiftHistoryCubit,
                      ShiftHistoryState,
                      Shift
                    >(
                      selector: (state) => state.shifts,
                      itemBuilder: (context, shift, index) => _ShiftCard(
                        shift: shift,
                        timeContext: contextState.timeContextFor(shift),
                        onTap: () =>
                            context.router.push(ShiftDetailRoute(shift: shift)),
                      ),
                      onLoadMore: () => context
                          .read<ShiftHistoryCubit>()
                          .loadShifts(isRefresh: false),
                      onRefresh: () =>
                          context.read<ShiftHistoryCubit>().loadShifts(),
                      emptyBuilder: () => _buildEmptyState(context),
                    ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Приоритет пуст-текстов (shift_history_earnings/mobile.md: период —
  /// теперь единый и всегда применён, это больше не отдельный «фильтр»
  /// поверх списка). Подсказка про контекст (организация/персональные)
  /// приоритетнее — она более действенная («переключите контекст»), чем
  /// общее «нет смен за период» — и показывается, только пока не включён
  /// фильтр статуса. Иначе — общий текст «за выбранный период»: период на
  /// экране применён всегда, значит именно он объясняет пустоту списка.
  Widget _buildEmptyState(BuildContext context) {
    final historyState = context.read<ShiftHistoryCubit>().state;
    final l10n = context.l10n;

    if (!historyState.hasFilters) {
      switch (historyState.scope) {
        case ShiftScope.organization:
          return AppEmptyState(
            icon: Icons.history_outlined,
            title: l10n.historyEmptyOrganization,
            subtitle: l10n.historyEmptyContextHint,
          );
        case ShiftScope.personal:
          return AppEmptyState(
            icon: Icons.history_outlined,
            title: l10n.historyEmptyPersonal,
            subtitle: l10n.historyEmptyContextHint,
          );
        case ShiftScope.all:
        case null:
          break;
      }
    }

    return AppEmptyState(
      icon: Icons.history_outlined,
      title: l10n.shiftsEmptyForRange,
    );
  }
}
