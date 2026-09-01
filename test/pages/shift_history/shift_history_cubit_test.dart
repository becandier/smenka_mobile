import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_cubit.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

Shift _shift(String id) => Shift(
  id: id,
  userId: 'u1',
  startedAt: DateTime.utc(2026, 6, 11, 10),
  status: ShiftStatus.finished,
  pauses: const [],
  workedSeconds: 3600,
);

Task<DefaultPaginator<Shift>> _page(
  List<Shift> shifts, {
  bool hasMore = false,
}) => Task<DefaultPaginator<Shift>>.success(
  DefaultPaginator<Shift>(hasMore: hasMore, data: shifts, total: shifts.length),
);

void main() {
  late _MockShiftRepository shiftRepo;

  final periodFrom = DateTime.utc(2026, 6);
  final periodTo = DateTime.utc(2026, 6, 7, 23, 59, 59);

  setUp(() {
    shiftRepo = _MockShiftRepository();
    when(
      () => shiftRepo.getShifts(
        status: any(named: 'status'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => _page([_shift('s1')]));
  });

  test('до применения контекста и периода запрос не уходит', () {
    ShiftHistoryCubit(shiftRepository: shiftRepo);

    verifyNever(
      () => shiftRepo.getShifts(
        status: any(named: 'status'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    );
  });

  test('только setContext (без периода) не запускает загрузку', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();

    verifyNever(
      () => shiftRepo.getShifts(
        status: any(named: 'status'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    );
    await cubit.close();
  });

  test('только setPeriod (без контекста) не запускает загрузку', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    verifyNever(
      () => shiftRepo.getShifts(
        status: any(named: 'status'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    );
    await cubit.close();
  });

  test('setContext, затем setPeriod — запускают первую загрузку с обоими '
      'применёнными одинаковыми границами', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();
    cubit.setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    expect(cubit.state.scope, ShiftScope.organization);
    expect(cubit.state.organizationId, 'org1');
    expect(cubit.state.dateFrom, periodFrom);
    expect(cubit.state.dateTo, periodTo);
    verify(
      () => shiftRepo.getShifts(
        scope: ShiftScope.organization,
        organizationId: 'org1',
        dateFrom: periodFrom,
        dateTo: periodTo,
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test(
    'setPeriod, затем setContext — тот же результат (порядок не важен)',
    () async {
      final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
        ..setPeriod(periodFrom, periodTo);
      await pumpEventQueue();
      cubit.setContext(ShiftScope.organization, 'org1');
      await pumpEventQueue();

      verify(
        () => shiftRepo.getShifts(
          scope: ShiftScope.organization,
          organizationId: 'org1',
          dateFrom: periodFrom,
          dateTo: periodTo,
          limit: any(named: 'limit'),
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test(
    'первый setContext(null, null) — контекст без ограничения — тоже '
    'запускает загрузку вместе с периодом (не путать с «ещё не пришёл»)',
    () async {
      final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
        ..setContext(null, null)
        ..setPeriod(periodFrom, periodTo);
      await pumpEventQueue();

      verify(
        () => shiftRepo.getShifts(
          dateFrom: periodFrom,
          dateTo: periodTo,
          limit: any(named: 'limit'),
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test(
    'повторный setContext с тем же контекстом — не перезапрашивает',
    () async {
      final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.personal, null)
        ..setPeriod(periodFrom, periodTo);
      await pumpEventQueue();
      cubit.setContext(ShiftScope.personal, null);
      await pumpEventQueue();

      verify(
        () => shiftRepo.getShifts(
          status: any(named: 'status'),
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          scope: any(named: 'scope'),
          organizationId: any(named: 'organizationId'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test(
    'повторный setPeriod с теми же границами — не перезапрашивает',
    () async {
      final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.personal, null)
        ..setPeriod(periodFrom, periodTo);
      await pumpEventQueue();
      cubit.setPeriod(periodFrom, periodTo);
      await pumpEventQueue();

      verify(
        () => shiftRepo.getShifts(
          status: any(named: 'status'),
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          scope: any(named: 'scope'),
          organizationId: any(named: 'organizationId'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test('смена контекста сбрасывает пагинацию', () async {
    when(
      () => shiftRepo.getShifts(
        status: any(named: 'status'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => _page([_shift('s1')], hasMore: true));

    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1')
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();
    await cubit.loadShifts(isRefresh: false); // подгрузка страницы 2
    await pumpEventQueue();
    expect(cubit.state.shifts.currentPage, 2);

    cubit.setContext(ShiftScope.organization, 'org2');
    await pumpEventQueue();

    expect(cubit.state.shifts.currentPage, 1);
    verify(
      () => shiftRepo.getShifts(
        scope: ShiftScope.organization,
        organizationId: 'org2',
        dateFrom: periodFrom,
        dateTo: periodTo,
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test('смена периода перезапрашивает с новыми границами, сохраняя '
      'контекст и фильтр статуса', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1')
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();
    cubit.setStatusFilter(ShiftStatus.finished);
    await pumpEventQueue();

    final newFrom = DateTime.utc(2026, 7);
    final newTo = DateTime.utc(2026, 7, 31, 23, 59, 59);
    cubit.setPeriod(newFrom, newTo);
    await pumpEventQueue();

    expect(cubit.state.dateFrom, newFrom);
    expect(cubit.state.dateTo, newTo);
    expect(cubit.state.filterStatus, ShiftStatus.finished);
    expect(cubit.state.scope, ShiftScope.organization);
    verify(
      () => shiftRepo.getShifts(
        status: ShiftStatus.finished,
        dateFrom: newFrom,
        dateTo: newTo,
        scope: ShiftScope.organization,
        organizationId: 'org1',
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test('смена контекста сохраняет фильтр статуса и период', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.all, null)
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    cubit.setStatusFilter(ShiftStatus.finished);
    await pumpEventQueue();

    cubit.setContext(ShiftScope.personal, null);
    await pumpEventQueue();

    expect(cubit.state.filterStatus, ShiftStatus.finished);
    expect(cubit.state.dateFrom, periodFrom);
    expect(cubit.state.dateTo, periodTo);
    verify(
      () => shiftRepo.getShifts(
        status: ShiftStatus.finished,
        dateFrom: periodFrom,
        dateTo: periodTo,
        scope: ShiftScope.personal,
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test('resetFilters сбрасывает статус, но не контекст и не период', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1')
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();
    cubit.setStatusFilter(ShiftStatus.active);
    await pumpEventQueue();

    cubit.resetFilters();
    await pumpEventQueue();

    expect(cubit.state.filterStatus, isNull);
    expect(cubit.state.scope, ShiftScope.organization);
    expect(cubit.state.organizationId, 'org1');
    expect(cubit.state.dateFrom, periodFrom);
    expect(cubit.state.dateTo, periodTo);
    await cubit.close();
  });
}
