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

  test('до первого setContext запрос не уходит', () {
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

  test('первый setContext запускает загрузку с этим контекстом', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();

    expect(cubit.state.scope, ShiftScope.organization);
    expect(cubit.state.organizationId, 'org1');
    verify(
      () => shiftRepo.getShifts(
        scope: ShiftScope.organization,
        organizationId: 'org1',
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test('первый setContext(null, null) — контекст без ограничения — тоже '
      'запускает загрузку (не путать с «ещё не пришёл»)', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(null, null);
    await pumpEventQueue();

    verify(() => shiftRepo.getShifts(limit: any(named: 'limit'))).called(1);
    await cubit.close();
  });

  test(
    'повторный setContext с тем же контекстом — не перезапрашивает',
    () async {
      final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.personal, null);
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
      ..setContext(ShiftScope.organization, 'org1');
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
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test('смена контекста сохраняет фильтры статуса/дат', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.all, null);
    await pumpEventQueue();

    final dateFrom = DateTime.utc(2026, 6);
    final dateTo = DateTime.utc(2026, 6, 30);
    cubit
      ..setStatusFilter(ShiftStatus.finished)
      ..setDateRange(dateFrom, dateTo);
    await pumpEventQueue();

    cubit.setContext(ShiftScope.personal, null);
    await pumpEventQueue();

    expect(cubit.state.filterStatus, ShiftStatus.finished);
    expect(cubit.state.filterDateFrom, dateFrom);
    expect(cubit.state.filterDateTo, dateTo);
    verify(
      () => shiftRepo.getShifts(
        status: ShiftStatus.finished,
        dateFrom: dateFrom,
        dateTo: dateTo,
        scope: ShiftScope.personal,
        limit: any(named: 'limit'),
      ),
    ).called(1);
    await cubit.close();
  });

  test('resetFilters сбрасывает статус/даты, но не контекст', () async {
    final cubit = ShiftHistoryCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();
    cubit.setStatusFilter(ShiftStatus.active);
    await pumpEventQueue();

    cubit.resetFilters();
    await pumpEventQueue();

    expect(cubit.state.filterStatus, isNull);
    expect(cubit.state.scope, ShiftScope.organization);
    expect(cubit.state.organizationId, 'org1');
    await cubit.close();
  });
}
